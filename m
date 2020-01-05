Return-Path: <SRS0=ofmn=26=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47CDC32771
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:02:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E168D20721
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E168D20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f082e15;
	Thu, 9 Jan 2020 06:02:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42089bf7
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jan 2020 21:38:44 +0000 (UTC)
Received: from claranet-outbound-smtp04.uk.clara.net
 (claranet-outbound-smtp04.uk.clara.net [195.8.89.37])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7359eaae
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jan 2020 21:38:44 +0000 (UTC)
Received: from cpc96796-rdng27-2-0-cust183.15-3.cable.virginm.net
 ([86.19.118.184]:43673 helo=[172.16.2.187])
 by relay04.mail.eu.clara.net (relay.clara.net [81.171.239.34]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 id 1ioDbe-0006zQ-DK  for wireguard@lists.zx2c4.com
 (return-path <barry@barrys-emacs.org>); Sun, 05 Jan 2020 21:38:43 +0000
From: Barry Scott <barry@barrys-emacs.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: wireguard broke with recent update on fedora 31
Date: Sun, 5 Jan 2020 21:38:41 +0000
References: <6c155e17-eb7a-c267-ee10-6cbb8a56857f@zx2c4.com>
 <6A278F71-FC48-497B-9948-D65A85004F57@barrys-emacs.org>
 <59d645ac-4c88-4d68-b96d-7e4acaeeb618@solidadmin.com>
 <a4e5e78d-afa0-c7d5-30dc-56fa139c3a85@solidadmin.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <a4e5e78d-afa0-c7d5-30dc-56fa139c3a85@solidadmin.com>
Message-Id: <15BB190B-4C85-4329-A44D-7011D89BAD84@barrys-emacs.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Thu, 09 Jan 2020 07:02:19 +0100
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



> On 3 Jan 2020, at 17:53, Joe Doss <joe@solidadmin.com> wrote:
> 
> Hey Barry,
> 
> Some older versions are building now:
> 
> https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/builds/
> 
> I have not tested them as I had to make some changes so the old repo
> sources to build the src RPMs. Let me know if you run into any issues.

dnf downgrade put me in this state:

$ rpm -qa | grep wireguard
wireguard-dkms-0.0.20191219-1.fc31.noarch
wireguard-tools-1.0.20200102-1.fc31.x86_64

$ uname -r
5.3.12-300.fc31.x86_64

But wireguard is not working.

Looking at the dnf history I think this is the point at which it went from working to not working.

$ dnf history info 97 | grep -e kernel -e wireguard -e Begin
Begin time     : Tue 10 Dec 2019 12:49:28 GMT
Begin rpmdb    : 527:133702206fb808b6a14cfbbd59ce0971e85d1f6c
    Install  kernel-5.3.15-300.fc31.x86_64                 @updates
    Install  kernel-core-5.3.15-300.fc31.x86_64            @updates
    Install  kernel-devel-5.3.15-300.fc31.x86_64           @updates
    Install  kernel-modules-5.3.15-300.fc31.x86_64         @updates
    Upgrade  wireguard-dkms-1:0.0.20191206-1.fc31.noarch   @jdoss-wireguard
    Upgraded wireguard-dkms-1:0.0.20191127-1.fc31.noarch   @@System
    Upgrade  wireguard-tools-1:0.0.20191206-1.fc31.x86_64  @jdoss-wireguard
    Upgraded wireguard-tools-1:0.0.20191127-1.fc31.x86_64  @@System
    Removed  kernel-5.3.8-300.fc31.x86_64                  @@System
    Removed  kernel-core-5.3.8-300.fc31.x86_64             @@System
    Removed  kernel-devel-5.3.8-300.fc31.x86_64            @@System
    Removed  kernel-modules-5.3.8-300.fc31.x86_64          @@System

If that is the change that introduced the break then I need the 2019 11 27 version
for the next bisect test.

Barry



> 
> Joe
> 
> 
> 
> -- 
> Joe Doss
> joe@solidadmin.com
> <pEpkey.asc>_______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
