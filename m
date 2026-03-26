Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EEB10AB82E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Mar 2026 23:12:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 982b4f8e;
	Thu, 26 Mar 2026 23:12:18 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ac80c276
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Mar 2026 20:18:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso14049095e9.2
 for <wireguard@lists.zx2c4.com>; Thu, 26 Mar 2026 13:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774556318; x=1775161118; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xycnlm/h8VsaAluVGkMfR2izvoHRISt/YiMCwALMUO4=;
 b=HelIFM5TS5ntZT1Bh2XpfEXvCc+Eror5OSXqVY0VmVYCqCgFHYnvpdIzteeLRok2fS
 k4xASMzd5gZLulxWeU38Mu3ePE4cRnKb+Yk8aZm1XaW5aEIa7upe8sTxVuz+OCo/yb+y
 hME2w8I/uerhEdzUMME+PbPxSItJ4vSou0aHx+E8NGLZKC5UNQ4C8ZuCNXB097hMJVZG
 iiQU8rNs8DSR1YLGT4XoK/Acm5FpXCPhccHEun6VSUZ+wnuGoHWegw+gec3efwqNQkUq
 7KTcy3OkZyJzPizISDZn2ogK6HIAYAExXuDm8xg+2RyCAFcjekHHNMO0pfBriL/YJ/rV
 zdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774556318; x=1775161118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xycnlm/h8VsaAluVGkMfR2izvoHRISt/YiMCwALMUO4=;
 b=pri+I2xvvtRngwj+5CN0WE6WmsnddzfAzDRRyukTs91O9+lJ1LB8SnRMN6zkwH/fE+
 f5InRenb9fjAl+qzAfQ7KrFWQO6GK4AgYvSwLs2WKRTloSz5BM6kH1zbixfANs7C9xFd
 fgekp9WRC2ovueiPWGNLeTvXz8+eaPOszSRWo5mA0KzG+svvr/vtvWheRzKhO0paEG9m
 btHEV0vSPNGJl+sdPKHe74qjpiqTO2pcEDWb8x7mLpWwPIL84nn32NmpVJysQWsfGWm6
 zaKgYVlfQELFHxwCGt20h2h234XxCkxdIsnDngX/PRZ1AtBz+89XrhRdAa/5nLPYJp7p
 mw8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjDqUZyTWumqJcN2M+fyn4K0Wj6erPj1u8ytuqn7Sj/s7dG6RBVYrX9WWExTmGt3Q0YzuDfbH1LfQ=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw8xBeN+eY0uOoXGsRMhYxiGvU14S3YMmDk56/M96sR2qBTiVxi
 bq6fiWra06Bri8uHXz05tDJqZ+AL4qRLCQjCLGBp9s4trt/91BIxAcPc
X-Gm-Gg: ATEYQzwDlm/uCCMOBfv9CWSUe9XWgjC3qGMjlXpMW1bj47SkLpIaPbyqt7TfXCwVqBz
 uv48jNn7qywmOsR7SK/iX9/UUw6EWEsuH1ZZWG1joajNXTotXdHIaLTlhxBd4cE18YHx7Nw5jQh
 rwb7YL+iff0+A9AUwlYmmzTeYVMJDVhx9JNs8s+VdpNqZ51+JX63ccyjHhoXc1t3ig/w09/LBGa
 73CD1iyr3NGkjNxJ9T3P1Fjq4Nt5s+tIfSJWUvIPiZWgr4IYreH+P+n7YqVdudLCI14AseNKcVS
 EQBggTUSDKON2wuQWyrjjcftRjXfnaLtBn2Cwi7CGGRNgPofjLpHtnz8loCgjxf/YJ1BNRPATkv
 wuGfxZPW37v65a6ZohUfS3IEcZ5J/kQfbxlfHnPDrcMEAWutz122sr0EGdUPvkOdruAzP1IQ2us
 fAsEFMOpbTMUViZhoyF6Huc60COh1cWnk11tVis0fPKkCzVZd6NPMUSF+46nEq+gBL2uUAYZvHq
 xCPhcWsiwA5
X-Received: by 2002:a05:600c:8708:b0:483:b505:9db7 with SMTP id
 5b1f17b1804b1-48727f1b5f1mr442955e9.32.1774556317978; 
 Thu, 26 Mar 2026 13:18:37 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk.
 [82.69.66.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48725d9acb9sm3330475e9.1.2026.03.26.13.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 13:18:37 -0700 (PDT)
From: david.laight.linux@gmail.com
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH next] wireguard: selftests: Remove spurious precision from
 banner printf
Date: Thu, 26 Mar 2026 20:18:36 +0000
Message-Id: <20260326201836.3957-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Mar 2026 23:12:16 +0000
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

From: David Laight <david.laight.linux@gmail.com>

Change ("%*.s", len, "") to ("%*s", len, "").
The former is equivalent to "%*.0s" but is really a typing mistake.
No actual change to the output.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 tools/testing/selftests/wireguard/qemu/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/qemu/init.c b/tools/testing/selftests/wireguard/qemu/init.c
index 3e49924dd77e..c87570494d30 100644
--- a/tools/testing/selftests/wireguard/qemu/init.c
+++ b/tools/testing/selftests/wireguard/qemu/init.c
@@ -53,7 +53,7 @@ static void print_banner(void)
 		panic("uname");
 
 	len = strlen("    WireGuard Test Suite on       ") + strlen(utsname.sysname) + strlen(utsname.release) + strlen(utsname.machine);
-	printf("\x1b[45m\x1b[33m\x1b[1m%*.s\x1b[0m\n\x1b[45m\x1b[33m\x1b[1m    WireGuard Test Suite on %s %s %s    \x1b[0m\n\x1b[45m\x1b[33m\x1b[1m%*.s\x1b[0m\n\n", len, "", utsname.sysname, utsname.release, utsname.machine, len, "");
+	printf("\x1b[45m\x1b[33m\x1b[1m%*s\x1b[0m\n\x1b[45m\x1b[33m\x1b[1m    WireGuard Test Suite on %s %s %s    \x1b[0m\n\x1b[45m\x1b[33m\x1b[1m%*s\x1b[0m\n\n", len, "", utsname.sysname, utsname.release, utsname.machine, len, "");
 }
 
 static void seed_rng(void)
-- 
2.39.5

