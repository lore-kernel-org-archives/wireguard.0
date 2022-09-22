Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C0CC6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 11:31:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 31e5af2d;
	Thu, 22 Sep 2022 11:29:11 +0000 (UTC)
Received: from mail.aixigo.de (mail.aixigo.de [2001:67c:13b0:ffff::60])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 75c1c5a5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 11:29:08 +0000 (UTC)
Received: from mailhost.ac.aixigo.de (mailhost.ac.aixigo.de [172.19.96.11])
 by mail.aixigo.de (OpenSMTPD) with ESMTPS id ddc1a8b7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 13:29:08 +0200 (CEST)
Received: from [172.19.97.128] (dpcl082.ac.aixigo.de [172.19.97.128])
 by mailhost.ac.aixigo.de (8.15.2/8.15.2/Debian-22) with ESMTP id
 28MBT7ip2563128; Thu, 22 Sep 2022 13:29:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aixigo.com;
 s=default; t=1663846147;
 bh=mxATgw33LN1sk7OTbDzwo1bFEk8xjgFbehsdLuS5MWs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=dtEI+vwo8RobvsXnlPnoJ7FNzHl0uhhM0PbJ1uyx4qH3wQTr3iYAbNNX5vU1D1Fyf
 tO78dh+ZY4Wh1VyQUOURWPf485BtoLBar0afW+jNnpVbjei1xyzelA2l4u7lUowN4m
 3K13wWEFNuzr0USo7WrhepQz3wUWFMLjolWDM7og=
Message-ID: <235c4ba6-95cf-2532-1b7d-3754cc4f255d@aixigo.com>
Date: Thu, 22 Sep 2022 13:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: MacOS app update needed
To: wireguard@lists.zx2c4.com
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
 <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
 <ee65e180-eef5-b882-58ab-8a1188a38a09@ut1.org>
Content-Language: en-US
From: Harald Dunkel <harald.dunkel@aixigo.com>
In-Reply-To: <ee65e180-eef5-b882-58ab-8a1188a38a09@ut1.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.7 at srvvm01.ac.aixigo.de
X-Virus-Status: Clean
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

I would love to have an update for Wireguard on MacOS and Ios.

Maybe Apple would include wireguard into MacOS' kernel as well,
if there is sufficient demand for this feature? Make yourself
heard at Apple's feedback page for MacOS.


Regards
Harri
