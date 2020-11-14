Return-Path: <SRS0=wRPw=EU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D5FC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 10:03:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B432224B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 10:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Xh3XtxFZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B432224B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 315c643a;
	Sat, 14 Nov 2020 09:58:24 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4aabd7d5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Nov 2020 09:58:21 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6caa50eb
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Nov 2020 09:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=Ey50ivhP7Iad
 CrDUYf5Qy1xom5A=; b=Xh3XtxFZw5Dg61LTHNy6lAU/oOnKOe3RD9N3ksR60dz0
 wSDXUu+C4+INC23cct/PFUrGuW/tTI5OoG2QTrEFszbbDB27e099tV1Dzjucq0as
 iw6eKAdn5Z9801a79d2qky9JTg/24q+w8dstxBBnC9yTVm0UDkbhVtSm8zdwj7Xe
 UiaPmOiZN5RPG2o8MVF85CSpcx/VZicby/beFHImeZnalReORL3UD08/+68MKFdR
 8gyeRFxNi196YZDjhz8hlAGXZxZDEMi1JGmbRaFZVv86SafS/dba8A1gRo6SEG6Z
 vUO/LMAw8hhgp7U1ZhkgMqE26aRvJwe88Y8M7T/dQw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ee97e42
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Nov 2020 09:59:07 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 2so11032489ybc.12
 for <wireguard@lists.zx2c4.com>; Sat, 14 Nov 2020 02:02:33 -0800 (PST)
X-Gm-Message-State: AOAM532ba/4gXStFKKkArfKtQ/3NnXqfAFKettKjhZ2MrMbRrKUlMrSf
 Asgfrb7+IjqXV4MfKmPQmB4wksXMR8ZfCuXBGwc=
X-Google-Smtp-Source: ABdhPJxzQO9NANPy4ONKITpSgI57Bnwnjq+G+DvMW+qSlzQ66UQyeal73GdtJZ7VaLNIubXvYfZ+cBg4jziSJQb9QQk=
X-Received: by 2002:a25:df05:: with SMTP id w5mr11284049ybg.20.1605348152653; 
 Sat, 14 Nov 2020 02:02:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:474a:b029:2b:bd99:a3dd with HTTP; Sat, 14 Nov 2020
 02:02:32 -0800 (PST)
In-Reply-To: <f33d3e97-5c9e-3573-663f-44ea744e6e8f@molgaard.org>
References: <6bfa482b-42ee-ebc3-f2cb-4f52d9d2e219@molgaard.org>
 <a47de6a45010b55c2ddab84e401a81a02f7728bd.camel@gmail.com>
 <f33d3e97-5c9e-3573-663f-44ea744e6e8f@molgaard.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Nov 2020 11:02:32 +0100
X-Gmail-Original-Message-ID: <CAHmME9rLvxVZoPwTfJ07LeL=o1wtwdqNJc6+DL5Hzyiwc67iUA@mail.gmail.com>
Message-ID: <CAHmME9rLvxVZoPwTfJ07LeL=o1wtwdqNJc6+DL5Hzyiwc67iUA@mail.gmail.com>
Subject: Re: Hooks in clients?
To: =?UTF-8?Q?Sune_M=C3=B8lgaard?= <sune@molgaard.org>
Cc: Nicholas Capo <nicholas.capo@gmail.com>, wireguard@lists.zx2c4.com
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

On 11/14/20, Sune M=C3=B8lgaard <sune@molgaard.org> wrote:

> But if I understand Jason correctly (thank you, Jason), even if we
> employ port knocking for a few other things, if we keep the WG port
> open, it will actually look closed, unless one actually has a legitimate
> client and client config.
>
> Is that understanding correct?

That is correct.
