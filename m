Return-Path: <SRS0=ToPy=MX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A81C677FF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Oct 2018 18:04:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F68A2054F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Oct 2018 18:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hE59ML+o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F68A2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47c3c8f3;
	Thu, 11 Oct 2018 18:02:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8aef05b
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Oct 2018 18:02:49 +0000 (UTC)
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92589555
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Oct 2018 18:02:48 +0000 (UTC)
Received: by mail-it1-x12f.google.com with SMTP id k206-v6so8782261ite.0
 for <wireguard@lists.zx2c4.com>; Thu, 11 Oct 2018 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=zxAE4s1oGebZzz1Ok2pX2QOv6UM1RTjfOiuMikOAuz8=;
 b=hE59ML+ognKOIa1yn0FaAdxmmKxdTJ8l1a/KYnHqJCSMyWRRliPSenJC3ht+b1bFSu
 3MNTtlfXp/iv5sBKEjTLtdzrdT6pg4L/UKtHtNkI70EtVuAPFTTXtXwYQQPcTF+pjOoW
 bTU/MeuUMQ0vKh0RUYMG3fa60rafoFVNv8ndDRnT05XwxhbRdKlF6kE0yT+pT0UNJgI7
 6GSqvBQU+SnANqwkrJGWYD3lnC4M8dwhNObOULPYUSDwNtyYsZk8nhl2nXIvR95HQfs5
 xc+of1CS1gqwie74/l+wZ9HCZAYYt79t/NJYvvTGNO1GKXy2bg7l9MOf0kIAGRq3ejms
 y4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=zxAE4s1oGebZzz1Ok2pX2QOv6UM1RTjfOiuMikOAuz8=;
 b=dck4nTmxg/O/7v7Cdm22SWOectI7PiqKe8PSFdTjHsXTKSD98lvvbNXsRk6j4xNwdm
 r1FfOWJwzyARCRepSM0pngzo1/7DZ/JYy1EzQDPHXP1TQDvqp8UJJKyvE1phFJAReAnw
 cGJQNHNJa1cgGco1SM69uS0fqwS+8t58zKeyT8BLAqKzo0gPqoi6UgEXjcctx4ki+6S/
 RhVOHq9y6rhr1ezePzvY6wGXf3LFUh7H/bqTzpNyIud+TdWLSm4YUlOrzN+9Uk8iNTxJ
 8p/VLi0jVg1WzvxiLT54t7wCWQkB0YM+c0lnwdn0E+ycDQ7BM8WSv0XVHYt4Y9gh1gfx
 LV+Q==
X-Gm-Message-State: ABuFfoiibm7CZ4tVLQOXCo1ArObxtAOXiOb//brnLS840Y4yNieyJ9kX
 yoPfBlVxAdgwj+4o4UlrlgsKyF9RsrLFv6vQy7/KVQ==
X-Google-Smtp-Source: ACcGV63OXacp5v+TNYaBCk0kXfc0r62beJOCwn0cSXBTQP93bxEeIazAcBG1T9K1DAx0XYdy1RT+PJzS3NESk7d7Ix0=
X-Received: by 2002:a24:9:: with SMTP id 9-v6mr2186208ita.35.1539281037484;
 Thu, 11 Oct 2018 11:03:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:f9c9:0:0:0:0:0 with HTTP; Thu, 11 Oct 2018 11:03:57
 -0700 (PDT)
In-Reply-To: <CANO0tfYVjdQ7izRC9mwxw+Lz71sa60BaF=mcNw6QB_SDjXQL4A@mail.gmail.com>
References: <CANO0tfYVjdQ7izRC9mwxw+Lz71sa60BaF=mcNw6QB_SDjXQL4A@mail.gmail.com>
From: Waishon <waishon009@gmail.com>
Date: Thu, 11 Oct 2018 20:03:57 +0200
Message-ID: <CANO0tfZ9PWEdp+UMSho=xxoto68wocTMe8TroXWzYBwrMgZKKA@mail.gmail.com>
Subject: Android client stopped connecting to server
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
Content-Type: multipart/mixed; boundary="===============5145886919835660059=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5145886919835660059==
Content-Type: multipart/alternative; boundary="00000000000072e7b60577f7cb63"

