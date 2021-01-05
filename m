Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D15C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 18:35:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC2822D5A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 18:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC2822D5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dce052a;
	Tue, 5 Jan 2021 18:35:30 +0000 (UTC)
Received: from srv.inf7.email (srv.inf7.email [64.225.52.57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 752e289a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 18:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References:To:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9uo6X6jTS+LikmlbdtDi69tznIncYHbnVaUs7zsSaqA=; b=SYC5twbowDIUlU+hLQzvBZNe9a
 K6t8mrFCM4dO+HCtgYyGFl2LYopwD/WeHWEpO/oNa4n48pH/nuUSpVc5yTUPubvUWrWz11HvrRnxo
 B30QN6H9Eve02wNzdWQt4ekhKCi0p2f6IdyB8LWZgngEDfIVazqdsjomoDqs3i48wo9/oCSVZ9KG5
 j+edx1/WjNR3ZwxULA9xStgKbcLj2JYE0fSXYp30VypixmGn8oOB8tUracXloqOfAHW12CNQmat1Y
 5a4/rKJ5jG0QU4pbq7H1xLUHIn+8NihkxwZBuB4znY/5/NaT2GJZHdwS9HCpDVCYqfCXWKdOVRZbs
 Oms9OkGQ==;
Received: from c-73-45-55-209.hsd1.il.comcast.net ([73.45.55.209]:46398
 helo=[192.168.1.100])
 by srv.inf7.email with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <joe@solidadmin.com>) id 1kwrB1-001Hgc-OX
 for wireguard@lists.zx2c4.com; Tue, 05 Jan 2021 18:35:27 +0000
To: wireguard@lists.zx2c4.com
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
 <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@mail.gmail.com>
 <VE1PR08MB5837188C79F58A014916E123A0D10@VE1PR08MB5837.eurprd08.prod.outlook.com>
From: Joe Doss <joe@solidadmin.com>
Organization: SolidAdmin
Subject: Re: Wireguard not available for CentOS Stream
Message-ID: <0dc9aaac-d92f-fbaa-21e0-3a92c246480e@solidadmin.com>
Date: Tue, 5 Jan 2021 12:35:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5837188C79F58A014916E123A0D10@VE1PR08MB5837.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - srv.inf7.email
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - solidadmin.com
X-Get-Message-Sender-Via: srv.inf7.email: authenticated_id:
 jdoss@solidadmin.com
X-Authenticated-Sender: srv.inf7.email: jdoss@solidadmin.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

On 1/5/21 5:25 AM, Jonathan Aquilina wrote:
> Is Fedora a rolling release so to speak? I remember they used to call
> fedora the bleeding edge distro not really geared for production
> environments is that still accurate. I have only used it as a work
> station desktop with KDE installed.

It has a release about every 6 months [1], so I wouldn't call it a
rolling release. You can use DNF System Upgrade to move up to the next
release pretty easily with a bit of downtime.

I have used Fedora a lot in production and I find that it works great. I
don't consider it bleeding edge at all unless you run Fedora Rawhide
[2]. If you are looking for a rolling release Fedora, checkout Fedora
CoreOS [3], but that comes with some changes on how you use it since it
is a container-focused operating system.

The kernel that ships in Fedora has WireGuard included and the
wireguard-tools package is in the main repo. IMO if you want to use a
Red Hat variant of Linux with WireGuard, Fedora Server, Fedora Cloud
[4], or Fedora CoreOS are your best choices. I use Fedora Server at home
and Fedora CoreOS at work with WireGuard everyday.

Joe


[1] https://fedoraproject.org/wiki/Releases
[2] https://fedoraproject.org/wiki/Releases/Rawhide
[3] https://getfedora.org/en/coreos?stream=stable
[4] https://alt.fedoraproject.org/cloud/

-- 
Joe Doss
joe@solidadmin.com
