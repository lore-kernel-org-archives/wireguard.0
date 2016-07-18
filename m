Return-Path: labawi-wg@matrix-dream.net
Received: from matrix-dream.net (matrix2.matrix-dream.net [84.200.73.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1a5c8e6
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jul 2016 21:35:49 +0000 (UTC)
Received: from ivan by matrix-dream.net with local (Exim 4.87)
 (envelope-from <labawi-wg@matrix-dream.net>) id 1bPGE8-0003aJ-5p
 for wireguard@lists.zx2c4.com; Mon, 18 Jul 2016 22:37:24 +0100
Date: Mon, 18 Jul 2016 22:37:24 +0100
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: wireguard@lists.zx2c4.com
Message-ID: <20160718213724.GA13759@matrix-dream.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [WireGuard] WireGuard module requires CONFIG_IP6_NF_IPTABLES
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

WireGuard seems like a nice simple tool. Much better than
IPsec (at least on linux). Thank you all who help develop it.


I have been trying to use WireGuard, unsuccessfully as it kept failing
to create a net device.

After a while I have traced it to the following line in ratelimiter.c:

>        ratelimiter->v6_match = xt_request_find_match(NFPROTO_IPV6, "hashlimit", 1);
>        if (IS_ERR(ratelimiter->v6_match)) {
>                pr_err("The xt_hashlimit module is required");
>                module_put(ratelimiter->v4_match->me);
>                return PTR_ERR(ratelimiter->v6_match);
>        }

Long story short, xt_hashlimit only builds the IPV6 version
if CONFIG_IP6_NF_IPTABLES is enabled (either module or builtin),
as in:
> #if IS_ENABLED(CONFIG_IP6_NF_IPTABLES)
and I didn't have it enabled. I didn't have it enabled as I used
nftables.

I would suggest changing the above pr_err to something like:
> pr_err("The xt_hashlimit module with CONFIG_IP6_NF_IPTABLES=[ym] is required");
At this point in execution, xt_haslimit module is present as the IPv4 version succeeded.

Also, it would be appropriate to include it here
https://www.wireguard.io/install/#kernel-requirements
and possibly test for it in packages.

Regards,
Ivan Labáth
