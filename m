Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABE3C10F03
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:02:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1491E2085A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eak7lJ5A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1491E2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88e97250;
	Fri, 1 Mar 2019 09:52:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a17d95d5
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 18:40:09 +0000 (UTC)
Received: from mail-it1-x12a.google.com (mail-it1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e23376b
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 18:40:09 +0000 (UTC)
Received: by mail-it1-x12a.google.com with SMTP id g17so8213146ita.2
 for <wireguard@lists.zx2c4.com>; Thu, 28 Feb 2019 10:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nF2tzK2q5znnLqGqPRoIUQW/I+r+HcEtFDoBF+aYfNw=;
 b=Eak7lJ5AWoYn6ZgBIElVvYY7Pw3+Z9u1+URLbNnqUm2+8lUF6FiBHAj15mfZ49DytO
 /QiaPuBIX9PMkt0H4cqzZ8f+GsFyARUjo5eLs22wYkonD1egJD5tbRK5YxTmcEmsX7mw
 2Sw83VzQK7nB9vTNlpbDqO/6ZFkhQ/I4Hmz7irIae1POOkAZEYfEq39lyIy0FzW/IiRf
 92lSMd/kMUVfw72RoCuWI7tBLfuMyPKrSmy0ji9FVDNDFs/GiKRgYwQCAf29wO2EQE6Q
 blGAcr3hvTv/mHsvU7HJxoPAUHdC9rT5hpluxtmKh2jZxxrQv6Nu0cAaiVYeRsr46W9B
 kE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nF2tzK2q5znnLqGqPRoIUQW/I+r+HcEtFDoBF+aYfNw=;
 b=PAyMWcnRpkhtWA69naIxV3EvbY7FkWj2rRyJV1HXzUkY1v0k2/lX9dZ6VPoRNc8Jjl
 fhXqmxvAsNwlya5H+3g4PiP1rDX7OBjOy6l0ev4ZaHPj3entvBEwKLzaEQf0y73+mM82
 TiWEIU0W7qJyPkzBmbBMeJYx+nT2JCzsXQOIovNQMtHE6YWgiAYaxSvlSJgZatJ3lu3s
 ls+eYuPzvb1eFIF0RG4DPLiTKuqaqT/TTaxuYsQEByjZ2ASA23Dikarjk01nDcGxMoZG
 2x1b9w5L3cV5M7Oy5K41qqgJq5ycCEEJ8F2kyuu2QUevNVb/8MykPJ+dhEY0AUUN77ey
 hAHw==
X-Gm-Message-State: APjAAAVtQuuVUaMIgfwp1GjOEXxKnA+eoniNy293zrLg1Up+THmUOl8z
 UPtov0tTkAfi/VJdT6Li33TT79REkswjrPdwtsxbJK3W
X-Google-Smtp-Source: APXvYqyMqmA9DncV2m2ae24RJMp5HwEmlUiEUQN4G9kfJpPVamupfeBWiNwP4yPuR1MtDCIDwY9qW5qMP/WaCnBGBQE=
X-Received: by 2002:a02:8a53:: with SMTP id e19mr336727jal.44.1551379792493;
 Thu, 28 Feb 2019 10:49:52 -0800 (PST)
MIME-Version: 1.0
References: <304c3849-35d1-3312-1670-e7a8469a01fe@post.com>
In-Reply-To: <304c3849-35d1-3312-1670-e7a8469a01fe@post.com>
From: Hayden Lau <lau.hayden@gmail.com>
Date: Thu, 28 Feb 2019 13:49:36 -0500
Message-ID: <CAPN0m0zzQR2q-PW5CqtSsr9FNU9AXjT6ao7gihbuG8nPLxchKw@mail.gmail.com>
Subject: Re: Openresolv package is a requirement and should be added to
 install docs
To: F <finalcountdown@post.com>
X-Mailman-Approved-At: Fri, 01 Mar 2019 10:52:31 +0100
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============2610748720484727970=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2610748720484727970==
Content-Type: multipart/alternative; boundary="0000000000007181de0582f8c136"

--0000000000007181de0582f8c136
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 28, 2019 at 1:29 PM F <finalcountdown@post.com> wrote:
>
> Learnt how to get WG working here
> https://github.com/StreisandEffect/streisand/issues/1434 and it
> describes how the openresolv package is needed to get WG to connect
> properly. This is not noted in the official WG docs and the average
> person would have difficulty figuring out why wg-quick doesn't connect.

The openresolv package is not a dependency of WireGuard. WireGuard itself
does not deal with DNS - the wg-quick tool simply sets up DNS servers for
wg interfaces for convenience. For example, I use Ubuntu 18.04 on my
laptop, and that distro uses systemd-resolvd. Therefore, I add the line
'PostUp = systemd-resolve -i %i --set-dns=193.138.218.74 --set-domain=~' to
my config file instead of the 'DNS = [DNS server here]' line.

Hayden

--0000000000007181de0582f8c136
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>On Thu, Feb 28, 2019 at 1:29 PM F &l=
t;<a href=3D"mailto:finalcountdown@post.com">finalcountdown@post.com</a>&gt=
; wrote:<br>&gt;<br>&gt; Learnt how to get WG working here<br>&gt; <a href=
=3D"https://github.com/StreisandEffect/streisand/issues/1434">https://githu=
b.com/StreisandEffect/streisand/issues/1434</a> and it<br>&gt; describes ho=
w the openresolv package is needed to get WG to connect<br>&gt; properly. T=
his is not noted in the official WG docs and the average<br>&gt; person wou=
ld have difficulty figuring out why wg-quick doesn&#39;t connect.</div><div=
><br></div><div>The openresolv package is not a dependency of WireGuard. Wi=
reGuard itself does not deal with DNS - the wg-quick tool simply sets up DN=
S servers for wg interfaces for convenience. For example, I use Ubuntu 18.0=
4 on my laptop, and that distro uses systemd-resolvd. Therefore, I add the =
line &#39;PostUp =3D systemd-resolve -i %i --set-dns=3D193.138.218.74 --set=
-domain=3D~&#39; to my config file instead of the &#39;DNS =3D [DNS server =
here]&#39; line.<br></div><div><br></div><div>Hayden<br></div><div><div><di=
v><div><div><div><div><br><br></div></div></div></div></div></div></div></d=
iv></div>

--0000000000007181de0582f8c136--

--===============2610748720484727970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2610748720484727970==--
