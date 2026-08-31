Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254E7CA6001
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8344a358;
	Mon, 5 Oct 2026 07:00:32 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d5699784
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48436668d20so603658f8f.3
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160542; x=1788765342; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MvCqbpJhgH/8AGMYemuWMRZPAzwtP4Us1pzRWWlXik4=;
 b=Q4BsxgAgua/YJBJNLPqpRG63wsn/Xziy217hpsHy6ZKAmAkwxwQpbk7zxhAELuCvy4
 1I2VXffFVpLUGR8qECmd7mCJ8DAVqYR1xZ8ld83JxuxSUNXmTbkItdcUA+HDjPzfCsCH
 u5yEDwwSdvU2RLczO6AJv9q8IiiVpwttY21yPlcS0rZ9PSsUr0TrTsYRiAOM72oB1z17
 DRtLJBlvbU6YUrFKM1CTOVBwpRxgqtJ0gLTnXysrvkElHcG1sq9ef8XN705/K/QCM7TI
 oHx8fyAVVDmsitt79B0AcltYEkBfWehk9/gaa2O6hQqvGuPqFCmUKtzvDxV1I+7y/znN
 AmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160542; x=1788765342;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MvCqbpJhgH/8AGMYemuWMRZPAzwtP4Us1pzRWWlXik4=;
 b=nsDMeXcR74feuWXhjhL3705WXoXsd2/2k+eMenF8uHPOmHYhYYGpivCJEv4P49URTG
 i8oE0QuOMDMM8D70S4lnQrp4+KO1xu+HX9FTFm1+PPhqASHUT7DDsNAu0tlkP92jFvx9
 qri2HRKpr049M+AvUCI6l/3hu4ngfyLiJSF3XH7wgKFJzgrJ9JoS4ieDiwxhiNNcwvep
 JJntnwVYeAW4JZDsrgbYLT7ilkeaRPgK928RzDqkjRgBDbhXrbKSh4enCp4j/tfAewAA
 JtbadIkMd0CXmoZWsLC1QN4tsUoVM/okQSh5NcajMiaLYkm9BJbeDngox1Jw/ygv3RU0
 BAlQ==
X-Gm-Message-State: AFuF++lz4DQLZd+cBZ4/IMh/Yq9ts8aDUgmHhxkee/OGnmHZZsc4e9sq
 2PmGKVD1ebiv9gyRuY584Nmeokhc5aBqVLNnCB7c+lOXC9dDJqbr7t3q3naGWQ==
X-Gm-Gg: AYBFou0PyRtyAYdiJxjRM5fwtOWLZ84kg+Pon1KWAgMW6+nKkUI5BJ9zUQDh7IdK5fz
 +kdaJbloedvs+k2qGBFl8DjZHFeXvvpJWTWGW95Nhaxfc7QL2LxET04cjapGDPCA+CLhCabsbuR
 MtZhkMGaeSerG9QnlC5Jd0pB3qDRWqK7/z0dWKv1cHuQr4tp2qDwyOQAeN7sHiw8/H0odF594EB
 kNcvl244oMlyyCbU1t9vqtB8d09oOMeNq08/aG4znHZqP/ZYXXH09OSyeNzeXb5hB9xSnmiGICs
 zTjtkGkNAfrWiWfhxNG3RsUdrqAZPRL07LyxS7LfVokk+TaRv8K/rRbFox2/snkjeeTt8BC/nj9
 fPEWH5g77OmK6kgqwBKgXk1kpT1JsWioez4AL9ZT4hwIn4sRnu+of3hG4kDapFzrz1inESKtf04
 oyN9AWbyGdkuanD42GTPv6KPYZTnxFaZu5+GySG8ynhKXlxcQvmL07thF1kKFMdjwJpmVsNnVoM
 dZQql0qsCCPtg0qr6LjmYBG
X-Received: by 2002:a05:6000:2dc9:b0:482:ea47:4484 with SMTP id
 ffacd0b85a97d-482f7996044mr36335786f8f.8.1788160542457; 
 Mon, 31 Aug 2026 00:15:42 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:41 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 01/10] WireGuardKitC: include
 sys/types.h for BSD type definitions
Date: Mon, 31 Aug 2026 10:15:28 +0300
Message-ID: <20260831071537.12966-2-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
References: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

The ctl_info and sockaddr_ctl definitions use u_char, u_int16_t and
u_int32_t without including <sys/types.h>. Newer clang versions with
strict module verification (Xcode 16 and later) refuse to build the
module because these declarations must be imported before use.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 Sources/WireGuardKitC/WireGuardKitC.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Sources/WireGuardKitC/WireGuardKitC.h b/Sources/WireGuardKitC/WireGuardKitC.h
index 54e4783..84c53f7 100644
--- a/Sources/WireGuardKitC/WireGuardKitC.h
+++ b/Sources/WireGuardKitC/WireGuardKitC.h
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: MIT
 // Copyright © 2018-2023 WireGuard LLC. All Rights Reserved.
 
+#include <sys/types.h>
+
 #include "key.h"
 #include "x25519.h"
 
-- 
2.50.1 (Apple Git-155)

