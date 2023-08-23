Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4915BC3DA66
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 17:07:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63dcca08;
	Wed, 23 Aug 2023 17:07:48 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2c7910c8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Aug 2023 17:07:46 +0000 (UTC)
Received: janet.servers.dxld.at; Wed, 23 Aug 2023 19:07:46 +0200
Date: Wed, 23 Aug 2023 19:07:40 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: IPv6 and PPPoE with MSSFIX
Message-ID: <20230823170740.ie5ro6eswgus3x2l@House.clients.dxld.at>
References: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
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

Hi Luiz,

On Tue, Aug 22, 2023 at 05:39:23PM -0300, Luiz Angelo Daros de Luca wrote:
> We noticed an issue with clients that use PPPoE and connect to WG
> using IPv6. Both sides start to fragment the encrypted packet leading
> to a severe degradation in performance. We reduced the wireguard MTU
> from the default 1420 to 1400 and the issue was solved. However, I
> wonder if it could be fixed with MSSFIX (in my case, nftables
> equivalent).
> 
> The server does know that the remote address has a smaller MTU as it
> fragments the packet accordingly when any VPN peer sends some traffic.
> The traffic inside the VPN does adjust the TCP MSS to fit into vpn
> interface MTU (1420 by default, now 1400).

Debug note: you can dump the current PMTU info on linux using

     $ ip -6 route show cache

Look at the "mtu" field of the route corresponding to the destination host
you're looking at.

IIRC `ip route get` will also print the PMTU currently in effect.

> I could dynamically add firewall rules to clamp MSS per authorized_ips
> but, theoretically, the kernel has all the info to do that
> automatically. I wonder if MSSFIX could detect the best MTU for a
> specific address through the wireguard. It should consider the
> peer-to-peer PMTU, the IP protocol wireguard is using and the normal
> wireguard headers.

Interesting idea Luiz, so if I understand correctly you have a wg device
with multiple peers where only some of them need the reduced MTU and you'd
like to use the maximum possible MTU for all peers.

As things are this won't "just work" with MSSFIX because the wg device
won't generate ICMP packet-too-big errors for packets sent to it for
encapsulation regardless of the underlying PMTU, rather the wg device will
always fragment when the resulting encapsulated packet doesn't fit as
you've observed.

AFAIK MSSFIX will only look at the actual outgoing route MTU and calculate
the MSS from that. Since wg never causes (dynamic) PMTU entries to be
created that won't work.

However we can also just create "static" PMTU entries. As we've seen above
linux uses the "mtu" route attribute to determine the actual PMTU behind a
route, as opposed to the netdev MTU, which you should think of as the upper
limit of what a link can support.

So you can try adding a route specific for the peer that's behind PPPoE
with the reduced PMTU. Assuming 2001:db8:1432::/64 is this peer's
AllowedIPs:

    $ ip route add 2001:db8:1432::/64 dev wg0 mtu 1432 proto static

You should be able to add this in PostUp in your wg.conf. The "proto
static" is optional, I just like to use that to mark administratively
created routes.

You're still going to want to set the peer's wg device MTU to 1432 or you
can create "mtu" routes in a similar fashion there. Up to you.

Also note MSSFIX or the nft equivalent mouthful `tcp flags syn tcp option
maxseg size set rt mtu` is really only appropriate for IPv4 traffic since
IPv4-PMTU is broken by too many networks. However over in always-sunny IPv6
land PMTU does work and should be preferred to mangling TCP headers. The
static PTMU route we created should cause the kernel to start sending the
appropriate ICMPv6 packet-too-big errors when it's configured for IPv6
forwarding.

You can test the PTB behaviour with `ping 2001:db8:1432::1 -s3000 -M do`.
The -s3000 sends large packets, careful with the size that's the ICMP
_payload size_ so it's not equivalent to MTU, and `-M do` disables local
fragmentation so you can see when PMTU is doing it's job. You'll get
something like "ping: local error: message too long, mtu: XXXX" showing the
PMTU value if ICMP-PTB error generation is working along the path.

--Daniel
