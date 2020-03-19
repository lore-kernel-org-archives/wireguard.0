Return-Path: <SRS0=ccJ7=5E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96B4C4332D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 08:15:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3357620663
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 08:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEjwOdpU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3357620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cd4633e;
	Thu, 19 Mar 2020 08:08:03 +0000 (UTC)
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [2607:f8b0:4864:20::e42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb479b7c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2020 08:08:02 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id z125so972513vsb.13
 for <wireguard@lists.zx2c4.com>; Thu, 19 Mar 2020 01:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hZdMMtUsDMoqRollS/5B/WJwIj7CMx2WHlRZajfm3kI=;
 b=CEjwOdpUt2gm9mVyhbiuVf4siz61oxCOBzMfEurRs8fJmY5oPXJi4FOAck1x3O7cKd
 4/Auhb9DpXEvG1ij/kc0cOQ/K0P+hJUudKO5NGe8dyULdXy/Ywxo9dpD/r0yAJ0fxjWc
 Ob7wgMGinX1HFaX4ZGGq7bTJPLRHltVZQLsRoYy0RtMAE3GeJmm6WzhcIbzFIJXpKFsg
 ZK3BBk4TstTSNDg5Ro5Ud1hcL7AAX0fZFjYIxq4sQQpEIEGdu8Au4x7zdmmOazu95HoP
 zknRx25Vh8k5TufjS1y3i7d9xYo2oEshsA5qWIuaGULc8tuSsppzC8MwsOIjgnEKzgFt
 z35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hZdMMtUsDMoqRollS/5B/WJwIj7CMx2WHlRZajfm3kI=;
 b=H/UyAUx2B4inD7JLY6/K7XmkusuSAZ30UPhVwe/vtiCn97HxPjEzeRhjIe8+7HmXqg
 rMYNHEPEIsNHFtCZrUwJ/Wil3/FH/O/VN1mQrDhlpuvsY03fLoQcvAmSPxSquMvKeXES
 FNTabWRQmckuEd9y6HF9ievvA+J9SoaWw0vTqPE8u3Vs5vggUSs+sgdtyXQk1x4WxiJA
 qA8X/xK0GVq3C/KJhY73hstwZouScYTvwQ7ZfKM1BRGLVxypS2ctPUNE2BF68B8K0RIk
 g0iyuTNyQSLuR9/yjEOih4jzhLyU3GsyPd63jCIPnpOL5MKaBzpptEaNB6CY4XJl3HvO
 inYg==
X-Gm-Message-State: ANhLgQ1cUGIHvxg6s0q2sGgkjUx0FYUkxYpwJ0PACSsrMvFtUtvVtCN+
 YRRHtP2N34Fz1frQi7UteVDdXLfwe31JD7P0V28OkpYT
X-Google-Smtp-Source: ADFU+vt4cJCdvqSITG1Z6MyBormX2Xi2x54BSSAkdydmz/E4qKhY4JHQ+2Yu7BegRA3KWy1WgA6o56snpiy/vi2DmdU=
X-Received: by 2002:a67:7f58:: with SMTP id a85mr1171862vsd.28.1584605668254; 
 Thu, 19 Mar 2020 01:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200318234214.5048-1-tanioka404@gmail.com>
 <CALpmF+HqACr03Zz+-160iNXFQcP1YzFUHRGWTQSatzmbv6uRzg@mail.gmail.com>
In-Reply-To: <CALpmF+HqACr03Zz+-160iNXFQcP1YzFUHRGWTQSatzmbv6uRzg@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Thu, 19 Mar 2020 17:14:17 +0900
Message-ID: <CAA2ss9GtRF2dwZO-6L3S0A98PH_MKedEuocKS3zxDOcD1BvPmQ@mail.gmail.com>
Subject: Re: [PATCH wireguard-android] strings: Update Japanese Translation,
 corresponds to commit 724884e.
To: Harsh Shandilya <me@msfjarvis.dev>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

> In the coming days we'll be making the translations available on Crowdin
> so if you find that more preferable, the option will be available. The pr=
oject link is
> https://crowdin.com/project/wireguard.

Looks Good!
When available, I will use it for translation.

2020=E5=B9=B43=E6=9C=8819=E6=97=A5(=E6=9C=A8) 12:48 Harsh Shandilya <me@msf=
jarvis.dev>:
>
> On Thu, 19 Mar 2020 at 05:14, Eiji Tanioka <tanioka404@gmail.com> wrote:
> >
> > Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
> > ---
> >  ui/src/main/res/values-ja/strings.xml | 1 +
> >  1 file changed, 1 insertion(+)
>
> Applied, thanks. In the coming days we'll be making the translations
> available on Crowdin so if you find that more preferable, the option
> will be available. The project link is
> https://crowdin.com/project/wireguard.
