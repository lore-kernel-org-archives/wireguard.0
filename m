Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57385CF34B7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b3ba0c0;
	Tue, 18 Nov 2025 17:32:22 +0000 (UTC)
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch
 [109.224.244.20])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6b080132
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Sep 2025 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tcarey.uk;
 s=protonmail; t=1758198782; x=1758457982;
 bh=Dhuee6i8nQUqCAQxEyGKAbtdRVAOo3Kgp8kTj/RP8x8=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=A66hdy3/ExMj0GZWCn6nDxMqio2EzLOa19BpTtdyxXzBx0cUyUKgj4WKUOIn0GJWR
 ye66Lsj2kagWchPlD6l3GJK0ozHdibtCo2b0sJ3MAX+CBc2jirvag/6K1+W6MeKah6
 yBI/KjKcRZM9FWRuDgWqg+3ofi0AW7KS1nOBEQnCz2Qt3TdD9afoGMm5ONBZixgkC9
 Tg7n6hI+vl63u07kpc9U4bv+hoVatwHwzv4fbwRike0Hevs4bu76c3sNSBe9WuTx7T
 sWPzAYmjksLM1yKrH+vXxI7Ki+uYRa7VgHitU4hW/iLjj2N7c8oypKV3Jzjd07AS0+
 MubMxxIokfE0A==
Date: Thu, 18 Sep 2025 12:32:58 +0000
To: wireguard@lists.zx2c4.com
From: Torin Carey <torin@tcarey.uk>
Cc: netdev@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] wireguard: remove unnecessary use of ipv6_stub
Message-ID: <20250918123234.297856-1-torin@tcarey.uk>
Feedback-ID: 43460779:user:proton
X-Pm-Message-ID: fce568dd48d251d9349f9357e3a00c789e048133
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

ipv6_stub is required for cases where ipv6 may be compiled as a module
and might not be loaded from a given context.

wireguard has a Kconfig dependence of IPV6 || !IPV6 so will also be compile=
d
as a module if ipv6 is, and wireguard already accesses a symbol of this mod=
ule
via ipv6_mod_enabled, so already has a module dependence on ipv6.

Removal is desireable since it removes an unnecessary indirect branch, but
also reduces the effort needed should ipv6_stub ever be modified/replaced.

Signed-off-by: Torin Carey <torin@tcarey.uk>
---
 drivers/net/wireguard/socket.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.=
c
index 253488f8c00f..593324d564d2 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -136,8 +136,8 @@ static int send6(struct wg_device *wg, struct sk_buff *=
skb,
 =09=09=09if (cache)
 =09=09=09=09dst_cache_reset(cache);
 =09=09}
-=09=09dst =3D ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
-=09=09=09=09=09=09      NULL);
+=09=09dst =3D ip6_dst_lookup_flow(sock_net(sock), sock, &fl,
+=09=09=09=09=09  NULL);
 =09=09if (IS_ERR(dst)) {
 =09=09=09ret =3D PTR_ERR(dst);
 =09=09=09net_dbg_ratelimited("%s: No route to %pISpfsc, error %d\n",

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
--=20
2.48.1