--00000000000072e7b60577f7cb63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey there,

I'm trying to connect my android client to a wireguard server. This worked
absolutly fine in the past.

However now the client isn't initiating a handshake. I've tried it on my
wireless and cellular network. It doesn't work with on that android device.
However it works absolutly fine on every other device in my network
(Raspberry, Linux computers etc.).

So I've done some debugging. When sniffing the traffic on my router using
tcpdump there is absolutly no connection to my server and my server doesn't
receive anything to.

Then I looked at the logcat of wireguard and saw that it stopped after
"Device started". On another device from a friend of mine it continues with
the handshake.

Here's the log of the non working device:
>>>10-04 20:08:46.663 17087 21706 D WireGuard/GoBackend: Changing tunnel
XXX to state UP
10-04 20:08:46.663 17087 21706 I WireGuard/GoBackend: Bringing tunnel up
10-04 20:08:46.687 17087 21706 D WireGuard/GoBackend: Go backend
v0.0.20180613
10-04 20:08:46.687 17087 21706 D WireGuard/GoBackend/XXX: Debug log enabled
10-04 20:08:46.687 17087 21706 I WireGuard/GoBackend/XXX: Attaching to
interface tun0
10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine:
decryption worker - started
10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine:
encryption worker - started
10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine: event
worker - started
10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine:
decryption worker - started
10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine:
handshake worker - started
10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine:
decryption worker - started
10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine:
encryption worker - started
10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine:
decryption worker - started
10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine:
decryption worker - started
10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine:
handshake worker - started
10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine:
decryption worker - started
10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine:
encryption worker - started
10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine:
handshake worker - started
10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine:
encryption worker - started
10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine:
handshake worker - started
10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine:
encryption worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine:
handshake worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine:
encryption worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine:
decryption worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine:
handshake worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine:
encryption worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine:
handshake worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine:
encryption worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine:
handshake worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine:
decryption worker - started
10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine: TUN
reader - started
10-04 20:08:46.690 17087 21706 D WireGuard/GoBackend/XXX: Interface has MTU
1280
10-04 20:08:46.690 17087 21706 D WireGuard/GoBackend/XXX: UAPI: Removing
all peers
10-04 20:08:46.690 17087 21706 D WireGuard/GoBackend/XXX: UAPI: Updating
private key
10-04 20:08:46.694 17087 21706 D WireGuard/GoBackend/XXX: UAPI: Transition
to peer configuration
10-04 20:08:46.699 17087 21706 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=
=C3=87=C2=AA5XFs)
- UAPI: Created
10-04 20:08:46.699 17087 21706 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=
=C3=87=C2=AA5XFs)
- UAPI: Updating endpoint
10-04 20:08:46.700 17087 21706 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=
=C3=87=C2=AA5XFs)
- UAPI: Updating persistent keepalive interva
10-04 20:08:46.701 17087 21706 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=
=C3=87=C2=AA5XFs)
- UAPI: Adding allowedip
10-04 20:08:46.703 17087 17108 D WireGuard/GoBackend/XXX: Routine: receive
incoming IPv6 - starting
10-04 20:08:46.703 17087 20915 D WireGuard/GoBackend/XXX: Routine: receive
incoming IPv4 - starting
10-04 20:08:46.703 17087 21706 D WireGuard/GoBackend/XXX: UDP bind has been
updated
10-04 20:08:46.703 17087 21706 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=
=C3=87=C2=AA5XFs)
- Starting...
10-04 20:08:46.704 17087 17135 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=
=C3=87=C2=AA5XFs)
- Routine: sequential receiver - started
10-04 20:08:46.704 17087 17108 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=
=C3=87=C2=AA5XFs)
- Routine: nonce worker - started
10-04 20:08:46.704 17087 17135 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=
=C3=87=C2=AA5XFs)
- Routine: sequential sender - started
10-04 20:08:46.704 17087 21706 I WireGuard/GoBackend/XXX: Device started
'
And here's the log on the working device:
10-04 20:14:13.349 13605 13622 D WireGuard/GoBackend: Changing tunnel
vserver to state UP
10-04 20:14:13.349 13605 13622 I WireGuard/GoBackend: Bringing tunnel up
10-04 20:14:13.350 13605 13622 D WireGuard/GoBackend: Requesting to start
VpnService
10-04 20:14:13.518 13605 13622 D WireGuard/GoBackend: Go backend
v0.0.20180613
10-04 20:14:13.519 13605 13622 D WireGuard/GoBackend/vserver: Debug log
enabled
10-04 20:14:13.520 13605 13622 I WireGuard/GoBackend/vserver: Attaching to
interface tun0
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
event worker - started
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
encryption worker - started
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
decryption worker - started
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
handshake worker - started
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
handshake worker - started
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
encryption worker - started
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
decryption worker - started
10-04 20:14:13.545 13605 13623 D WireGuard/GoBackend/vserver: Routine:
decryption worker - started
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
handshake worker - started
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
encryption worker - started
10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine:
handshake worker - started
10-04 20:14:13.545 13605 13623 D WireGuard/GoBackend/vserver: Routine:
encryption worker - started
10-04 20:14:13.545 13605 13623 D WireGuard/GoBackend/vserver: Routine:
handshake worker - started
10-04 20:14:13.545 13605 13623 D WireGuard/GoBackend/vserver: Routine:
decryption worker - started
10-04 20:14:13.546 13605 13631 D WireGuard/GoBackend/vserver: Routine: TUN
reader - started
10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine:
encryption worker - started
10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine:
encryption worker - started
10-04 20:14:13.546 13605 13623 D WireGuard/GoBackend/vserver: Routine:
decryption worker - started
10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine:
handshake worker - started
10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine:
handshake worker - started
10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine:
decryption worker - started
10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine:
encryption worker - started
10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine:
encryption worker - started
10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine:
handshake worker - started
10-04 20:14:13.546 13605 13655 D WireGuard/GoBackend/vserver: Routine:
decryption worker - started
10-04 20:14:13.547 13605 13651 D WireGuard/GoBackend/vserver: Routine:
decryption worker - started
10-04 20:14:13.547 13605 13622 D WireGuard/GoBackend/vserver: Interface has
MTU 1280
10-04 20:14:13.548 13605 13622 D WireGuard/GoBackend/vserver: UAPI:
Removing all peers
10-04 20:14:13.548 13605 13622 D WireGuard/GoBackend/vserver: UAPI:
Updating private key
10-04 20:14:13.549 13605 13622 D WireGuard/GoBackend/vserver: UAPI:
Transition to peer configuration
10-04 20:14:13.550 13605 13622 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - UAPI: Created
10-04 20:14:13.550 13605 13622 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - UAPI: Updating endpoint
10-04 20:14:13.550 13605 13622 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - UAPI: Updating persistent keepalive inte=
rva
10-04 20:14:13.550 13605 13622 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - UAPI: Adding allowedip
10-04 20:14:13.550 13605 13622 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - UAPI: Adding allowedip
10-04 20:14:13.556 13605 13651 D WireGuard/GoBackend/vserver: Routine:
receive incoming IPv6 - starting
10-04 20:14:13.557 13605 13655 D WireGuard/GoBackend/vserver: Routine:
receive incoming IPv4 - starting
10-04 20:14:13.558 13605 13622 D WireGuard/GoBackend/vserver: UDP bind has
been updated
10-04 20:14:13.558 13605 13622 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Starting...
10-04 20:14:13.558 13605 13630 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Routine: nonce worker - started
10-04 20:14:13.558 13605 13630 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Routine: sequential sender - started
10-04 20:14:13.558 13605 13655 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Routine: sequential receiver - started
10-04 20:14:13.558 13605 13622 I WireGuard/GoBackend/vserver: Device starte=
d
10-04 20:14:13.801 13605 13655 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Sending handshake initiation
10-04 20:14:13.804 13605 13655 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Awaiting keypair
10-04 20:14:13.822 13605 13623 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Received handshake response
10-04 20:14:13.822 13605 13623 D WireGuard/GoBackend/vserver:
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Obtained awaited keypair

