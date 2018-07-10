Return-Path: maheshmatkhah.soft@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d15a284a
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 08:09:45 +0000 (UTC)
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8173ce7
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 08:09:45 +0000 (UTC)
Received: by mail-ua0-x22d.google.com with SMTP id x24-v6so13422966ual.10
 for <wireguard@lists.zx2c4.com>; Tue, 10 Jul 2018 01:17:05 -0700 (PDT)
MIME-Version: 1.0
From: Mohammad Amir Heshmatkhah <maheshmatkhah.soft@gmail.com>
Date: Tue, 10 Jul 2018 12:46:28 +0430
Message-ID: <CAPDu8706B0ZHjqCk6rUfdD0DNC1Z1ADS6_z7Kc+60p3P26tSHQ@mail.gmail.com>
Subject: WireGuard on Docker
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000005216bf0570a0c11f"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000005216bf0570a0c11f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I want to run WireGuard on a docker container as server,
I try difrent base Images but  I get this error message every time:

[#] ip link add wg0 type wireguard
RTNETLINK answers: Operation not supported
Unable to access interface: Protocol not supported
[#] ip link delete dev wg0
Cannot find device "wg0"

Here is 3 Dokerfiles I tried:

FROM alpine:3.7
RUN apk upgrade --update \
&& echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >>
/etc/apk/repositories \
&& apk add --no-cache bash wireguard-tools

ENTRYPOINT [ "wg-quick", "up", "wg0" ]

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94-

FROM ubuntu:16.04
RUN apt-get update && apt-get install -y software-properties-common
apt-utils \
&& add-apt-repository ppa:wireguard/wireguard \
&& apt-get update \
&& apt-get install -y iproute linux-headers-$(uname -r) wireguard-dkms
wireguard-tools wireguard

ENTRYPOINT [ "wg-quick", "up", "wg0" ]

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94-

FROM debian:9
RUN echo "deb http://deb.debian.org/debian/ unstable main" >
/etc/apt/sources.list.d/unstable.list \
&& printf 'Package: *\nPin: release a=3Dunstable\nPin-Priority: 150\n' >
/etc/apt/preferences.d/limit-unstable \
&& apt-get update && apt-get install -y wireguard

ENTRYPOINT [ "wg-quick", "up", "wg0" ]

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94-

I run this containers with:

sudo docker run -it -v $(pwd)/config:/etc/wireguard/ -v  /dev:/dev  -v
/lib/modules:/lib/modules  --cap-add=3DALL --privileged <image name here>

where wg0.conf is located in " $(pwd)/config/wg0.conf" on host machine

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94-

and here is my wg0.conf file:

[Interface]
Address =3D 172.26.10.1/24
SaveConfig =3D true
PrivateKey =3D <server private key here>
ListenPort =3D 40540

[Peer]
PublicKey =3D <client public key here>
AllowedIPs =3D 172.26.10.2/32

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94-

So, How can I fix this "*Unable to access interface: Protocol not supported=
*"
error?

--0000000000005216bf0570a0c11f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:small;text-decoration-style:initia=
l;text-decoration-color:initial">Hi,</div><div style=3D"font-size:small;tex=
t-decoration-style:initial;text-decoration-color:initial">I want to run Wir=
eGuard on a docker container as server,</div><div style=3D"font-size:small;=
text-decoration-style:initial;text-decoration-color:initial">I try difrent =
base Images but=C2=A0 I get this error message every time:</div><div style=
=3D"font-size:small;text-decoration-style:initial;text-decoration-color:ini=
tial"><br></div><div style=3D"font-size:small;text-decoration-style:initial=
;text-decoration-color:initial">[#] ip link add wg0 type wireguard</div><di=
v style=3D"font-size:small;text-decoration-style:initial;text-decoration-co=
lor:initial">RTNETLINK answers: Operation not supported</div><div style=3D"=
font-size:small;text-decoration-style:initial;text-decoration-color:initial=
">Unable to access interface: Protocol not supported</div><div style=3D"fon=
t-size:small;text-decoration-style:initial;text-decoration-color:initial">[=
#] ip link delete dev wg0</div><div style=3D"font-size:small;text-decoratio=
n-style:initial;text-decoration-color:initial">Cannot find device &quot;wg0=
&quot;</div><div style=3D"font-size:small;text-decoration-style:initial;tex=
t-decoration-color:initial"><br></div><div style=3D"font-size:small;text-de=
coration-style:initial;text-decoration-color:initial">Here is 3 Dokerfiles =
I tried:</div><div style=3D"font-size:small;text-decoration-style:initial;t=
ext-decoration-color:initial"><br></div><div style=3D"font-size:small;text-=
decoration-style:initial;text-decoration-color:initial">FROM alpine:3.7</di=
v><div style=3D"font-size:small;text-decoration-style:initial;text-decorati=
on-color:initial">RUN apk upgrade --update \</div><div style=3D"font-size:s=
mall;text-decoration-style:initial;text-decoration-color:initial">&amp;&amp=
; echo<span>=C2=A0</span><a href=3D"http://dl-cdn.alpinelinux.org/alpine/ed=
ge/testing" target=3D"_blank" style=3D"color:rgb(17,85,204)">http://dl-cdn.=
alpinelinux.org/alpine/edge/testing</a><span>=C2=A0</span>&gt;&gt; /etc/apk=
/repositories \</div><div style=3D"font-size:small;text-decoration-style:in=
itial;text-decoration-color:initial">&amp;&amp; apk add --no-cache bash wir=
eguard-tools</div><div style=3D"font-size:small;text-decoration-style:initi=
al;text-decoration-color:initial"><br></div><div style=3D"font-size:small;t=
ext-decoration-style:initial;text-decoration-color:initial">ENTRYPOINT [ &q=
uot;wg-quick&quot;, &quot;up&quot;, &quot;wg0&quot; ]</div><div style=3D"fo=
nt-size:small;text-decoration-style:initial;text-decoration-color:initial">=
<br></div><div style=3D"font-size:small;text-decoration-style:initial;text-=
decoration-color:initial">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-</div><div sty=
le=3D"font-size:small;text-decoration-style:initial;text-decoration-color:i=
nitial"><br></div><div style=3D"font-size:small;text-decoration-style:initi=
al;text-decoration-color:initial">FROM ubuntu:16.04</div><div style=3D"font=
-size:small;text-decoration-style:initial;text-decoration-color:initial">RU=
N apt-get update &amp;&amp; apt-get install -y software-properties-common a=
pt-utils \=C2=A0</div><div style=3D"font-size:small;text-decoration-style:i=
nitial;text-decoration-color:initial">&amp;&amp; add-apt-repository ppa:wir=
eguard/wireguard \</div><div style=3D"font-size:small;text-decoration-style=
:initial;text-decoration-color:initial">&amp;&amp; apt-get update \</div><d=
iv style=3D"font-size:small;text-decoration-style:initial;text-decoration-c=
olor:initial">&amp;&amp; apt-get install -y iproute linux-headers-$(uname -=
r) wireguard-dkms wireguard-tools wireguard</div><div style=3D"font-size:sm=
all;text-decoration-style:initial;text-decoration-color:initial"><br></div>=
<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial">ENTRYPOINT [ &quot;wg-quick&quot;, &quot;up&quot;, &quot;wg=
0&quot; ]</div><div style=3D"font-size:small;text-decoration-style:initial;=
text-decoration-color:initial"><br></div><div style=3D"font-size:small;text=
-decoration-style:initial;text-decoration-color:initial">=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94-</div><div style=3D"font-size:small;text-decoration-style:i=
nitial;text-decoration-color:initial"><br></div><div style=3D"font-size:sma=
ll;text-decoration-style:initial;text-decoration-color:initial">FROM debian=
:9</div><div style=3D"font-size:small;text-decoration-style:initial;text-de=
coration-color:initial">RUN echo &quot;deb<span>=C2=A0</span><a href=3D"htt=
p://deb.debian.org/debian/" target=3D"_blank" style=3D"color:rgb(17,85,204)=
">http://deb.debian.org/debian/</a><span>=C2=A0</span>unstable main&quot; &=
gt; /etc/apt/sources.list.d/unstable.list \</div><div style=3D"font-size:sm=
all;text-decoration-style:initial;text-decoration-color:initial">&amp;&amp;=
 printf &#39;Package: *\nPin: release a=3Dunstable\nPin-Priority: 150\n&#39=
