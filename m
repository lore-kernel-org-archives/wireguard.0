Return-Path: natechancellor@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eafbbe43
 for <wireguard@lists.zx2c4.com>; Fri, 3 Aug 2018 23:50:44 +0000 (UTC)
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com
 [IPv6:2a00:1450:400c:c09::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad501170
 for <wireguard@lists.zx2c4.com>; Fri, 3 Aug 2018 23:50:44 +0000 (UTC)
Received: by mail-wm0-x230.google.com with SMTP id c14-v6so7882602wmb.4
 for <wireguard@lists.zx2c4.com>; Fri, 03 Aug 2018 17:01:15 -0700 (PDT)
Return-Path: <natechancellor@gmail.com>
Date: Fri, 3 Aug 2018 17:01:12 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: j@mailb.org
Subject: Re: [PATCH] wg-quick: use resolvectl if present to set dns
Message-ID: <20180804000112.GA12885@flashbox>
References: <d78ba489-ebc5-4769-610b-51529cc650ca@mailb.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d78ba489-ebc5-4769-610b-51529cc650ca@mailb.org>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Aug 01, 2018 at 02:04:25PM +0200, j@mailb.org wrote:
> 
> only use resolvconf is available, fall back to resolvectl if present
> otherwise. don't set dns if both are missing.
> 
> ---
>  src/tools/wg-quick/linux.bash | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> 

> diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
> index 3f1976b..f86f0c8 100755
> --- a/src/tools/wg-quick/linux.bash
> +++ b/src/tools/wg-quick/linux.bash
> @@ -151,13 +151,21 @@ resolvconf_iface_prefix() {
>  HAVE_SET_DNS=0
>  set_dns() {
>  	[[ ${#DNS[@]} -gt 0 ]] || return 0
> -	printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a "$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
> +	if [ -x /usr/bin/resolvconf ]; then
> +		printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a "$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
> +	elif [ -x /usr/bin/resolvectl ]; then
> +		cmd resolvectl dns $INTERFACE "${DNS[@]}"
> +	fi
>  	HAVE_SET_DNS=1
>  }
>  
>  unset_dns() {
>  	[[ ${#DNS[@]} -gt 0 ]] || return 0
> -	cmd resolvconf -d "$(resolvconf_iface_prefix)$INTERFACE"
> +	if [ -x /usr/bin/resolvconf ]; then
> +		cmd resolvconf -d "$(resolvconf_iface_prefix)$INTERFACE"
> +	elif [ -x /usr/bin/resolvectl ]; then
> +		cmd resolvectl revert $INTERFACE
> +	fi
>  }
>  
>  add_route() {
> 

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

I'd argue a better way to check if a command is available is the command
built-in:

if command -v resolvconf >/dev/null; then
    do stuff
fi

The user may have resolvconf available in PATH but not in that location.

Jason can comment on if this makes sense, I don't use wg-quick on Linux.

Nathan
