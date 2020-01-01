Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0649BC32767
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:40:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99BC221734
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:40:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaWl5q13"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99BC221734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02535271;
	Fri, 3 Jan 2020 15:39:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fe1b3f9
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jan 2020 03:38:39 +0000 (UTC)
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ab7cada
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jan 2020 03:38:39 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id p191so9277817vkf.8
 for <wireguard@lists.zx2c4.com>; Tue, 31 Dec 2019 19:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eQYfYpl+7VFIz5r1KschXgsfywL2clSIdg+emOGxKgY=;
 b=HaWl5q13P1oupx6fxi37nFqocCL/pAwZiqSMsCzobpkdnMQUYuSFcwBB3GLsLJUnmT
 VLkh7OYJHDuXPfC+Pb2S6pNdozqfT2BHB0SsnhHen8+z2AeCYaKZuX5ljgoLkMegALY4
 0ikN8//yJtkdf23FyaLy9pi/hhnC88v1bifTjtScmmzc38zn3UgU/YWGqSnv+xJSi0Xi
 r6uSGFo2eB51Ko7IFb7fW2HGPhkWUizjVSCDUa4LjT+hWeR3kkXpRGHDtaiKcLruy8y1
 DCDzf76AoVFXh/b2ZIjo0C8klnM4jUME9kT6RGK+jEEx425BAI8JkK0aN5MiYHNm295M
 inLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eQYfYpl+7VFIz5r1KschXgsfywL2clSIdg+emOGxKgY=;
 b=bRsYiStmZepeJCQQaqvVyNk9RTPc1OZHppIvY/pJZUsK9s85m0LtMpxQotxlH5n6TR
 p9QjGa95I/LAE8kffZ9kexLrH2VLEuIanxf502WHwWfQYtmiK3ABMJs8A+Ktcgh8cjZO
 c+Z5UXusjzYtIIsCHtZqiS9YldOgNy71uL4TgrE21rsBz/+Dy+bXh4wOQKxH0qgBkT4/
 NnditT17yybgfFYKRGY+xHxzMEDlU9L5uMMlrCxXBe7whINYVWCP7L3VViV4aRAGY2qj
 lBcTp1lucCtVEkMHwVdVKxdvt/eTL/33Wphg7cw4kPnSTLpobJl0lxl+eXYzd4PBapLr
 kG5g==
X-Gm-Message-State: APjAAAXb0YtdJbsLHHwkNFwOHnmCHy8bsndg2osBE5/eXXhf4GkFGwBl
 b5Il326w/G5pjBie65M9SJWMWesqgo2AWDhiFE6jNwlrSzo=
X-Google-Smtp-Source: APXvYqwwAyPKYAUE/PbZ2mRubS1FsweeoqRl2uHchdmXFLYxV8pJuwtcE80wcL0xImL+cawyO0cPSTrg0SKuGzfbIeg=
X-Received: by 2002:a1f:9ec8:: with SMTP id h191mr43096868vke.48.1577849917295; 
 Tue, 31 Dec 2019 19:38:37 -0800 (PST)
MIME-Version: 1.0
From: Edward Vielmetti <edward.vielmetti@gmail.com>
Date: Tue, 31 Dec 2019 22:38:00 -0500
Message-ID: <CAPRZce0Ruqyrei0OykZ-d-gK97TGTq4wMPy2OrrVeUEbvm=sjA@mail.gmail.com>
Subject: Installing Wireguard on Windows 10 on Arm; "wintun" device
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 03 Jan 2020 16:39:10 +0100
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
Content-Type: multipart/mixed; boundary="===============3290625512754863587=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3290625512754863587==
Content-Type: multipart/alternative; boundary="000000000000d4533b059b0bcf7f"

--000000000000d4533b059b0bcf7f
Content-Type: text/plain; charset="UTF-8"

I have a Windows 10 on Arm laptop (Lenovo Yoga C630) that I'm
looking to install Wireguard on.

Generally speaking, Windows 10 on Arm runs either arm64 or win32
binaries, but not win64, so I installed the 32-bit x86 version of Wireguard
and the software came up fine.

I created a config to point at my existing Wireguard server, but was stymied
by the need to install a "Wintun" device. Apparently this doesn't work,
with the error message as follows

2019-12-31 22:30:55.300: [TUN] [wg0] Unable to create Wintun interface:
Error creating interface: No driver for device "Wintun" installed

I do see this commit

https://git.zx2c4.com/wintun/commit/?id=f48b0b2883e849a2c91ccbfa72fa0691461c7cda


which makes me think there's some arm64 work going on somewhere, and it's
possible
that I botched the install at some point, so I'd welcome any guidance or
expectations.

thanks

Ed
-- 
Edward Vielmetti +1 734 330 2465
edward.vielmetti@gmail.com

--000000000000d4533b059b0bcf7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a Windows 10 on Arm laptop (Lenovo Yoga C630) that =
I&#39;m=C2=A0<div>looking to install Wireguard on.</div><div><br></div><div=
>Generally speaking, Windows 10 on Arm runs either arm64 or win32</div><div=
>binaries, but not win64, so I installed the 32-bit x86 version of Wireguar=
d</div><div>and the software came up fine.</div><div><br></div><div>I creat=
ed a config to point at my existing Wireguard server, but was stymied</div>=
<div>by the need to install a &quot;Wintun&quot; device. Apparently this do=
esn&#39;t work,</div><div>with the error message as follows</div><div><br><=
/div><div>2019-12-31 22:30:55.300: [TUN] [wg0] Unable to create Wintun inte=
rface: Error creating interface: No driver for device &quot;Wintun&quot; in=
stalled<br><div><br></div><div>I do see this commit</div><div><br></div><di=
v><a href=3D"https://git.zx2c4.com/wintun/commit/?id=3Df48b0b2883e849a2c91c=
cbfa72fa0691461c7cda">https://git.zx2c4.com/wintun/commit/?id=3Df48b0b2883e=
849a2c91ccbfa72fa0691461c7cda</a>=C2=A0</div><div><br></div><div>which make=
s me think there&#39;s some arm64 work going on somewhere, and it&#39;s pos=
sible</div><div>that I botched the install at some point, so I&#39;d welcom=
e any guidance or expectations.</div><div><br></div><div>thanks</div><div><=
br></div><div>Ed=C2=A0</div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature">Edward Vielmetti=C2=A0+1 734 330 2465=
<div><a href=3D"mailto:edward.vielmetti@gmail.com" target=3D"_blank">edward=
.vielmetti@gmail.com</a></div><div><br></div></div></div></div>

--000000000000d4533b059b0bcf7f--

--===============3290625512754863587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3290625512754863587==--
