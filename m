Return-Path: <SRS0=Vhpd=JN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DE5C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 12:15:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3B47610FA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 12:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3B47610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-fetish.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da7e815c;
	Fri, 16 Apr 2021 12:14:05 +0000 (UTC)
Received: from mailout-02.maxonline.de (mailout-02.maxonline.de [81.24.66.23])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f5ea4664
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 12:14:03 +0000 (UTC)
Received: from web03-01.max-it.de (web03-01.max-it.de [81.24.64.215])
 by mailout-02.maxonline.de (Postfix) with ESMTPS id 089A0BDE
 for <wireguard@lists.zx2c4.com>; Fri, 16 Apr 2021 14:14:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by web03-01.max-it.de (Postfix) with ESMTP id E2DC928B992
 for <wireguard@lists.zx2c4.com>; Fri, 16 Apr 2021 14:14:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at web03-01.max-it.de
Received: from web03-01.max-it.de ([127.0.0.1])
 by localhost (web03-01.max-it.de [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id TgSeryTtzYDp for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 14:14:02 +0200 (CEST)
Received: from [172.24.68.132] (unknown [81.24.66.208])
 (Authenticated sender: m.muenz@spam-fetish.org)
 by web03-01.max-it.de (Postfix) with ESMTPA id A4A1528B50B
 for <wireguard@lists.zx2c4.com>; Fri, 16 Apr 2021 14:14:02 +0200 (CEST)
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
To: wireguard@lists.zx2c4.com
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
 <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
 <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de>
From: "Muenz, Michael" <m.muenz@spam-fetish.org>
Message-ID: <8e80a3e4-4118-6273-a5e3-0ec7692fcb17@spam-fetish.org>
Date: Fri, 16 Apr 2021 14:14:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Am 16.04.2021 um 10:57 schrieb Stefan Haller:
> After applying Toke's patch for bird and your Wireguard patch in
> a7a84a17faf784 everything is working as before (with minor config
> changes).
>
> Just for the record, my previous configuration looked like this (using
> POINTTOPOINT interfaces, I use ifconfig to set the peer address):


Hi,

Just following the conversation and also had a quick chat with Jason via 
IRC (mimugmail).
We had a couple of reports that with latest change of removing PTP which 
breaks OSPF.
In our case (OPNsense) we rely on FRR so it would be nice to have a 
generic solution without toucingh routing software itself.


> So for me everything works as expected again. A big thanks to all of you for
> figuring out what was going wrong and getting it fixed so quickly.
>
>

I set up a lab and will do some testing with version before and after 
the change, maybe for FRR it's enough to set NBMA or similar.


Best,

Michael

