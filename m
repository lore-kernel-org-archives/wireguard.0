Return-Path: <SRS0=wyc1=2U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F8BC2D0CE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 09:51:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 305092071E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 09:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t4bQMvJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 305092071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39f30201;
	Mon, 30 Dec 2019 09:51:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83ee03a8
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Dec 2019 21:03:32 +0000 (UTC)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90cf3e19
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Dec 2019 21:03:32 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id e6so27121835qtq.7
 for <wireguard@lists.zx2c4.com>; Sat, 28 Dec 2019 13:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vkyGtLr39/m+audvP062j5ptoONEF4k3WuyHryzga04=;
 b=t4bQMvJGmU2qvZX7jVgpOH2Q0oimx/Fh2AdDCfCp69H+5ip7pGfyC1ZkBj5Pq1PE8s
 Gb5PXbz9ikFdbYafSrudN53hkmZjjvnQQ9LapDpwSX6wcrLiomG+pTBZdA2L2iJEVRv2
 soQNcC1oEAx4b66ggskA26X6umzmQe5/6Q/8JYhKEKUocDjdgl4OThAz1AiqlPNpcx0K
 ytuJDfjHlS23sl0pF14jMcQtIJR/2fpH63cpS9Cb+uhacdnVnLhp7ehrWhMO94kBcnYv
 nzPZETG169o8+6Fc56Antat5TodAeGnH/X9w8pHvYSa+rKf+JSFoCBpHXcSLo9ufk4KP
 zqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vkyGtLr39/m+audvP062j5ptoONEF4k3WuyHryzga04=;
 b=TfYlNU+90KKCc+OZ1r9ZqpOKRYrwVxCByfuCTU8uwaDG9SgTQDD0tD02PYH5NYWsn6
 X2m7XjK/OIRSeISygp3AYRGezu8JsfM6Otup86A1eo/9DnICK4OFw7ywfO+8WWbR1Go2
 Lb7tSQuveLdmwVjUDch92IpELf+iVWWKCqcYH/gdEAmstMOzTOQgnmYyaPn2XrrNnHB4
 6kOkR0ap3nqn6ge5xntzZ7XxcDKupxqISX8UXhrNoSUI3QK1DZcFvTnngdkX10m6vkVb
 2rkx0L+thK6Mi8NEp+jc6Ty/Uszm/OjIoFv98/iQ5n+nvrrA0CNDvdZy2b5ZJAOysIdA
 cJfA==
X-Gm-Message-State: APjAAAWsYd0oIbhGDVsHmRVaGK+zlj5nF0gH5tYiAYKNfB/qGf81W9k8
 FCxnuCrpbUuukG0V9nIYrxcIDBfkLtW2gCyml/ExRtTI
X-Google-Smtp-Source: APXvYqyrI/GQt0njfj7qK8M+1jAmCHK4qaEgP7c2xlrVs65aGH53OsG/x7Dvu90PPZ6cskBp0XlHKmJXtq/FcVD1Vo8=
X-Received: by 2002:aed:3c16:: with SMTP id t22mr41903538qte.92.1577567011217; 
 Sat, 28 Dec 2019 13:03:31 -0800 (PST)
MIME-Version: 1.0
From: eric brandl <ericb0813@gmail.com>
Date: Sat, 28 Dec 2019 15:03:20 -0600
Message-ID: <CALXT2kFp9SPFELS97vHJFndGH7cFh0=gjC1h9Tuv2LgSMHeJ-Q@mail.gmail.com>
Subject: Data Connection Lost Win10 (Server) Win10 (Clients) 37
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 30 Dec 2019 10:51:22 +0100
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
Content-Type: multipart/mixed; boundary="===============9162917763792167144=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============9162917763792167144==
Content-Type: multipart/alternative; boundary="00000000000050244f059ac9f11f"

--00000000000050244f059ac9f11f
Content-Type: text/plain; charset="UTF-8"

Issue I am having is sporadically around every 5 to 30 min all peer
connections no longer send traffic over them, and the only way to get them
working again is to restart the WireGuard server (Win 10) .


The log shows this:

2019-12-28 01:39:46.625: [TUN] [GameNet] Failed to write packet to TUN
device: file already closed

2019-12-28 01:39:46.629: [TUN] [GameNet] Binding v4 socket to interface 16
(blackhole=false)

2019-12-28 01:39:46.631: [TUN] [GameNet] Failed to write packet to TUN
device: file already closed

2019-12-28 01:39:46.649: [TUN] [GameNet] Failed to write packet to TUN
device: file already closed

2019-12-28 01:39:46.668: [TUN] [GameNet] Failed to write packet to TUN
device: file already closed

2019-12-28 01:39:46.692: [TUN] [GameNet] Failed to write packet to TUN
device: file already closed

