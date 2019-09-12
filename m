Return-Path: <SRS0=gBlD=XH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,HTML_MESSAGE,
	MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	WEIRD_PORT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E76C4CEC7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Sep 2019 19:27:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197DD2084D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Sep 2019 19:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uE4OrwOR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 197DD2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e76e7055;
	Thu, 12 Sep 2019 19:27:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 291571c1
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Sep 2019 19:27:48 +0000 (UTC)
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fb27472
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Sep 2019 19:27:48 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id d126so3327862vkb.1
 for <wireguard@lists.zx2c4.com>; Thu, 12 Sep 2019 12:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=iRLbmdxQWvdO6OCdfWS2Pms7ZnmpE/LhCqmxx3vNBoM=;
 b=uE4OrwORwCMzYreJmoxk7xVR9xqYBEbQTE+yPDjDcHYZDp28JND1HYT7GkHsYVBG9B
 Mfq2AqQvd4R0E92Y6BnO8rPmkfUyuViodGHOVklT4YoM29sOzQ5ErJeoE13+ODsgnUVO
 aQ8cUtFFWZPrkBFpaXo8hIhImzJ6nRw5jN0nQ+GrJdEkxvcZEQKL4M6vDf3+ccXh4sv+
 m/ckcnUKSQNbZaWAxjfZ+CA7xk++1FdfC+4k+7MnSxsOrErlfsqOpIhViBJ7DfjxgEqQ
 WdaVwXY+jo/aSMpVsnqDWtJ74Tv5r/1C+BboMJQ21LHcu1IeauaaFQ84KSJ6WLrMLv3j
 bWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iRLbmdxQWvdO6OCdfWS2Pms7ZnmpE/LhCqmxx3vNBoM=;
 b=ZyfPhE0moGfcBBqpJAP/rTOItsiPueQ1TfNeNfSuerDH17lTZoy8E20i2ovQw49Ppq
 s3EbBVQuC20b7D3L7GlzQQElOu0RXVwIgkS3C9BSJwfFuzVx1fQjWInOV85VLJU3ikHh
 n2jwiP2kmi5Rsue0klultMHESVq2DGHqtc5sXH3lZRbG1ozv+MqZjR933IhSRngWHrqR
 uELRuJRN4tK9Kicf+PB71mwaV3W9qGsIOLnD2iawnosu5f+oiBM1u7VOuBOJ7SpEbyKs
 Qt3e3aga5+JMWOBwk78AOGPqkL/7s2ml7L3VFf6HfDssgyINp7U/B+Lmo08uhFhi5Cnz
 0Z5A==
X-Gm-Message-State: APjAAAX3naqXRPpmG79pyDVaEchjfKVeU9K/9/0Aj8sshrvzAfJz9QZ2
 hTiQcmmdvEptAb9Xgm3SI6fpw9MUxgzb80yBpE1wY2vRq+czGw==
X-Google-Smtp-Source: APXvYqwt6tKq7xXmwKstescA2i9bABBmEQevfKCImUs1AlBCsgt4vxSt4R3zj5j6kUV6cy+bBpnatYEq8luTdthCDHM=
X-Received: by 2002:ac5:c934:: with SMTP id u20mr20728962vkl.27.1568316466596; 
 Thu, 12 Sep 2019 12:27:46 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
Date: Thu, 12 Sep 2019 21:27:35 +0200
Message-ID: <CA+Hw3ebSHKAa_WaOsXYezP_n3o2rQfbLvaRoGYH8SpF92=7fBg@mail.gmail.com>
Subject: Routing between multiple wg interfaces
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============5622281500179577837=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5622281500179577837==
Content-Type: multipart/alternative; boundary="000000000000e3108105926021a8"

--000000000000e3108105926021a8
Content-Type: text/plain; charset="UTF-8"

I am trying to route between multiple WG interfaces.

On my primary server:

wg0.conf:

[Interface]
Address = 192.168.6.4/24
ListenPort = 51820
PrivateKey =
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j
ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i
-j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey =
AllowedIPs = 192.168.6.1/32, 192.168.1.0/24
Endpoint = xy.com:51820

wg1.conf:

[Interface]
Address = 192.168.9.1/24
ListenPort = 51821
PrivateKey =

PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j
ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i
-j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey =
AllowedIPs = 192.168.9.3/32

---

With wg0 I am connecting to an other server (xy.com:51820). On wg1 I am
accepting client connections.

On this server I can ping everything, so connection is working well.

ping 192.168.6.1 - works
ping 192.168.1.xxx - works

ping 192.168.9.3 - works

---

Now I am connecting my client to this server (client 192.168.9.3):

[Interface]
PrivateKey =
Address = 192.168.9.3/24
DNS = 192.168.9.1

[Peer]
PublicKey =
AllowedIPs = 192.168.9.1/32, 192.168.1.0/24
Endpoint = primaryserver:51821


I can ping server 192.168.9.1 as expected, but I am unable to ping any of
my devices in 192.168.1.0/24.

Anyone knows what's the problem here?

--000000000000e3108105926021a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I am trying to route between multipl=
e WG interfaces.=C2=A0<br></div><div><br></div><div>On my primary server:</=
div><div><br></div><div>wg0.conf:</div><div><br></div><div>[Interface]</div=
><div>Address =3D <a href=3D"http://192.168.6.4/24">192.168.6.4/24</a></div=
><div>ListenPort =3D 51820</div><div>PrivateKey =3D=C2=A0</div><div>PostUp =
=3D iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEP=
T; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE</div><div>PostDown =
=3D iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEP=
T; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE</div><div><br></div=
><div>[Peer]</div><div>PublicKey =3D=C2=A0</div><div>AllowedIPs =3D <a href=
=3D"http://192.168.6.1/32">192.168.6.1/32</a>, <a href=3D"http://192.168.1.=
0/24">192.168.1.0/24</a></div><div>Endpoint =3D <a href=3D"http://xy.com:51=
820">xy.com:51820</a></div><div><br></div><div>wg1.conf:</div><div><br></di=
v><div>[Interface]</div><div>Address =3D <a href=3D"http://192.168.9.1/24">=
192.168.9.1/24</a></div><div>ListenPort =3D 51821</div><div>PrivateKey =3D=
=C2=A0</div><div><br></div><div>PostUp =3D iptables -A FORWARD -i %i -j ACC=
EPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o=
 eth0 -j MASQUERADE</div><div>PostDown =3D iptables -D FORWARD -i %i -j ACC=
EPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o=
 eth0 -j MASQUERADE</div><div><br></div><div>[Peer]</div><div>PublicKey =3D=
=C2=A0</div><div>AllowedIPs =3D <a href=3D"http://192.168.9.3/32">192.168.9=
.3/32</a></div><div><br></div><div>---</div><div><br></div><div>With wg0 I =
am connecting to an other server (<a href=3D"http://xy.com:51820">xy.com:51=
820</a>). On wg1 I am accepting client connections.</div><div><br></div><di=
v>On this server I can ping everything, so connection is working well.=C2=
=A0</div><div><br></div><div>ping 192.168.6.1 - works</div><div>ping 192.16=
8.1.xxx - works</div><div><br></div><div>ping 192.168.9.3 - works</div><div=
><br></div><div>---</div><div><br></div><div>Now I am connecting my client =
to this server (client 192.168.9.3):</div><div><br></div><div>[Interface]</=
div><div>PrivateKey =3D=C2=A0</div><div>Address =3D <a href=3D"http://192.1=
68.9.3/24">192.168.9.3/24</a></div><div>DNS =3D 192.168.9.1</div><div><br><=
/div><div>[Peer]</div><div>PublicKey =3D=C2=A0</div><div>AllowedIPs =3D <a =
href=3D"http://192.168.9.1/32">192.168.9.1/32</a>, <a href=3D"http://192.16=
8.1.0/24">192.168.1.0/24</a></div><div>Endpoint =3D primaryserver:51821</di=
v><div><br></div><div><br></div><div>I can ping server 192.168.9.1 as expec=
ted, but I am unable to ping any of my devices in <a href=3D"http://192.168=
.1.0/24">192.168.1.0/24</a>.=C2=A0</div><div><br></div><div>Anyone knows wh=
at&#39;s the problem here?</div></div></div>

--000000000000e3108105926021a8--

--===============5622281500179577837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5622281500179577837==--
