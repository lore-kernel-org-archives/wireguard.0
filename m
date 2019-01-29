Return-Path: <SRS0=D9u6=QF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98794C282C7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 29 Jan 2019 21:12:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D7F20881
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 29 Jan 2019 21:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D7F20881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wenarab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6ad8fb5;
	Tue, 29 Jan 2019 21:06:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09a51cf4
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Jan 2019 21:06:52 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c9e6d2b
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Jan 2019 21:06:52 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id n126so4815965vke.12
 for <wireguard@lists.zx2c4.com>; Tue, 29 Jan 2019 13:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=H8Qmca1Y/UmNUfDuZWshto3M5geM5z2fcJWwE/4hY7U=;
 b=OiBSlL5+7gAdhKUu9EjBylfxrZfffh1DhjZ0ptj0MF6cjQ3ALuGC8L8LYzgheG4zCz
 CQ/yl3QUMdLfec3vUAGrRKv2wKiTfTtQ52hj0cvnm6xHPMoqosZpByyi7c2EH2F/Q7QA
 WM/+Yu5cu/BjPVwP82ELNFFl+U59FRbYVgp0qGpkJi4anGB3ZbdjzvVbz5+vukwQk6W1
 ++sSOGLzlgU1q7uVqu9UcjXI3MEOdfF2hvFJ+cbQSpKb8/jpsXl1sJz3Me6qcj3qwTAh
 f/6C+MlHoEjHy2+rM6Szc6+IDZyTrFflOkVKC/Ww3axcJ5SMB+AZJJcaQX2/qehZ1x71
 YhhQ==
X-Gm-Message-State: AJcUukcAlP4/lnB7ur1ipe10GtU4jzxrWBWmExg3Nl+Dm7u+/CLC2J1d
 XdAF8b4842ogTLdzd4/3dxJyoQWeAmyZjPwg2glE/DEy+WQ=
X-Google-Smtp-Source: ALg8bN7XeMIiN5Ooh0D2oPbL9AdUJ7WQGuaKE9UPif1bthwozB5VMjrVK4YSU+rY3l2LGv3CCxcY9t2gCqLc6MLsv50=
X-Received: by 2002:a1f:a28a:: with SMTP id l132mr11245191vke.37.1548796364492; 
 Tue, 29 Jan 2019 13:12:44 -0800 (PST)
MIME-Version: 1.0
From: Gawen ARAB <g@wenarab.com>
Date: Tue, 29 Jan 2019 22:12:33 +0100
Message-ID: <CADjxVNq-PPTrzd9qDZK+ZFF8v70eme8n87xBK-77e=PNMGCQwg@mail.gmail.com>
Subject: wirehub - decentralized, peer-to-peer and secure overlay networks
 built with WireGuard
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
Content-Type: multipart/mixed; boundary="===============5657712573546300398=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5657712573546300398==
Content-Type: multipart/alternative; boundary="0000000000002295fb05809f4111"

