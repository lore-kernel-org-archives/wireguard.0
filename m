Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B88EE49AD
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 20:28:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 773a9519;
	Sat, 19 Aug 2023 20:14:24 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 23132c23
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2023 20:06:09 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52889bc61b6so2606293a12.0
 for <wireguard@lists.zx2c4.com>; Sat, 19 Aug 2023 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=krose.org; s=google; t=1692475568; x=1693080368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBqxtTZFcF2+u+z3+vXMkFR/hscinsTNek8/4Z/c7Hk=;
 b=ozLq/B4Z+DRHLp4NNDVydjulQjGcKx9+nbWmC4dQTaaZUr4TP4ayH4ij2pfPnA6JwA
 cgUsrt7YX1/LPAxvltyxRMiq0fXqTYd/7sXemEcQewNg1WHz0xrmk+f+uPUa20OGqR04
 aUCR/qcoizkNSoE5QxR33mNOg0YfibnqX4Yy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692475568; x=1693080368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBqxtTZFcF2+u+z3+vXMkFR/hscinsTNek8/4Z/c7Hk=;
 b=N4NR6NEILi7fEk7DGhrqQ/Xn9Y1siLV3eqt6nongSP8158QpICNjE4Rr64MtmdVPVV
 DVqQYNKCX2GiYriCXGQQk4OzLgcSudruqJ0/OEVOb7aj2wWe8jLILJPAJpK+dGb7/k1l
 O4TNobF6hp5DIcrjU1pC8yCBjUDJDKjy6NpjjqreaoZlJTvhWV1TKjeMLOEFHy6imzHE
 I0V3O8Q2cO9QF44YKuYEExGBwDrAt5R2bZQxc/lkgemwB3sinoV/6Z9ksSLlPYYBkdKd
 rKni7bJuPvKuLk6d0Yw+JVsV174dPSfHfBKnRxGR9Tnl12W0gv1Bgpcaa6se9oHanmCf
 bEMg==
X-Gm-Message-State: AOJu0YxW/p2yf0avjFSgm+IYHWM28UEA/vTYDIaFrBdURsp8mCLinJJx
 H+A1oaQHohdi9bNOWvk8EEb+cKy6r4+WMoNIJynK5g==
X-Google-Smtp-Source: AGHT+IHDaDzNz84MlDg7tk71l8nIAb8Fwq+6S4gp+BG/81KaBWioAieOr8aidr6A1j2+hG24vDvMw4lE6Zgo/Tn6lo8=
X-Received: by 2002:aa7:d6c4:0:b0:522:3849:48d8 with SMTP id
 x4-20020aa7d6c4000000b00522384948d8mr1784809edr.9.1692475568483; Sat, 19 Aug
 2023 13:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
In-Reply-To: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
From: Kyle Rose <krose@krose.org>
Date: Sat, 19 Aug 2023 16:05:57 -0400
Message-ID: <CAJU8_nXtXcxL2XezZxvigXeGVnvtWrs2BaF2kpbe-DM4aARuBA@mail.gmail.com>
Subject: Re: [RFC] Replace WireGuard AllowedIPs with IP route attribute
To: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: wireguard@lists.zx2c4.com, bird-users@network.cz, 
 babel-users@alioth-lists.debian.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 19 Aug 2023 20:14:11 +0000
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

Daniel,

I attempted several times to send the following message to the mailing
list nearly two months ago, but they all landed in moderation for some
reason and were silently dropped after a few days. You are not the
only one who wants this functionality for mesh VPNs. I note the email
you subsequently replied to (by Bernd) also didn't show up on the
list, suggesting I am not the only one whose messages are being
inexplicably jailed.

Kyle

=3D=3D=3D=3D
I really like the straightforward configurability of Wireguard
out-of-the-box. It was astonishingly easy to configure a mesh to
replace my previous hub-and-spoke OpenVPN setup. Thank you for making
this easy.

That said, I'd like the ability to use Linux's policy routing engine
to allow for more complex packet flows across the VPN that are
currently incompatible with Wireguard's internal packet handling. For
example, let's say I have 4 nodes and want to be able to use each of
the nodes as the default gateway for different types of flows.
Modifying the sender side to respect a route's gateway is
straightforward:

--- a/drivers/net/wireguard/allowe
dips.c
+++ b/drivers/net/wireguard/allowe
dips.c
@@ -6,6 +6,8 @@
 #include "allowedips.h"
 #include "peer.h"

+#include <net/route.h>
+
 enum { MAX_ALLOWEDIPS_BITS =3D 128 };

 static struct kmem_cache *node_cache;