2019-12-28 01:39:46.714: [TUN] [GameNet] Failed to write packet to TUN
device: file already closed

2019-12-28 01:39:46.730: [TUN] [GameNet] Failed to write packet to TUN
device: file already closed


Server Config:

[Interface]
PrivateKey = SNIP
ListenPort = 5687
Address = 10.152.152.1/24
MTU = 1360

[Peer]
PublicKey = BMIr6jiTNpu1wiSAqTLBUBFnM3DBW+RMdvapkmnFAiY=
AllowedIPs = 10.152.152.2/32

[Peer]
PublicKey = gY0SvOX8lKfLkMXHIwA6pNnB8ooc36vCOPlQ0WmR5Es=
AllowedIPs = 10.152.152.3/32

[Peer]
PublicKey = NcbtXceq1dh3khRv+YXXXw9RmJJH+r0acVIGbJ3qWSY=
AllowedIPs = 10.152.152.4/32

[Peer]
PublicKey = LkMrfhjHOz6VgL9gTsBkcahkw++RMYokMbJnViQ9xVM=
AllowedIPs = 10.152.152.5/32

[Peer]
PublicKey = YAKEhGM4Wr1SYSb197ugyV7IKqUOh+Jzpg7NVNLa3AM=
AllowedIPs = 10.152.152.6/32

[Peer]
PublicKey = MZ1ycd1MdUvFUDpRxgY0hc7/jwTP9TuuYB6uwmyYdmQ=
AllowedIPs = 10.152.152.7/32

[Peer]
PublicKey = Re5hkZG10PuN993GVRkkYCjjnyKyk96SCN4vFP5l/mM=
AllowedIPs = 10.152.152.8/32

[Peer]
PublicKey = Yrx9W1PC60Uw9tpsRIByV0U+aW3eE210X1LCxTnk21w=
AllowedIPs = 10.152.152.10/32

Example Client Config:

[Interface]
PrivateKey = generated_private_key
ListenPort = 5687
Address = 10.152.152.3/24
MTU = 1360

[Peer]
PublicKey = wQE513lYAgeLMcA72rGUnAcqknTYRlC2+oyWKI4Q1j4=
AllowedIPs = 10.152.152.0/24
Endpoint = SNIP:5687
PersistentKeepalive = 40

Things I have tried:

Rolling back to 35

Changing MTU

Switching NIC in Proxmox from Intel to Realtek and back


Other Notes:

With only two peers connected it seems to be less of an issue, with 8 or so
connected we get this issue quicker.

--00000000000050244f059ac9f11f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin=
:0px;padding:0.8em 0px 0.25em;border:0px;font-variant-numeric:inherit;font-=
variant-east-asian:inherit;font-stretch:inherit;font-size:14px;line-height:=
inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:b=
aseline;color:rgb(26,26,27)">Issue I am having is sporadically around every=
 5 to 30 min all peer connections no longer send traffic over them, and the=
 only way to get them working again is to restart the WireGuard server (Win=
 10) .</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px;pa=
dding:0.8em 0px 0.25em;border:0px;font-variant-numeric:inherit;font-variant=
-east-asian:inherit;font-stretch:inherit;font-size:14px;line-height:inherit=
;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:baseline=
;color:rgb(26,26,27)"><br></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" st=
yle=3D"margin:0px;padding:0.8em 0px 0.25em;border:0px;font-variant-numeric:=
inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size:14px=
;line-height:inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;ver=
tical-align:baseline;color:rgb(26,26,27)">The log shows this:</p><p class=
=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px;padding:0.8em 0px 0.=
25em;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inheri=
t;font-stretch:inherit;font-size:14px;line-height:inherit;font-family:&quot=
;Noto Sans&quot;,Arial,sans-serif;vertical-align:baseline;color:rgb(26,26,2=
7)">2019-12-28 01:39:46.625: [TUN] [GameNet] Failed to write packet to TUN =
device: file already closed</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" s=
tyle=3D"margin:0px;padding:0.8em 0px 0.25em;border:0px;font-variant-numeric=
:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size:14p=
x;line-height:inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;ve=
rtical-align:baseline;color:rgb(26,26,27)">2019-12-28 01:39:46.629: [TUN] [=
GameNet] Binding v4 socket to interface 16 (blackhole=3Dfalse)</p><p class=
=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px;padding:0.8em 0px 0.=
25em;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inheri=
t;font-stretch:inherit;font-size:14px;line-height:inherit;font-family:&quot=
;Noto Sans&quot;,Arial,sans-serif;vertical-align:baseline;color:rgb(26,26,2=
7)">2019-12-28 01:39:46.631: [TUN] [GameNet] Failed to write packet to TUN =
device: file already closed</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" s=
tyle=3D"margin:0px;padding:0.8em 0px 0.25em;border:0px;font-variant-numeric=
:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size:14p=
x;line-height:inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;ve=
rtical-align:baseline;color:rgb(26,26,27)">2019-12-28 01:39:46.649: [TUN] [=
GameNet] Failed to write packet to TUN device: file already closed</p><p cl=
ass=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px;padding:0.8em 0px=
 0.25em;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inh=
