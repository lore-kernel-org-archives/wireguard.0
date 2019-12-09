Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5090C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 19:54:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 000E0206D3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 19:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cs.umd.edu header.i=@cs.umd.edu header.b="GUyevp1R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 000E0206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.umd.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 134e2bf9;
	Mon, 9 Dec 2019 19:54:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd3286b2
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 19:54:06 +0000 (UTC)
Received: from mrouter00.cs.umd.edu (mrouter00.cs.umd.edu [128.8.128.203])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b458a5ea
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 19:54:06 +0000 (UTC)
Received: from barracuda.cs.umd.edu (barracuda01.cs.umd.edu [128.8.128.202])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mrouter00.cs.umd.edu (Postfix) with ESMTPS id A951B82D6A83
 for <wireguard@lists.zx2c4.com>; Mon,  9 Dec 2019 14:54:04 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.umd.edu;
 s=mrouter00; t=1575921245;
 bh=/Ksljv23qnwMQbfovF2hl33w8eLka2inMJA8jVipQ5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GUyevp1RypIkqRCFXmVxqLF1QlEasbsTzcBfUgExxAapaVWEyQLQXBmWatTDPL+CV
 kU7dgCPBwWuKRAh3Ivc5ude+C7nLKorTwxYxStJaIvplVuUsNXmYpJPbAIID1Dz1bZ
 Pbdp8mrtS67kS2g1j2qcRd/HLqSPym6yIQkx02Jg=
Authentication-Results: mrouter00.cs.umd.edu;
 arc=none smtp.remote-ip=128.8.128.202
ARC-Seal: i=1; a=rsa-sha256; d=cs.umd.edu; s=csmx; t=1575921245; cv=none;
 b=NVDyyU9Niw7HNTBPXShMa7Umal6d0mg9C6VNCdjsgQrzUb1NVj1X6y2gJ8a0NC4tHFtmqI/9H2K72etLYAcnRUvNNeGIuiyWevx8Ax/mp+DtxLom0qvBzEI4CZBHDVabhvmvJ6YXKOLBJpgiV4A8gwlWH8erkCePEeHeC+UvhIs=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cs.umd.edu; s=csmx; t=1575921245; 
 c=relaxed/simple;
 bh=/Ksljv23qnwMQbfovF2hl33w8eLka2inMJA8jVipQ5s=; 
 h=X-ASG-Debug-ID:Received:X-Barracuda-Envelope-From:
 X-Barracuda-Effective-Source-IP:X-Barracuda-Apparent-Source-IP:
 Received:From:To:Cc:Subject:Date:X-ASG-Orig-Subj:Message-Id:
 X-Mailer:In-Reply-To:References:X-Barracuda-Connect:
 X-Barracuda-Start-Time:X-Barracuda-URL:X-Virus-Scanned:
 X-Barracuda-Scan-Msg-Size:X-Barracuda-BRTS-Status:
 X-Barracuda-Bayes:X-Barracuda-Spam-Score:X-Barracuda-Spam-Status:
 X-Barracuda-Spam-Report;
 b=g7vU6ARAE9nK9RJc8sQifr5dZy7Pc6YRNM13bLw4nLf4dcK9miLFXG5CaBBYujlmQUi94jdDIjDD5ZU48J5M8KXLF6lF2Wj9dOeBgzJhLGVY2TyD65yVCEwrsjGEEr/AVFYTZv58vThhd04oM2HR2pRJfNHaU9UkOxlTAFKyhic=
ARC-Authentication-Results: i=1; mrouter00.cs.umd.edu;
 dkim=none (no signatures found);
 x-return-mx=pass (MX Record found) header.domain=cs.umd.edu
 policy.org_domain=umd.edu policy.is_org=no;
 x-return-mx=pass (MX Record found) smtp.domain=cs.umd.edu
 policy.org_domain=umd.edu policy.is_org=no; x-trusted-ip=pass
Authentication-Results: mrouter00.cs.umd.edu; dkim=none (no signatures found);
 x-return-mx=pass header.domain=cs.umd.edu policy.org_domain=umd.edu
 policy.is_org=no (MX Record found); 
 x-return-mx=pass smtp.domain=cs.umd.edu policy.org_domain=umd.edu
 policy.is_org=no (MX Record found); x-trusted-ip=pass
X-ASG-Debug-ID: 1575921244-08f01f355d363070001-KOqj8r
Received: from smtp00.cs.umd.edu (smtp00.cs.umd.edu [128.8.127.20]) by
 barracuda.cs.umd.edu with ESMTP id hGPvDInpMOXRCHBx;
 Mon, 09 Dec 2019 14:54:04 -0500 (EST)
X-Barracuda-Envelope-From: seriv@cs.umd.edu
X-Barracuda-Effective-Source-IP: smtp00.cs.umd.edu[128.8.127.20]
X-Barracuda-Apparent-Source-IP: 128.8.127.20
Received: from grosh.cs.umd.edu (altyn.cs.umd.edu [10.72.1.13])
 (Authenticated sender: seriv)
 by smtp00.cs.umd.edu (Postfix) with ESMTPSA id 71E2F4075EE2;
 Mon,  9 Dec 2019 14:54:02 -0500 (EST)
From: Sergey Ivanov <seriv@cs.umd.edu>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] Support building for RHEL-8.1 instead of RHEL-8.0
Date: Mon,  9 Dec 2019 14:53:39 -0500
X-ASG-Orig-Subj: [PATCH 1/1] Support building for RHEL-8.1 instead of RHEL-8.0
Message-Id: <20191209195339.11817-1-seriv@cs.umd.edu>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <CAHmME9r4mgUzrqxJ7vEJZLqG7UVnQjAKrJSpDDF8h0hr7hnYBw@mail.gmail.com>
References: <CAHmME9r4mgUzrqxJ7vEJZLqG7UVnQjAKrJSpDDF8h0hr7hnYBw@mail.gmail.com>
X-Barracuda-Connect: smtp00.cs.umd.edu[128.8.127.20]
X-Barracuda-Start-Time: 1575921244
X-Barracuda-URL: https://barracuda01.cs.umd.edu:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cs.umd.edu
X-Barracuda-Scan-Msg-Size: 1128
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
 SCORE=-2.02 using per-user scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.78558
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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

RedHat backported to their kernel 4.18.0-147.el8 a couple features.
This patch enables compiling for this kernel.

Signed-off-by: Sergey Ivanov <seriv@cs.umd.edu>
---
 src/compat/compat.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/compat/compat.h b/src/compat/compat.h
index b4a8f8b..6808259 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -326,7 +326,7 @@ static inline int wait_for_random_bytes(void)
 }
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0) && !defined(ISRHEL8) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
 #include <linux/random.h>
 #include <linux/slab.h>
 struct rng_is_initialized_callback {
@@ -831,7 +831,7 @@ static inline void skb_mark_not_on_list(struct sk_buff *skb)
 }
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 20, 0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 20, 0) && !defined(ISRHEL8)
 #define NLA_EXACT_LEN NLA_UNSPEC
 #endif
 #if LINUX_VERSION_CODE < KERNEL_VERSION(5, 2, 0)
-- 
2.18.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
