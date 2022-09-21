Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A456FECAAD8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Sep 2022 08:20:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6b97fcc6;
	Wed, 21 Sep 2022 08:20:10 +0000 (UTC)
Received: from vidar.ut-capitole.fr (vidar-alt-1.ut-capitole.fr
 [193.49.48.246])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3f1c6ba6
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Sep 2022 08:20:08 +0000 (UTC)
Received: from [10.26.2.40] (a19600.ut-capitole.fr [10.26.2.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bandry)
 by vidar.ut-capitole.fr (Postfix) with ESMTPSA id 919D740C2E61
 for <wireguard@lists.zx2c4.com>; Wed, 21 Sep 2022 10:20:07 +0200 (CEST)
Message-ID: <ee65e180-eef5-b882-58ab-8a1188a38a09@ut1.org>
Date: Wed, 21 Sep 2022 10:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: MacOS app update needed
Content-Language: fr
To: wireguard@lists.zx2c4.com
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
 <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
From: Bruno <bandry@ut1.org>
In-Reply-To: <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

Windows Client project don't feel alive either. Last commit has 6 months 
and last release is 9 month old.

Same, here https://git.zx2c4.com/wireguard-windows/log/ and here 
https://github.com/WireGuard/wireguard-windows

Version 0.5.3 works well, but I suppose it can be even better!

Any plans for some update?

Regards

Bruno

Le 21/09/2022 à 09:52, Houman a écrit :
> Hi Simon,
>
> Not only that, even the repo
> https://github.com/WireGuard/wireguard-apple hasn't been updated since
> 27 Sep 2021.
> There are a number of useful contributions in the form of pull
> requests waiting there to be approved for over 8 months.
>
> The project feels abandoned, which is such a shame.
>
> Regards,
> Houman
