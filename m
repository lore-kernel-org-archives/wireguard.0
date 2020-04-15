Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=FORGED_MUA_MOZILLA,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33546C55196
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEFF721556
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEFF721556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48ed3a75;
	Fri, 24 Apr 2020 20:38:40 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [159.69.161.202])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f56c9348
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 12:15:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gnw-wireguard@m.gmane-mx.org>) id 1jOh6E-0008QA-8I
 for wireguard@lists.zx2c4.com; Wed, 15 Apr 2020 14:25:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: wireguard@lists.zx2c4.com
From: Kalle <kalle-python@gmx.de>
Subject: Update kmod-wireguard on CentOS 7.7 failed
Date: Wed, 15 Apr 2020 14:14:50 +0200
Message-ID: <r76trq$3frd$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
X-Mozilla-News-Host: news://news.gmane.org:119
Content-Language: en-US
X-Mailman-Approved-At: Fri, 24 Apr 2020 22:38:38 +0200
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

Hello,

this happens on
# cat /etc/redhat-release
CentOS Linux release 7.7.1908 (Core)

# yum update
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


Witch kmod-wireguard.x86_64 0:1.0.20200401-1.el7_7.elrepo everything was 
OK. Did i miss something?

Best regards,

Kalle.


