Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FDAC3815B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:27:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B40B120578
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LugT/ayZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B40B120578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c85fbc6c;
	Tue, 14 Apr 2020 08:03:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92294b89
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Apr 2020 22:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586816964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=xENEjcmhPGwc2y5vLor/EJ6DRudCRi6D5WVSWBMRKcI=;
 b=LugT/ayZwGJh2hhC/FQedvRpBR4YnyAqL1pmPF/hwacf8K9MXrqc6zcOj8TBL5y89+NaDi
 Ikmv+jnFvQbd6IrT16Zr7yBoCNtZciULi2umqm03WkWxdOR7v5HElkXY14XyaGtZrrJ907
 drtGWT9jEV2nvMjh8RRzm12eTfeldr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-8AaFvKVINBm7IlQx6B5FDA-1; Mon, 13 Apr 2020 18:29:20 -0400
X-MC-Unique: 8AaFvKVINBm7IlQx6B5FDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC5481005513;
 Mon, 13 Apr 2020 22:29:15 +0000 (UTC)
Received: from llong.com (ovpn-115-28.rdu2.redhat.com [10.10.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3589D100164D;
 Mon, 13 Apr 2020 22:29:07 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
Cc: linux-mm@kvack.org, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-ppp@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-wireless@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-fscrypt@vger.kernel.org, ecryptfs@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-bluetooth@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 cocci@systeme.lip6.fr, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: [PATCH v2 2/2] crypto: Remove unnecessary memzero_explicit()
Date: Mon, 13 Apr 2020 18:28:46 -0400
Message-Id: <20200413222846.24240-1-longman@redhat.com>
In-Reply-To: <20200413211550.8307-1-longman@redhat.com>
References: <20200413211550.8307-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mailman-Approved-At: Tue, 14 Apr 2020 10:03:41 +0200
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

Since kfree_sensitive() will do an implicit memzero_explicit(), there
is no need to call memzero_explicit() before it. Eliminate those
memzero_explicit() and simplify the call sites. For better correctness,
the setting of keylen is also moved down after the key pointer check.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 19 +++++-------------
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      | 20 +++++--------------
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 12 +++--------
 drivers/crypto/inside-secure/safexcel_hash.c  |  3 +--
 4 files changed, 14 insertions(+), 40 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index aa4e8fdc2b32..8358fac98719 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -366,10 +366,7 @@ void sun8i_ce_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct sun8i_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	crypto_free_sync_skcipher(op->fallback_tfm);
 	pm_runtime_put_sync_suspend(op->ce->dev);
 }
@@ -391,14 +388,11 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		dev_dbg(ce->dev, "ERROR: Invalid keylen %u\n", keylen);
 		return -EINVAL;
 	}
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
-	op->keylen = keylen;
+	kfree_sensitive(op->key);
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
 	if (!op->key)
 		return -ENOMEM;
+	op->keylen = keylen;
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
@@ -416,14 +410,11 @@ int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	if (err)
 		return err;
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
-	op->keylen = keylen;
+	kfree_sensitive(op->key);
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
 	if (!op->key)
 		return -ENOMEM;
+	op->keylen = keylen;
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 5246ef4f5430..0495fbc27fcc 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -249,7 +249,6 @@ static int sun8i_ss_cipher(struct skcipher_request *areq)
 			offset = areq->cryptlen - ivsize;
 			if (rctx->op_dir & SS_DECRYPTION) {
 				memcpy(areq->iv, backup_iv, ivsize);
-				memzero_explicit(backup_iv, ivsize);
 				kfree_sensitive(backup_iv);
 			} else {
 				scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
@@ -367,10 +366,7 @@ void sun8i_ss_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct sun8i_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	crypto_free_sync_skcipher(op->fallback_tfm);
 	pm_runtime_put_sync(op->ss->dev);
 }
@@ -392,14 +388,11 @@ int sun8i_ss_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		dev_dbg(ss->dev, "ERROR: Invalid keylen %u\n", keylen);
 		return -EINVAL;
 	}
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
-	op->keylen = keylen;
+	kfree_sensitive(op->key);
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
 	if (!op->key)
 		return -ENOMEM;
+	op->keylen = keylen;
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
@@ -418,14 +411,11 @@ int sun8i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		return -EINVAL;
 	}
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
-	op->keylen = keylen;
+	kfree_sensitive(op->key);
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
 	if (!op->key)
 		return -ENOMEM;
+	op->keylen = keylen;
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index fd1269900d67..6aa9ce7bbbd4 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -341,10 +341,7 @@ void meson_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	crypto_free_sync_skcipher(op->fallback_tfm);
 }
 
@@ -368,14 +365,11 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
 		return -EINVAL;
 	}
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
-	op->keylen = keylen;
+	kfree_sensitive(op->key);
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
 	if (!op->key)
 		return -ENOMEM;
+	op->keylen = keylen;
 
 	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypto/inside-secure/safexcel_hash.c
index 43962bc709c6..4a2d162914de 100644
--- a/drivers/crypto/inside-secure/safexcel_hash.c
+++ b/drivers/crypto/inside-secure/safexcel_hash.c
@@ -1081,8 +1081,7 @@ static int safexcel_hmac_init_pad(struct ahash_request *areq,
 		}
 
 		/* Avoid leaking */
-		memzero_explicit(keydup, keylen);
-		kfree(keydup);
+		kfree_sensitive(keydup);
 
 		if (ret)
 			return ret;
-- 
2.18.1

