Return-Path: <SRS0=wsGv=TQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFFCC04E87
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 06:27:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0923720848
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 06:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ld7U8Ifq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0923720848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bcbfd8f;
	Thu, 16 May 2019 06:27:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1b0bff8
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 15:31:38 +0000 (UTC)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50d275ab
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 15:31:38 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id i26so86207qtr.10
 for <wireguard@lists.zx2c4.com>; Wed, 15 May 2019 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YBnv7oYzusQpf6WEuTmkQuRRwT7BUwElHcZ2bh/oOl4=;
 b=Ld7U8Ifqf7NdB+C7wKJ0+VCwB+OEcyirrM4Uev6MiZHquD8YEb/YhH12Cb1+Kly4Wg
 9UqN1ZzrveDE8D1J9pFyLiEPF6HPN/7qLLKBrlQ/5uRHIadD27EqCgqJplDAToDultUx
 iKFbTbh3d9JhHqWV1vhBsxCleqSq967vQ8AgXqkOxZE4KqhL7FFbnzXlbG8+74QVmTaZ
 Dy8c/6uPaRmQAe5kyI6cujerJrCiw4MFfJesTZPWGWTDiSotCvSicWAkQnYXGZQuZQfo
 Q5h2/CX9/6RjAxUJ8WNWW/BAT3vmiYzz3yq416SuS5Xq+tl7hC4lvySAaOdYbmadA1nr
 PnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YBnv7oYzusQpf6WEuTmkQuRRwT7BUwElHcZ2bh/oOl4=;
 b=WF4KgCVTfNVIh/DDKRMKBKIGEAG3jjCZRsprg9oq/coditUpr5kr9tnUYWKjfBwLpt
 8bwsEaSWgvXiCPooLd9eo+dHEvsUYx3nMGgGLGCwDo79+QsWbAPpvIjQq/w2cLuUWX0w
 kI2VIPEaYEtBkB+2DowiLTIn+WOpCURshwYOt0H/1h4OTHVm7s0tQ+E8jbZthWJI+jgY
 AKYpooRz6Fp4XCMhHM47rgYzKcCynXnKM3TbfqSqYlq/WiHy4AUs+4KClQtBDFv4OGCl
 3hwXbRktqcki2UCCQMIZGRbumMXhvOUTYiGh2llpYboiwIvAQzommU1DoUMNqERHtKAJ
 B44A==
X-Gm-Message-State: APjAAAW4STdglc7CW1Ba4B5zhU35UcR2JIdAsSWzkNNiOL0pSwNSR0cv
 ukhsH1kku+EXbxHAVjNBfrFHulB7JSfurkWgVnw=
X-Google-Smtp-Source: APXvYqzarv6xX0vfJCZYXqVr0oDxu/g1efIDIYb9RittGjbioBQIlEDyHc+1Xn1eEwmHw48HC7blOZgjMqN8iMJL8lU=
X-Received: by 2002:a0c:b907:: with SMTP id u7mr35354558qvf.189.1557934297985; 
 Wed, 15 May 2019 08:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
 <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
In-Reply-To: <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
From: Lev Stipakov <lstipakov@gmail.com>
Date: Wed, 15 May 2019 18:31:26 +0300
Message-ID: <CAGyAFMWgboF5zkEwKjc5yEX4T5HnXvW10k8qj6kxTCB1bVQRPQ@mail.gmail.com>
Subject: Re: [Openvpn-devel] Wintun performance results
To: =?UTF-8?B?0JjQu9GM0Y8g0KjQuNC/0LjRhtC40L0=?= <chipitsine@gmail.com>
X-Mailman-Approved-At: Thu, 16 May 2019 08:27:23 +0200
Cc: openvpn-devel <openvpn-devel@lists.sourceforge.net>,
 wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============6266824779848784241=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6266824779848784241==
Content-Type: multipart/alternative; boundary="0000000000006a3b080588eed80c"

--0000000000006a3b080588eed80c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think so, but before we need to incorporate wintun support into
openvpn2/3 masters.

ke 15. toukok. 2019 klo 17.49 =D0=98=D0=BB=D1=8C=D1=8F =D0=A8=D0=B8=D0=BF=
=D0=B8=D1=86=D0=B8=D0=BD (chipitsine@gmail.com) kirjoitti:

> it will most probably get lost in mailing list.
> can we add it to https://openvpn.net website ? something like
> "performance testing" with full configs provided ?
>

--=20
-Lev

--0000000000006a3b080588eed80c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I think so, but before we need to incorpo=
rate wintun support into openvpn2/3 masters.</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">ke 15. toukok. 2019 klo 17.49 =
=D0=98=D0=BB=D1=8C=D1=8F =D0=A8=D0=B8=D0=BF=D0=B8=D1=86=D0=B8=D0=BD (<a hre=
f=3D"mailto:chipitsine@gmail.com">chipitsine@gmail.com</a>) kirjoitti:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v>it will most probably get lost in mailing list.</div><div>can we add it t=
o <a href=3D"https://openvpn.net" target=3D"_blank">https://openvpn.net</a>=
 website ? something like &quot;performance testing&quot; with full configs=
 provided ?=C2=A0</div></div></blockquote></div><div><br></div>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature">-Lev</div></div>

--0000000000006a3b080588eed80c--

--===============6266824779848784241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6266824779848784241==--
