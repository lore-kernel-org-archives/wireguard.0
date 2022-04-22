Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F070C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Apr 2022 20:12:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1799410a;
	Sun, 24 Apr 2022 20:09:54 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a19ffc03
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 17:45:45 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 5CA0A240107
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 19:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1650649545; bh=dbkjilLum2DXeZ2wvcVndreC6ItOZx4/VJXu6i2Pkr4=;
 h=From:To:Cc:Subject:Date:From;
 b=fRDpcT1tlBb92HfiQxpoty/d2DZBtxOEW8G8nsAqJtibwcsx1JXJCXwvvA0PqGSlY
 NOMLhRljJqYhNF4WwLNMtdSM9OK9AONWa4WmjblzAPF433Es+GqyDd4dBQGXdzti2j
 R0lIxO+5TaZU2YvKAZQ8njdSBF/n3Fo41by9vYEZAwGzg/GN2drdPIm7QIvoZ7gLxX
 06VaYLtz0hBSAW3f1ZNJY7hOVbf0xvSpFj4FirWgvUiTjNDR9xiE5UThZgFkNSiuo/
 Y9O6IzHHh8xGvlbN8GOfMK9B8Gxy4w9kJ4SScNzdqvPGI04e8isy8vWNGQn26Hr6Vb
 x+lGm4Ny/RRLQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4KlMJS4Jnwz9rxG;
 Fri, 22 Apr 2022 19:45:44 +0200 (CEST)
From: Andreas Weigel <andreas.weigel@posteo.de>
To: wireguard@lists.zx2c4.com
Cc: Andreas Weigel <andreas.weigel@posteo.de>
Subject: [PATCH 1/1] wg syncconf: explicitly reset
 PresharedKey/PersistentKeepalive
Date: Fri, 22 Apr 2022 17:45:06 +0000
Message-Id: <20220422174506.22299-2-andreas.weigel@posteo.de>
In-Reply-To: <20220422174506.22299-1-andreas.weigel@posteo.de>
References: <20220422174506.22299-1-andreas.weigel@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 24 Apr 2022 20:09:51 +0000
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

make wg syncconf correctly clear a preshared key or keepalive in case
the file config does not define those; currently syncconf does not
change these settings at all if runtime has them set but file does not
---
 src/setconf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/src/setconf.c b/src/setconf.c
index bfd0a3a..8661a92 100644
--- a/src/setconf.c
+++ b/src/setconf.c
@@ -63,6 +63,14 @@ static bool sync_conf(struct wgdevice *file)
 	}
 
 	for_each_wgpeer(file, peer) {
+		if (!(peer->flags & WGPEER_HAS_PRESHARED_KEY)) {
+			memset(peer->preshared_key, 0, WG_KEY_LEN);
+			peer->flags |= WGPEER_HAS_PRESHARED_KEY;
+		}
+		if (!(peer->flags & WGPEER_HAS_PERSISTENT_KEEPALIVE_INTERVAL)) {
+			peer->persistent_keepalive_interval = 0;
+			peer->flags |= WGPEER_HAS_PERSISTENT_KEEPALIVE_INTERVAL;
+		}
 		pubkeys[i].pubkey = peer->public_key;
 		pubkeys[i].from_file = true;
 		++i;
-- 
2.25.1

