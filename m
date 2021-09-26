Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658E9C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 14:46:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DB3260FDC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 14:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DB3260FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e3d79e7;
	Sun, 26 Sep 2021 14:46:08 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1a37c193
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Sep 2021 14:46:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s21so3933569wra.7
 for <wireguard@lists.zx2c4.com>; Sun, 26 Sep 2021 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fMhJ//l/3Ym/LJwRG2zZn/gi++Luzm7xJAij7PTRxrU=;
 b=MwDjA3E8k3CuyUFwkkjf2Rjytgs2kUsUiF4OOeTUsEEbe1hQCDoGn7n/ZE0odMAF0q
 AjazokeS2ni5Bwa+DUhx63fnJBE4gY2xYBUHqZyKDbcZ51X1xL5ADfUuRV2OvT4Qsnka
 e3vUZRhEnzmDa1mkNzTAlhHPcE4sveykZ4K5FGwJPHin68jRcUcoMdhn9JGDbYiY2vC6
 cIpJms9mUsUdlGFBJb/E3Xo5/+Dg7eYO7a7falZdgFQ1/gBQGXOHscWcI9GCChCrqC/4
 zhETXiJgCv4Og4BUoDMD+2CaiuX35/grp0EraDCgsLwqathdVGHZfgyRtPyE6blIK9xW
 9HCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fMhJ//l/3Ym/LJwRG2zZn/gi++Luzm7xJAij7PTRxrU=;
 b=gKCaAguUSHlP2n0lRCrPjqBDVr0ctohrosnQxbXmUNlpk/hCIi76NgV4e5T8Le7saV
 nsDM1oEtsGD5mPF3+E113Ubt4krZtTidiIRm5pzsznRtLGIU1//EPIm+gDoP/IEwVBj1
 D3kW/uADcDtA2aRSWScPRj3RrhBukHAozZ4AgQp3XQwkrKb/hHFarRxtAPTupN4SEKLa
 2W12cmhqqsd9yG3tyI0t6tpvEGPRBOA7/MdiQrj6NiE0FRn/C37EeqwRloeGQ5I4Xj09
 qenOkYOHNfW7qO2gEb3h010/UQ6gyeP+uK0lpLjlGhIPK7yPBn/rWD7o8Uqv0tdkCuL2
 PuUg==
X-Gm-Message-State: AOAM532ZKvENgn/LVbYEPjz9Dc+s0qvwcacKUEqzpGMn2p8zcHufMsGg
 DkgdqZ5Oa9tQjeRvKMvA8XVkYF4RmMxZ7rmVzHf+giNGCok=
X-Google-Smtp-Source: ABdhPJxnR9Ph+0qIitwiQnR5ew3rCGf8EXgaMFylTlZVROiCS6930Dqs8KnXFxgye7gOXfLLaplJkbEVb37bSrV+UwU=
X-Received: by 2002:a5d:4a41:: with SMTP id v1mr2192245wrs.324.1632667565805; 
 Sun, 26 Sep 2021 07:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAKFP4-gORakAyi7A+f2uMwRiE5LT5Ui7rBgZedqoBPcV6Q0M0Q@mail.gmail.com>
 <CAHmME9o2+1Wrmd9y1i-YLwQpa4rHTc_1CEbbmA_f4_mKj2AYqg@mail.gmail.com>
In-Reply-To: <CAHmME9o2+1Wrmd9y1i-YLwQpa4rHTc_1CEbbmA_f4_mKj2AYqg@mail.gmail.com>
From: Alexis Geoffrey <alexis.geoffrey97@gmail.com>
Date: Sun, 26 Sep 2021 09:45:55 -0500
Message-ID: <CAKFP4-jh1OvViU3LO=zn0kzcZu6znG7iAO4JHDCVE=6ogrkO=w@mail.gmail.com>
Subject: Re: Can't add search domain in Wireguard Android App
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Wow! Thanks for such a quick turnaround! Looking forward to
downloading the update.

Thanks for all your great work on Wireguard,
Alexis