And here's the config:
[Interface]
Address =3D fd00:2:1::5/64
PrivateKey =3D YAXZKLpq+XXXX

[Peer]
AllowedIPs =3D fd00::/16
Endpoint =3D XXX.de:51820
PersistentKeepalive =3D 25
PublicKey =3D lrQtqqXosiux8XXXX

Do you've any idea why this happen? If you need further information for
debugging let me know!.

Thanks in advance
S=C3=B6ren

--00000000000072e7b60577f7cb63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hey the=
re,<div><br></div><div>I&#39;m trying to connect my android client to a wir=
eguard server. This worked absolutly fine in the past.</div><div><br></div>=
<div>However now the client isn&#39;t initiating a handshake. I&#39;ve trie=
d it on my wireless and cellular network. It doesn&#39;t work with on that =
android device. However it works absolutly fine on every other device in my=
 network (Raspberry, Linux computers etc.).=C2=A0<br><br>So I&#39;ve done s=
ome debugging. When sniffing the traffic on my router using tcpdump there i=
s absolutly no connection to my server and my server doesn&#39;t receive an=
ything to.=C2=A0</div><div><br></div><div>Then I looked at the logcat of wi=
reguard and saw that it stopped after &quot;Device started&quot;. On anothe=
r device from a friend of mine it continues with the handshake.=C2=A0<br><b=
r>Here&#39;s the log of the non working device:</div><div><div>&gt;&gt;&gt;=
10-04 20:08:46.663 17087 21706 D WireGuard/GoBackend: Changing tunnel XXX t=
o state UP</div><div>10-04 20:08:46.663 17087 21706 I WireGuard/GoBackend: =
Bringing tunnel up</div><div>10-04 20:08:46.687 17087 21706 D WireGuard/GoB=
ackend: Go backend v0.0.20180613</div><div>10-04 20:08:46.687 17087 21706 D=
 WireGuard/GoBackend/XXX: Debug log enabled</div><div>10-04 20:08:46.687 17=
