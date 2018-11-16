Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A20C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Nov 2018 21:38:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A57B72086C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Nov 2018 21:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (768-bit key) header.d=solidadmin.com header.i=@solidadmin.com header.b="IUJfa6Dz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A57B72086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id beb8c0c4;
	Fri, 16 Nov 2018 21:32:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b556509
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Nov 2018 21:32:55 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30f53547
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Nov 2018 21:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXVPrHyFAhLOp6hNIgqX0rFMBCYelCgJhU4yM3GtqOw=; b=IUJfa6DzhVQ+AZ/SZG5KhgGyAJ
 RzETpPOjjyJ+7MSFrZuxQqpxHDFEK/UNWa0SH6Q49ovDCWwgeQnLP/THtosiHYjmkw21s/LOizDrb
 jtWiF9U03i/z3uJofb5BJzQ8HgWFhoE+ZrnXCvbu+vLbLYgyQ8gsV46cRj1Hc2eQfDb3Ri2sie+69
 yaplLc2Je2jsm1MHMZ3NdjfvP1HlhKteVgVKcV8chRTxA1DFezcgyKAJnKxEq4BlHc2jTclLD/phu
 KueVRGt+YHOat/oX2qwZEEfKT53JdzNrQzoTDWcFfdD0m377BCzxVc2JZ2RrkRoRPB4gbl7vBwtQS
 DpiFsB+g==;
Received: from d4-50-197-134.col.wideopenwest.com ([50.4.134.197]:58210
 helo=[192.168.1.146]) by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <joe@solidadmin.com>) id 1gNlov-0001V8-Kl
 for wireguard@lists.zx2c4.com; Fri, 16 Nov 2018 15:38:33 -0600
To: wireguard@lists.zx2c4.com
From: Joe Doss <joe@solidadmin.com>
Subject: RHEL 8 Beta Install Documentation
Organization: SolidAdmin
Message-ID: <c54ebbf7-2cca-b1e7-4079-565a2bc5b3fa@solidadmin.com>
Date: Fri, 16 Nov 2018 15:38:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
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

Hi all,

For those people that are giving the RHEL 8 Beta a spin, here are some 
quick and dirty steps for getting WireGuard installed from the Copr 
CentOS 7 repo.

Import the CentOS 7 EPEL GPG Key
# rpm --import http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7

Install DKMS from the CentOS 7 EPEL repo
# yum install 
http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/d/dkms-2.6.1-1.el7.noarch.rpm

Install the WireGuard CentOS 7 repo from Copr
# curl -Lo /etc/yum.repos.d/wireguard.repo 
https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/repo/epel-7/jdoss-wireguard-epel-7.repo

Install WireGuard DKMS and tools packages
# yum install wireguard-dkms wireguard-tools

Modprobe the wireguard kernel module
# modprobe wireguard

Verify it is working with lsmod
# lsmod |grep wireguard

Enjoy!
Joe



-- 
Joe Doss
joe@solidadmin.com
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
