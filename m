Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58EFC47258
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:03:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B93420658
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rub.de header.i=@rub.de header.b="GoK8fe7O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B93420658
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=rub.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb4c2696;
	Mon, 4 May 2020 10:51:17 +0000 (UTC)
Received: from out3.mail.ruhr-uni-bochum.de (out3.mail.ruhr-uni-bochum.de
 [134.147.53.155])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b0e8f5f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 May 2020 20:21:17 +0000 (UTC)
Received: from mx3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
 by out3.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 49Fd3y0cjQz8SFW
 for <wireguard@lists.zx2c4.com>; Sun,  3 May 2020 22:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
 t=1588538014; bh=CUA7GQCBBtKIAn58Pv8hO82DgvxQtiz7T2frrFzLRqQ=;
 h=From:Subject:To:Date:From;
 b=GoK8fe7OOT7Na/jsNXglvLoi9NGyphD3dvuQAG2zUgIzZhVvYn+KQvIKO4OtIr365
 M5PO5hxiXoDRN8sPm+4sxw0VQIDXJL358IKSMNCJevQFLGJZ4sfF7/LSwiJaxPRHGS
 46x/Cq/vBAE5xc1HNB49ECnSkzP708c6hH8cnyMM=
Received: from out3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
 by mx3.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 49Fd3x6GbZz8SB4
 for <wireguard@lists.zx2c4.com>; Sun,  3 May 2020 22:33:33 +0200 (CEST)
X-Envelope-Sender: <pascal.ernster+wireguard@rub.de>
X-RUB-Notes: Internal origin=134.147.42.227
Received: from mail1.mail.ruhr-uni-bochum.de (mail1.mail.ruhr-uni-bochum.de
 [134.147.42.227])
 by out3.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 49Fd3x687nz8S9x
 for <wireguard@lists.zx2c4.com>; Sun,  3 May 2020 22:33:33 +0200 (CEST)
Received: from [IPv6:2a01:c23:6c01:5503:f417:bfc6:e4c5:b5ba]
 (dynamic-2a01-0c23-6c01-5503-f417-bfc6-e4c5-b5ba.c23.pool.telefonica.de
 [IPv6:2a01:c23:6c01:5503:f417:bfc6:e4c5:b5ba])
 by mail1.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 49Fd3x24NWzypm
 for <wireguard@lists.zx2c4.com>; Sun,  3 May 2020 22:33:33 +0200 (CEST)
From: Pascal Ernster <pascal.ernster+wireguard@rub.de>
Subject: Ubuntu kernel >= 5.3.0-52.46 breaks DKMS build for
 wireguard-linux-compat >= 1.0.20200429, patch included
To: wireguard@lists.zx2c4.com
Message-ID: <6565463c-0a99-9137-5cc2-714e2fbd6dfc@rub.de>
Date: Sun, 3 May 2020 22:33:43 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------3D3E1166ADE98F9D5739DFFB"
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.4 at mail1.mail.ruhr-uni-bochum.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 04 May 2020 12:51:11 +0200
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

This is a multi-part message in MIME format.
--------------3D3E1166ADE98F9D5739DFFB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,


Ubuntu kernel 5.3.0-52.46 breaks the DKMS build for
wireguard-linux-compat 1.0.20200429. Function skb_reset_redirect() got
added to the kernel's include/linux/skbuff.h, but collides with the
function defintion from wireguard-linux-compat's compat/compat.h:

https://kernel.ubuntu.com/git/ubuntu/ubuntu-eoan.git/commit/include/linux/skbuff.h?h=Ubuntu-5.3.0-52.46&id=b8845f9376917c49f5e219288613c6cbe172f884

Kernel 5.3.0-52.46 is not only used for Ubuntu 19.10, but serves also as
HWE kernel in Ubuntu 18.04.

I've got the DKMS module to compile again on Ubuntu 18.04 using the
attached patch, but I'm not sure it that's the correct solution to the
problem since the colliding function definitions differ and I'm not
really familiar with the kernel's network internals.


Regards
Pascal

--------------3D3E1166ADE98F9D5739DFFB
Content-Type: text/x-patch; charset=UTF-8;
 name="fix-for-ubuntu-kernel-5.3.0-52.46.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="fix-for-ubuntu-kernel-5.3.0-52.46.patch"

--- /var/lib/dkms/wireguard/1.0.20200429/source/compat/compat.h	2020-04-3=
0 23:03:40.000000000 +0000
+++ /var/lib/dkms/wireguard/1.0.20200429/source/compat/compat.h	2020-04-3=
0 23:03:40.000000000 +0000
@@ -1021,12 +1021,14 @@ out:
 #if LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 29) || (LINUX_VERSION_CODE=
 >=3D KERNEL_VERSION(5, 5, 0) && LINUX_VERSION_CODE < KERNEL_VERSION(5, 5=
, 14))
 #include <linux/skbuff.h>
 #include <net/sch_generic.h>
+#if !(defined(UTS_UBUNTU_RELEASE_ABI) && (LINUX_VERSION_CODE >=3D KERNEL=
_VERSION(5, 3, 18)) && (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 0)) && =
(UTS_UBUNTU_RELEASE_ABI >=3D 52)) // Ubuntu 18.04-HWE and 19.10 >=3D 5.3.=
0-52.46
 static inline void skb_reset_redirect(struct sk_buff *skb)
 {
 #ifdef CONFIG_NET_SCHED
 	skb_reset_tc(skb);
 #endif
 }
+#endif
 #endif
=20
 #if defined(ISUBUNTU1604) || defined(ISRHEL7)

--------------3D3E1166ADE98F9D5739DFFB--
