Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD7C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 14:22:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 072da8f6;
	Tue, 20 May 2025 19:55:11 +0000 (UTC)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2cd3f2d8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2025 04:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1740370417;
 bh=QUnxINV4h0+72Ou0M9jqMPGNZyrytkwHTR/8PMwxqYM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=c8kZ0IbrnJln1gGF2ss+9B9o962Jy1/Fts1QmfBmJvqOc52a5LmNXVK5NcvFreDO9
 1Vsf5Ivqc6Paj2fo86XtC6HEDKyySPgHCI60lLKoaxiJ+eKHZVUV89s8/9733RXC0Z
 Wqt4/eNAhX1QezmoGXIGrj6KXm+o1PT7SJxg5+Vs=
X-QQ-mid: bizesmtpip4t1740370367th0m8ul
X-QQ-Originating-IP: YACropfZKbFnsY+WYSwIdCcFXQBCfwM3OPJ2699B36A=
Received: from localhost.localdomain ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 24 Feb 2025 12:12:45 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 210867971091029739
From: WangYuli <wangyuli@uniontech.com>
To: Jason@zx2c4.com,
	shuah@kernel.org
Cc: wangyuli@uniontech.com, horms@kernel.org, tglx@linutronix.de,
 jstultz@google.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com
Subject: [RESEND PATCH v2] wireguard: selftests: Cleanup
 CONFIG_UBSAN_SANITIZE_ALL
Date: Mon, 24 Feb 2025 12:12:38 +0800
Message-ID: <6945896DD80A71BD+20250224041238.45039-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MPAlP4yRn0xgUjN0gIBL01n/MBhEZCsEcAKtVOEh6kVYgpA/OKfZoppR
 Gy6EExKtL9VBD3aHP+/Q82Y9EGvQGXbmdW9Dr5czGaJ9imlQUVxv4dKorSyUO2inX3k2Mfl
 fFnOhKhkLoPx+oP/McSyZ+l3VGyZKW1xPzZRxzQSlgA+kJOQ97bRtTfdJjWwKlL0JXNIHIX
 lJuCO/KDy2DDseG20VpucLPWAxrA+0RlGZNa7i0xVJdNx/oTKC0bCxna4bY4wx6sjpG+g1v
 UdmOZJOD4aU4rNteih3M1YsLbdO+BTHId2NDmotndPq0ycWZHyqYLFUfevkkmaRMfY4ABZ1
 1shpjAvb/otOTk3+WRxGeZPSNWm5O+9g2NvAiu7YednSYioZV+7tBLkxbc2ClJ2+3oSsyBg
 WM9hCFuo9wgrHFx18fP6L6U3qIjOTZlXO4bhFqJX4vSLIDeVMGLXxOKVbM9JpLjEtp89sP+
 ISNQU29BpvyLC55XzFeBcWtlzZ6VC0hwhrOw8RV7GOiY5yWo79kcpYGtQPXbE9cOddyaiLf
 L1gXJf4eo1WsCynmtGsdvz8pzxaPcw5kXjJmd9VkS6ndRDD2WjpQpluOvJFxWdaWw55r9aT
 Zk04ixLKjQC0JdM7q/a/OAGsaTWwcYMxy3jVdWCXb1iADItmua6w0ZxRis0OC1IYsIoBnOU
 PLdn8fqOMde0XYJtnI/dpztOfBPH7v8FRGiuH7m3bcgQYmjjhXLOXYLyGkNG3eBfiyXH9vG
 6pETQth2Blt0TqE85r12KEatLXQ+bzsNUAUCGY+3nVArClmJTsIuFba8UuakeYqnLr2x20y
 310j6D1CE1saKKrSccQ1+xlTJ3pkRbBPROOM1SioXYH3pR3m2Bfz7zZm647YK+3crx4XEGx
 d+s7riJflmY3lUteAhitHc0suL1r7yRx8P6iWLClOJaKMN1FR/BgOfXXoPBEUGPXHRPJ+TV
 nJBqRcER7zOpLkDzQ3u8JxgrJlwWOami8Y9JsAquIrW8b02uNToVFxC5advjrl6jVBjUVp1
 PoWxtjAtwjvg3wNEVIClI/Lq1376VgH/wl7e7XXPrlclnjj/SKDJErt/5Iof7uUEqTptrTf
 w==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

Commit 918327e9b7ff ("ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL")
removed the CONFIG_UBSAN_SANITIZE_ALL configuration option.
Eliminate invalid configurations to improve code readability.

Link: https://lore.kernel.org/all/20250123105743.GO395043@kernel.org/
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2: Add Simon Horman's "Reviewed-by" tag.
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 tools/testing/selftests/wireguard/qemu/debug.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/qemu/debug.config b/tools/testing/selftests/wireguard/qemu/debug.config
index 139fd9aa8b12..828f14300d0a 100644
--- a/tools/testing/selftests/wireguard/qemu/debug.config
+++ b/tools/testing/selftests/wireguard/qemu/debug.config
@@ -22,7 +22,6 @@ CONFIG_HAVE_ARCH_KASAN=y
 CONFIG_KASAN=y
 CONFIG_KASAN_INLINE=y
 CONFIG_UBSAN=y
-CONFIG_UBSAN_SANITIZE_ALL=y
 CONFIG_DEBUG_KMEMLEAK=y
 CONFIG_DEBUG_STACK_USAGE=y
 CONFIG_DEBUG_SHIRQ=y
-- 
2.47.2

