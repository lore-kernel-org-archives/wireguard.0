Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC2AC00307
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94BD62081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4ZrJ6Fp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94BD62081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76d0ebe2;
	Fri, 6 Sep 2019 19:06:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8ecfb92
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Aug 2019 11:35:06 +0000 (UTC)
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a94ae30
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Aug 2019 11:35:06 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id j25so4507666vsq.12
 for <wireguard@lists.zx2c4.com>; Fri, 30 Aug 2019 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=12Y4ABvOSaOQWPCA7P2OBxyS0tMZiWocWXHTTGrcyfE=;
 b=d4ZrJ6FpEZp3tEmn5tSHGtfKAcNyZ4p6YCjrojCv4jh/7zv2sUJICVkfQP18VKnZ7Q
 ePvud+Cdcgd4NNYDA5ARKiuzSVEyOzW5oDdgh/tR4WK67POUJ9k/E9fhME/YPDb0zkuf
 WC3etkke/e+BxtfouoqHKeDXUTEgMUdpFG0x64TTr0FFGhwNUsCRcapLviseyly9mEZ+
 jBYC1+KsAeuUlTZR5HA4PSdXKixYx/W7GixXtrPM16Mm6uYTkLnS28jJl2O8cXh+I2wi
 belZ34yajA6dwumYXeD5WMcJTzuwUCsl8XCkxcs4yn/691SmfDA6ORbLlpOygltbujtA
 dbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=12Y4ABvOSaOQWPCA7P2OBxyS0tMZiWocWXHTTGrcyfE=;
 b=sh5NiU/uCnjl+oacI+FaLi8ugsNHTCFNEAbeP/b/LMdAEb/WttZFLnDFCk2hB15m0Z
 vkdyIFoJKxJIwRc780Kz/CWAv0fqs2p7HA8wSMf+czPDxo5SCzgKRuyGaUwsHqY9IhzA
 3Rw90ek0ZbgbJ+9yCU4uhPL5JlEXr2qmkMG5fDfBq0kzf0DiWC3TW4AFA+IJfP3RKe9A
 xM28rGOqVZ9QPRcfvZQ96QBPAX8oCLURoLzKwIgzPy+WV8CSdbMcRnxsefswflz1dP17
 xgB28Lm9s4uEF63VwO6wUrFhrzJsUQ6yxD9MZIxhmBuANtsZ7lftTtKjzHRgJG6hUT80
 qR2Q==
X-Gm-Message-State: APjAAAWcPKMaiaX0eydtwVXkcs/wzcrw+XR1wKMbB9IC38Z+3itvvZda
 c6wrODZILuon/DJb2t+WinNM/4w5ofmSRbQyX81SE+aMFJE=
X-Google-Smtp-Source: APXvYqycCiVxwjqX9wTMvWu3TY0s/4Zn1qATt+NF6MW6QVorwLvxKkcVVHkcfzWJis4gkVymn2YdYzqJssP5JOKW/WY=
X-Received: by 2002:a67:10c6:: with SMTP id 189mr8295155vsq.194.1567164906144; 
 Fri, 30 Aug 2019 04:35:06 -0700 (PDT)
MIME-Version: 1.0
From: Dmitry Kovalenko <waaayfar3r@gmail.com>
Date: Fri, 30 Aug 2019 14:34:55 +0300
Message-ID: <CALYxMCvCKwbuCuq1pAiAnW0t_FCSEvPj7q6n609HmVUjT_59Tg@mail.gmail.com>
Subject: Issue with Apple clients when routing all traffic through Wireguard
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:06:10 +0200
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
Content-Type: multipart/mixed; boundary="===============8544296761238061351=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8544296761238061351==
Content-Type: multipart/alternative; boundary="0000000000008908130591540317"

--0000000000008908130591540317
Content-Type: text/plain; charset="UTF-8"

Hi

I have been using wireguard for a while now and discovered an issue with
routes created by macOS and iOS GUI clients. The issue is that wireguard
does not create a route to the endpoint via a default route. So when you
specify AllowedIPs = 0.0.0.0/0 (excluding private IPs does not change
anything) on a client, everything just stops working because 0.0.0.0/0 is
now reachable only through wireguard tunnel, which is obviously not
reachable as there is no route to it through normal internet connection.

Pretty much, the routes look like this:
*default via 10.80.0.1 dev wg0* - default route through wg
*default via 10.0.0.1 dev eth0* - old default route through ethernet
*10.0.0.0/24 <http://10.0.0.0/24> dev eth0*

When they have to look like this:
*default via 10.80.0.1 dev wg0 *- default route through wg
*default via 10.0.0.1 dev eth0* - old default route through ethernet
*1.2.3.4/32 <http://1.2.3.4/32> via 10.0.0.1 dev eth0* - specific route to
wireguard endpoint (1.2.3.4 here) through ethernet *which is missing*

*10.0.0.0/24 <http://10.0.0.0/24> dev eth0*

Right now the only workaround is manually calculating AllowedIPs CIDRs
excluding the endpoint address. I assume this is not by design and should
be fixed by either creating a route to wg endpoint through default gateway
or excluding endpoint IP from AllowedIPs without having to do it manually
in the config.

--0000000000008908130591540317
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>I have been using wireguard for a wh=
ile now and discovered an issue with routes created by macOS and iOS GUI cl=
ients. The issue is that wireguard does not create a route to the endpoint =
via a default route. So when you specify AllowedIPs =3D <a href=3D"http://0=
.0.0.0/0">0.0.0.0/0</a> (excluding private IPs does not change anything) on=
 a client, everything just stops working because <a href=3D"http://0.0.0.0/=
0">0.0.0.0/0</a> is now reachable only through wireguard tunnel, which is o=
bviously not reachable as there is no route to it through normal internet c=
onnection.</div><div><br></div><div>Pretty much, the routes look like this:=
</div><div><b>default via 10.80.0.1 dev wg0</b> - default route through wg<=
/div><div><b>default via 10.0.0.1 dev eth0</b> - old default route through =
ethernet</div><div><b><a href=3D"http://10.0.0.0/24">10.0.0.0/24</a> dev et=
h0</b></div><div><br></div><div>When they have to look like this:</div><div=
><b>default via 10.80.0.1 dev wg0 </b>- default route through wg</div><div>=
<b>default via 10.0.0.1 dev eth0</b>=C2=A0- old default route through ether=
net</div><div><b><u><a href=3D"http://1.2.3.4/32">1.2.3.4/32</a> via 10.0.0=
.1 dev eth0</u></b>=C2=A0- specific route to wireguard endpoint (1.2.3.4 he=
re) through ethernet <b>which is missing</b></div><div><b><a href=3D"http:/=
/10.0.0.0/24">10.0.0.0/24</a> dev eth0<br></b></div><div><b><br></b></div><=
div>Right now the only workaround is manually calculating AllowedIPs CIDRs =
excluding the endpoint address. I assume this is not by design and should b=
e fixed by either creating a route to wg endpoint through default gateway o=
r excluding endpoint IP from AllowedIPs without having to do it manually in=
 the config.</div></div>

--0000000000008908130591540317--

--===============8544296761238061351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8544296761238061351==--