erit;font-stretch:inherit;font-size:14px;line-height:inherit;font-family:&q=
uot;Noto Sans&quot;,Arial,sans-serif;vertical-align:baseline;color:rgb(26,2=
6,27)">2019-12-28 01:39:46.668: [TUN] [GameNet] Failed to write packet to T=
UN device: file already closed</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM=
" style=3D"margin:0px;padding:0.8em 0px 0.25em;border:0px;font-variant-nume=
ric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size:=
14px;line-height:inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif=
;vertical-align:baseline;color:rgb(26,26,27)">2019-12-28 01:39:46.692: [TUN=
] [GameNet] Failed to write packet to TUN device: file already closed</p><p=
 class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px;padding:0.8em =
0px 0.25em;border:0px;font-variant-numeric:inherit;font-variant-east-asian:=
inherit;font-stretch:inherit;font-size:14px;line-height:inherit;font-family=
:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:baseline;color:rgb(2=
6,26,27)">2019-12-28 01:39:46.714: [TUN] [GameNet] Failed to write packet t=
o TUN device: file already closed</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XS=
iJM" style=3D"margin:0px;padding:0.8em 0px 0.25em;border:0px;font-variant-n=
umeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-si=
ze:14px;line-height:inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-se=
rif;vertical-align:baseline;color:rgb(26,26,27)">2019-12-28 01:39:46.730: [=
TUN] [GameNet] Failed to write packet to TUN device: file already closed</p=
><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px;padding:0.8=
em 0px 0.25em;border:0px;font-variant-numeric:inherit;font-variant-east-asi=
an:inherit;font-stretch:inherit;font-size:14px;line-height:inherit;font-fam=
ily:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:baseline;color:rg=
b(26,26,27)"><br></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"ma=
rgin:0px;padding:0.8em 0px 0.25em;border:0px;font-variant-numeric:inherit;f=
ont-variant-east-asian:inherit;font-stretch:inherit;font-size:14px;line-hei=
ght:inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-ali=
gn:baseline;color:rgb(26,26,27)">Server Config:</p><pre class=3D"gmail-_3Gn=
arIQX9tD_qsgXkfSDz1" style=3D"margin-top:4px;margin-bottom:4px;padding:8px;=
border:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;fon=
t-stretch:inherit;font-size:14px;line-height:1.4;font-family:inherit;vertic=
al-align:baseline;max-width:100%;overflow:auto;display:grid;color:rgb(26,26=
,27)"><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM" style=3D"margin:0px;pad=
ding:0px;border:0px;font-style:inherit;font-variant:inherit;font-stretch:in=
herit;font-size:13px;line-height:20px;font-family:&quot;Noto Mono&quot;,Men=
lo,Monaco,Consolas,monospace;vertical-align:baseline;background-color:trans=
parent;max-width:100%;overflow:auto">[Interface]
PrivateKey =3D SNIP
ListenPort =3D 5687
Address =3D <a href=3D"http://10.152.152.1/24">10.152.152.1/24</a>
MTU =3D 1360

[Peer]
PublicKey =3D BMIr6jiTNpu1wiSAqTLBUBFnM3DBW+RMdvapkmnFAiY=3D
AllowedIPs =3D <a href=3D"http://10.152.152.2/32">10.152.152.2/32</a>

[Peer]
PublicKey =3D gY0SvOX8lKfLkMXHIwA6pNnB8ooc36vCOPlQ0WmR5Es=3D
AllowedIPs =3D <a href=3D"http://10.152.152.3/32">10.152.152.3/32</a>

[Peer]
PublicKey =3D NcbtXceq1dh3khRv+YXXXw9RmJJH+r0acVIGbJ3qWSY=3D
AllowedIPs =3D <a href=3D"http://10.152.152.4/32">10.152.152.4/32</a>

[Peer]
PublicKey =3D LkMrfhjHOz6VgL9gTsBkcahkw++RMYokMbJnViQ9xVM=3D
AllowedIPs =3D <a href=3D"http://10.152.152.5/32">10.152.152.5/32</a>

[Peer]
PublicKey =3D YAKEhGM4Wr1SYSb197ugyV7IKqUOh+Jzpg7NVNLa3AM=3D
AllowedIPs =3D <a href=3D"http://10.152.152.6/32">10.152.152.6/32</a>

