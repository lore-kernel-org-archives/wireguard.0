Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C269BEE49A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 20:28:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f77948a;
	Sat, 19 Aug 2023 20:14:12 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id afb3c43f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Jun 2023 13:04:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8deso22918135e9.0
 for <wireguard@lists.zx2c4.com>; Fri, 30 Jun 2023 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=krose.org; s=google; t=1688130249; x=1690722249;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0/7nNaL/P0R9e2nCJxMk8yYBb00MnGgU12TaDtIl+vI=;
 b=nhNoqpi9ACeoCbg5vy0z3nv5OjCRslYcB4ywnxLzq5liuc4j1dXkQBwyCcn9m9amcU
 Jtgw4qlKTRQKP6ANpOu1xqLzjDcfKvHt1l+nn4qGTwRXtDngNxLmztw7s/YTMl07+efO
 QNlklNRFz38InmsnLxO9qIAjjsElRqS7K8rms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688130249; x=1690722249;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0/7nNaL/P0R9e2nCJxMk8yYBb00MnGgU12TaDtIl+vI=;
 b=fKplw9oQ/8swVj7Eu9tdiAYSZpNc46Qb2Xa/pZ2PoOyWSGyb07O/6GtDS5sl+H303y
 XTh5oY2ykrCPHr6RC6L3SKO8Huxm4jgTYF693FCg5LaKScGFnTKYQ2BBnTVi7JOWiLBa
 kv6U2G2tnlD1RCKSHbjkOUqg5o7/x8OuIAW0dxR7TN5tBIqvIcGH7nrrJb2vRcWY+/fw
 IOfk1671kql/Y3WxVvvtpjnFN22iR6aHVHloh0sSdj9wCoJC8nNG9QlfyyultCgD+1lh
 8LFjVuKRznNbHoeUlywu7QmR6fDu9Yrw41G6FzIKkb5aHHLYJZilkvnRYABIEXnk8WHA
 us0g==
X-Gm-Message-State: AC+VfDzcFd3Hi45DNf5ouXXiHEfKuY6yt5oE/J1tbLa/Yq3ks2EOT8R/
 RrvYFJFQcf9DASpW4YUEast6bYV7m7G0C4Hqq8furQEfEfYUOhp230c=
X-Google-Smtp-Source: ACHHUZ4TexkValx3T3gz9xQOkfbDNlHpsgfrGtB85DOuQYNOZ+6W+czXnQZpGlIJXC0McLxUdaZdMxbtDqLh0BLYmYM=
X-Received: by 2002:a1c:4b17:0:b0:3f9:255e:ee3b with SMTP id
 y23-20020a1c4b17000000b003f9255eee3bmr2386766wma.30.1688130248507; Fri, 30
 Jun 2023 06:04:08 -0700 (PDT)
MIME-Version: 1.0
From: Kyle Rose <krose@krose.org>
Date: Fri, 30 Jun 2023 09:03:56 -0400
Message-ID: <CAJU8_nVZW5TiDrT-_bmn+DirbfCn4yuHtZi2xjJ+1ZRDi7ME1g@mail.gmail.com>
Subject: Option to enable policy routing
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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
 enum { MAX_ALLOWEDIPS_BITS = 128 };

 static struct kmem_cache *node_cache;
@@ -356,10 +358,18 @@ int wg_allowedips_read_node(struct
allowedips_node *node, u8 ip[16], u8 *cidr)
 struct wg_peer *wg_allowedips_lookup_dst(struct allowedips *table,
                                         struct sk_buff *skb)
 {
-       if (skb->protocol == htons(ETH_P_IP))
-               return lookup(table->root4, 32, &ip_hdr(skb)->daddr);
-       else if (skb->protocol == htons(ETH_P_IPV6))
-               return lookup(table->root6, 128, &ipv6_hdr(skb)->daddr);
+       struct rtable *rt = skb_rtable(skb);
+       if (rt->rt_uses_gateway) {
+               if (rt->rt_gw_family == AF_INET)
+                       return lookup(table->root4, 32, &rt->rt_gw4);
+               else if (rt->rt_gw_family == AF_INET6)
+                       return lookup(table->root6, 128, &rt->rt_gw6);
+       } else {
+               if (skb->protocol == htons(ETH_P_IP))
+                       return lookup(table->root4, 32, &ip_hdr(skb)->daddr);
+               else if (skb->protocol == htons(ETH_P_IPV6))
+                       return lookup(table->root6, 128, &ipv6_hdr(skb)->daddr);
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

Thoughts?

Thanks,
Kyle
