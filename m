Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9EEC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Nov 2022 20:41:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ace791b3;
	Thu, 10 Nov 2022 20:41:23 +0000 (UTC)
Received: from quad.pendre.co.uk (quad.pendre.co.uk [92.27.241.245])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 55e0d679
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2022 20:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by quad.pendre.co.uk (Postfix) with ESMTP id DFB129600E2;
 Thu, 10 Nov 2022 20:41:20 +0000 (GMT)
Received: from quad.pendre.co.uk ([127.0.0.1])
 by localhost (quad.pendre.co.uk [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 6CmXt0D7U65I; Thu, 10 Nov 2022 20:41:20 +0000 (GMT)
Received: from [192.168.0.1] (quad.pendre.co.uk [192.168.0.1])
 by quad.pendre.co.uk (Postfix) with ESMTPS id 7C1E79600AF;
 Thu, 10 Nov 2022 20:41:20 +0000 (GMT)
Message-ID: <306f35dc-5101-35f0-a466-ee5cee758d07@elrepo.org>
Date: Thu, 10 Nov 2022 20:41:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: wireguard@lists.zx2c4.com, "Jason A. Donenfeld" <Jason@wireguard.com>
From: Phil Perry <pperry@elrepo.org>
Subject: compat: update for RHEL 8.7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Update for release of RHEL 8.7, which now backports 
ktime_get_coarse_boottime_ns()

Signed-off-by: Philip J. Perry <phil@elrepo.org>


diff -Naurp wireguard-linux-compat-1.0.20220627.orig/src/compat/compat.h 
wireguard-linux-compat-1.0.20220627/src/compat/compat.h
--- a/src/compat/compat.h        2022-06-27 11:54:37.000000000 +0100
+++ b/src/compat/compat.h     2022-11-10 19:55:49.653581044 +0000
@@ -16,7 +16,7 @@
  #define ISRHEL7
  #elif RHEL_MAJOR == 8
  #define ISRHEL8
-#if RHEL_MINOR >= 6
+#if RHEL_MINOR >= 7
  #define ISCENTOS8S
  #endif
  #endif
@@ -412,6 +412,7 @@ static inline u64 __compat_jiffies64_to_
  }
  #define jiffies64_to_nsecs __compat_jiffies64_to_nsecs
  #endif
+#if !defined(ISRHEL8)
  static inline u64 ktime_get_coarse_boottime_ns(void)
  {
  #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0)
@@ -423,6 +424,7 @@ static inline u64 ktime_get_coarse_boott
  #endif
  }
  #endif
+#endif

  #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0)
  #include <linux/inetdevice.h>

