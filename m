Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE7FC4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:14:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D02372148D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOduXfEh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D02372148D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f636adc0;
	Thu, 21 Feb 2019 07:05:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dbca67b
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 19:39:19 +0000 (UTC)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dad8fbf5
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 19:39:19 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id 2so24604556qtb.5
 for <wireguard@lists.zx2c4.com>; Tue, 19 Feb 2019 11:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=p/fML5D4pvqpMElgBxY6IaconFc4fUHK66sO+D53VZA=;
 b=BOduXfEhrr4nI6a51G+kDIIJ4vXhRRMmyiX3pNLx76n7QhjzuKQXVIuwU7DWPdlQB+
 DKuVUxIl6/qzOc8Qou5LtUI6eJmumGsDOmIAeVynZkwwjEmytDDKayiJyGVhJ0uk79oe
 TLMr6Z7AGJ9sqNgoo+VaAVUHGLvLlLTWb/8Cb6473pNhzDBpdsIYmRjsC4kcNhiLAznf
 2f7kdJOE72Q6PII9QqUnYFYF25KNUSYCokt1NFl09UXLpBcvlqKZ7w+T/3Ib8vBx8pbC
 /r8u6bXUCj8mXzkI3lKtMiYsk2hkL/jIW+eCvqeblqRThq7534uV0m+ws9W/aSW7RHHx
 z4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=p/fML5D4pvqpMElgBxY6IaconFc4fUHK66sO+D53VZA=;
 b=naucTd3Rx+9jjjfFvpc1W5SHegsG0wtVQXcOcjuEz0qwi4nF159kJY4pGHTy3G3rNZ
 QYL/tckSu13H6ljMKqwUUBerPa5SzzDwGcg2rKFarc9vOekYM9dGbx5XPemeNt8rVyuQ
 HoF9pUG+SqD+UklGP2ujTfZ4lTCvqcSeakQRfkyA85Yt/qEpvbdR8KlHRGWp3Hel7JuP
 oGpBLCMuHv2He3r15NSAaJ2W2hho0MHg40v6ALoAnADuzHpQEZalwF5ML3DrJZYPzHFQ
 w7hbQpuGOYv66m0j0rKspNizqtS/RwdhCz2+aA8yPLVETsdRCDkrQgJ52cKhBgnNBTWP
 R8zw==
X-Gm-Message-State: AHQUAuZ58RBPPRk9QcObKd5OJjlGNajtCnIHN0dn6NTvm4JTZAoOe5oS
 As9LKqqjJhHmjJocG/XyM/JypbyeEj5SFhIKAAOAIUl8aos=
X-Google-Smtp-Source: AHgI3IYTNZ47ysf70/fPXswexRRMUT6HWjEBxttarYQdfFLEv79GDDVhE6pWnWNFajh1Vlw0OkoZUBvfYj2eeZecFZ0=
X-Received: by 2002:ac8:5297:: with SMTP id s23mr3296552qtn.371.1550605673682; 
 Tue, 19 Feb 2019 11:47:53 -0800 (PST)
MIME-Version: 1.0
From: Arpit Gupta <g.arpit@gmail.com>
Date: Tue, 19 Feb 2019 11:47:43 -0800
Message-ID: <CAGCGyt+bsxa-aRoETJFTwvOZ1eb=Q_AemZUwufN_7RYicnnKaw@mail.gmail.com>
Subject: upgrading raspberry pi required me to re install wireguard
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 21 Feb 2019 08:05:11 +0100
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
Content-Type: multipart/mixed; boundary="===============1125505139554374307=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1125505139554374307==
Content-Type: multipart/alternative; boundary="0000000000005ddc1f058244847d"

--0000000000005ddc1f058244847d
Content-Type: text/plain; charset="UTF-8"

Hi All

I am running raspberry pi v3 and ran apt-get update and upgrade commands to
get upto date. It also ended up updating the kernel i think. I should have
paid more attention to what all was getting updated.

After the update wireguard was not running and upon debugging i found that
the wireguard kernel module was no longer present. So i uninstalled all
wireguard packages and installed them again and the module showed up and on
reboot system was back to normal. What i was curious was how should one go
about doing os/kernel updates in future in order to avoid this issue?

I am running
Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 2019 armv7l
GNU/Linux
No LSB modules are available.
Distributor ID: Raspbian
Description: Raspbian GNU/Linux 9.8 (stretch)
Release: 9.8
Codename: stretch

ii  wireguard                       0.0.20190123-1               all
  fast, modern, secure kernel VPN tunnel (metapackage)
ii  wireguard-dkms                  0.0.20190123-1               all
  fast, modern, secure kernel VPN tunnel (DKMS version)
ii  wireguard-tools                 0.0.20190123-1               armhf
  fast, modern, secure kernel VPN tunnel (userland utilities)

--
Arpit

--0000000000005ddc1f058244847d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi All<=
div><br></div><div>I am running raspberry pi v3 and ran apt-get update and =
upgrade commands to get upto date. It also ended up updating the kernel i t=
hink. I should have paid more attention to what all was getting updated.</d=
iv><div><br></div><div>After the update wireguard was not running and upon =
debugging i found that the wireguard kernel module was no longer present. S=
o i uninstalled all wireguard packages and installed them again and the mod=
ule showed up and on reboot system was back to normal. What i was curious w=
as how should one go about doing os/kernel updates in future in order to av=
oid this issue?</div><div><br></div><div>I am running</div><div>Linux raspb=
errypi 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux<=
/div><div><div>No LSB modules are available.</div><div>Distributor ID:<span=
 style=3D"white-space:pre">	</span>Raspbian</div><div>Description:<span sty=
le=3D"white-space:pre">	</span>Raspbian GNU/Linux 9.8 (stretch)</div><div>R=
elease:<span style=3D"white-space:pre">	</span>9.8</div><div>Codename:<span=
 style=3D"white-space:pre">	</span>stretch</div><div><br></div><div><div>ii=
=C2=A0 wireguard=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00.0.20190123-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0all=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fast, modern, sec=
ure kernel VPN tunnel (metapackage)</div><div>ii=C2=A0 wireguard-dkms=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.0.20190123-1=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 fast, modern, secure kernel VPN tunnel (DKMS version)</div><=
div>ii=C2=A0 wireguard-tools=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00.0.20190123-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0armhf=C2=A0 =C2=A0 =C2=A0 =C2=A0 fast, modern, secure kernel V=
PN tunnel (userland utilities)</div></div><div><br></div><div><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>--</div>Arpit</div></di=
v></div></div></div></div></div></div>

--0000000000005ddc1f058244847d--

--===============1125505139554374307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1125505139554374307==--
