Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FF4F483DE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 17:37:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 76c3c768;
	Mon, 23 Mar 2026 17:37:36 +0000 (UTC)
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 31876dac
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Mar 2026 23:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robben.io;
 s=protonmail2; t=1773875201; x=1774134401;
 bh=0jpXlsf6fMeYzC3cj/poC7OCU0M5ltrlgZjDX/C6dx4=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=QiXB9Hz4lM9htLTQrNRic7GfeV9T10ymk74PRs3RGNkeXnxsv+yxab4pq3yc9iB2n
 ZxyP2/MsJ+Jz2PTITwc+zKEtFABhnempi47ZVKXTp3TY7G4Fpm09caDAPIYyLHS6ep
 r/xunPpHAOMjQl+ANSjc3FvGH1RT0FGSuLrKDOEvpwHiy7rjmIbjQaIRB3jgWCRU+w
 awAxDooq8i5AVAQNX6Ds53kC2B2bhgokBKANUTPTZj16LIzxDmbOp8GEf0zRPAE9v0
 KcFZdJVzbaan+eyL4vi0DYeX8AdZfAN1Rjnq3nwY7d2JPljDh/d1WFmqpE/4al0xlN
 oEp0M1NMUzyhQ==
Date: Wed, 18 Mar 2026 23:06:38 +0000
To: wireguard@lists.zx2c4.com
From: Jeroen Robben <jeroen@robben.io>
Cc: Jeroen Robben <jeroen@robben.io>
Subject: [PATCH] wireguard: use memzero_explicit() when zeroing handshake key
 material
Message-ID: <20260318230635.227291-1-jeroen@robben.io>
Feedback-ID: 28918330:user:proton
X-Pm-Message-ID: e39914d409e4d3c68c9474aa8c0690ff73287140
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Mar 2026 17:37:32 +0000
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

Replace memset() calls in handshake_zero() with memzero_explicit()
to ensure clearing handshake state is not optimized away by the compiler.

Signed-off-by: Jeroen Robben <jeroen@robben.io>
---
 drivers/net/wireguard/noise.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/noise.c b/drivers/net/wireguard/noise.c
index 7eb9a23a3d4d..b8be04549fa6 100644
--- a/drivers/net/wireguard/noise.c
+++ b/drivers/net/wireguard/noise.c
@@ -77,10 +77,10 @@ void wg_noise_handshake_init(struct noise_handshake *ha=
ndshake,
=20
 static void handshake_zero(struct noise_handshake *handshake)
 {
-=09memset(&handshake->ephemeral_private, 0, NOISE_PUBLIC_KEY_LEN);
-=09memset(&handshake->remote_ephemeral, 0, NOISE_PUBLIC_KEY_LEN);
-=09memset(&handshake->hash, 0, NOISE_HASH_LEN);
-=09memset(&handshake->chaining_key, 0, NOISE_HASH_LEN);
+=09memzero_explicit(&handshake->ephemeral_private, NOISE_PUBLIC_KEY_LEN);
+=09memzero_explicit(&handshake->remote_ephemeral, NOISE_PUBLIC_KEY_LEN);
+=09memzero_explicit(&handshake->hash, NOISE_HASH_LEN);
+=09memzero_explicit(&handshake->chaining_key, NOISE_HASH_LEN);
 =09handshake->remote_index =3D 0;
 =09handshake->state =3D HANDSHAKE_ZEROED;
 }
--=20
2.53.0


