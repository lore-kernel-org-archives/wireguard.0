Return-Path: <SRS0=jywV=SH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,WEIRD_PORT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A96C10F13
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E24BC2184B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmRtosdY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E24BC2184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41d85e6f;
	Fri, 5 Apr 2019 15:21:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f6e6d74
 for <wireguard@lists.zx2c4.com>;
 Sat, 30 Mar 2019 00:44:06 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1af3792c
 for <wireguard@lists.zx2c4.com>;
 Sat, 30 Mar 2019 00:44:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id w15so4725740wmc.3
 for <wireguard@lists.zx2c4.com>; Fri, 29 Mar 2019 17:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YXWrMDNG9bGmixRmTfUOzR48hpDVivopRmMugQjvsOU=;
 b=RmRtosdY8DJF2pzVbQxGmTMSgA7vIlL3vRKTi2FSUGoNBizoT9ZDJhrXzriwZQXt+N
 EM6z9mkz10bVAKrpZ9rXu7/LfnZd5Q8brqQwpyy20ZIGOTIga/kwofcaYQsW1HVPA0gh
 59Klk6eZyr+fnm32jz3C+J6+KrvqGOBmRRRo3ffZp9TvJBxOboWUo9RiewkRMDFeWTDP
 NZPGa7mgkW7v2Nguq8wAG0E1rpNs48otT/hvdX5864YRpeWNXrx9K+RYuokXlW1XlAkV
 hg4YSpu20StCe/gf5QP7MHicLTf1TTZOVa5q4Qs7KRyIMzzfpizWt7QYXqU/EGtGSbwV
 xG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YXWrMDNG9bGmixRmTfUOzR48hpDVivopRmMugQjvsOU=;
 b=GXpPRCIqz44Uxu6tuo3EEtbKT00aiGbfWSgp8Rm+MoAa0Kl43bnitWwPY9x9xpmqqq
 4atBPcH9gNYvL6TV7z+ZsgcwS7jNmw9PMZicv/pxdsV+n8BQWo1J5I/43nHri+m82X6E
 I1NDsxQdE66a3oyW8kNcVQdFRDxtkIovNbFan4isdvcAEwLQBH4G9a/TWAPkBOs/7IDC
 uGplbhWDgX5wYqdaVTMEmgp+X6NuZ3ismeizQn+YMoImJZJy7o+4DiiNCBSIUVJsiRSR
 R0SqF68tkjFVHHUbbuI9Qg4k/iW4Y/J8WWW6VYZ2qspaoc6Mu3H4jOGQRJdCsxrdbtu1
 Um+g==
X-Gm-Message-State: APjAAAVaMPvU1BI8nyRsLD+g5QH9BQPtfrvGCGrAUsAHg7ESosvZjkyY
 BDMkfTkgJivtBz1+uZbugugBgbTdUR2LjYQRZgZdqd8lqTg=
X-Google-Smtp-Source: APXvYqzRRYqvTPEOJSovD9E03K8bSRRnwc5uK2xn9Sig/VTzVsbBjrwovBHW3YkoVKD6YPQjZiIuDQu8Eer8zDYAZx0=
X-Received: by 2002:a7b:cf2c:: with SMTP id m12mr5115126wmg.21.1553906734709; 
 Fri, 29 Mar 2019 17:45:34 -0700 (PDT)
MIME-Version: 1.0
From: Indro Fedrigo <indro.fedrigo@gmail.com>
Date: Fri, 29 Mar 2019 17:45:23 -0700
Message-ID: <CAAJTE62-YTQ_3Kuii7T2z4-aOr5FrrOGF7WgxVnZaY6mu0XuPA@mail.gmail.com>
Subject: Server with multiple peers
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 05 Apr 2019 17:21:48 +0200
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
Content-Type: multipart/mixed; boundary="===============8328890093182486972=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8328890093182486972==
Content-Type: multipart/alternative; boundary="000000000000efc1990585451aa7"

--000000000000efc1990585451aa7
Content-Type: text/plain; charset="UTF-8"