--0000000000002295fb05809f4111
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I've been giving my free time on a side project called WireHub
(https://github.com/gawen/wirehub), which is a simple tool to build
decentralized, peer-to-peer and secure overlay networks. It dynamically
configures WireGuard tunnels, discoverying peers' endpoints via a
authenticated
DHT, going through NATs, and relaying the WireGuard traffic if no P2P
communication is possible.

Overlay networks are defined by a single human-readable file which lists th=
e
hostname and public key for each nodes of the network. Here's an example:

    name test               # network name is 'test'
    subnet 10.0.42.0/24     # overlay subnetwork is 10.0.42.0/24
    workbit 8               # PoW parameter for DHT security

    # a public bootstrap node
    boot P17zMwXJFbBdJEn05RFIMADw9TX5_m2xgf31OgNKX3w bootstrap.wirehub.io

    # Add trusted node 'a.test' to the overlay network.
    # Each trusted node are at least identified by an human-readable
hostname
    # and a base64 public key.
    trust a.test KJ7YGrBeqLLm_JJ1huIS26OnqAVFy57z5UJqjyMagW4

    # If the endpoint of a peer is static, it might be set after the public
key.
    # Note that this is optional, as endpoints can be dynamically found in
the
    # DHT.
    trust b.test eIix5ldvqDzOIrG9ViKTe9TSBlF4g9nUwKi20C06hFM 12.34.56.78

    # By default WireHub assigns nodes an (overlay) private IP, but a stati=
c
    # private IP might be defined
    trust c.test 10.0.42.254 kKZzuIm11zkBSHL9ETRwEthIBbLTvz840F_k4mhI_Hs
    ...

To start a peer,

    # wh up ./config private-key ./sk

When a network is up, the node's hostnames are resolved in userland.

    # ping b.test
    PING 10.0.42.2 (10.0.42.2): 56 data bytes
    64 bytes from 10.0.42.2: seq=3D0 ttl=3D64 time=3D106.801 ms
    64 bytes from 10.0.42.2: seq=3D1 ttl=3D64 time=3D49.778 ms

WireGuard and WireHub uses the same Curve25519 key. WireHub keys must be
generated with `wh genkey`, which adds a Proof-of-Work to the generation of
the
Curve25519 key, in order to mitigate Sybil attacks on the DHT. A high
workbit
will require more work to generate a valid key.

    # wh genkey workbit 8       # fast
    MFaqLuutFvNs79Xc9zhOUofIbL3xSLz1uo+RB1xB73s=3D
    # wh genkey workbit 8 | wh pubkey | wh workbit
    8
    # wh genkey workbit 16      # will take more time to generate
    kLfotsCIfB/7OcDGeLenptfy2Dzav9wmVZjVQ0Gvnk0=3D
    # wh genkey workbit 16 | wh pubkey | wh workbit
    16

    # wg genkey | wh pubkey | wh workbit    # WireGuard keys have 0 workbit
    0

Under the hood, WireHub runs its own UDP protocol, binding the same UDP por=
t
than the WireGuard interface (for NAT trasversal technique reasons). It
does so using
libpcap. The first byte of a WireHub packet is 0xff, which corresponds to a=
n
invalid WireGuard packet with message type outside the valid range
0x00-0x03.

WireHub currently authenticates its packets with a custom cryptographic
scheme
based on the node's keys. In the future, it might be better to tunnel
WireHub
packets through WireGuard, yet I'm not sure how to do that simply at the
moment,
as WireHub packets are not IP packets but more like authenticated messages.

There's much room for improvement (security, allowed-ips management, more
UDP
hole punching techniques, faster relaying), but it's usable. Docker images
are
provided to ease quick starting.

Feel free to test and give some feedbacks!

Also, I'll be at FOSDEM 2019 next week-end, so see you there! =F0=9F=8D=BA

Gawen