; &gt; /etc/apt/preferences.d/limit-unstable \</div><div style=3D"font-size=
:small;text-decoration-style:initial;text-decoration-color:initial">&amp;&a=
mp; apt-get update &amp;&amp; apt-get install -y wireguard</div><div style=
=3D"font-size:small;text-decoration-style:initial;text-decoration-color:ini=
tial"><br></div><div style=3D"font-size:small;text-decoration-style:initial=
;text-decoration-color:initial">ENTRYPOINT [ &quot;wg-quick&quot;, &quot;up=
&quot;, &quot;wg0&quot; ]</div><div style=3D"font-size:small;text-decoratio=
n-style:initial;text-decoration-color:initial"><br></div><div style=3D"font=
-size:small;text-decoration-style:initial;text-decoration-color:initial">=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94-</div><div style=3D"font-size:small;text-=
decoration-style:initial;text-decoration-color:initial"><br></div><div styl=
e=3D"font-size:small;text-decoration-style:initial;text-decoration-color:in=
itial">I run this containers with:</div><div style=3D"font-size:small;text-=
decoration-style:initial;text-decoration-color:initial"><br></div><div styl=
e=3D"font-size:small;text-decoration-style:initial;text-decoration-color:in=
itial">sudo docker run -it -v $(pwd)/config:/etc/wireguard/ -v=C2=A0 /dev:/=
dev=C2=A0 -v=C2=A0 /lib/modules:/lib/modules=C2=A0 --cap-add=3DALL --privil=
eged &lt;image name here&gt;</div><div style=3D"font-size:small;text-decora=
tion-style:initial;text-decoration-color:initial"><br></div><div style=3D"f=
ont-size:small;text-decoration-style:initial;text-decoration-color:initial"=
>where wg0.conf is located in &quot; $(pwd)/config/<span style=3D"font-size=
:small;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">wg0.conf</span>&quot; =
on host machine</div><div style=3D"font-size:small;text-decoration-style:in=
itial;text-decoration-color:initial"><br></div><div style=3D"font-size:smal=
l;text-decoration-style:initial;text-decoration-color:initial">=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94-</div><div style=3D"font-size:small;text-decoration-s=
tyle:initial;text-decoration-color:initial"><br></div><div style=3D"font-si=
ze:small;text-decoration-style:initial;text-decoration-color:initial">and h=
ere is my wg0.conf file:</div><div style=3D"font-size:small;text-decoration=
-style:initial;text-decoration-color:initial"><br></div><div style=3D"font-=
size:small;text-decoration-style:initial;text-decoration-color:initial">[In=
terface]</div><div style=3D"font-size:small;text-decoration-style:initial;t=
ext-decoration-color:initial">Address =3D<span>=C2=A0</span><a href=3D"http=
://172.26.10.1/24" target=3D"_blank" style=3D"color:rgb(17,85,204)">172.26.=
10.1/24</a></div><div style=3D"font-size:small;text-decoration-style:initia=
l;text-decoration-color:initial">SaveConfig =3D true</div><div style=3D"fon=
t-size:small;text-decoration-style:initial;text-decoration-color:initial">P=
rivateKey =3D &lt;server private key here&gt;</div><div style=3D"font-size:=
small;text-decoration-style:initial;text-decoration-color:initial">ListenPo=
rt =3D 40540</div><div style=3D"font-size:small;text-decoration-style:initi=
al;text-decoration-color:initial"><br></div><div style=3D"font-size:small;t=
ext-decoration-style:initial;text-decoration-color:initial">[Peer]</div><di=
v style=3D"font-size:small;text-decoration-style:initial;text-decoration-co=
lor:initial">PublicKey =3D &lt;client public key here&gt;</div><div style=
=3D"font-size:small;text-decoration-style:initial;text-decoration-color:ini=
tial">AllowedIPs =3D<span>=C2=A0</span><a href=3D"http://172.26.10.2/32" ta=
rget=3D"_blank" style=3D"color:rgb(17,85,204)">172.26.10.2/32</a></div><div=
 style=3D"font-size:small;text-decoration-style:initial;text-decoration-col=
or:initial"><br></div><div style=3D"font-size:small;text-decoration-style:i=
nitial;text-decoration-color:initial">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-</=
div><div style=3D"font-size:small;text-decoration-style:initial;text-decora=
tion-color:initial"><br></div><div style=3D"font-size:small;text-decoration=
-style:initial;text-decoration-color:initial">So, How can I fix this &quot;=
<b>Unable to access interface: Protocol not supported</b>&quot; error?</div=
><br></div>

--0000000000005216bf0570a0c11f--