Hi Jason,
I'm trying to create a server with multiple peers form a wgx.conf file :
[Interface]
PrivateKey = QKet8noQBbM14ipbUOzw28yoFikAze4uM55xY+uFVWg=
ListenPort = 10300

[Peer]
PublicKey = 9YI43pxPeCvs3twJdBs5cQyH6N7qkQuTv4LcMslxYT0=
Endpoint = 10.0.10.100:10200
AllowedIPs = 192.168.0.0/16
PersistentKeepalive = 25

[Peer]
PublicKey = sQfagzCndbDxclqBJpla1Yk9p23tJKI/UWmjn8xfhz0=AllowedIPs
Endpoint = 10.0.10.101:10200
AllowedIPs = 192.168.0.0/16
PersistentKeepalive = 25

[Peer]
PublicKey = r5CcRqfp+HQrHNAGr26S8VZpT1FBlJIR7k47J2lV/XY=
Endpoint = 10.0.10.102:10200
AllowedIPs = 192.168.0.0/16
PersistentKeepalive = 25

[Peer]
PublicKey = uLUB9pcIx7cfr2Xc5O9WeVuDfIKAgm0SHRGpmSftqRQ=
Endpoint = 10.0.10.103:10200
AllowedIPs = 192.168.0.0/16
PersistentKeepalive = 25

but doing :
# wg setconf wgx /etc/wireguard/wgx.conf
ip link set up dev wgx
and
# wg
this is what I get

interface: wgx
  public key: Gd+9z9ubyeuQHl1ijoBLaz1IKRZ67qriWeQnDkIBWFU=
  private key: (hidden)
  listening port: 10300

peer: 9YI43pxPeCvs3twJdBs5cQyH6N7qkQuTv4LcMslxYT0=
  endpoint: 10.0.10.100:10200
  allowed ips: (none)
  latest handshake: 49 seconds ago
  transfer: 308 B received, 924 B sent
  persistent keepalive: every 25 seconds

peer: sQfagzCndbDxclqBJpla1Yk9p23tJKI/UWmjn8xfhz0=
  endpoint: 10.0.10.101:10200
  allowed ips: (none)
  transfer: 0 B received, 7.80 KiB sent
  persistent keepalive: every 25 seconds

peer: r5CcRqfp+HQrHNAGr26S8VZpT1FBlJIR7k47J2lV/XY=
  endpoint: 10.0.10.102:10200
  allowed ips: (none)
  transfer: 0 B received, 7.80 KiB sent
  persistent keepalive: every 25 seconds

peer: uLUB9pcIx7cfr2Xc5O9WeVuDfIKAgm0SHRGpmSftqRQ=
  endpoint: 10.0.10.103:10200
  allowed ips: 192.168.0.0/16
  transfer: 0 B received, 7.80 KiB sent
  persistent keepalive: every 25 seconds


the parameter AllowedIPs seems to get set only for the last peer...
Any idea ?

Thanks for this great piece of software!

Indro Fedrigo

--000000000000efc1990585451aa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
 Jason,</div><div>I&#39;m trying to create a server with multiple peers for=
