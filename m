Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBE2C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:26:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661112070B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661112070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anderiasch.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f422350;
	Thu, 28 Feb 2019 18:15:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94f57385
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Feb 2019 19:39:41 +0000 (UTC)
Received: from ares.art-core.org (ares.art-core.org [81.169.138.148])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b53c6fa4
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Feb 2019 19:39:41 +0000 (UTC)
Received: from [192.168.178.20] (p54AA186B.dip0.t-ipconnect.de [84.170.24.107])
 by ares.art-core.org (mail.art-core.org) with ESMTPSA id 977491038001F
 for <wireguard@lists.zx2c4.com>; Wed, 27 Feb 2019 19:49:14 +0000 (UTC)
From: Florian Anderiasch <ml+wireguard@anderiasch.de>
Subject: BUG: Ubuntu package doesn't return proper error code on failure
To: wireguard@lists.zx2c4.com
Message-ID: <20bf2bc3-58b1-9f23-bd8d-41b85c5565ef@anderiasch.de>
Date: Wed, 27 Feb 2019 20:49:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Feb 2019 19:15:55 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,
please excuse if this is the wrong medium to report this error, but I
couldn't manage to file a bug on Launchpad.

Ubuntu 18.04
4.15.0-45-generic
wireguard-dkms                                  0.0.20190123-wg1~bionic

wireguard-dkms failed to install properly because the kernel module
could not be compiled (my bad, has nothing to do with this bug report),
but the installation exited with exit code 0 and so I didn't realize at
first because everything scrolled past. IMHO this should be a non-zero
exit code because wireguard was obviously not working because I couldn't
modprobe the kernel module.

apt-get install --reinstall wireguard-dkms
  Reading package lists... Done
  Building dependency tree
  Reading state information... Done
  0 upgraded, 0 newly installed, 1 reinstalled, 0 to remove and 0 not
upgraded.
  Need to get 551 kB of archives.
  After this operation, 0 B of additional disk space will be used.
  Get:1 http://ppa.launchpad.net/wireguard/wireguard/ubuntu bionic/main
amd64 wireguard-dkms all 0.0.20190123-wg1~bionic [551 kB]
  Fetched 551 kB in 0s (1.589 kB/s)
  (Reading database ... 278642 files and directories currently installed.)
  Preparing to unpack .../wireguard-dkms_0.0.20190123-wg1~bionic_all.deb ...

  ------------------------------
  Deleting module version: 0.0.20190123
  completely from the DKMS tree.
  ------------------------------
  Done.
  Unpacking wireguard-dkms (0.0.20190123-wg1~bionic) over
(0.0.20190123-wg1~bionic) ...
  Setting up wireguard-dkms (0.0.20190123-wg1~bionic) ...
  Loading new wireguard-0.0.20190123 DKMS files...
  Building for 4.15.0-45-generic
  Building initial module for 4.15.0-45-generic
  Error! Bad return status for module build on kernel: 4.15.0-45-generic
(x86_64)
  Consult /var/lib/dkms/wireguard/0.0.20190123/build/make.log for more
information.

The real cause of the error was me using the LLVM linker lld as
/usr/bin/lld - which unsurprisingly doesn't build kernel modules, not
that it matters for this.

Everything is working now flawlessly, thanks for your efforts :)

Cheers,
Florian
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
