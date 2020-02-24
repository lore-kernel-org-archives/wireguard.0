Return-Path: <SRS0=Pzr+=4M=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E18C35671
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Feb 2020 14:00:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B9520836
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Feb 2020 14:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NdPQw7pl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7B9520836
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 332c40c7;
	Mon, 24 Feb 2020 13:56:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4e44101
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:55:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c494176
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:55:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78a00e08
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Ws1JU94a1sOvJlE03qBP1+aBfNI=; b=NdPQw7
 pl6USaPCe06HQnSMetz5UkqzeKVqj1zTVBvFaujBZP1Fyl+g1J04AWHlLhaSXOj6
 GeQfF1N4z+naf0Sb1WxVWOegStyPOPo7pcaBU7QSIrA+5JcZbq2h+PIiGSDq3Pgp
 dtfHDs5+4IhQLmGXJKJdILlkCDEfF4tQbzqyNkwaQ1AdaN3tUnGfg+swdBS8iOOk
 oNxbXamneeJaAdCb95SBRWa2NBhpJJ1cpoPUH/j2Nu3zg4AaaJjYtfNTlACYEoVe
 8dFVFHc2kKAau8dahf9q4DtKYX/nwW4yOi0DWXX5yRTyTLNE0g1ENMvZByz33hI3
 AbR/UwnWapVxFnIg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 16c3115e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:55:58 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id b18so8998852oie.2
 for <wireguard@lists.zx2c4.com>; Mon, 24 Feb 2020 05:59:22 -0800 (PST)
X-Gm-Message-State: APjAAAWOBym/ZJqqgDwwQ+aIPakI6826bQDsaOJxgglsuCUKQVDBVrTe
 m1UvRjgEGrNjKnohbJDiU5P7ecuSzrwjf/hsNIs=
X-Google-Smtp-Source: APXvYqy4pd9KJL9QjCVnOWlvklM8hLoYEp/zVQ0HLQY3qCaa5YjGAnoHsbLoomTY2TLLP21DHfgMpruKsSVCe6IQ0EQ=
X-Received: by 2002:a05:6808:4cc:: with SMTP id
 a12mr13175784oie.115.1582552761686; 
 Mon, 24 Feb 2020 05:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20200213103117.68943-1-tanioka404@gmail.com>
 <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
 <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
 <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
 <CAA2ss9E2jnvA_TLhBPJTSuqBz+YoU-wUTPnYghYw+bMPpeSoWQ@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D06C64FF@PLANJAVA.amebis.doma>
 <CAA2ss9GtMHuhS7wTfKiHee62iyVH6pB4OH9vucbWZnpBeRGqXQ@mail.gmail.com>
 <CAA2ss9GG5P2QgRtO=sBSKywTqAniB4rfk7qSWOkvTtVnvPNsXg@mail.gmail.com>
 <3a52d59c-0784-4eaf-aedd-ce7baba2f5c3@rozman.si>
 <CAA2ss9FUyK_Hrk3AoPLd9cKe1Mpci=yt28L_zY9kQ7S2_1eqkw@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D0760855@PLANJAVA.amebis.doma>
 <CAA2ss9FaHPH7achZkZ2i+RazeVjPW=SSCfe3DBj3NP-v-vcB2Q@mail.gmail.com>
In-Reply-To: <CAA2ss9FaHPH7achZkZ2i+RazeVjPW=SSCfe3DBj3NP-v-vcB2Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 24 Feb 2020 21:59:10 +0800
X-Gmail-Original-Message-ID: <CAHmME9pX8Puz0WUHyK6gcNJDK7j09t7RpzsN+z43EgrObmSREQ@mail.gmail.com>
Message-ID: <CAHmME9pX8Puz0WUHyK6gcNJDK7j09t7RpzsN+z43EgrObmSREQ@mail.gmail.com>
Subject: Re: [PATCH] Add japanese translation.
To: Eiji Tanioka <tanioka404@gmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On Mon, Feb 24, 2020 at 9:57 PM Eiji Tanioka <tanioka404@gmail.com> wrote:
>
> Hi,
>
> Thank you for the instruction.
> Yes, Japanese doesn't have plural. I will use this file.
>
> When finished, I will send "resources.rc" and "messages.gotext.json" to you.
> Which style do you prefer? "git format-patch" or "attachment"?

Please avoid sending attachments to the mailing list, and rather use
`git format-patch` and `git send-email`.

Thanks a bunch for doing this. It's very appreciated work.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
