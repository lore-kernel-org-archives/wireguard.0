Return-Path: adriankoooo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a60b07dd
 for <wireguard@lists.zx2c4.com>; Sun, 2 Sep 2018 19:37:16 +0000 (UTC)
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b462beff
 for <wireguard@lists.zx2c4.com>; Sun, 2 Sep 2018 19:37:16 +0000 (UTC)
Received: by mail-io0-x232.google.com with SMTP id v14-v6so14350766iob.4
 for <wireguard@lists.zx2c4.com>; Sun, 02 Sep 2018 12:51:36 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
Date: Sun, 2 Sep 2018 21:51:24 +0200
Message-ID: <CA+Hw3eaWT76rB1eAEVM4DOMr_t3GkU07crF_aq8x8Vkww-DeZg@mail.gmail.com>
Subject: Wireguard behind NAT
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000009127a20574e8c038"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000009127a20574e8c038
Content-Type: text/plain; charset="UTF-8"

Is there any way to connect to Wireguard behind a Carrier-grade NAT?

On SIDE_A I have a backup LTE connection, without proper public ip, only
dynamic ip and I server with Wireguard.

SIDE_A = mobile LTE connection, without public IP, behind carrier grade NAT
SIDE_A_SERVER = WIREGUARD (connecting to sideb.dyndns.org)

SIDE_B = VDSL with public ip + ddns (sideb.dyndns.org)
SIDE_B_SERVER = WIREGUARD (cannot connect to SIDE_A, because no public ip
on SIDE_A)


Best regards,
Adrian

--0000000000009127a20574e8c038
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there any way to connect to Wireguard behind a Carrier-=
grade NAT?=C2=A0<div><br></div><div>On SIDE_A I have a backup LTE connectio=
n, without proper public ip, only dynamic ip and I server with Wireguard.=
=C2=A0</div><div><br></div><div>SIDE_A =3D mobile LTE connection, without p=
ublic IP, behind carrier grade NAT=C2=A0</div><div>SIDE_A_SERVER =3D WIREGU=
ARD (connecting to <a href=3D"http://sideb.dyndns.org">sideb.dyndns.org</a>=
)=C2=A0</div><div><br></div><div>SIDE_B =3D VDSL with public ip + ddns (<a =
href=3D"http://sideb.dyndns.org">sideb.dyndns.org</a>)=C2=A0</div><div>SIDE=
_B_SERVER =3D WIREGUARD (cannot connect to SIDE_A, because no public ip on =
SIDE_A)=C2=A0</div><div><br></div><div><br></div><div>Best regards,=C2=A0</=
div><div>Adrian</div></div>

--0000000000009127a20574e8c038--
