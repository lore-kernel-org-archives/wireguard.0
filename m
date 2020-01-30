Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FFBC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 16:53:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C390C20661
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 16:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solidadmin.com header.i=@solidadmin.com header.b="GUkss6R+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C390C20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afd82c98;
	Thu, 30 Jan 2020 16:53:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01c70e0d
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 16:53:34 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 660e0ed1
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9xajAIibWNqyxH5vWn9mju5ZBLzvDapGFHcZ+dIGio=; b=GUkss6R+AwlatCVXi3mvOxA1/E
 8I7XIK23RRGzhPMRGNsNqZLVqzsuTIAHogHAemuGv1Cqa3QCTmatb0kwZB+AbZikZyGMm0x+q1rBA
 8WRs/VOjkyBxtudLFWmqpVZBF0LgkPPLOlPqHXfc/8Ief+HJk1DuJPIMe8Fwuez21INQDWySgMr+u
 NsbacZ+ps71DCfn2gm23tT8AQv9IX0pZKAVORhRBPRPGLWRxFSBKgiUMlbr4Vg+Kb2WQTqdvrx7OL
 eyYPhiAfPmp8N0MShqeqnfCrr/1YnrSQgYkuEW3yv1pdoUL0AQ7MhNBZTV66n/ljExrwFpJT5SQ8r
 XqNDW07A==;
Received: from c-67-173-122-188.hsd1.il.comcast.net ([67.173.122.188]:15041
 helo=[192.168.1.179]) by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <joe@solidadmin.com>)
 id 1ixD4a-00048k-62; Thu, 30 Jan 2020 10:53:44 -0600
From: Joe Doss <joe@solidadmin.com>
Subject: wireguard-tools EPEL Packages
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Autocrypt: addr=joe@solidadmin.com; keydata=
 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
Organization: SolidAdmin
Message-ID: <14d713c9-c87c-df88-872a-48ebdfa9a740@solidadmin.com>
Date: Thu, 30 Jan 2020 10:53:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
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
Cc: john Florian <jflorian@doubledog.org>,
 Michael Watters <wattersm@watters.ws>
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

Hey all,

I have EPEL 7 and EPEL 8 packages built for wireguard-tools that need
some testing and karma if you have a FAS account. Jason and I are hoping
to get these into stable somewhat soon.

https://bodhi.fedoraproject.org/updates/FEDORA-EPEL-2020-ae3c489b3a
https://bodhi.fedoraproject.org/updates/FEDORA-EPEL-2020-07d59431de

Thanks!
Joe



-- 
Joe Doss
joe@solidadmin.com


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
