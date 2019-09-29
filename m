Return-Path: <SRS0=JYHX=XY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9EEC4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Sep 2019 10:18:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 671A62086A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Sep 2019 10:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaAbOorE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 671A62086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 029ea5c7;
	Sun, 29 Sep 2019 10:18:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6e475db
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Sep 2019 10:18:06 +0000 (UTC)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 187afa17
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Sep 2019 10:18:06 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id u184so5346596qkd.4
 for <wireguard@lists.zx2c4.com>; Sun, 29 Sep 2019 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9MMyLN36z+R73ga961h/kcijcBjtWYLbsXVUHm2ec6s=;
 b=gaAbOorEv3OMSjtydm2to8CT1wcAs8L9ndxvC4Ihxlg3vry6cgXiqCkl0qh4tS/b4s
 9Z28yKYSP33RP/e2bZteoyEYX8sn1QFHvfuLSWzBjMLpVG1KFvzGsHRGaXRTeD5lXxCj
 7DJN5cJb54xJqnMc/tRoZ/ESgi21iS6+j5oMCNQiQz3i4nikTGnyIWuZJJlDIBEnvmAO
 guUa75CsB1xNka1Pd3iAkpz96fF/uymZcYyY/Y/yAiuZI6oamn15f0eYZqYoCI0NTWR8
 F9XcKsK3wDU4y7Q1ZMCr93TbVEk4LzP/2K6kuuLkENRhHsyMWWwP8sGhLtGv0bo5pXmk
 gtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9MMyLN36z+R73ga961h/kcijcBjtWYLbsXVUHm2ec6s=;
 b=dPqfHBMbCfyjhcIGjF7byqkfrgI3LV94u8w9Z3nZBkw96l3GGW4eFNBdqqYBXKqm+f
 NLwnuNjUZ72+DMxEWITGIz0M8NhHQkch7GdY1pakfm5ng4fcrpza7PRIlQQSGgHcYrRV
 mQFUeMZ7G5PDZkc+54K4mqGsfq5cgqluan4ZfgI1Jn+3rrBzyC20wKjRXv52xVpsXlMY
 LgKTFHF+0/NqT6E5OCuKvc9HEON6tzY6MEp3feIsEb9XkkD1Sa3IcD0Kgrrbz1tl93Yw
 mEq4tcXc7QMm4vQXflZuyoxsPS0LqeZrOLjZ0qp+8PKyA44MzVaOWM/fi/cseqc4VsHo
 +bQA==
X-Gm-Message-State: APjAAAXAvOnr6ace4Kho+SYG4WceipKedNDShoe3lkpa/8PSXgdIloaV
 IPxDqih0wkiJx2XDkTE95Rf5wRuKUpmsvFsQt1WB3cgytcw=
X-Google-Smtp-Source: APXvYqxX0CcfivNRfeOkCpc62iIZDWfixRKPxuA4p3NLQ9dmepRNP3dRS/ajw61rbC37o40gvcgT7wAYBzIUQ2iG3Ek=
X-Received: by 2002:a37:dc04:: with SMTP id v4mr14136327qki.51.1569752285371; 
 Sun, 29 Sep 2019 03:18:05 -0700 (PDT)
MIME-Version: 1.0
From: Lev Stipakov <lstipakov@gmail.com>
Date: Sun, 29 Sep 2019 13:17:55 +0300
Message-ID: <CAGyAFMV6=0XB+FxTeTM27v9PmLsd3_+VCTVnAQcUCmdaYXkBRw@mail.gmail.com>
Subject: OpenVPN Windows client with Wintun
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============6324653015817445497=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6324653015817445497==
Content-Type: multipart/alternative; boundary="0000000000005ae23c0593ae6f88"

--0000000000005ae23c0593ae6f88
Content-Type: text/plain; charset="UTF-8"

Hello,

Here is _unofficial_ OpenVPN Windows client with wintun support:

https://staging.openvpn.net/openvpn2/openvpn-install-2.5_git-I607-Win10.exe

The installer includes wintun MSM version 0.6, wrapped into MSI according
to msi-example doc.

To use wintun driver instead of tap-window6, add "windows-driver wintun" to
your VPN profile.

Please be aware that openvpn wintun support has not been yet reviewed and
merged, so it may contain bugs.

Some performance numbers (with recent -O2 fix to windows build system):

Server - openvpn 2.4.4
    tap-windows6: 390Mbit/s
    wintun: 730Mbit/s

Server - openvpn3 with kernel acceleration
    tap-windows6: 405Mbit/s
    wintun: 1.05Gbit/s

-- 
-Lev

--0000000000005ae23c0593ae6f88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Here is _unofficial_ OpenVPN Win=
dows client with wintun support:=C2=A0</div><div><br></div><div><a href=3D"=
https://staging.openvpn.net/openvpn2/openvpn-install-2.5_git-I607-Win10.exe=
" target=3D"_blank">https://staging.openvpn.net/openvpn2/openvpn-install-2.=
5_git-I607-Win10.exe</a></div><div><br></div><div>The installer includes wi=
ntun MSM version 0.6, wrapped into MSI according to msi-example doc.=C2=A0<=
/div><div><br></div><div>To use wintun driver instead of tap-window6, add &=
quot;windows-driver wintun&quot; to your VPN profile.<br><div><br></div><di=
v>Please be aware that openvpn wintun support has not been yet reviewed and=
 merged, so it may contain bugs.</div><br>Some performance numbers (with re=
cent -O2 fix to windows build system):<br><br>Server - openvpn 2.4.4<br>=C2=
=A0 =C2=A0 tap-windows6: 390Mbit/s<br>=C2=A0 =C2=A0 wintun: 730Mbit/s<br><b=
r>Server - openvpn3 with kernel acceleration<div>=C2=A0 =C2=A0 tap-windows6=
: 405Mbit/s<br>=C2=A0 =C2=A0 wintun: 1.05Gbit/s=C2=A0=C2=A0</div></div><div=
><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">-Lev</div></div>

--0000000000005ae23c0593ae6f88--

--===============6324653015817445497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6324653015817445497==--
