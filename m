Return-Path: <SRS0=K46V=QL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99809C282C4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 17:01:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE8A820815
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 17:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (768-bit key) header.d=solidadmin.com header.i=@solidadmin.com header.b="yQypYKNl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE8A820815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8c95d1f;
	Mon, 4 Feb 2019 16:54:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 167614b9
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 16:54:53 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b8c762a
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RvWhn1VJJ9KvQLb6G8szg0m3Yh02UyMSeZHh+4SoHSg=; b=yQypYKNlCph3SXkcAWn6vPcF3i
 LHbhDd51MM0dgCNRfA52AHXDuNxbkujsE0mK5lK6xyJyYFXPW7kgFVrV0Ue53QMTcHwnvSSJjC7+N
 wGSM6RXX6/NseRIeKVNIGCIL5KtHNAd6t/37IDDyw4OZL92Ffkl4AYeJ/BP8xHlYnfqIohC5DwHm+
 OGLYJu3Er9l4AkXg1gk0oyaWV2BWv5vJ/ro7PlvsTM78+R8b3T2QIK9kT72EbBjHiYg5KbGRo9RpH
 HUGpKLFgLTLJrvi21OWUuGfiqTtBjt5oJKt8QcIvltin/VvM/Xh03Y4RdkGuOrsUidGGIJ4PbWpd7
 XDxt67KQ==;
Received: from c-73-208-105-48.hsd1.il.comcast.net ([73.208.105.48]:54172
 helo=[192.168.1.146]) by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <joe@solidadmin.com>) id 1gqhch-0004j3-2S
 for wireguard@lists.zx2c4.com; Mon, 04 Feb 2019 11:01:31 -0600
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Joe Doss <joe@solidadmin.com>
Subject: Fedora DKMS Issues
Organization: SolidAdmin
Message-ID: <15503e7e-cc33-294e-b166-29ad0ddabcb4@solidadmin.com>
Date: Mon, 4 Feb 2019 11:01:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - conquer.yellowcord.com
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - solidadmin.com
X-Get-Message-Sender-Via: conquer.yellowcord.com: authenticated_id:
 jdoss@solidadmin.com
X-Authenticated-Sender: conquer.yellowcord.com: jdoss@solidadmin.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

Hi All,

We have been seeing some issues where DKMS is no longer upgrading 
cleanly on Fedora. This is due to the older version's DKMS conf file 
getting remove prematurely and you end up with this error `Error! Could 
not locate dkms.conf file.` when running any dkms commands.

I have a working RPM that does not cause this error with my testing on 
Fedora 29 and CentOS 7, so I have pushed it up to Copr 
(https://copr.fedoraproject.org/coprs/jdoss/wireguard/build/854203/). I 
_think_ this should fix things moving forward, but this issue has been 
hard to reproduce, so I am starting this thread to gather feedback if it 
doesn't fix the problem.

Please upgrade to wireguard-dkms-0.0.20190123-2 to give this a try. Once 
Jason releases the next snapshot, we can see if users running this 
version break on the upgrade or not. Please note that this new RPM won't 
fix your WireGuard DKMS install if it is already in a broken state. You 
will need to totally remove the older wireguard-dkms RPM and install 
this new one.

The gist of the underlying issue is this is a DKMS problem that is not 
very well documented. 
https://github.com/dell/dkms/issues/25#issuecomment-360275619 is the GH 
Issue that I followed when trying to track this problem down. Using 
%posttrans vs %post in the RPM feels hacky and not the best solution, 
but it should do for now. From what I can tell ZFS on Linux DKMS RPM had 
similar problems and they solved with with some bash 
(https://github.com/zfsonlinux/zfs/pull/8216). I am hoping this abuse of 
%posttrans limps us along until Linux 5.0.

Please leave feedback on this new version in this thread.

Thanks,
Joe



-- 
Joe Doss
joe@solidadmin.com
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