[Peer]
PublicKey =3D MZ1ycd1MdUvFUDpRxgY0hc7/jwTP9TuuYB6uwmyYdmQ=3D
AllowedIPs =3D <a href=3D"http://10.152.152.7/32">10.152.152.7/32</a>

[Peer]
PublicKey =3D Re5hkZG10PuN993GVRkkYCjjnyKyk96SCN4vFP5l/mM=3D
AllowedIPs =3D <a href=3D"http://10.152.152.8/32">10.152.152.8/32</a>

[Peer]
PublicKey =3D Yrx9W1PC60Uw9tpsRIByV0U+aW3eE210X1LCxTnk21w=3D
AllowedIPs =3D <a href=3D"http://10.152.152.10/32">10.152.152.10/32</a>
</code></pre><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px=
;padding:0.8em 0px 0.25em;border:0px;font-variant-numeric:inherit;font-vari=
ant-east-asian:inherit;font-stretch:inherit;font-size:14px;line-height:inhe=
rit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:basel=
ine;color:rgb(26,26,27)">Example Client Config:</p><pre class=3D"gmail-_3Gn=
arIQX9tD_qsgXkfSDz1" style=3D"margin-top:4px;margin-bottom:4px;padding:8px;=
border:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;fon=
t-stretch:inherit;font-size:14px;line-height:1.4;font-family:inherit;vertic=
al-align:baseline;max-width:100%;overflow:auto;display:grid;color:rgb(26,26=
,27)"><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM" style=3D"margin:0px;pad=
ding:0px;border:0px;font-style:inherit;font-variant:inherit;font-stretch:in=
herit;font-size:13px;line-height:20px;font-family:&quot;Noto Mono&quot;,Men=
lo,Monaco,Consolas,monospace;vertical-align:baseline;background-color:trans=
parent;max-width:100%;overflow:auto">[Interface]
PrivateKey =3D generated_private_key
ListenPort =3D 5687
Address =3D <a href=3D"http://10.152.152.3/24">10.152.152.3/24</a>
MTU =3D 1360

[Peer]
PublicKey =3D wQE513lYAgeLMcA72rGUnAcqknTYRlC2+oyWKI4Q1j4=3D
AllowedIPs =3D <a href=3D"http://10.152.152.0/24">10.152.152.0/24</a>
Endpoint =3D SNIP:5687
PersistentKeepalive =3D 40
</code></pre><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px=
;padding:0.8em 0px 0.25em;border:0px;font-variant-numeric:inherit;font-vari=
ant-east-asian:inherit;font-stretch:inherit;font-size:14px;line-height:inhe=
rit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:basel=
ine;color:rgb(26,26,27)">Things I have tried:</p><p class=3D"gmail-_1qeIAgB=
0cPwnLhDF9XSiJM" style=3D"margin:0px;padding:0.8em 0px 0.25em;border:0px;fo=
nt-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inh=
erit;font-size:14px;line-height:inherit;font-family:&quot;Noto Sans&quot;,A=
rial,sans-serif;vertical-align:baseline;color:rgb(26,26,27)">Rolling back t=
o 35</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px;padd=
ing:0.8em 0px 0.25em;border:0px;font-variant-numeric:inherit;font-variant-e=
ast-asian:inherit;font-stretch:inherit;font-size:14px;line-height:inherit;f=
ont-family:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:baseline;c=
olor:rgb(26,26,27)">Changing MTU</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSi=
JM" style=3D"margin:0px;padding:0.8em 0px 0.25em;border:0px;font-variant-nu=
meric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-siz=
e:14px;line-height:inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-ser=
if;vertical-align:baseline;color:rgb(26,26,27)">Switching NIC in Proxmox fr=
om Intel to Realtek and back</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" =
style=3D"margin:0px;padding:0.8em 0px 0.25em;border:0px;font-variant-numeri=
c:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size:14=
px;line-height:inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;v=
ertical-align:baseline;color:rgb(26,26,27)"><br></p><p class=3D"gmail-_1qeI=
AgB0cPwnLhDF9XSiJM" style=3D"margin:0px;padding:0.8em 0px 0.25em;border:0px=
;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:=
inherit;font-size:14px;line-height:inherit;font-family:&quot;Noto Sans&quot=
;,Arial,sans-serif;vertical-align:baseline;color:rgb(26,26,27)">Other Notes=
:</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px;padding=
:0.8em 0px 0px;border:0px;font-variant-numeric:inherit;font-variant-east-as=
ian:inherit;font-stretch:inherit;font-size:14px;line-height:inherit;font-fa=
mily:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:baseline;color:r=
gb(26,26,27)">With only two peers connected it seems to be less of an issue=
, with 8 or so connected we get this issue quicker.</p></div>

--00000000000050244f059ac9f11f--

--===============9162917763792167144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9162917763792167144==--
