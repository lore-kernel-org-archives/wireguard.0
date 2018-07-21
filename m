Return-Path: logcabin@fastmail.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b5d334a
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 21:39:10 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46342d4f
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 21:39:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 328A72147B
 for <wireguard@lists.zx2c4.com>; Sat, 21 Jul 2018 17:47:59 -0400 (EDT)
Message-Id: <1532209678.585688.1448515984.39AF7871@webmail.messagingengine.com>
From: logcabin@fastmail.net
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_----------=_15322096785856880"
Subject: Re: WireGuard on Docker
Date: Sat, 21 Jul 2018 17:47:58 -0400
In-Reply-To: <CAPDu8706B0ZHjqCk6rUfdD0DNC1Z1ADS6_z7Kc+60p3P26tSHQ@mail.gmail.com>
References: <CAPDu8706B0ZHjqCk6rUfdD0DNC1Z1ADS6_z7Kc+60p3P26tSHQ@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_15322096785856880
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

I'm wondering if the kernel module is loaded:

# modinfo wireguard


On Tue, Jul 10, 2018, at 4:16 AM, Mohammad Amir Heshmatkhah wrote:
> Hi,
> I want to run WireGuard on a docker container as server,
> I try difrent base Images but  I get this error message every time:
>=20
> [#] ip link add wg0 type wireguard
> RTNETLINK answers: Operation not supported
> Unable to access interface: Protocol not supported
> [#] ip link delete dev wg0
> Cannot find device "wg0"
>=20
> Here is 3 Dokerfiles I tried:
>=20
> FROM alpine:3.7
> RUN apk upgrade --update \
> && echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >>
> /etc/apk/repositories \> && apk add --no-cache bash wireguard-tools
>=20
> ENTRYPOINT [ "wg-quick", "up", "wg0" ]
>=20
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>=20
> FROM ubuntu:16.04
> RUN apt-get update && apt-get install -y software-properties-common
> apt-utils \> && add-apt-repository ppa:wireguard/wireguard \
> && apt-get update \
> && apt-get install -y iproute linux-headers-$(uname -r) wireguard-dkms
> wireguard-tools wireguard>=20
> ENTRYPOINT [ "wg-quick", "up", "wg0" ]
>=20
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>=20
> FROM debian:9
> RUN echo "deb http://deb.debian.org/debian/ unstable main" >
> /etc/apt/sources.list.d/unstable.list \> && printf 'Package: *\nPin: rele=
ase a=3Dunstable\nPin-Priority: 150\n' >
> /etc/apt/preferences.d/limit-unstable \> && apt-get update && apt-get ins=
tall -y wireguard
>=20
> ENTRYPOINT [ "wg-quick", "up", "wg0" ]
>=20
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>=20
> I run this containers with:
>=20
> sudo docker run -it -v $(pwd)/config:/etc/wireguard/ -v  /dev:/dev
> -v  /lib/modules:/lib/modules  --cap-add=3DALL --privileged <image
> name here>>=20
> where wg0.conf is located in " $(pwd)/config/wg0.conf" on host machine>=20
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>=20
> and here is my wg0.conf file:
>=20
> [Interface]
> Address =3D 172.26.10.1/24
> SaveConfig =3D true
> PrivateKey =3D <server private key here>
> ListenPort =3D 40540
>=20
> [Peer]
> PublicKey =3D <client public key here>
> AllowedIPs =3D 172.26.10.2/32
>=20
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>=20
> So, How can I fix this "*Unable to access interface: Protocol not
> supported*" error?> _________________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--_----------=_15322096785856880
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type=3D"text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
</head>
<body><div style=3D"font-family:Arial;">I'm wondering if the kernel module =
is loaded:<br></div>
<div style=3D"font-family:Arial;"><br></div>
<div style=3D"font-family:Arial;"># modinfo wireguard<br></div>
<div><br></div>
<div><br></div>
<div>On Tue, Jul 10, 2018, at 4:16 AM, Mohammad Amir Heshmatkhah wrote:<br>=
</div>
<blockquote type=3D"cite"><div dir=3D"ltr"><div style=3D"font-size:small;te=
xt-decoration-style:initial;text-decoration-color:initial;">Hi,<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">I want to run WireGuard on a docker container as server,<b=
r></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">I try difrent base Images but&nbsp; I get this error messa=
ge every time:<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">[#] ip link add wg0 type wireguard<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">RTNETLINK answers: Operation not supported<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">Unable to access interface: Protocol not supported<br></di=
v>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">[#] ip link delete dev wg0<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">Cannot find device "wg0"<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">Here is 3 Dokerfiles I tried:<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">FROM alpine:3.7<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">RUN apk upgrade --update \<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">&amp;&amp; echo<span>&nbsp;</span><a href=3D"http://dl-cdn=
.alpinelinux.org/alpine/edge/testing" style=3D"color:rgb(17, 85, 204);">htt=
p://dl-cdn.alpinelinux.org/alpine/edge/testing</a><span>&nbsp;</span>&gt;&g=
t; /etc/apk/repositories \<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">&amp;&amp; apk add --no-cache bash wireguard-tools<br></di=
v>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">ENTRYPOINT [ "wg-quick", "up", "wg0" ]<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">FROM ubuntu:16.04<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">RUN apt-get update &amp;&amp; apt-get install -y software-=
properties-common apt-utils \&nbsp;<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">&amp;&amp; add-apt-repository ppa:wireguard/wireguard \<br=
></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">&amp;&amp; apt-get update \<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">&amp;&amp; apt-get install -y iproute linux-headers-$(unam=
e -r) wireguard-dkms wireguard-tools wireguard<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">ENTRYPOINT [ "wg-quick", "up", "wg0" ]<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">FROM debian:9<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">RUN echo "deb<span>&nbsp;</span><a href=3D"http://deb.debi=
an.org/debian/" style=3D"color:rgb(17, 85, 204);">http://deb.debian.org/deb=
ian/</a><span>&nbsp;</span>unstable main" &gt; /etc/apt/sources.list.d/unst=
able.list \<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">&amp;&amp; printf 'Package: *\nPin: release a=3Dunstable\n=
Pin-Priority: 150\n' &gt; /etc/apt/preferences.d/limit-unstable \<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">&amp;&amp; apt-get update &amp;&amp; apt-get install -y wi=
reguard<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">ENTRYPOINT [ "wg-quick", "up", "wg0" ]<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">I run this containers with:<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">sudo docker run -it -v $(pwd)/config:/etc/wireguard/ -v&nb=
sp; /dev:/dev&nbsp; -v&nbsp; /lib/modules:/lib/modules&nbsp; --cap-add=3DAL=
L --privileged &lt;image name here&gt;<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">where wg0.conf is located in " $(pwd)/config/<span class=
=3D"highlight" style=3D"background-color:rgb(255, 255, 255)"><span class=3D=
"size" style=3D"font-size:small">wg0.conf</span></span>" on host machine<br=
></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">and here is my wg0.conf file:<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">[Interface]<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">Address =3D<span>&nbsp;</span><a href=3D"http://172.26.10.=
1/24" style=3D"color:rgb(17, 85, 204);">172.26.10.1/24</a><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">SaveConfig =3D true<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">PrivateKey =3D &lt;server private key here&gt;<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">ListenPort =3D 40540<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">[Peer]<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">PublicKey =3D &lt;client public key here&gt;<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">AllowedIPs =3D<span>&nbsp;</span><a href=3D"http://172.26.=
10.2/32" style=3D"color:rgb(17, 85, 204);">172.26.10.2/32</a><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-<br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;"><br></div>
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial;">So, How can I fix this "<b>Unable to access interface: Pro=
tocol not supported</b>" error?<br></div>
</div>
<div><u>_______________________________________________</u><br></div>
<div>WireGuard mailing list<br></div>
<div><a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com=
</a><br></div>
<div><a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard">https:/=
/lists.zx2c4.com/mailman/listinfo/wireguard</a><br></div>
</blockquote><div style=3D"font-family:Arial;"><br></div>
</body>
</html>

--_----------=_15322096785856880--