087 21706 I WireGuard/GoBackend/XXX: Attaching to interface tun0</div><div>=
10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine: decrypti=
on worker - started</div><div>10-04 20:08:46.688 17087 17132 D WireGuard/Go=
Backend/XXX: Routine: encryption worker - started</div><div>10-04 20:08:46.=
688 17087 17132 D WireGuard/GoBackend/XXX: Routine: event worker - started<=
/div><div>10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine=
: decryption worker - started</div><div>10-04 20:08:46.688 17087 17116 D Wi=
reGuard/GoBackend/XXX: Routine: handshake worker - started</div><div>10-04 =
20:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine: decryption wor=
ker - started</div><div>10-04 20:08:46.688 17087 17132 D WireGuard/GoBacken=
d/XXX: Routine: encryption worker - started</div><div>10-04 20:08:46.688 17=
087 17116 D WireGuard/GoBackend/XXX: Routine: decryption worker - started</=
div><div>10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine:=
 decryption worker - started</div><div>10-04 20:08:46.688 17087 17116 D Wir=
eGuard/GoBackend/XXX: Routine: handshake worker - started</div><div>10-04 2=
0:08:46.688 17087 17132 D WireGuard/GoBackend/XXX: Routine: decryption work=
er - started</div><div>10-04 20:08:46.688 17087 17132 D WireGuard/GoBackend=
/XXX: Routine: encryption worker - started</div><div>10-04 20:08:46.688 170=
87 17132 D WireGuard/GoBackend/XXX: Routine: handshake worker - started</di=
v><div>10-04 20:08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine: e=
ncryption worker - started</div><div>10-04 20:08:46.688 17087 17116 D WireG=
uard/GoBackend/XXX: Routine: handshake worker - started</div><div>10-04 20:=
08:46.688 17087 17116 D WireGuard/GoBackend/XXX: Routine: encryption worker=
 - started</div><div>10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/X=
