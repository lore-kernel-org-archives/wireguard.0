Return-Path: <SRS0=hg4e=G5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A59C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Jan 2021 20:40:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AEA122B2C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Jan 2021 20:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AEA122B2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lotz.li
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04726445;
	Tue, 26 Jan 2021 20:40:27 +0000 (UTC)
Received: from mail.dr-lotz.de (mail.dr-lotz.de [5.9.59.78])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6941c367
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jan 2021 20:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.dr-lotz.de (Postfix) with ESMTP id 9364F5B25F;
 Tue, 26 Jan 2021 21:40:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dr-lotz.de
Received: from mail.dr-lotz.de ([127.0.0.1])
 by localhost (mail.dr-lotz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UfRIaAs2M_W1; Tue, 26 Jan 2021 21:40:23 +0100 (CET)
Received: from [192.168.42.35] (ipb21b6623.dynamic.kabel-deutschland.de
 [178.27.102.35])
 by mail.dr-lotz.de (Postfix) with ESMTPSA id 01A7B5B25E;
 Tue, 26 Jan 2021 21:40:22 +0100 (CET)
Subject: Re: [PATCH v2] wireguard: netlink: add multicast notification for
 peer changes
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: kernel test robot <lkp@intel.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20210109210056.160597-1-linus@lotz.li>
 <20210115195353.11483-1-linus@lotz.li>
 <CAHmME9rny0bc2JA1_9_A=_3OuPnEvqJyK7UMwsL+x=yTHRoBTQ@mail.gmail.com>
From: Linus Lotz <linus@lotz.li>
Message-ID: <189f640c-e399-502a-86ec-3432a39a14ad@lotz.li>
Date: Tue, 26 Jan 2021 21:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9rny0bc2JA1_9_A=_3OuPnEvqJyK7UMwsL+x=yTHRoBTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi Jason,
have you had a chance to look at it yet?

Cheers
Linus

Am 16.01.21 um 00:40 schrieb Jason A. Donenfeld:
> Hey Linus,
> 
> My email server has been firewalled from vger.kernel.org until today,
> so I didn't see the original until this v2 was sent today. My
> apologies. I'll review this first thing on Monday.
> 
> Jason
> 