m a wgx.conf file :</div><div>[Interface]<br>PrivateKey =3D QKet8noQBbM14ip=
bUOzw28yoFikAze4uM55xY+uFVWg=3D<br>ListenPort =3D 10300<br><br>[Peer]<br>Pu=
blicKey =3D 9YI43pxPeCvs3twJdBs5cQyH6N7qkQuTv4LcMslxYT0=3D<br>Endpoint =3D =
<a href=3D"http://10.0.10.100:10200">10.0.10.100:10200</a><br>AllowedIPs =
=3D <a href=3D"http://192.168.0.0/16">192.168.0.0/16</a><br>PersistentKeepa=
live =3D 25<br><br>[Peer]<br>PublicKey =3D sQfagzCndbDxclqBJpla1Yk9p23tJKI/=
UWmjn8xfhz0=3DAllowedIPs<br>Endpoint =3D <a href=3D"http://10.0.10.101:1020=
0">10.0.10.101:10200</a><br>AllowedIPs =3D <a href=3D"http://192.168.0.0/16=
">192.168.0.0/16</a><br>PersistentKeepalive =3D 25<br><br>[Peer]<br>PublicK=
ey =3D r5CcRqfp+HQrHNAGr26S8VZpT1FBlJIR7k47J2lV/XY=3D<br>Endpoint =3D <a hr=
ef=3D"http://10.0.10.102:10200">10.0.10.102:10200</a><br>AllowedIPs =3D <a =
href=3D"http://192.168.0.0/16">192.168.0.0/16</a><br>PersistentKeepalive =
=3D 25<br><br>[Peer]<br>PublicKey =3D uLUB9pcIx7cfr2Xc5O9WeVuDfIKAgm0SHRGpm=
SftqRQ=3D<br>Endpoint =3D <a href=3D"http://10.0.10.103:10200">10.0.10.103:=
10200</a><br>AllowedIPs =3D <a href=3D"http://192.168.0.0/16">192.168.0.0/1=
6</a><br>PersistentKeepalive =3D 25</div><div><br></div><div>but doing :</d=
iv><div># wg setconf wgx /etc/wireguard/wgx.conf<br>ip link set up dev wgx<=
br></div><div>and</div><div># wg<br></div><div>this is what I get</div><div=
><br></div><div>interface: wgx<br>=C2=A0 public key: Gd+9z9ubyeuQHl1ijoBLaz=
1IKRZ67qriWeQnDkIBWFU=3D<br>=C2=A0 private key: (hidden)<br>=C2=A0 listenin=
g port: 10300<br><br>peer: 9YI43pxPeCvs3twJdBs5cQyH6N7qkQuTv4LcMslxYT0=3D<b=
r>=C2=A0 endpoint: <a href=3D"http://10.0.10.100:10200">10.0.10.100:10200</=
a><br>=C2=A0 allowed ips: (none)<br>=C2=A0 latest handshake: 49 seconds ago=
<br>=C2=A0 transfer: 308 B received, 924 B sent<br>=C2=A0 persistent keepal=
ive: every 25 seconds<br><br>peer: sQfagzCndbDxclqBJpla1Yk9p23tJKI/UWmjn8xf=
hz0=3D<br>=C2=A0 endpoint: <a href=3D"http://10.0.10.101:10200">10.0.10.101=
:10200</a><br>=C2=A0 allowed ips: (none)<br>=C2=A0 transfer: 0 B received, =
7.80 KiB sent<br>=C2=A0 persistent keepalive: every 25 seconds<br><br>peer:=
 r5CcRqfp+HQrHNAGr26S8VZpT1FBlJIR7k47J2lV/XY=3D<br>=C2=A0 endpoint: <a href=
=3D"http://10.0.10.102:10200">10.0.10.102:10200</a><br>=C2=A0 allowed ips: =
(none)<br>=C2=A0 transfer: 0 B received, 7.80 KiB sent<br>=C2=A0 persistent=
 keepalive: every 25 seconds<br><br>peer: uLUB9pcIx7cfr2Xc5O9WeVuDfIKAgm0SH=
RGpmSftqRQ=3D<br>=C2=A0 endpoint: <a href=3D"http://10.0.10.103:10200">10.0=
.10.103:10200</a><br>=C2=A0 allowed ips: <a href=3D"http://192.168.0.0/16">=
192.168.0.0/16</a><br>=C2=A0 transfer: 0 B received, 7.80 KiB sent<br>=C2=
=A0 persistent keepalive: every 25 seconds<br></div><div><br></div><div><br=
></div><div>the parameter AllowedIPs seems to get set only for the last pee=
r...</div><div>Any idea ?</div><div><br></div><div>Thanks for this great pi=
ece of software!</div><div><br></div><div>Indro Fedrigo</div><div><br></div=
></div></div></div></div>

--000000000000efc1990585451aa7--

--===============8328890093182486972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8328890093182486972==--