XX: Routine: handshake worker - started</div><div>10-04 20:08:46.689 17087 =
17116 D WireGuard/GoBackend/XXX: Routine: encryption worker - started</div>=
<div>10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine: dec=
ryption worker - started</div><div>10-04 20:08:46.689 17087 17116 D WireGua=
rd/GoBackend/XXX: Routine: handshake worker - started</div><div>10-04 20:08=
:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine: encryption worker -=
 started</div><div>10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX=
: Routine: handshake worker - started</div><div>10-04 20:08:46.689 17087 17=
116 D WireGuard/GoBackend/XXX: Routine: encryption worker - started</div><d=
iv>10-04 20:08:46.689 17087 17116 D WireGuard/GoBackend/XXX: Routine: hands=
hake worker - started</div><div>10-04 20:08:46.689 17087 17116 D WireGuard/=
GoBackend/XXX: Routine: decryption worker - started</div><div>10-04 20:08:4=
6.689 17087 17116 D WireGuard/GoBackend/XXX: Routine: TUN reader - started<=
/div><div>10-04 20:08:46.690 17087 21706 D WireGuard/GoBackend/XXX: Interfa=
ce has MTU 1280</div><div>10-04 20:08:46.690 17087 21706 D WireGuard/GoBack=
end/XXX: UAPI: Removing all peers</div><div>10-04 20:08:46.690 17087 21706 =
D WireGuard/GoBackend/XXX: UAPI: Updating private key</div><div>10-04 20:08=
:46.694 17087 21706 D WireGuard/GoBackend/XXX: UAPI: Transition to peer con=
figuration</div><div>10-04 20:08:46.699 17087 21706 D WireGuard/GoBackend/X=
XX: peer(lrQt=C3=94=C3=87=C2=AA5XFs) - UAPI: Created</div><div>10-04 20:08:=
46.699 17087 21706 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=C3=87=C2=AA5X=
Fs) - UAPI: Updating endpoint</div><div>10-04 20:08:46.700 17087 21706 D Wi=
reGuard/GoBackend/XXX: peer(lrQt=C3=94=C3=87=C2=AA5XFs) - UAPI: Updating pe=
rsistent keepalive interva</div><div>10-04 20:08:46.701 17087 21706 D WireG=
uard/GoBackend/XXX: peer(lrQt=C3=94=C3=87=C2=AA5XFs) - UAPI: Adding allowed=
ip</div><div>10-04 20:08:46.703 17087 17108 D WireGuard/GoBackend/XXX: Rout=
ine: receive incoming IPv6 - starting</div><div>10-04 20:08:46.703 17087 20=
915 D WireGuard/GoBackend/XXX: Routine: receive incoming IPv4 - starting</d=
iv><div>10-04 20:08:46.703 17087 21706 D WireGuard/GoBackend/XXX: UDP bind =
has been updated</div><div>10-04 20:08:46.703 17087 21706 D WireGuard/GoBac=
kend/XXX: peer(lrQt=C3=94=C3=87=C2=AA5XFs) - Starting...</div><div>10-04 20=
:08:46.704 17087 17135 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=C3=87=C2=
=AA5XFs) - Routine: sequential receiver - started</div><div>10-04 20:08:46.=
704 17087 17108 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=C3=87=C2=AA5XFs)=
 - Routine: nonce worker - started</div><div>10-04 20:08:46.704 17087 17135=
 D WireGuard/GoBackend/XXX: peer(lrQt=C3=94=C3=87=C2=AA5XFs) - Routine: seq=
uential sender - started</div><div>10-04 20:08:46.704 17087 21706 I WireGua=
rd/GoBackend/XXX: Device started<br>&#39;<br>And here&#39;s the log on the =
working device:<br><div>10-04 20:14:13.349 13605 13622 D WireGuard/GoBacken=
d: Changing tunnel vserver to state UP</div><div>10-04 20:14:13.349 13605 1=
3622 I WireGuard/GoBackend: Bringing tunnel up</div><div>10-04 20:14:13.350=
 13605 13622 D WireGuard/GoBackend: Requesting to start VpnService</div><di=
