Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E56BC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:49:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC69208D5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hb9fxq.ch header.i=@hb9fxq.ch header.b="lJq+I/Ug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC69208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hb9fxq.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e948a56;
	Wed, 17 Jun 2020 07:26:46 +0000 (UTC)
Received: from sw.superlogical.ch (sw.superlogical.ch [2a03:4000:9:189::4a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ddfd273e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jun 2020 15:13:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F17F8C28BF; Tue,  9 Jun 2020 17:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hb9fxq.ch; s=default; 
 t=1591716067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8+Nt7ROQbqai3uPLzcGnzXulo/FR7FIpsmMrw9Q5mCQ=;
 b=lJq+I/Uggqk8XVZXt7sJ29wlB6RYBBwtBT3t5FbUTSQnwz7E+ydTJiqhYZxCNeNVfWLU69
 +UeQN6UxZzoJNrqalKMB8tDyzK1gN1VipBrd2Yb+5ZTXiH2q1T3V2dT5r0gmyXfsKpcFDB
 2USr9tk1D4ftm1y+diZ7PIADPwLAJ8yq8KZLgo4mSpIv+8LWSiPkQnmBin1Xewb2wcIh6N
 HLDjBHQSDr6BZBUAZVfQSqMYc38acKGJrZXQo9x85stX7QRtJ+IJaFzkchaLI0x7LsjOqz
 9T0tMYfp2KV5QxbOiBtvitbibGvvPTZKWZPYGavpvJT1chaTlRzJ5EpiJ48dyA==
From: Frank Werner-Krippendorf <mail@hb9fxq.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Frank Werner-Krippendorf <mail@hb9fxq.ch>
Subject: [PATCH] Do not assign in if condition
 wg_noise_handshake_consume_initiation()
Date: Tue,  9 Jun 2020 17:21:00 +0200
Message-Id: <20200609152100.29612-1-mail@hb9fxq.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:26:35 +0200
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

Fixes an error condition reported by checkpatch.pl which caused by
assigning a variable in an if condition in
wg_noise_handshake_consume_initiation().

Signed-off-by: Frank Werner-Krippendorf <mail@hb9fxq.ch>
---
 drivers/net/wireguard/noise.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/noise.c b/drivers/net/wireguard/noise.c
index 626433690abb..9524a15a62a6 100644
--- a/drivers/net/wireguard/noise.c
+++ b/drivers/net/wireguard/noise.c
@@ -617,8 +617,9 @@ wg_noise_handshake_consume_initiation(struct message_handshake_initiation *src,
 	memcpy(handshake->hash, hash, NOISE_HASH_LEN);
 	memcpy(handshake->chaining_key, chaining_key, NOISE_HASH_LEN);
 	handshake->remote_index = src->sender_index;
+	initiation_consumption = ktime_get_coarse_boottime_ns();
 	if ((s64)(handshake->last_initiation_consumption -
-	    (initiation_consumption = ktime_get_coarse_boottime_ns())) < 0)
+	    initiation_consumption) < 0)
 		handshake->last_initiation_consumption = initiation_consumption;
 	handshake->state = HANDSHAKE_CONSUMED_INITIATION;
 	up_write(&handshake->lock);
-- 
2.20.1

