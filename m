Return-Path: gbojsza@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5a90713
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 18:48:54 +0000 (UTC)
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45562826
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 18:48:54 +0000 (UTC)
Received: by mail-pg0-x231.google.com with SMTP id w8-v6so8011560pgp.7
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jun 2018 11:54:27 -0700 (PDT)
MIME-Version: 1.0
From: Glen Bojsza <gbojsza@gmail.com>
Date: Tue, 26 Jun 2018 11:54:15 -0700
Message-ID: <CACW8NbDjsbFxuoMZtUsBa8NDEe_bbdhZOFjeQNWgwLEeA4sc4A@mail.gmail.com>
Subject: Passing traffic through WG stopped working?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="000000000000fef1b3056f900615"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000fef1b3056f900615
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I have two routers, one is a wireguard server and the other is a wireguard
client.

Before traveling I tested the system and everything worked as expected.

I arrived at my destination, brought up the wireguard client router and
everything worked as expected.

After two days, suddenly wireguard client router no longer passes all
connected clients traffic over the wireguard vpn?

I confirmed that wg is up and connected to the wireguard server
router...also I remoted into the wireguard server router and confirmed from
that side that wg is up and connected.

But none of the clients that connect to the wireguard client router gets
routed over the vpn anymore?

I have checked the client network config file and I don=E2=80=99t see anyth=
ing
wrong (nothing should have changed since I am the only one that has access)=
.

Any ideas or suggestions would be appreciated.

Thanks,

Glen

--000000000000fef1b3056f900615
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I have two routers, one is a wireguard server and the other is a wireguard=
 client.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Before travelin=
g I tested the system and everything worked as expected.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I arrived at my destination, brought up th=
e wireguard client router and everything worked as expected.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">After two days, suddenly wireguard cl=
ient router no longer passes all connected clients traffic over the wiregua=
rd vpn?</div><div dir=3D"auto"><br></div><div dir=3D"auto">I confirmed that=
 wg is up and connected to the wireguard server router...also I remoted int=
o the wireguard server router and confirmed from that side that wg is up an=
d connected.</div><div dir=3D"auto"><br></div><div dir=3D"auto">But none of=
 the clients that connect to the wireguard client router gets routed over t=
he vpn anymore?</div><div dir=3D"auto"><br></div><div dir=3D"auto">I have c=
hecked the client network config file and I don=E2=80=99t see anything wron=
g (nothing should have changed since I am the only one that has access).</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Any ideas or suggestions w=
ould be appreciated.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Glen</div>

--000000000000fef1b3056f900615--
