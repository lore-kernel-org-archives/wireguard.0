Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E4AC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 14:06:46 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401A064EF6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 14:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 401A064EF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=evilham.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33b30803;
	Fri, 19 Mar 2021 14:04:21 +0000 (UTC)
Received: from yggdrasil.evilham.com (yggdrasil.evilham.com [46.19.33.155])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 25840a5c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Mar 2021 21:02:21 +0000 (UTC)
Received: from yggdrasil.evilham.com (localhost [IPv6:::1])
 by yggdrasil.evilham.com (Postfix) with ESMTP id 4F1fbw63DvzHnS
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 22:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=evilham.com; h=from:to
 :subject:date:message-id:mime-version:content-type; s=mail; bh=w
 GxFSf2/Ms50iWHc3jSwmyufOpM=; b=Ybd8og4rzWKXR8YCCLUSAmOGjBXCLVblo
 3t3yo2NaH15wRijc8oCGe1IvsmXbcOqplujy/rV0RAY8r7XuFb7u7EwAsq4eU4z5
 2sl0OkqWR3LsjyMm+7W6g6+ZnViJFlMzikYjCAwe33Qw1v/N5UFIwVdvjjvZ5I9Y
 +cnRlS1aQ4=
Received: from yggdrasil.evilham.com (unknown [IPv6:2a0a:e5c1:121:1::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by yggdrasil.evilham.com (Postfix) with ESMTPSA id 4F1fbw2CNYzHnR
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 22:02:20 +0100 (CET)
From: Evilham <contact@evilham.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Fix build on FreeBSD 13 after removal from base
Date: Thu, 18 Mar 2021 22:02:19 +0100
Message-ID: <75ddd07a-8d31-4938-8480-540f1996c9ad@yggdrasil.evilham.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:04:20 +0000
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

\o Hello,

noticed that after if_wg removal from stable/13 following patch is 
needed for compiling the module.

I'm currently lacking a 14/CURRENT machine to assert that the 
module compiles with these changes, but from checking the branch, 
it looks like these definitions are there already, I wouldn't 
think versions pre-13 should be affected by this.

Cheers and thank you for the efforts and... handling of things.

---
 src/compat.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/src/compat.h b/src/compat.h
index 6126e26..bc29c01 100644
--- a/src/compat.h
+++ b/src/compat.h
@@ -7,6 +7,9 @@
  */

 #include <sys/param.h>
+#if __FreeBSD_version < 1400000
+#include <sys/smp.h>
+#include <sys/gtaskqueue.h>
 #if __FreeBSD_version < 1300000
 #define VIMAGE

@@ -18,8 +21,6 @@
 #include <sys/malloc.h>
 #include <sys/proc.h>
 #include <sys/lock.h>
-#include <sys/smp.h>
-#include <sys/gtaskqueue.h>
 #include <sys/socketvar.h>
 #include <sys/protosw.h>
 #include <net/vnet.h>
@@ -39,6 +40,7 @@

 #undef atomic_load_ptr
 #define atomic_load_ptr(p) (*(volatile __typeof(*p) *)(p))
+#endif /* __FreeBSD_version < 1300000 */

 struct taskqgroup_cpu {
 	LIST_HEAD(, grouptask)	tgc_tasks;
@@ -67,7 +69,7 @@ static inline void taskqgroup_drain_all(struct 
taskqgroup *tqg)
 		gtaskqueue_drain_all(q);
 	}
 }
-#endif
+#endif /* __FreeBSD_version < 1400000 */

 #if __FreeBSD_version < 1202000
 static inline uint32_t arc4random_uniform(uint32_t bound)
--
2.30.1
