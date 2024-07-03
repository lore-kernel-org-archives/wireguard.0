Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B683EC30653
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Jul 2024 16:24:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a42abcd;
	Wed, 3 Jul 2024 16:20:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2a3c548f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Jul 2024 16:20:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 942E7CE2D2D;
 Wed,  3 Jul 2024 16:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4E9C2BD10;
 Wed,  3 Jul 2024 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720023623;
 bh=kM7jQRoVbuiZwl0a2UGo6LmrBqwjsYDrjS4j+uNWnaE=;
 h=Date:From:To:Subject:From;
 b=i4TKhmChXTss2c0ieiT4vXhUtXHKw3TO3mVLSbgWpbmaZvAJHPXZrqIJpe1Jnw2E7
 HG4UAbhghqSvIZqYeWGDIvrMCxnnPvSDTeVxDDkDbd8bOkDlU1vMYh3jf8F+jr+ycj
 YQ4W3P+nKxYdxB4Yv7Jg1efSQCyfkUiozZrdbX5FHg55VBZmIhpMjp8poS/847qWTJ
 XCkrJnbXE+Ucdd1Te11D8fC/I15FI8SghjbeBngiFKMf27UN52eey54s1yVdZKzKTW
 C4oUHekNjRa5qa/PtK69G+wTtur2KeGPSXST7hr5/S+Biq/tNBAE/N1/9OaiDDQUbS
 jU1hNCCgT0QQQ==
Date: Wed, 3 Jul 2024 18:20:19 +0200
From: Helge Deller <deller@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org
Subject: [PATCH] wireguard: allowedips: Prevent unaligned memory accesses
Message-ID: <ZoV6Q6lWgVRqe7eh@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On the parisc platform the Linux kernel issues kernel warnings because
swap_endian() tries to load a 128-bit IPv6 address from an unaligned
memory location:
 Kernel: unaligned access to 0x55f4688c in wg_allowedips_insert_v6+0x2c/0x80 [wireguard] (iir 0xf3010df)
 Kernel: unaligned access to 0x55f46884 in wg_allowedips_insert_v6+0x38/0x80 [wireguard] (iir 0xf2010dc)

Avoid such unaligned memory accesses by instead using the
get_unaligned_be64() helper macro.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
index 0ba714ca5185..daf967130b72 100644
--- a/drivers/net/wireguard/allowedips.c
+++ b/drivers/net/wireguard/allowedips.c
@@ -15,8 +15,8 @@ static void swap_endian(u8 *dst, const u8 *src, u8 bits)
 	if (bits == 32) {
 		*(u32 *)dst = be32_to_cpu(*(const __be32 *)src);
 	} else if (bits == 128) {
-		((u64 *)dst)[0] = be64_to_cpu(((const __be64 *)src)[0]);
-		((u64 *)dst)[1] = be64_to_cpu(((const __be64 *)src)[1]);
+		((u64 *)dst)[0] = get_unaligned_be64(src);
+		((u64 *)dst)[1] = get_unaligned_be64(src[8]);
 	}
 }
 