--0000000000002295fb05809f4111
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<br><br>I&#39;ve been giving my fre=
e time on a side project called WireHub<br>(<a href=3D"https://github.com/g=
awen/wirehub">https://github.com/gawen/wirehub</a>), which is a simple tool=
 to build<br>decentralized, peer-to-peer and secure overlay networks. It dy=
namically<br>configures WireGuard tunnels, discoverying peers&#39; endpoint=
s via a authenticated<br>DHT, going through NATs, and relaying the WireGuar=
d traffic if no P2P<br>communication is possible.<br><br>Overlay networks a=
re defined by a single human-readable file which lists the<br>hostname and =
public key for each nodes of the network. Here&#39;s an example:<br><br>=C2=
=A0=C2=A0=C2=A0 name test=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # network name is &#39;test&#39;<br>=
=C2=A0=C2=A0=C2=A0 subnet <a href=3D"http://10.0.42.0/24">10.0.42.0/24</a>=
=C2=A0=C2=A0=C2=A0=C2=A0 # overlay subnetwork is <a href=3D"http://10.0.42.=
0/24">10.0.42.0/24</a><br>=C2=A0=C2=A0=C2=A0 workbit 8=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # PoW param=
eter for DHT security<br><br>=C2=A0=C2=A0=C2=A0 # a public bootstrap node<b=
r>=C2=A0=C2=A0=C2=A0 boot P17zMwXJFbBdJEn05RFIMADw9TX5_m2xgf31OgNKX3w <a hr=
ef=3D"http://bootstrap.wirehub.io">bootstrap.wirehub.io</a><br><br>=C2=A0=
=C2=A0=C2=A0 # Add trusted node &#39;a.test&#39; to the overlay network.<br=
>=C2=A0=C2=A0=C2=A0 # Each trusted node are at least identified by an human=
-readable hostname<br>=C2=A0=C2=A0=C2=A0 # and a base64 public key.<br>=C2=
=A0=C2=A0=C2=A0 trust a.test KJ7YGrBeqLLm_JJ1huIS26OnqAVFy57z5UJqjyMagW4<br=
><br>=C2=A0=C2=A0=C2=A0 # If the endpoint of a peer is static, it might be =
set after the public key.<br>=C2=A0=C2=A0=C2=A0 # Note that this is optiona=
l, as endpoints can be dynamically found in the<br>=C2=A0=C2=A0=C2=A0 # DHT=
.<br>=C2=A0=C2=A0=C2=A0 trust b.test eIix5ldvqDzOIrG9ViKTe9TSBlF4g9nUwKi20C=
06hFM 12.34.56.78<br><br>=C2=A0=C2=A0=C2=A0 # By default WireHub assigns no=
des an (overlay) private IP, but a static<br>=C2=A0=C2=A0=C2=A0 # private I=
P might be defined<br>=C2=A0=C2=A0=C2=A0 trust c.test 10.0.42.254 kKZzuIm11=
zkBSHL9ETRwEthIBbLTvz840F_k4mhI_Hs<br>=C2=A0=C2=A0=C2=A0 ...<br><br>To star=
t a peer,<br><br>=C2=A0=C2=A0=C2=A0 # wh up ./config private-key ./sk<br><b=
r>When a network is up, the node&#39;s hostnames are resolved in userland.<=
br><br>=C2=A0=C2=A0=C2=A0 # ping b.test<br>=C2=A0=C2=A0=C2=A0 PING 10.0.42.=
2 (10.0.42.2): 56 data bytes<br>=C2=A0=C2=A0=C2=A0 64 bytes from <a href=3D=
"http://10.0.42.2">10.0.42.2</a>: seq=3D0 ttl=3D64 time=3D106.801 ms<br>=C2=
=A0=C2=A0=C2=A0 64 bytes from <a href=3D"http://10.0.42.2">10.0.42.2</a>: s=
eq=3D1 ttl=3D64 time=3D49.778 ms<br><br>WireGuard and WireHub uses the same=
 Curve25519 key. WireHub keys must be<br>generated with `wh genkey`, which =
adds a Proof-of-Work to the generation of the<br>Curve25519 key, in order t=
o mitigate Sybil attacks on the DHT. A high workbit<br>will require more wo=
rk to generate a valid key.<br><br>=C2=A0=C2=A0=C2=A0 # wh genkey workbit 8=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # fast<br>=C2=A0=C2=A0=C2=A0 MFaqLuutF=
vNs79Xc9zhOUofIbL3xSLz1uo+RB1xB73s=3D<br>=C2=A0=C2=A0=C2=A0 # wh genkey wor=
kbit 8 | wh pubkey | wh workbit<br>=C2=A0=C2=A0=C2=A0 8<br>=C2=A0=C2=A0=C2=
=A0 # wh genkey workbit 16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # will take more t=
ime to generate<br>=C2=A0=C2=A0=C2=A0 kLfotsCIfB/7OcDGeLenptfy2Dzav9wmVZjVQ=
0Gvnk0=3D<br>=C2=A0=C2=A0=C2=A0 # wh genkey workbit 16 | wh pubkey | wh wor=
kbit<br>=C2=A0=C2=A0=C2=A0 16<br><br>=C2=A0=C2=A0=C2=A0 # wg genkey | wh pu=
bkey | wh workbit=C2=A0=C2=A0=C2=A0 # WireGuard keys have 0 workbit<br>=C2=
=A0=C2=A0=C2=A0 0<br><br>Under the hood, WireHub runs its own UDP protocol,=
 binding the same UDP port<br>than the WireGuard interface (for NAT trasver=
sal technique reasons). It does so using<br>libpcap. The first byte of a Wi=
reHub packet is 0xff, which corresponds to an<br>invalid WireGuard packet w=
ith message type outside the valid range 0x00-0x03.<br><br>WireHub currentl=
y authenticates its packets with a custom cryptographic scheme<br>based on =
the node&#39;s keys. In the future, it might be better to tunnel WireHub<br=
>packets through WireGuard, yet I&#39;m not sure how to do that simply at t=
he moment,<br>as WireHub packets are not IP packets but more like authentic=
ated messages.<br><br>There&#39;s much room for improvement (security, allo=
wed-ips management, more UDP<br>hole punching techniques, faster relaying),=
 but it&#39;s usable. Docker images are<br>provided to ease quick starting.=
<br><br>Feel free to test and give some feedbacks!<br><br>Also, I&#39;ll be=
 at FOSDEM 2019 next week-end, so see you there! =F0=9F=8D=BA<br><br>Gawen<=
/div></div>

--0000000000002295fb05809f4111--

--===============5657712573546300398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5657712573546300398==--
