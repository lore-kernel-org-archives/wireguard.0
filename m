Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E39BC35240
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 19:29:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECD82082E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 19:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnUTUMHV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CECD82082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa77984c;
	Thu, 30 Jan 2020 19:28:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11589523
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 19:28:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4597b93
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 19:28:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7489D2082E;
 Thu, 30 Jan 2020 19:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580412539;
 bh=hhAIE0Prgk+Wv/0a25D0q0q7GJanUZwEcQHqGsWLry4=;
 h=From:To:Subject:Date:From;
 b=MnUTUMHVFAwPb/97kEX+odytMr/+pt115+l+Em3s9LFRMqDYSBfts0AFOm2WbWmsU
 38pAtsokXDD3NL8jRrUu4gC7VJPRYv1K4g5+5+2pzsIHAmaa99J81XQzMgyyQ22I0L
 xQYcNgUPUlYDSR8vfdfhr6QpTEEmC56cjBSOl01E=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] wireguard: selftests: Cleanup CONFIG_ENABLE_WARN_DEPRECATED
Date: Thu, 30 Jan 2020 20:28:53 +0100
Message-Id: <20200130192853.3528-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

CONFIG_ENABLE_WARN_DEPRECATED is gone since
commit 771c035372a0 ("deprecate the '__deprecated' attribute warnings
entirely and for good").

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 tools/testing/selftests/wireguard/qemu/debug.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/qemu/debug.config b/tools/testing/selftests/wireguard/qemu/debug.config
index b9c72706fe4d..5909e7ef2a5c 100644
--- a/tools/testing/selftests/wireguard/qemu/debug.config
+++ b/tools/testing/selftests/wireguard/qemu/debug.config
@@ -1,5 +1,4 @@
 CONFIG_LOCALVERSION="-debug"
-CONFIG_ENABLE_WARN_DEPRECATED=y
 CONFIG_ENABLE_MUST_CHECK=y
 CONFIG_FRAME_POINTER=y
 CONFIG_STACK_VALIDATION=y
-- 
2.17.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
