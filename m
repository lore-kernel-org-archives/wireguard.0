Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12398C4BA0B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 09:20:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 507F721556
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 09:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="BjAMQ8xv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 507F721556
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fd7cfc8;
	Wed, 26 Feb 2020 09:17:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef9a1e38
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 09:17:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17faa08e
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 09:17:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fb2b515
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=R76Ab9Al+7nvqx3uHxOuPiTimUY=; b=BjAMQ8
 xvCXCHXEz/Z2azIZXpQc7zm8YrT1eWEUMZMc+7nltP072bfD0rlCDb2I7V+Zoa+u
 T8m4kPesw5M6h4+FGohz+x08VWVd6MHnVGpl2pAfjkDKgO8SJaMACX5b29Qvhkm9
 0nkx5nvdpR0exG3tm6pxU/mvJucaJne1HUlhryJ75+tNbsKJL6ttqx8nWaKf/j3E
 WNFSdooA2LQr1mHJ2CTD0eeKqLRgXxMhwEyryPyk/DBcKY0Q98lCeHrQIZ9vA73M
 lGVwJDlcOqWY3c4H5sVXjNc3qtjtknVmsh23yzBWEotdqIpPGe3kQVZZyZo69v0C
 t73ItI5rIHkQ/qVw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c6abab62
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 09:17:02 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id i1so2319732oie.8
 for <wireguard@lists.zx2c4.com>; Wed, 26 Feb 2020 01:20:40 -0800 (PST)
X-Gm-Message-State: APjAAAV8es1UB5LtAm1FjovP3hZSWqE66J9jkvhgAq7VzcU932rkW6z7
 MyYqfZkr4uxcS66WDKeb7xC0VzWTWjSpRSV1H9Q=
X-Google-Smtp-Source: APXvYqxl8BtsCE6z8sDW34VufUSMPTI0Ia4nUFzLS6J0QnKg92mHgAoR4bLxZYS7IC9ta168jNMOkPyW2NBXzVVEbhM=
X-Received: by 2002:a05:6808:4d3:: with SMTP id
 a19mr2115361oie.119.1582708839896; 
 Wed, 26 Feb 2020 01:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20200225154427.99376-1-tanioka404@gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D0767622@PLANJAVA.amebis.doma>
 <CAA2ss9EMhZM8KVmUFku_4x2RoHwiZp3+VNMd4qudv+gnS1xF9A@mail.gmail.com>
 <CAA2ss9HDT5+zU6Zz1Gt=zNRKqr+Dv8hc8z63=qJMJymhgRD=2Q@mail.gmail.com>
 <CAA2ss9Ed9e34Ca1+c4dLrEH7kczf1cmwauArH3byQqbj+1-Myg@mail.gmail.com>
In-Reply-To: <CAA2ss9Ed9e34Ca1+c4dLrEH7kczf1cmwauArH3byQqbj+1-Myg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 26 Feb 2020 17:20:28 +0800
X-Gmail-Original-Message-ID: <CAHmME9oVqiOH=U6Jz=Hs5AVyNkZ+_L4_srJKVSzimgbg3DPULw@mail.gmail.com>
Message-ID: <CAHmME9oVqiOH=U6Jz=Hs5AVyNkZ+_L4_srJKVSzimgbg3DPULw@mail.gmail.com>
Subject: Re: [PATCH 1/2 wireguard-windows] Add Japanese translation to
 resources.rc
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
Content-Type: multipart/mixed; boundary="===============0556792879521764011=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0556792879521764011==
Content-Type: multipart/alternative; boundary="0000000000002f5e16059f771e7f"

--0000000000002f5e16059f771e7f
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 26, 2020 at 10:47 AM Eiji Tanioka <tanioka404@gmail.com> wrote:

> Oops! I missed mail from ML.
>
> >The reason it is being held:
> >    Message body is too big: 46986 bytes with a limit of 40 KB
>


It's okay. I saw that caught in the queue and manually approved it.

--0000000000002f5e16059f771e7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26, 2020 at 10:47 AM Eiji=
 Tanioka &lt;<a href=3D"mailto:tanioka404@gmail.com">tanioka404@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr">Oops! I missed mail from ML.<div><br><div>&gt;The reason it =
is being held:</div>&gt;=C2=A0 =C2=A0 Message body is too big: 46986 bytes =
with a limit of 40 KB</div></div></blockquote><div><br></div><div><br></div=
><div>It&#39;s okay. I saw that caught in the queue and manually approved i=
t.</div></div></div>

--0000000000002f5e16059f771e7f--

--===============0556792879521764011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0556792879521764011==--