@@ -356,10 +358,18 @@ int wg_allowedips_read_node(struct
allowedips_node *node, u8 ip[16], u8 *cidr)
 struct wg_peer *wg_allowedips_lookup_dst(stru
ct allowedips *table,
                                         struct sk_buff *skb)
 {
-       if (skb->protocol =3D=3D htons(ETH_P_IP))
-               return lookup(table->root4, 32, &ip_hdr(skb)->daddr);
-       else if (skb->protocol =3D=3D htons(ETH_P_IPV6))
-               return lookup(table->root6, 128, &ipv6_hdr(skb)->daddr);
+       struct rtable *rt =3D skb_rtable(skb);
+       if (rt->rt_uses_gateway) {
+               if (rt->rt_gw_family =3D=3D AF_INET)
+                       return lookup(table->root4, 32, &rt->rt_gw4);
+               else if (rt->rt_gw_family =3D=3D AF_INET6)
+                       return lookup(table->root6, 128, &rt->rt_gw6);
+       } else {
+               if (skb->protocol =3D=3D htons(ETH_P_IP))
+                       return lookup(table->root4, 32, &ip_hdr(skb)->daddr=
);
+               else if (skb->protocol =3D=3D htons(ETH_P_IPV6))
+                       return lookup(table->root6, 128, &ipv6_hdr(skb)->da=
ddr);
+       }
        return NULL;
 }

The problem is that reply packets will be dropped via the source
address check for all but the peer with the default route listed in
AllowedIPs. The way the trie code works means a highly-invasive change
would be needed to allow for multiple peers to be associated with a
given prefix: I suspect any further complication (not to mention
possible additional data structure bloat) is undesirable, and anyway I
am looking to bypass most of the complexity created by Wireguard's
parallel packet routing infrastructure and instead leverage the far
more flexible Linux policy routing engine.

At this point, what I'd like to do is be able to skip the source
address check by configuration, instead relying on rp_filter and
firewall rules to reject bogus or unwanted packets. With such a config
knob, AllowedIPs would be used only for selecting the destination peer
based on the packet daddr or the route's gateway. For a mesh like I
described above, I would configure only a gateway IP for each peer in
AllowedIPs and use the policy routing engine for all other packet
routing behavior.

I appreciate that Wireguard works the way it does most likely because
routing is configured differently across the wide variety of devices
it supports (and in some cases may be unavailable to users), so I
don't think the AllowedIPs source address check should be removed by
default; but it would be nice if I could turn it off and rely on other
mechanisms in the kernel that would allow for more flexibility.


On Sat, Aug 19, 2023 at 10:05=E2=80=AFAM Daniel Gr=C3=B6ber <dxld@darkboxed=
.org> wrote:
>
> Hi wireguard, birds, and babelers,
>
> tl;dr I want to add a new Linux route attribute (think "via $wgpeer") to
> supplement wireguard's internal AllowedIPs logic for both routing and
> source address filtering.
>
> I've been pondering how to better integrate wireguard into dynamic routin=
g
> daemons, particularly BIRD and babeld. Essentially we want to be able to
> dynamically add/remove AllowedIPs depending on current reachability and/o=
r
> link quality stats.
>
> Looking at the wg netlink API I see two major efficiency/scalability
> problems: 1) there is no way to be notified of changes in AllowedIPs made
> by other processes meaning we have to do periodic scans and 2) a peer's
> AllowedIPs set can only be replaced wholesale, not modified
> incrementally. This is problematic as "someone" might, in the worst case,
> want to install an entire internet routing table's worth of AllowedIPs an=
d
> the set will likely change frequently. FYI: The IPv4 table has ~1M entrie=
s
> at present, yikes.
>
> Assuming external AllowedIPs changes are infrequent occationally dumping
> them all to keep a consistent view of the state shouldn't be too much of =
an
> issue as long as the netlink interface is performant enoug, so I'm going =
to
> concentrate on the add/remove API for now.
>
> Instead of doing the obvious thing and adding a more efficient incrementa=
l
> AllowedIPs netlink interface I figure why not just add a route attribute =
to
> select a target wg peer on a device. That way we could not only save memo=
ry
> (no separate AllowedIPs trie) but also simplify routing daemon
> implementation considerably.
>
> This would mirror how on ethernet you can have `dev eth0 via $router_ip`.
> I'm still reviewing the net/ code to find the best way to do this, but I'=
m
> thinking either a new RTA_WGPEER, like: `default dev wg0 via-wgpeer
> $peer_pubkey` or perhaps re-using RTA_VIA and keying off a statically
> configured AllowedIP addresses.
>
> To start I'd make this an opt-in replacement for our usual AllowedIPs
> logic, making sure to only activate it if any via* RTAs are active on a
> particular device, but if it proves to work well I don't see why we
> couldn't adapt the netlink code to maintain AllowedIPs using this RTA (bu=
t
> invisible to userspace) to re-use the same code and get rid of allowedips=
.c
> altogether. That's assuming this ends up being less code overall or perha=
ps
> more performant.
>
> Happy to hear your thoughts,
> --Daniel
