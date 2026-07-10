Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B8ECA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0d36b9ac;
	Mon, 5 Oct 2026 06:59:53 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4d652f6f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2026 13:22:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493f45e206dso3024745e9.1
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jul 2026 06:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783689768; x=1784294568; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MvCqbpJhgH/8AGMYemuWMRZPAzwtP4Us1pzRWWlXik4=;
 b=pB9/hoaMbhXNBvIdDRwH4B58dntEnnaM2udWQCJxBIQjeh3cShk5qEWEv8WsDdpNPq
 +VcsI6kFuD+RpAmDbJkuHZHVm/Uztw5UiM9bfGyQkk/YxTR+Bfp84kjdHlqurBt+1nxn
 aj1KdZZ8/xJUmjMvGZmtFFitjwpYjbSRqjJ4OS9BoDG9u5WojiGgkQIb+OLngKkzr2LK
 1rKUd1qsSoeK9xJsNHfuAoS7hlU8cxqIENiecXBN0xIF6W/eIgMtZ1LkAuVeH0TZSLX7
 NjRNgSj5ZXBY9R7hxY6Q+m++e4vQeF2TVwmy61gSJyFTrG7mFFQ+4S5MIX3ezUZ0ThHd
 rwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783689768; x=1784294568;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MvCqbpJhgH/8AGMYemuWMRZPAzwtP4Us1pzRWWlXik4=;
 b=NMVYp/Iw9cCfl7yAIRpb8VHS2AZbbdmNrsVcqG4GFvZG0eGWufygKWl9bcFbfBcE6a
 5bwGEoaewG5mG/PcQmsbPUg8c9kM9wkUZ8zmk1ajZ6Pmct3eLzVoNZ+Udf2SMgZJduR4
 l/c+0HWwtTg2JxE+eaupTY7YpIAd36arskK3aByI5JdlGYVrtUdxsbxdTeNixHSoQTU/
 9J1p8Wp/jEml2YtIjEqsN40KH+hrQU3V0KrOOs8lsPBpaycQFd2vhg3fQvDYaF0U42Wm
 K9mfsBaV54Teav5XEGcgUUw9NjWo64ykXmK/+tizpjJW3kR3VUb7/+ttpo2IuMxthKFU
 h1QQ==
X-Gm-Message-State: AOJu0YxLzc3Q0vV74IdGNi2pPMM7T/c0/UNUOj03bE36MUWIVqhSmWvD
 wun2ULk85Um5z2iEl4jeX0EfhYGn/+NedHndeWvhnMmiljKTEXJKc1zt
X-Gm-Gg: AfdE7ckbC/Wo2KTiYzsP9p7IdRCRybXdoVJRYxdNzaMaNVm643WesuovBlWBbsqjcIh
 hqDAHNc6wKtjzvGRum5pDersC6Nv0VNJLbrNvphBAJg2rUshBfz0hZUvPZnMPUn29yJS9UOe6ym
 EgvDyCvFAM/w2seLdxKD/imwMQ323wng7AS83aj+y5OL8z67Itw+XeMa1mXcG4P2IP7tsQsmRn7
 2JQXLZerPsxB6sClpxlEPiVC/GVzbLhJ5S2VxMNew+ZRlsl47rrlObP0Ys2Ley8TyKLg5reFS53
 5YVHsCKlsM2HPHWMz9ieq8BC2GQvdKFCw7ek2HMD0z0zFa+tXoKy3wifrvubWDkJLZeCf2OgMmJ
 NlB39tPw4jRXLFgCiIjW9I8bUMpTtDXv83Cn5rSYsSVlvNmVHhbI/S/9KUjSPm5GI48BCSnAWWh
 bEzrRaLzVaW5bgaFUpCE8ijAjDcyeKV+/tfQXZSSzHzxixCULrng==
X-Received: by 2002:a05:600d:15a:10b0:492:7025:13fd with SMTP id
 5b1f17b1804b1-493f2ae402dmr27528255e9.0.1783689768100; 
 Fri, 10 Jul 2026 06:22:48 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039bcdasm62653868f8f.21.2026.07.10.06.22.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jul 2026 06:22:47 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [PATCH wireguard-apple 1/7] WireGuardKitC: include sys/types.h for
 BSD type definitions
Date: Fri, 10 Jul 2026 16:22:33 +0300
Message-ID: <20260710132242.39814-2-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
References: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
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

