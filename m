Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C88C33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 07:03:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD99C206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 07:03:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kepLOwDh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD99C206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 941ab761;
	Thu, 30 Jan 2020 07:03:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9fffc30
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 07:03:33 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93b6ea01
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 07:03:33 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id q81so2565650oig.0
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 23:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8sTiGpkn09wnr2MMOiRLTl/U3z/dlBVIs0p/JX2sf70=;
 b=kepLOwDhcLVfs8tKl9wBFsyBAE+3MkrWBft5+boXLeVBRLORfhG8lg3y4+u7fZj4dK
 ylBtdBOOCNuEKMQbJwYnf6IZgtlWS0i1j/+LH68MwUaT9XZ/5p+jtY69RF+ISS7Kl5ZH
 1NRIZEctKqIV1EbDPFAXvjRQE5Is/NT+lUt7lc3jqoVCWHC+sgvvmVj0L2uYw5YWpyO0
 TrAugHNErquoP6iumeA65YKgSqX7X4PZ0NH+qmxR1U2g3+NJBG5ABrgEaGiUC7lq9ufi
 B0OI7tDXg6GCWItmWIYkT5QEzFrFlrNssls91HKQEzso23TWs5fikzfFu3pi6FzIceYE
 uJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8sTiGpkn09wnr2MMOiRLTl/U3z/dlBVIs0p/JX2sf70=;
 b=aXG8oU/pO0KlkzFOMjYhO2TeXQCe8w91ksSRwvKQVufehgxT2Ls0L5ybgHM+6andb5
 +aHyoyNaxhCaUTuFNrmVjThCLnoD3MvYud2YAlDX2+jc/Q4STCwbwaOvE2NDgk99fLZj
 NDn+3TiZRNv3dRzqGr93nPh08EwUDcRzPw9eEL5U1QwWn6jBEwxYdEEqqjsSrYmS509/
 r+nJonouW36o3rAPLYp9naoL6bp9aGZDMZ4RykNu3ti83rLjjxEHaTQ9GQGv3FnxjOGa
 LUlC/Vrq90VwncWqvvMZCt8Sl7jIBNELNf3WRVdVLoe2G8Res/b4Ve5O46rsfVTUGC45
 1KPA==
X-Gm-Message-State: APjAAAXcEe3dOMR9bfIe0csUv7vw1U6oNgJ3Racm/tEhHol85Tm/Q+os
 tTbqqA9dxmpzmxcNRf32Ojs9rlnqpmWSNk6lXZ8FAHUoCRB8CA==
X-Google-Smtp-Source: APXvYqwfBmuG8VX1BaNQTzAzkN3H+hyvFPWHfRhBuvg5SnVShVV/wHq7pUEP0N1EVSv/5dUHALs8KH5mn+yQEUsrtMA=
X-Received: by 2002:a54:408f:: with SMTP id i15mr1903784oii.64.1580367819745; 
 Wed, 29 Jan 2020 23:03:39 -0800 (PST)
MIME-Version: 1.0
References: <6cd7ccf2c193ee3bd1db3d5870f6982084d0d0d6.camel@dreamofjapan.de>
In-Reply-To: <6cd7ccf2c193ee3bd1db3d5870f6982084d0d0d6.camel@dreamofjapan.de>
From: Martin <martinmoen@gmail.com>
Date: Thu, 30 Jan 2020 07:03:03 +0000
Message-ID: <CAKiCHuOpy7m9yUwUiE1QBPEDtoM6O_R5grgD9JgLVd-qP3fRHQ@mail.gmail.com>
Subject: Re: ArchLinux wireguard install
To: planung@dreamofjapan.de
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
Content-Type: multipart/mixed; boundary="===============6993357074424820425=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6993357074424820425==
Content-Type: multipart/alternative; boundary="00000000000082b035059d560eb8"

--00000000000082b035059d560eb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Take a look at the mullvad program for arch in the AUR.
But I'd also ask in the Networking section on the archlinux forums
regarding the upgrade path for the module and kernel.
https://bbs.archlinux.org/viewforum.php?id=3D8

On Thu, Jan 30, 2020 at 2:09 AM Frank Tornack <planung@dreamofjapan.de>
wrote:

> hello all,
>
> I apologize in advance for the stupid question, but I am very unsure.
> I received a voucher for a VPN service at a trade fair and would like
> to test it. The service Mullvad VPN uses the technology WireGuard. And
> I use ArchLinux.
>
> My question was created by the ArchLinux Wiki. There it already refers
> to the kernel 5.6, which should support this function without a module.
> Now my question is, is it better to wait for this kernel or just
> install the module? Would it be a problem if I forgot to delete the
> module again? I am using the Network Manager, what do I need to be
> aware of?
>
> Many thanks in advance and thank you for developing this tool.
>
>
> --
> Mit freundlichen Gr=C3=BC=C3=9Fen
> Frank Tornack
>
>
> -----------------------------
>   Why don't you pair `em up in threes? -Yogi Berra
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000082b035059d560eb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Take a look at the mullvad program for arch in the AU=
R.</div><div>But I&#39;d also ask in the Networking section on the archlinu=
x forums regarding the upgrade path for the module and kernel.<br></div><di=
v><a href=3D"https://bbs.archlinux.org/viewforum.php?id=3D8">https://bbs.ar=
chlinux.org/viewforum.php?id=3D8</a></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 30, 2020 at 2:09 AM F=
rank Tornack &lt;<a href=3D"mailto:planung@dreamofjapan.de">planung@dreamof=
japan.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">hello all,<br>
<br>
I apologize in advance for the stupid question, but I am very unsure.<br>
I received a voucher for a VPN service at a trade fair and would like<br>
to test it. The service Mullvad VPN uses the technology WireGuard. And<br>
I use ArchLinux.<br>
<br>
My question was created by the ArchLinux Wiki. There it already refers<br>
to the kernel 5.6, which should support this function without a module.<br>
Now my question is, is it better to wait for this kernel or just<br>
install the module? Would it be a problem if I forgot to delete the<br>
module again? I am using the Network Manager, what do I need to be<br>
aware of?<br>
<br>
Many thanks in advance and thank you for developing this tool.<br>
<br>
<br>
-- <br>
Mit freundlichen Gr=C3=BC=C3=9Fen<br>
Frank Tornack<br>
<br>
<br>
-----------------------------<br>
=C2=A0 Why don&#39;t you pair `em up in threes? -Yogi Berra<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--00000000000082b035059d560eb8--

--===============6993357074424820425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6993357074424820425==--
