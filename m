Return-Path: <SRS0=SwL3=U7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA5BC06510
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Jul 2019 19:51:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9FEB21850
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Jul 2019 19:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solidadmin.com header.i=@solidadmin.com header.b="JJumFV8B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9FEB21850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84a0257b;
	Tue, 2 Jul 2019 19:51:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5f74cd1
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 19:51:49 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5f05246
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 19:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WK1Q7lLKgqSJXH7BVcgvWhI8jQQxcazxO0aDnxAtPfs=; b=JJumFV8BacerU/hzU2w6Q+BxfW
 XFmEXgYoCfVxF30MnAbelxW+/4I8E2Wkf9mCWkhiuiVM3DNFmaHjsbPCKndKRqGAIHNfqiD1ZBUa7
 oAFcITtJC7gngqPejQqxHgCsH7E3+4eXJ5yzDZZtvljlOc/YiBiN91JVwSZ+7xhIz2YZef33hn0Vo
 9ouVKB0Ps0RAGr0Gv92AUX1Q1IzO6Z7sZsVc71+ETjni5CDOHaBni7z8JBq2e0LJIHtFfgfCdS9+L
 yFkAoCODsF4bDyvR3M6W4OIzrk+JZUWHkigx8h8BchavbOVJTFD9E1uiPVoO+1n5nZ9OZYaO8XEw3
 0EM6vfCg==;
Received: from [108.160.195.141] (port=44276 helo=[192.168.1.146])
 by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <joe@solidadmin.com>)
 id 1hiOoe-0007jT-O3; Tue, 02 Jul 2019 14:51:48 -0500
Subject: Re: RHEL8 package install or build fail
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Michael <gravitygrazer@gmail.com>
References: <CADXv92b2P79-OJBzK+aXhKFr3k_VqZkkkAuZOg5dALui8aNTiA@mail.gmail.com>
 <CAHmME9qi6eb+YCKx8NdtN85ouTszDBrCsrshT1sYFTUXw8K_zQ@mail.gmail.com>
 <CAKJniYQ-YcFrYm8hz2Q8aWaJf2jLTsa_g2VGy_UaqfEx2yBUtQ@mail.gmail.com>
 <CAHmME9rT11fPmBuRxa_sSRjW01ZN6eSJuDEpKOpGVbH2e=SZew@mail.gmail.com>
 <CAHmME9rNis62NiBZTyuaOjcxRtu2N9=90GaLR03_zQOPmYwFhg@mail.gmail.com>
 <CADXv92ZnXYbUYJOnA_xsr6Q4HCfSxFZaqLN0WXDLobCUjsJayg@mail.gmail.com>
 <CAHmME9r+yjBGcfoG7Tkp7UE=1Te_j32c7zWF+_pqCwP8rfJUCg@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Organization: SolidAdmin
Message-ID: <687474d5-54c4-0cb1-f442-734400ac0cb6@solidadmin.com>
Date: Tue, 2 Jul 2019 14:51:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9r+yjBGcfoG7Tkp7UE=1Te_j32c7zWF+_pqCwP8rfJUCg@mail.gmail.com>
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
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 6/28/19 9:52 AM, Jason A. Donenfeld wrote:
> Apparently you have to add the "codeready" repository in RHEL8, as
> libmnl-devel was removed from the main repo according to the release
> notes.

It looks like you can enable other repos for Copr builds but it isn't 
working when I enable:

https://cdn.redhat.com/content/dist/rhel8/$releasever/x86_64/codeready-builder/os

I will see if I can get the maintainers of Copr to enable this repo by 
default for RHEL8 buildroots.

Joe



-- 
Joe Doss
joe@solidadmin.com
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