v>10-04 20:14:13.518 13605 13622 D WireGuard/GoBackend: Go backend v0.0.201=
80613</div><div>10-04 20:14:13.519 13605 13622 D WireGuard/GoBackend/vserve=
r: Debug log enabled</div><div>10-04 20:14:13.520 13605 13622 I WireGuard/G=
oBackend/vserver: Attaching to interface tun0</div><div>10-04 20:14:13.545 =
13605 13631 D WireGuard/GoBackend/vserver: Routine: event worker - started<=
/div><div>10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Rou=
tine: encryption worker - started</div><div>10-04 20:14:13.545 13605 13631 =
D WireGuard/GoBackend/vserver: Routine: decryption worker - started</div><d=
iv>10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine: h=
andshake worker - started</div><div>10-04 20:14:13.545 13605 13631 D WireGu=
ard/GoBackend/vserver: Routine: handshake worker - started</div><div>10-04 =
20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: Routine: encryption=
 worker - started</div><div>10-04 20:14:13.545 13605 13631 D WireGuard/GoBa=
ckend/vserver: Routine: decryption worker - started</div><div>10-04 20:14:1=
3.545 13605 13623 D WireGuard/GoBackend/vserver: Routine: decryption worker=
 - started</div><div>10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/v=
server: Routine: handshake worker - started</div><div>10-04 20:14:13.545 13=
605 13631 D WireGuard/GoBackend/vserver: Routine: encryption worker - start=
ed</div><div>10-04 20:14:13.545 13605 13631 D WireGuard/GoBackend/vserver: =
Routine: handshake worker - started</div><div>10-04 20:14:13.545 13605 1362=
3 D WireGuard/GoBackend/vserver: Routine: encryption worker - started</div>=
<div>10-04 20:14:13.545 13605 13623 D WireGuard/GoBackend/vserver: Routine:=
 handshake worker - started</div><div>10-04 20:14:13.545 13605 13623 D Wire=
Guard/GoBackend/vserver: Routine: decryption worker - started</div><div>10-=
04 20:14:13.546 13605 13631 D WireGuard/GoBackend/vserver: Routine: TUN rea=
der - started</div><div>10-04 20:14:13.546 13605 13650 D WireGuard/GoBacken=
d/vserver: Routine: encryption worker - started</div><div>10-04 20:14:13.54=
6 13605 13650 D WireGuard/GoBackend/vserver: Routine: encryption worker - s=
tarted</div><div>10-04 20:14:13.546 13605 13623 D WireGuard/GoBackend/vserv=
er: Routine: decryption worker - started</div><div>10-04 20:14:13.546 13605=
 13650 D WireGuard/GoBackend/vserver: Routine: handshake worker - started</=
