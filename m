Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0746CC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 21:14:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9199C2075B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 21:14:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKUa1Dar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9199C2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c31634c0;
	Wed, 2 Jan 2019 21:11:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c7de9a0
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 21:11:35 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ab5fa63
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 21:11:34 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id n2so15080119pgm.3
 for <wireguard@lists.zx2c4.com>; Wed, 02 Jan 2019 13:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OWPLu7VV8zH25VIyaMtvlKyBF//3Kh2hdnV12hQo44M=;
 b=nKUa1DarR90qVfEyfoY96EgKoHrhGe3CgYFSBEo07EhSHVQcMfxQosn3gsFhX31q34
 CabLQ6IMZC4pHe+C8z1BUU8rkziX/tFhPlEUt6QysjP8BD3k9UcflzPE1IKaiGeZVtxw
 En21dw8UZBwz86ttC44Zk2ZwthTj9RMSckib65gWWsYvc+9Kjlck/lCk7f+g/otJMK4S
 HPZonVRsbT4pitQtuYbqaHr3bOOeaqEdOEUgZuqQr3A4eLOV7jhle7NrIlzWZ0Z1DGzf
 uy5wKCbpK5UzmUn2Q/YpPQ/6dcrdtQjxQw2ySFXbFBMgIckTScSwkXSfmqx7+4ytdavB
 hSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OWPLu7VV8zH25VIyaMtvlKyBF//3Kh2hdnV12hQo44M=;
 b=dpTT+LfuFlNQuJXhAHliJ4XnV1lu4oYcZGjr16wQrQ9F94cOvtCdb55Gi0wudccB6H
 k/iGK2GQ1yV30CG74OnWGpTQR61+e1mJ6hV0FcIhO+DuMLY4IQnecJReIZIhvh9QjQa+
 +wwuRMQEsdAf5mCDAWJKN7aLbMIl73Bv32q3RnOGOiVm4IgMM/ExXqLGJRx8QQ5uT14/
 9egashCPJNPwkem0V4hUvjnBkfwNlMSjg3645RC6pDS2N6JNJQqfBWDKQVJTsxCnFf9r
 Z5mAxGcnYlVI2xG0Ri1LQds+d12clIh8ShjfNKlrXvo/23MmQpZFdRVl3sDHSN5tXG1G
 EpBQ==
X-Gm-Message-State: AJcUukdYRA1enDqdUUI7+e46uitohidUNCe4+kC2E7qwE4n1Ll3DiMVk
 tvkYfX+zOoeUbddZ3cr+tJkGGwN1bkeySu+AJhs=
X-Google-Smtp-Source: AFSGD/WYZYNBT2yz2qsaausTbGVz3YmITIgN0yovKDGlopTFd8g/AVNa/xZmDMHE7jCxMc7l25Y82H7b34v5qNAqDlw=
X-Received: by 2002:a62:f247:: with SMTP id y7mr45983678pfl.25.1546463638148; 
 Wed, 02 Jan 2019 13:13:58 -0800 (PST)
MIME-Version: 1.0
References: <CAOAvjy2V3WBFOtKp6dKztFh3gYHwW4=sfnz_ZxtRvDM=9fwQpw@mail.gmail.com>
In-Reply-To: <CAOAvjy2V3WBFOtKp6dKztFh3gYHwW4=sfnz_ZxtRvDM=9fwQpw@mail.gmail.com>
From: Martin Eskdale Moen <martinmoen@gmail.com>
Date: Wed, 2 Jan 2019 21:13:22 +0000
Message-ID: <CAKiCHuOeimfJ3y7k1PWxxN_YXSs8AFA8L7++4C3XFAMLjNM21A@mail.gmail.com>
Subject: Re: Google Chromecast
To: Subin Abid <subinabid@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2654331914382818568=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2654331914382818568==
Content-Type: multipart/alternative; boundary="000000000000cf5ce3057e801f76"

--000000000000cf5ce3057e801f76
Content-Type: text/plain; charset="UTF-8"

Are you routing all your traffic through the VPN?

On Wed, Jan 2, 2019 at 6:47 PM Subin Abid <subinabid@gmail.com> wrote:

> Hello,
>
> Android device (using Home app) cannot connect to chromecast while the
> device is connected to VPN. Is anyone else facing this problem?
>
> --
> Subin Abid
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000cf5ce3057e801f76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Are you routing all your traffic through the VPN?<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jan 2, 2019 at 6:4=
7 PM Subin Abid &lt;<a href=3D"mailto:subinabid@gmail.com">subinabid@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial=
,helvetica,sans-serif">Hello,</div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default=
" style=3D"font-family:arial,helvetica,sans-serif">Android device (using Ho=
me app) cannot connect to chromecast while the device is connected to VPN. =
Is anyone else facing this problem?</div><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail-m_5468736971009718748gmail_signature"><div dir=3D"ltr">=
Subin Abid=C2=A0<div><br></div></div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000cf5ce3057e801f76--

--===============2654331914382818568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2654331914382818568==--
