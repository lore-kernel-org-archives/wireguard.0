Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F3FC10F03
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:07:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09EC02085A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09EC02085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anderiasch.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89d98242;
	Fri, 1 Mar 2019 09:57:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0888f428
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 08:16:55 +0000 (UTC)
Received: from ares.art-core.org (ares.art-core.org [81.169.138.148])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 516382c9
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 08:16:55 +0000 (UTC)
Received: from webmail.art-core.org (vhost.unconfigu.red [85.214.213.40])
 by ares.art-core.org (mail.art-core.org) with ESMTPSA id B96A410380014
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 08:25:40 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 21 Feb 2019 09:25:40 +0100
From: Florian Anderiasch <ml+wireguard@anderiasch.de>
To: wireguard@lists.zx2c4.com
Subject: BUG: Ubuntu package doesn't return proper error code on failure
Message-ID: <aa99b980f14d5b0cb004e0e1b5c4ab1a@anderiasch.de>
X-Sender: ml+wireguard@anderiasch.de
User-Agent: Roundcube Webmail/1.3.6
X-Mailman-Approved-At: Fri, 01 Mar 2019 10:57:41 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
   (Reading database ... 278642 files and directories currently 
installed.)
   Preparing to unpack .../wireguard-dkms_0.0.20190123-wg1~bionic_all.deb 
...

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
