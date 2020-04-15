Return-Path: <SRS0=RTrd=57=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE58C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 16:22:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A702D20737
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 16:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A702D20737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25859182;
	Wed, 15 Apr 2020 16:12:27 +0000 (UTC)
Received: from p-impout001.msg.pkvw.co.charter.net
 (p-impout009aa.msg.pkvw.co.charter.net [47.43.26.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 97fabfde
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 16:12:25 +0000 (UTC)
Received: from [192.168.0.2] ([76.91.204.161]) by cmsmtp with ESMTP
 id Oknuj3HbsUue7OknvjL992; Wed, 15 Apr 2020 16:22:23 +0000
X-Authority-Analysis: v=2.3 cv=L+tjvNb8 c=1 sm=1 tr=0
 a=rO8gbEbqGp3jIVlhlq3uIg==:117 a=rO8gbEbqGp3jIVlhlq3uIg==:17
 a=IkcTkHD0fZMA:10 a=D0F8mIkVAAAA:8 a=DULHaMh4mUT3te3SGzwA:9 a=QEXdDO2ut3YA:10
 a=XhW8svmLi0FxbReJHgY3:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Eddie <stunnel@attglobal.net>
Subject: kmod-wireguard 20200413 fails transaction check
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <50d9516e-9546-07ce-d0f4-434e5893f2a9@attglobal.net>
Date: Wed, 15 Apr 2020 09:22:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfA/4ZHf7LGxUmJOfQ35jy2pbIW7rqWRom3e74arSk4aVnh1V9WLVR4jPzoaq0EUpBJFVO8duha5GKpxpqtdx53LyM69o8W4rs6NPVaRg5IsPUXtef2ok
 Gl3pPx6EuAM+8+suNAy0Axts/jkfmsAXm4g5jJlqnzesHVLxQBun1yAWjd6Ru7ETZX4DbItO04X01g==
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
Reply-To: stunnel@attglobal.net
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I'm running a Nethserver box, which is built on top of CentOS 7. Trying 
to update to the latest wireguard throws the following:

Resolving Dependencies
--> Running transaction check
---> Package kmod-wireguard.x86_64 0:1.0.20200401-1.el7_7.elrepo will be 
updated
---> Package kmod-wireguard.x86_64 0:1.0.20200413-1.el7_8.elrepo will be 
an update
--> Processing Dependency: kernel(siphash_4u64) = 0xdb8b9061 for 
package: kmod-wireguard-1.0.20200413-1.el7_8.elrepo.x86_64
--> Processing Dependency: kernel(siphash_3u32) = 0x04e11789 for 
package: kmod-wireguard-1.0.20200413-1.el7_8.elrepo.x86_64
--> Processing Dependency: kernel(siphash_1u64) = 0x0680ac30 for 
package: kmod-wireguard-1.0.20200413-1.el7_8.elrepo.x86_64
--> Finished Dependency Resolution
Error: Package: kmod-wireguard-1.0.20200413-1.el7_8.elrepo.x86_64 (elrepo)
            Requires: kernel(siphash_3u32) = 0x04e11789
Error: Package: kmod-wireguard-1.0.20200413-1.el7_8.elrepo.x86_64 (elrepo)
            Requires: kernel(siphash_4u64) = 0xdb8b9061
Error: Package: kmod-wireguard-1.0.20200413-1.el7_8.elrepo.x86_64 (elrepo)
            Requires: kernel(siphash_1u64) = 0x0680ac30
  You could try using --skip-broken to work around the problem
  You could try running: rpm -Va --nofiles --nodigest

It's currently running this:

uname -a
Linux Nethserver.BogoLinux.net 3.10.0-1062.12.1.el7.x86_64 #1 SMP Tue 
Feb 4 23:02:59 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

But there is an update to this, which I haven't had time to install yet:

kernel                 x86_64 3.10.0-1062.18.1.el7


Do I need to wait until after the kernel update to update wireguard.

Cheers.
