Return-Path: <SRS0=K46V=QL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62D3C282C4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 18:09:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38D202082E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 18:09:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (768-bit key) header.d=solidadmin.com header.i=@solidadmin.com header.b="0EXfINWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38D202082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45d8a924;
	Mon, 4 Feb 2019 18:02:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 503180ec
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 18:02:57 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52802af7
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 18:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HUq8HdCO+/aiB1eOa2HEZLW+E17viBl74NW8iitizxQ=; b=0EXfINWhtMJFYh1Kcxw9F4+A/N
 azcS5Y29dJRnlB8g+nKjH/jYhLptKOvmKwkW0Wad+OnEgEKkDd9dPMMxOlYWkQP2MYYKER76p2zWy
 v9VWF/XlMrmR4lKFYq517OMHuA14HsXHh9NckTirjlYRKSeaNXrnrPPG7a/9WCR3uv9V8KPaucZv+
 UlenaTA6upZ9qNyBh4MNXE0agtqJsqQ9UwhIOTlEZ9SQMhZTY5tclzwF6H5BEzJaWerY3GgbWgKIx
 9thkxQtuIpznE/Ioyg2tt3WY88GjzkvElmJTaj2lqTiyx1G7lnTaeIMMRPBw7or3bJo5ZVODhOsFb
 uyxbKIQw==;
Received: from c-73-208-105-48.hsd1.il.comcast.net ([73.208.105.48]:55970
 helo=[192.168.1.146]) by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <joe@solidadmin.com>) id 1gqigZ-00059R-VW
 for wireguard@lists.zx2c4.com; Mon, 04 Feb 2019 12:09:36 -0600
Subject: Re: Fedora DKMS Issues
To: wireguard@lists.zx2c4.com
References: <15503e7e-cc33-294e-b166-29ad0ddabcb4@solidadmin.com>
From: Joe Doss <joe@solidadmin.com>
Organization: SolidAdmin
Message-ID: <3b9809a8-ba5a-ac57-09eb-f07f12c78b3d@solidadmin.com>
Date: Mon, 4 Feb 2019 12:09:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <15503e7e-cc33-294e-b166-29ad0ddabcb4@solidadmin.com>
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

On 2/4/19 11:01 AM, Joe Doss wrote:
> I have a working RPM that does not cause this error with my testing on 
> Fedora 29 and CentOS 7, so I have pushed it up to Copr 
> (https://copr.fedoraproject.org/coprs/jdoss/wireguard/build/854203/). I 

It looks like Copr is having a case of the Mondays and not building 
anything other than pc64le packages right now. Here is a testing RPM I 
made last week that can be installed manually for anyone itching to test 
things out.

https://copr-be.cloud.fedoraproject.org/results/jdoss/wireguard-testing/fedora-29-x86_64/00852015-wireguard-dkms/wireguard-dkms-0.0.20190123-2.fc29.noarch.rpm

Joe




-- 
Joe Doss
joe@solidadmin.com
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
