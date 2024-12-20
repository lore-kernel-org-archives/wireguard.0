Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486C4C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f88ddef3;
	Tue, 20 May 2025 19:49:50 +0000 (UTC)
Received: from mx.nixnet.email (mx.nixnet.email [2a01:4ff:f0:2247::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a8ef6597
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Dec 2024 11:04:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mx.nixnet.email (Postfix) with ESMTPSA id 56BE97D32E
 for <wireguard@lists.zx2c4.com>; Mon, 23 Dec 2024 12:04:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pwned.life;
 s=202002021149; t=1734951892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc; bh=KvMqZ5j6kIh/vlkKYjh5R5wrXVyBSOrcA2DFp5Z9kbY=;
 b=dmbtUyB+Bzb4t07GsaD+rpJBwTR+JKdNRd1iZ/kupZx0uVzp7DtacJt1rKmGhyUSmqWjSC
 JmHtEbBY0nbFPagoECjmlVc7LWJtXSNXDmLEiTPKBvGy+NsuJubTeRoZAVxQZwxdX9g1+z
 yv79v6yiOTmyax1puZiP2ZYNpD5RgsU=
Message-Id: <D6J1477IJK6M.71HCECAKVDXG@pwned.life>
To: <wireguard@lists.zx2c4.com>
From: "fossdd" <fossdd@pwned.life>
Date: Fri, 20 Dec 2024 08:29:26 +0100
Subject: [PATCH] wg-quick: use SUDO variable for a different sudo
 implementation like doas
X-Mailman-Approved-At: Tue, 20 May 2025 19:45:56 +0000
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

Signed-off-by: fossdd <fossdd@pwned.life>
---
 src/wg-quick/linux.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..7795c0b 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -82,7 +82,7 @@ read_bool() {
 }
 
 auto_su() {
-	[[ $UID == 0 ]] || exec sudo -p "$PROGRAM must be run as root. Please enter the password for %u to continue: " -- "$BASH" -- "$SELF" "${ARGS[@]}"
+	[[ $UID == 0 ]] || exec "${SUDO:-sudo}" "$BASH" -- "$SELF" "${ARGS[@]}"
 }
 
 add_if() {

base-commit: 13f4ac4cb74b5a833fa7f825ba785b1e5774e84f
-- 
2.47.1
