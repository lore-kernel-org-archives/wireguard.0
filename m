Return-Path: hannes@stressinduktion.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72f0ea09
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 16:41:52 +0000 (UTC)
Message-Id: <1479141867.3723362.787321689.4A3DCFD6@webmail.messagingengine.com>
From: Hannes Frederic Sowa <hannes@stressinduktion.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 David Ahern <dsa@cumulusnetworks.com>, Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>,
 YOSHIFUJI Hideaki <hideaki.yoshifuji@miraclelinux.com>
MIME-Version: 1.0
Content-Type: text/plain
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
Date: Mon, 14 Nov 2016 17:44:27 +0100
In-Reply-To: <20161113232813.28926-1-Jason@zx2c4.com>
Subject: Re: [WireGuard] [PATCH v3] ip6_output: ensure flow saddr actually
	belongs to device
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Nov 14, 2016, at 00:28, Jason A. Donenfeld wrote:
> This puts the IPv6 routing functions in parity with the IPv4 routing
> functions. Namely, we now check in v6 that if a flowi6 requests an
> saddr, the returned dst actually corresponds to a net device that has
> that saddr. This mirrors the v4 logic with __ip_dev_find in
> __ip_route_output_key_hash. In the event that the returned dst is not
> for a dst with a dev that has the saddr, we return -EINVAL, just like
> v4; this makes it easy to use the same error handlers for both cases.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: David Ahern <dsa@cumulusnetworks.com>
> ---
> Changes from v2:
>     It turns out ipv6_chk_addr already has the device enumeration
>     logic that we need by simply passing NULL.
> 
>  net/ipv6/ip6_output.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
> index 6001e78..b3b5cb6 100644
> --- a/net/ipv6/ip6_output.c
> +++ b/net/ipv6/ip6_output.c
> @@ -926,6 +926,10 @@ static int ip6_dst_lookup_tail(struct net *net,
> const struct sock *sk,
>  	int err;
>  	int flags = 0;
>  
> +       if (!ipv6_addr_any(&fl6->saddr) &&
> +           !ipv6_chk_addr(net, &fl6->saddr, NULL, 1))
> +               return -EINVAL;

Hmm, this check is too permissive, no?

E.g. what happens if you move a link local address from one interface to
another? In this case this code would still allow the saddr to be used.

I just also quickly read up on the history (sorry was travelling last
week) and wonder if you ever saw a user space facing bug or if this is
basically some difference you saw while writing out of tree code?

Thanks,
Hannes
