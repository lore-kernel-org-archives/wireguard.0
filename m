Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AFBC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 18:16:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3944022D57
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 18:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3944022D57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bdd4568;
	Tue, 5 Jan 2021 18:14:27 +0000 (UTC)
Received: from srv.inf7.email (srv.inf7.email [64.225.52.57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d0f54108
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RjP1Pndk3B6BiCxAPoegjtoS8kzhUJxoB/aZvlh5AJI=; b=HCGX3aTmO9R4fymoDxmJH+fkIu
 t9vedWXDxJxrwd197MMZXWBbWdK3qmdBcNY9+ldNFtC1P6QgiR9v5P8g4meyRI6493MkUrNbAwxjQ
 vWpecpKAHAM/eXQyRdFWJsAYZkAfiqsYc3f053MCPptLw6C/LvlORUXLjHoToNevdEmNt++tdcDk0
 ff80bprcuv2zureJfOqLK+5lZqQde56o948lky8u0i2l0hXa8JnlAQTEtm4swCs13fEIFZDTBeXOZ
 eeZ4iNMlTlrCFcLiPQHIsVUwAwpNEui6leYCiTELS0W83NjQXaAm29aFv5zpunR48Vn4iDa3SZLpw
 NKgjnarA==;
Received: from c-73-45-55-209.hsd1.il.comcast.net ([73.45.55.209]:45596
 helo=[192.168.1.100])
 by srv.inf7.email with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <joe@solidadmin.com>) id 1kwqqd-001HQh-CC
 for wireguard@lists.zx2c4.com; Tue, 05 Jan 2021 18:14:23 +0000
Subject: Re: Wireguard not available for CentOS Stream
To: wireguard@lists.zx2c4.com
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
 <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Organization: SolidAdmin
Message-ID: <3704c0e5-027b-d432-fb0d-4b0e3c93bcf8@solidadmin.com>
Date: Tue, 5 Jan 2021 12:14:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 1/4/21 3:55 PM, Jeffrey Walton wrote:
> From an admin and developer perspective I find Fedora Server a real
> gem. Speaking from experience, I would much rather work on Fedora than
> CentOS or Red Hat.  Fedora Server comes with the latest stable tools
> and does not need things like Software Collections (SCL) to get a
> modern Apache, Python or PHP.

Same! I actually ran Fedora Cloud in production for 5 years at my
previous job across AWS and GCP with about 400 VMs. We did 6mo OS
refreshes and patching when needed. Fedora in production is super stable
for my use cases. We're using Fedora CoreOS at my current job now and
it's pretty great too.

Joe




-- 
Joe Doss
joe@solidadmin.com
