Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE42C47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 15:59:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F13826142B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 15:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F13826142B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b08f20c5;
	Sun, 6 Jun 2021 15:59:37 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6bff174e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 15:59:36 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id x10so7274867plg.3
 for <wireguard@lists.zx2c4.com>; Sun, 06 Jun 2021 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JQVft9ZNOFfY5wVw/bQUuYr4RkdAjem+jCMOPt12qEo=;
 b=XOsomZpFn3NYrG/UGioNNXeu77tbFv+QA6P/w7+7NuLUTWPhhI9PjlDFD5pbCIbDJy
 PXv1WBVhnEWWzhRUb/k7KZIwEeMwE7Dk+tAxDk567o/sgunPRrimoXfY3ZV9XBJzO3W7
 fD0FLW+BnWm07shiQdB6FpQJT0oXrhKS6mfl6x+1hUNfQoKMfBYcAezThOAfg+hUYXDq
 bAouGQUtM2Xx2S39+egDcpe7yVWsNgxuLN7GDDEBwCHWrbMg36o2njAKXHtnnhskBlw5
 anN+t9W5l7ULKP2OuikwpUpfBagh2o7yKaN34vZ2GbYmg3ZvXTJmZjWM57vY0RUVkNVT
 H8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JQVft9ZNOFfY5wVw/bQUuYr4RkdAjem+jCMOPt12qEo=;
 b=TNx4+yCkgWZwDntzespABMtFsANgJgN8lz9UNCpHDwR7GZuYu/sWICNbBWTTDMYHrA
 l+8TMQybb6b96m346M+LuPxavzbPRROpgOkOALRcvNA9Uq/IqNxZMJfHaJCtyvHGThBn
 Ro52A/Fyr/DxOD7mtmk8m39Dmhe7NQK9DUZaDhcfNupg0+A+HwUBqNCx/a/4CKcaZ1gQ
 AzOgjViFk0I6hZ/IT/aeQCCtHhKUsiUnAbhgSbRP5UxMZZuEtYi8HrDo7bOjB58gGisj
 eko0K8IV1CnH08a7piVfxiMyrpPMbNmgGKSyRzxaYzmwWwRQi97nYuy2gX/qjoZ0rlha
 o8eQ==
X-Gm-Message-State: AOAM532VVN1mGPVorcIgdrJ+1El9z4WEnVwcxkjc09oFgEjpVgChXWka
 7xPXlOlRmag9Dgo8AjcfPEtCGtrRttIHh59dzHM=
X-Google-Smtp-Source: ABdhPJxPBkD0cGxNfon5qAwF0ybLpPWKbptODry/nQDeXjz+09oT/MURKSspsulAtl/0j6bY+l8PmVmDdcvpNtcnaPg=
X-Received: by 2002:a17:902:d305:b029:10d:c8a3:657f with SMTP id
 b5-20020a170902d305b029010dc8a3657fmr14045749plc.0.1622995174170; Sun, 06 Jun
 2021 08:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADTMz0+OmW5n1JSD6pLA-_2=aRHeuhYLdQ6BCwjHg07vrPc+vA@mail.gmail.com>
 <CAHmME9poc+xPG_WfX1vYTSc9JPrSkMpWGR=rTGspOVsKyYfCpA@mail.gmail.com>
In-Reply-To: <CAHmME9poc+xPG_WfX1vYTSc9JPrSkMpWGR=rTGspOVsKyYfCpA@mail.gmail.com>
From: Christian McDonald <rcmcdonald91@gmail.com>
Date: Sun, 6 Jun 2021 11:59:21 -0400
Message-ID: <CADTMz0KSq7Kj6SzTptTt=Uy5EEGkCRhbZXzZfPeeJ6Vu8134uQ@mail.gmail.com>
Subject: Re: Certain private keys being mangled by wg on FreeBSD
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Would it not be better for wg to just fail outright instead of
transforming a poorly generated key entered by a user, regardless of
where the key came from? Especially if that problematic key passes the
regex validation that was provided in another thread in this email
list? If not, what would be an appropriate solution to catch
situations like this and in turn alert users? This seems like it could
be a larger discussion on interoperability, especially when dealing
with keys that are being generated by VPN providers.

Granted, this certainly isn=E2=80=99t my area of expertise. Though, the
behavior is just unexpected (and confusing) from an end user
perspective.

On Sun, Jun 6, 2021 at 11:09 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> It looks like whatever is generating those private keys is not
> clamping them. Specifically, all private keys should undergo this
> transformation:
>
>         key[0] &=3D 248;
>         key[31] =3D (key[31] & 127) | 64;
>
> In your case, your `Lm` prefix (first byte: 0x2c) is being anded with
> 248, and thus turns into KG (first byte: 0x28).
>
> The kernel properly clamps the keys on input, though, in case
> generators forget to clamp them. So what you're seeing is correct
> behavior.



--=20
R. Christian McDonald
M: (616) 856-9291
E: rcmcdonald91@gmail.com