div><div>10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Rout=
ine: handshake worker - started</div><div>10-04 20:14:13.546 13605 13650 D =
WireGuard/GoBackend/vserver: Routine: decryption worker - started</div><div=
>10-04 20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine: enc=
ryption worker - started</div><div>10-04 20:14:13.546 13605 13650 D WireGua=
rd/GoBackend/vserver: Routine: encryption worker - started</div><div>10-04 =
20:14:13.546 13605 13650 D WireGuard/GoBackend/vserver: Routine: handshake =
worker - started</div><div>10-04 20:14:13.546 13605 13655 D WireGuard/GoBac=
kend/vserver: Routine: decryption worker - started</div><div>10-04 20:14:13=
.547 13605 13651 D WireGuard/GoBackend/vserver: Routine: decryption worker =
- started</div><div>10-04 20:14:13.547 13605 13622 D WireGuard/GoBackend/vs=
erver: Interface has MTU 1280</div><div>10-04 20:14:13.548 13605 13622 D Wi=
reGuard/GoBackend/vserver: UAPI: Removing all peers</div><div>10-04 20:14:1=
3.548 13605 13622 D WireGuard/GoBackend/vserver: UAPI: Updating private key=
</div><div>10-04 20:14:13.549 13605 13622 D WireGuard/GoBackend/vserver: UA=
PI: Transition to peer configuration</div><div>10-04 20:14:13.550 13605 136=
22 D WireGuard/GoBackend/vserver: peer(fJY3=C3=94=C3=87=C2=AAfFm0) - UAPI: =
Created</div><div>10-04 20:14:13.550 13605 13622 D WireGuard/GoBackend/vser=
ver: peer(fJY3=C3=94=C3=87=C2=AAfFm0) - UAPI: Updating endpoint</div><div>1=
0-04 20:14:13.550 13605 13622 D WireGuard/GoBackend/vserver: peer(fJY3=C3=
=94=C3=87=C2=AAfFm0) - UAPI: Updating persistent keepalive interva</div><di=
v>10-04 20:14:13.550 13605 13622 D WireGuard/GoBackend/vserver: peer(fJY3=
=C3=94=C3=87=C2=AAfFm0) - UAPI: Adding allowedip</div><div>10-04 20:14:13.5=
50 13605 13622 D WireGuard/GoBackend/vserver: peer(fJY3=C3=94=C3=87=C2=AAfF=
m0) - UAPI: Adding allowedip</div><div>10-04 20:14:13.556 13605 13651 D Wir=
eGuard/GoBackend/vserver: Routine: receive incoming IPv6 - starting</div><d=
iv>10-04 20:14:13.557 13605 13655 D WireGuard/GoBackend/vserver: Routine: r=
eceive incoming IPv4 - starting</div><div>10-04 20:14:13.558 13605 13622 D =
WireGuard/GoBackend/vserver: UDP bind has been updated</div><div>10-04 20:1=
4:13.558 13605 13622 D WireGuard/GoBackend/vserver: peer(fJY3=C3=94=C3=87=
=C2=AAfFm0) - Starting...</div><div>10-04 20:14:13.558 13605 13630 D WireGu=
ard/GoBackend/vserver: peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Routine: nonce wo=
rker - started</div><div>10-04 20:14:13.558 13605 13630 D WireGuard/GoBacke=
nd/vserver: peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Routine: sequential sender -=
 started</div><div>10-04 20:14:13.558 13605 13655 D WireGuard/GoBackend/vse=
rver: peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Routine: sequential receiver - sta=
rted</div><div>10-04 20:14:13.558 13605 13622 I WireGuard/GoBackend/vserver=
: Device started</div><div>10-04 20:14:13.801 13605 13655 D WireGuard/GoBac=
kend/vserver: peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Sending handshake initiati=
on</div><div>10-04 20:14:13.804 13605 13655 D WireGuard/GoBackend/vserver: =
peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Awaiting keypair</div><div>10-04 20:14:1=
3.822 13605 13623 D WireGuard/GoBackend/vserver: peer(fJY3=C3=94=C3=87=C2=
=AAfFm0) - Received handshake response</div><div>10-04 20:14:13.822 13605 1=
3623 D WireGuard/GoBackend/vserver: peer(fJY3=C3=94=C3=87=C2=AAfFm0) - Obta=
ined awaited keypair</div></div></div><div><br></div><div>And here&#39;s th=
e config:<br></div><div><div>[Interface]</div><div>Address =3D fd00:2:1::5/=
64</div><div>PrivateKey =3D YAXZKLpq+XXXX</div><div><br></div><div>[Peer]</=
div><div>AllowedIPs =3D fd00::/16</div><div>Endpoint =3D XXX.de:51820</div>=
<div>PersistentKeepalive =3D 25</div><div>PublicKey =3D lrQtqqXosiux8XXXX</=
div></div><div><br></div><div>Do you&#39;ve any idea why this happen? If yo=
u need further information for debugging let me know!.<br><br>Thanks in adv=
ance</div><div>S=C3=B6ren</div><div><br></div></div></div></div></div>
<br>

--00000000000072e7b60577f7cb63--

--===============5145886919835660059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5145886919835660059==--
