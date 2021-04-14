Return-Path: <SRS0=Tjnm=JL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCE6C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 21:18:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60C7D61166
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 21:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60C7D61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fdd1d1d;
	Wed, 14 Apr 2021 21:18:12 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 954884bf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 21:18:09 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id m7so13987928ljp.10
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V1dPVVXQWaQVoSq+oLeKnulRpffk6LlQTtkTcVOdCDQ=;
 b=XdvGN4vg9qtFhZu4X2HGLaxTFh3IEbUNNpl5Y9i4whYfMiXuYC+yP/GGfvoaXjXQrj
 MlKwVJUhJVYK2G50YSKydZVc4Y4mof1SiM9jjkis5IIPEnxSmbG6z3WOdI3Y7j6vreBd
 0CZVbsckU7YPwBtaNCMILTuYuOOdc68C4fkcWiixmUHaYAUqAfOq+Zyh0o4fTAdwIfmh
 GC3497EGagUW7hX6sfurqiQr4GIV6TDIhWYnh/v5M3KI+G2B0WZOliLkLQguLU89oxwh
 eHuCKH4DQAxkxUFayrHUSwsy/Mg6YFvGd6ffI0w4i9ja2/KnxtgaUslTCMYE2mXEALHQ
 cLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1dPVVXQWaQVoSq+oLeKnulRpffk6LlQTtkTcVOdCDQ=;
 b=n3/FVNoiDTAv+WjJXsCTfjJR2dGGmRLdoTLmt+TvSpSDjXrMtcwRNut1FQXHpVSSEh
 j8m7eWALj6tikh5Kh9cJE5kDOlz8Qq3RgbLmDFTEK/tyZepNHpjGqUCsaIHSIbrUMDS6
 y4xS0GGEbVyUGyrXUSV50Qgra897PVBvSDIbH7JjRujIdY89ifEB1xiUo9vYzXiGvI0A
 nnU8CA6WMfAnKE8VLaBsNGjFGZXrlz4uB5gEb63h2bjGn6xS8Eargz54MN18vPBJkUAS
 CgBigX9yXs8E9Kfoety94SoFfzH6gBfWI4UJHOVXA6biKTBrDCbJAVcs3Stqz2RlRp6c
 UgiA==
X-Gm-Message-State: AOAM533yTE5cmFX+0EmFqWNmL5+8JZXdoHUt60c/Ecxfzf0+2MEsJX75
 T1HYuuRukH1S1g9cRRdP8bTetQDlgdZdwqpxlLMNe/uRlpw=
X-Google-Smtp-Source: ABdhPJy90T0lDbeM+H+EI5WLbB6NzfF+Dex4ibHSNSy8q8t+ZrHRZq8KWi3GAMnv1qoP+kR6nKvc3FnNY8IVaAvpvAE=
X-Received: by 2002:a2e:9f10:: with SMTP id u16mr22336509ljk.115.1618435089345; 
 Wed, 14 Apr 2021 14:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
 <CAN5wt5poiJbOAfe+_VQpu=+6V8dLDiFDVyhUFNbad5NEd9YFfA@mail.gmail.com>
 <CAN5wt5qce9+b8okeKyH4j_U2kUrL5i=_UJ2VupNSJLR2NN5oRQ@mail.gmail.com>
 <CAHmME9oYEYZwShTCwmnNFU=iGUyONm4u8UW-FQa_pytJvyen2A@mail.gmail.com>
In-Reply-To: <CAHmME9oYEYZwShTCwmnNFU=iGUyONm4u8UW-FQa_pytJvyen2A@mail.gmail.com>
From: Christopher Ng <facboy@gmail.com>
Date: Wed, 14 Apr 2021 22:17:59 +0100
Message-ID: <CAN5wt5oqXc95GkDcXym0KeV=ELWY0bU=D2wF+7ThJTBxfMdQYQ@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
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

ah good call, there was an old version there!  now works fine with the
vanilla PostUp you suggested.

On Wed, 14 Apr 2021 at 21:19, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Sounds like you probably have an older version of wg.exe somewhere
> with higher precedence in your PATH. Perhaps C:\windows\system32?
