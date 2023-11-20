Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574F4C072A2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Nov 2023 01:17:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2c4e5e3;
	Mon, 20 Nov 2023 01:17:09 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3159dbc1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2023 01:17:06 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 20 Nov 2023 02:17:06 +0100
Date: Mon, 20 Nov 2023 02:17:01 +0100
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Thomas Brierley <tomxor@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: linux: fix MTU calculation (use PMTUD)
Message-ID: <20231120011701.asllvpzuffih34wz@House.clients.dxld.at>
References: <20231029192210.120316-1-tomxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231029192210.120316-1-tomxor@gmail.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Thomas,

On Sun, Oct 29, 2023 at 07:22:10PM +0000, Thomas Brierley wrote:
> Currently MTU calculation fails to successfully utilise the kernel's
> built-in path MTU discovery mechanism (PMTUD). Fixing this required a
> re-write of the set_mtu_up() function, which also addresses two related
> MTU issues as a side effect...
> 
> 1. Trigger PMTUD Before Query
> 
> Currently the endpoint path MTU acquired from `ip route get` will almost
> definitely be empty,

This is not entirely true, routes can specify the `mtu` route attribute
explicitly and this will show up here. Something like:

    $ ip route add 2001:db8::1 dev eth0 via fe80::1 mtu 9000
    $ ip route get 2001:db8::1                                          ~ 
    2001:db8::1 from :: via fe80::1 dev eth0 src 2001:db8:2 metric 1 mtu 9000 pref medium

So this is useful even when not taking PMTU into account. The only
concerning problem I see here is that in the case where ip-route-get
returns a cached PMTU so the MTU selection isn't fully deterministic.

> because this only queries the routing cache.  To
> trigger PMTUD on the endpoint and fill this cache, it is necessary to
> send an ICMP with the DF bit set.

I don't think this is useful. Path MTU may change, doing this only once
when the interface comes up just makes wg-quick less predictable IMO.

> We now perform a ping beforehand with a total packet size equal to the
> interface MTU, larger will not trigger PMTUD, and smaller can miss a
> bottleneck. To calculate the ping payload, the device MTU and IP header
> size must be determined first.
> 
> 2. Consider IPv6/4 Header Size
> 
> Currently an 80 byte header size is assumed i.e. IPv6=40 + WireGuard=40.
> However this is not optimal in the case of IPv4. Since determining the
> IP header size is required for PMTUD anyway, this is now optimised as a
> side effect of endpoint MTU calculation.

This is not a good idea. Consider what happens when a peer roams from an
IPv4 to a IPv6 endpoint address. It's better to be conservative and assume
IPv6 sized overhead, besides IPv4 is legacy anyway ;)

> 3. Use Smallest Endpoint MTU
> 
> Currently in the case of multiple endpoints the largest endpoint path
> MTU is used. However WireGuard will dynamically switch between endpoints
> when e.g. one fails, so the smallest MTU is now used to ensure all
> endpoints will function correctly.

"function correctly". Do note that wireguard lets it's UDP packets be
fragmented. So connectivty will still work even when the wg device MTU
doesn't match the (current) PMTU. The only downsides to this mismatch being
performance:

 - additional header overhead for fragments,
 - less than half max packets-per-second performance and
 - additional lateny for tunnel packets hit by IPv6 PMTU discovery

   I was surprised to learn that this would happen periodically, every time
   the PMTU cache expires. Seems inherent in the IPv6 design as there's no
   way (AFAICT) for the kernel to validate the PMTU before the cache
   expires (like is done for NDP for example).

> Signed-off-by: Thomas Brierley <tomxor@gmail.com>
> ---
>  src/wg-quick/linux.bash | 41 ++++++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
> index 4193ce5..5aba2cb 100755
> --- a/src/wg-quick/linux.bash
> +++ b/src/wg-quick/linux.bash
> @@ -123,22 +123,33 @@ add_addr() {
>  }
>  
>  set_mtu_up() {
> -	local mtu=0 endpoint output
> -	if [[ -n $MTU ]]; then
> -		cmd ip link set mtu "$MTU" up dev "$INTERFACE"
> -		return
> -	fi
> -	while read -r _ endpoint; do
> -		[[ $endpoint =~ ^\[?([a-z0-9:.]+)\]?:[0-9]+$ ]] || continue
> -		output="$(ip route get "${BASH_REMATCH[1]}" || true)"
> -		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
> -	done < <(wg show "$INTERFACE" endpoints)
> -	if [[ $mtu -eq 0 ]]; then
> -		read -r output < <(ip route show default || true) || true
> -		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
> +	local dev devmtu end endmtu iph=40 wgh=40 mtu
> +	# Device MTU
> +	if [[ -n $(ip route show default) ]]; then
> +		[[ $(ip route show default) =~ dev\ ([^ ]+) ]]
> +		dev=${BASH_REMATCH[1]}
> +		[[ $(ip addr show $dev scope global) =~ inet6 ]] &&
> +			iph=40 || iph=20
> +		if [[ $(ip link show dev $dev) =~ mtu\ ([0-9]+) ]]; then
> +			devmtu=${BASH_REMATCH[1]}
> +			[[ $(( devmtu - iph - wgh )) -gt $mtu ]] &&
> +				mtu=$(( devmtu - iph - wgh ))
> +		fi
> +		# Endpoint MTU
> +		while read -r _ end; do
> +			[[ $end =~ ^\[?([a-f0-9:.]+)\]?:[0-9]+$ ]]
> +			end=${BASH_REMATCH[1]}
> +			[[ $end =~ [:] ]] &&
> +				iph=40 || iph=20
> +			ping -w 1 -M do -s $(( devmtu - iph - 8 )) $end &> /dev/null || true
> +			if [[ $(ip route get $end) =~ mtu\ ([0-9]+) ]]; then
> +				endmtu=${BASH_REMATCH[1]}
> +				[[ $(( endmtu - iph - wgh )) -lt $mtu ]] &&
> +					mtu=$(( endmtu - iph - wgh ))
> +			fi
> +		done < <(wg show "$INTERFACE" endpoints)
>  	fi
> -	[[ $mtu -gt 0 ]] || mtu=1500
> -	cmd ip link set mtu $(( mtu - 80 )) up dev "$INTERFACE"
> +	cmd ip link set mtu ${MTU:-${mtu:-1420}} up dev "$INTERFACE"
>  }
>  
>  resolvconf_iface_prefix() {
> -- 
> 2.30.2
> 

--Daniel
