Return-Path: <SRS0=hbZ4=2G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F2CC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Dec 2019 22:55:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D5742176D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Dec 2019 22:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="1+josn3L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D5742176D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5628158f;
	Mon, 16 Dec 2019 22:55:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c70ae3c8
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 22:55:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de9e15e5
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 22:55:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5906d51
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 21:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=mXpfwdk/XjmxUdiVi854lK9J20g=; b=1+josn
 3L3PHus4IP6Tm+pPYaOASMGrrsAIUYt2qAlO9jcjJIw0A2pkwy1MsLTJC0zhljTR
 jCjFRkxgt1xbqFX95knUm7yi6KAV4h1dvhQDQQb2w4se0oJ7UbOAQ7kspbtdKdME
 s8i2Y2QupXxLxZGlfvSCt915XYIboX160tZx6sDJmITLVVHawvH2RP+VmZTp9+gw
 dmUKtbWirAsjws+Jm3r/L15cL/fYHfrdqzLsJjE2cR3GVZzNao15nAbO8RZpp29n
 306DzFOkkS8bK2XkAX8hNbbH8ffnHbk1eHDxEKUA6+9/NNjD84FxxiMEUI7WkvKT
 UNs/0rSDLi0u4iIg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7f0584a9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 21:58:56 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id b8so4650777oiy.5
 for <wireguard@lists.zx2c4.com>; Mon, 16 Dec 2019 14:55:18 -0800 (PST)
X-Gm-Message-State: APjAAAUzSeiq4EyPZDIvb36myhhsAVy4Z4rjfI361sTL30jCYTYECHPW
 OCSdxiTM1g3cA/rnpU9xv7/AtSNaUb75HUQGP4E=
X-Google-Smtp-Source: APXvYqzXQ0weEUme+SUzseRhkirC2+DTO1iBN3/MprRRGNwqBMeRTlvUr86nh2xP23Xg+GARtLcS6L1RhP75jGgK5WI=
X-Received: by 2002:aca:5cc1:: with SMTP id q184mr760331oib.122.1576536917683; 
 Mon, 16 Dec 2019 14:55:17 -0800 (PST)
MIME-Version: 1.0
References: <c984c11f-fd80-7468-698d-bc5ed8b8fdb8@53c70r.de>
In-Reply-To: <c984c11f-fd80-7468-698d-bc5ed8b8fdb8@53c70r.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Dec 2019 23:55:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9rkeeMUdozgaz5uSobTkUifOfs3UG5GE=Vr8e5pYK97jA@mail.gmail.com>
Message-ID: <CAHmME9rkeeMUdozgaz5uSobTkUifOfs3UG5GE=Vr8e5pYK97jA@mail.gmail.com>
Subject: Re: WG interface does not come up after Fedora Upgrade
To: Silvan Nagl <mail@53c70r.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5883419274975624242=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5883419274975624242==
Content-Type: multipart/alternative; boundary="000000000000f4367b0599da1a2c"

--000000000000f4367b0599da1a2c
Content-Type: text/plain; charset="UTF-8"

Which Fedora? Which kernel? What version of nftables?

On Mon, Dec 16, 2019, 21:32 Silvan Nagl <mail@53c70r.de> wrote:

> Hi,
>
> recently i upgraded my Fedora including WG to the newest version
> 0.0.20191212. After the upgrade i was not able to bring up the interface
> anymore. Does someone else have the same issue as me?
>
> Actual error:
>
> /dev/fd/63:5:94-96: Error: syntax error, unexpected fib
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000f4367b0599da1a2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Which Fedora? Which kernel? What version of nftables=
?<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Dec 16, 2019, 21:32 Silvan Nagl &lt;<a href=3D"mailto:mail@53c70r.de=
">mail@53c70r.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,=
<br>
<br>
recently i upgraded my Fedora including WG to the newest version <br>
0.0.20191212. After the upgrade i was not able to bring up the interface <b=
r>
anymore. Does someone else have the same issue as me?<br>
<br>
Actual error:<br>
<br>
/dev/fd/63:5:94-96: Error: syntax error, unexpected fib<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--000000000000f4367b0599da1a2c--

--===============5883419274975624242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5883419274975624242==--
