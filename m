Return-Path: adriankoooo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aee24d6f
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 10:14:35 +0000 (UTC)
Received: from mail-io0-x233.google.com (mail-io0-x233.google.com
 [IPv6:2607:f8b0:4001:c06::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a8f0bfc
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 10:14:35 +0000 (UTC)
Received: by mail-io0-x233.google.com with SMTP id y12-v6so31466ioj.13
 for <wireguard@lists.zx2c4.com>; Mon, 03 Sep 2018 03:28:59 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
Date: Mon, 3 Sep 2018 12:28:48 +0200
Message-ID: <CA+Hw3eb7rEuDyuzq9dCj71KAYK3hRni0EDiz5j1ZpKjVwBo-Xg@mail.gmail.com>
Subject: Wireguard behind NAT
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="0000000000005bce910574f502fe"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000005bce910574f502fe
Content-Type: text/plain; charset="UTF-8"

Is there any way to connect to Wireguard behind a Carrier-grade NAT?

On SIDE_A I have a backup LTE connection, without proper public ip, only
dynamic ip and I server with Wireguard.

SIDE_A = mobile LTE connection, without public IP, behind carrier grade NAT
SIDE_A_SERVER = WIREGUARD (connecting to sideb.dyndns.org)

SIDE_B = VDSL with public ip + ddns (sideb.dyndns.org)
SIDE_B_SERVER = WIREGUARD (cannot connect to SIDE_A, because no public ip
on SIDE_A)

I heard of Wireguard-P2P, but it's not running on headless server, because
one of their component requires x11.


Best regards,
Adrian

--0000000000005bce910574f502fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"color:rgb(49,49,49);word-spacing:1px;background-color:rgb(25=
5,255,255)">Is there any way to connect to Wireguard behind a Carrier-grade=
 NAT?=C2=A0</span><div style=3D"color:rgb(49,49,49);word-spacing:1px" dir=
=3D"auto"><br></div><div style=3D"font-size:1rem;color:rgb(49,49,49);word-s=
pacing:1px" dir=3D"auto">On SIDE_A I have a backup LTE connection, without =
proper public ip, only dynamic ip and I server with Wireguard.=C2=A0</div><=
div style=3D"color:rgb(49,49,49);word-spacing:1px" dir=3D"auto"><br></div><=
div style=3D"font-size:1rem;color:rgb(49,49,49);word-spacing:1px" dir=3D"au=
to">SIDE_A =3D mobile LTE connection, without public IP, behind carrier gra=
de NAT=C2=A0</div><div style=3D"font-size:1rem;color:rgb(49,49,49);word-spa=
cing:1px" dir=3D"auto">SIDE_A_SERVER =3D WIREGUARD (connecting to=C2=A0<a h=
ref=3D"http://sideb.dyndns.org/" target=3D"_blank" style=3D"font-size:1rem"=
>sideb.dyndns.org</a>)=C2=A0</div><div style=3D"color:rgb(49,49,49);word-sp=
acing:1px" dir=3D"auto"><br></div><div style=3D"font-size:1rem;color:rgb(49=
,49,49);word-spacing:1px" dir=3D"auto">SIDE_B =3D VDSL with public ip + ddn=
s (<a href=3D"http://sideb.dyndns.org/" target=3D"_blank" style=3D"font-siz=
e:1rem">sideb.dyndns.org</a>)=C2=A0</div><div style=3D"font-size:1rem;color=
:rgb(49,49,49);word-spacing:1px" dir=3D"auto">SIDE_B_SERVER =3D WIREGUARD (=
cannot connect to SIDE_A, because no public ip on SIDE_A)=C2=A0</div><div s=
tyle=3D"color:rgb(49,49,49);word-spacing:1px" dir=3D"auto"><br></div><div s=
tyle=3D"color:rgb(49,49,49);word-spacing:1px" dir=3D"auto">I heard of Wireg=
uard-P2P, but it&#39;s not running on headless server, because one of their=
 component requires x11.=C2=A0</div><div style=3D"color:rgb(49,49,49);word-=
spacing:1px" dir=3D"auto"><br></div><div style=3D"color:rgb(49,49,49);word-=
spacing:1px" dir=3D"auto"><br></div><div style=3D"font-size:1rem;color:rgb(=
49,49,49);word-spacing:1px" dir=3D"auto">Best regards,=C2=A0</div><div styl=
e=3D"font-size:1rem;color:rgb(49,49,49);word-spacing:1px" dir=3D"auto">Adri=
an</div>

--0000000000005bce910574f502fe--
