Return-Path: hegyi.mokka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52bfb062
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jul 2018 06:36:08 +0000 (UTC)
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 943d0450
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jul 2018 06:36:08 +0000 (UTC)
Received: by mail-it0-x22d.google.com with SMTP id p17-v6so19658337itc.2
 for <wireguard@lists.zx2c4.com>; Sat, 21 Jul 2018 23:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDu8706B0ZHjqCk6rUfdD0DNC1Z1ADS6_z7Kc+60p3P26tSHQ@mail.gmail.com>
 <CAJqFBzwF-3jvB9yNqcQdcn9qp_i2xPua1fjeVoY7a-j0es=VYw@mail.gmail.com>
In-Reply-To: <CAJqFBzwF-3jvB9yNqcQdcn9qp_i2xPua1fjeVoY7a-j0es=VYw@mail.gmail.com>
From: Zsolt Hegyi <hegyi.mokka@gmail.com>
Date: Sun, 22 Jul 2018 08:44:47 +0200
Message-ID: <CAJqFBzymAkoh60A=PYWnx5-ZCVY19+uQ3uNnhHhCSU40TU5FZg@mail.gmail.com>
Subject: Re: WireGuard on Docker
To: Mohammad Amir Heshmatkhah <maheshmatkhah.soft@gmail.com>,
 wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="00000000000019ae4e057190de0a"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000019ae4e057190de0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC'ing the list as well.

On Sun, 22 Jul 2018, 08:43 Zsolt Hegyi, <hegyi.mokka@gmail.com> wrote:

> Hi Mohammad,
>
> You need to load the WireGuard kernel module on your host OS, not inside
> the containers. All containers "share" and run on the same kernel as the
> host OS does.
>
> Best regards,
> Zsolt
>
>
> On Sat, 21 Jul 2018, 23:34 Mohammad Amir Heshmatkhah, <
> maheshmatkhah.soft@gmail.com> wrote:
>
>> Hi,
>> I want to run WireGuard on a docker container as server,
>> I try difrent base Images but  I get this error message every time:
>>
>> [#] ip link add wg0 type wireguard
>> RTNETLINK answers: Operation not supported
>> Unable to access interface: Protocol not supported
>> [#] ip link delete dev wg0
>> Cannot find device "wg0"
>>
>> Here is 3 Dokerfiles I tried:
>>
>> FROM alpine:3.7
>> RUN apk upgrade --update \
>> && echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >>
>> /etc/apk/repositories \
>> && apk add --no-cache bash wireguard-tools
>>
>> ENTRYPOINT [ "wg-quick", "up", "wg0" ]
>>
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>>
>> FROM ubuntu:16.04
>> RUN apt-get update && apt-get install -y software-properties-common
>> apt-utils \
>> && add-apt-repository ppa:wireguard/wireguard \
>> && apt-get update \
>> && apt-get install -y iproute linux-headers-$(uname -r) wireguard-dkms
>> wireguard-tools wireguard
>>
>> ENTRYPOINT [ "wg-quick", "up", "wg0" ]
>>
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>>
>> FROM debian:9
>> RUN echo "deb http://deb.debian.org/debian/ unstable main" >
>> /etc/apt/sources.list.d/unstable.list \
>> && printf 'Package: *\nPin: release a=3Dunstable\nPin-Priority: 150\n' >
>> /etc/apt/preferences.d/limit-unstable \
>> && apt-get update && apt-get install -y wireguard
>>
>> ENTRYPOINT [ "wg-quick", "up", "wg0" ]
>>
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>>
>> I run this containers with:
>>
>> sudo docker run -it -v $(pwd)/config:/etc/wireguard/ -v  /dev:/dev  -v
>> /lib/modules:/lib/modules  --cap-add=3DALL --privileged <image name here=
>
>>
>> where wg0.conf is located in " $(pwd)/config/wg0.conf" on host machine
>>
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>>
>> and here is my wg0.conf file:
>>
>> [Interface]
>> Address =3D 172.26.10.1/24
>> SaveConfig =3D true
>> PrivateKey =3D <server private key here>
>> ListenPort =3D 40540
>>
>> [Peer]
>> PublicKey =3D <client public key here>
>> AllowedIPs =3D 172.26.10.2/32
>>
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>>
>> So, How can I fix this "*Unable to access interface: Protocol not
>> supported*" error?
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>

--00000000000019ae4e057190de0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC&#39;ing the list as well.<br><br><div class=3D"gmail_quote"><div dir=3D"=
ltr">On Sun, 22 Jul 2018, 08:43 Zsolt Hegyi, &lt;<a href=3D"mailto:hegyi.mo=
kka@gmail.com">hegyi.mokka@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Hi Mohammad,<div><br></div><div>You need to load the WireG=
uard kernel module on your host OS, not inside the containers. All containe=
rs &quot;share&quot; and run on the same kernel as the host OS does.</div><=
div><br></div><div>Best regards,</div><div>Zsolt</div><div><br><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Sat, 21 Jul 2018, 23:34 Mohammad Ami=
r Heshmatkhah, &lt;<a href=3D"mailto:maheshmatkhah.soft@gmail.com" target=
=3D"_blank">maheshmatkhah.soft@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div style=3D"font-size:small;text-de=
coration-style:initial;text-decoration-color:initial">Hi,</div><div style=
=3D"font-size:small;text-decoration-style:initial;text-decoration-color:ini=
tial">I want to run WireGuard on a docker container as server,</div><div st=
yle=3D"font-size:small;text-decoration-style:initial;text-decoration-color:=
initial">I try difrent base Images but=C2=A0 I get this error message every=
 time:</div><div style=3D"font-size:small;text-decoration-style:initial;tex=
t-decoration-color:initial"><br></div><div style=3D"font-size:small;text-de=
coration-style:initial;text-decoration-color:initial">[#] ip link add wg0 t=
ype wireguard</div><div style=3D"font-size:small;text-decoration-style:init=
ial;text-decoration-color:initial">RTNETLINK answers: Operation not support=
ed</div><div style=3D"font-size:small;text-decoration-style:initial;text-de=
coration-color:initial">Unable to access interface: Protocol not supported<=
/div><div style=3D"font-size:small;text-decoration-style:initial;text-decor=
ation-color:initial">[#] ip link delete dev wg0</div><div style=3D"font-siz=
e:small;text-decoration-style:initial;text-decoration-color:initial">Cannot=
 find device &quot;wg0&quot;</div><div style=3D"font-size:small;text-decora=
tion-style:initial;text-decoration-color:initial"><br></div><div style=3D"f=
ont-size:small;text-decoration-style:initial;text-decoration-color:initial"=
>Here is 3 Dokerfiles I tried:</div><div style=3D"font-size:small;text-deco=
ration-style:initial;text-decoration-color:initial"><br></div><div style=3D=
"font-size:small;text-decoration-style:initial;text-decoration-color:initia=
l">FROM alpine:3.7</div><div style=3D"font-size:small;text-decoration-style=
:initial;text-decoration-color:initial">RUN apk upgrade --update \</div><di=
v style=3D"font-size:small;text-decoration-style:initial;text-decoration-co=
lor:initial">&amp;&amp; echo<span>=C2=A0</span><a href=3D"http://dl-cdn.alp=
inelinux.org/alpine/edge/testing" style=3D"color:rgb(17,85,204)" target=3D"=
_blank">http://dl-cdn.alpinelinux.org/alpine/edge/testing</a><span>=C2=A0</=
span>&gt;&gt; /etc/apk/repositories \</div><div style=3D"font-size:small;te=
xt-decoration-style:initial;text-decoration-color:initial">&amp;&amp; apk a=
dd --no-cache bash wireguard-tools</div><div style=3D"font-size:small;text-=
decoration-style:initial;text-decoration-color:initial"><br></div><div styl=
e=3D"font-size:small;text-decoration-style:initial;text-decoration-color:in=
itial">ENTRYPOINT [ &quot;wg-quick&quot;, &quot;up&quot;, &quot;wg0&quot; ]=
</div><div style=3D"font-size:small;text-decoration-style:initial;text-deco=
ration-color:initial"><br></div><div style=3D"font-size:small;text-decorati=
on-style:initial;text-decoration-color:initial">=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94-</div><div style=3D"font-size:small;text-decoration-style:initial;te=
xt-decoration-color:initial"><br></div><div style=3D"font-size:small;text-d=
ecoration-style:initial;text-decoration-color:initial">FROM ubuntu:16.04</d=
iv><div style=3D"font-size:small;text-decoration-style:initial;text-decorat=
ion-color:initial">RUN apt-get update &amp;&amp; apt-get install -y softwar=
e-properties-common apt-utils \=C2=A0</div><div style=3D"font-size:small;te=
xt-decoration-style:initial;text-decoration-color:initial">&amp;&amp; add-a=
pt-repository ppa:wireguard/wireguard \</div><div style=3D"font-size:small;=
text-decoration-style:initial;text-decoration-color:initial">&amp;&amp; apt=
-get update \</div><div style=3D"font-size:small;text-decoration-style:init=
ial;text-decoration-color:initial">&amp;&amp; apt-get install -y iproute li=
nux-headers-$(uname -r) wireguard-dkms wireguard-tools wireguard</div><div =
style=3D"font-size:small;text-decoration-style:initial;text-decoration-colo=
r:initial"><br></div><div style=3D"font-size:small;text-decoration-style:in=
itial;text-decoration-color:initial">ENTRYPOINT [ &quot;wg-quick&quot;, &qu=
ot;up&quot;, &quot;wg0&quot; ]</div><div style=3D"font-size:small;text-deco=
ration-style:initial;text-decoration-color:initial"><br></div><div style=3D=
"font-size:small;text-decoration-style:initial;text-decoration-color:initia=
l">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94-</div><div style=3D"font-size:small;te=
xt-decoration-style:initial;text-decoration-color:initial"><br></div><div s=
tyle=3D"font-size:small;text-decoration-style:initial;text-decoration-color=
:initial">FROM debian:9</div><div style=3D"font-size:small;text-decoration-=
style:initial;text-decoration-color:initial">RUN echo &quot;deb<span>=C2=A0=
</span><a href=3D"http://deb.debian.org/debian/" style=3D"color:rgb(17,85,2=
04)" target=3D"_blank">http://deb.debian.org/debian/</a><span>=C2=A0</span>=
unstable main&quot; &gt; /etc/apt/sources.list.d/unstable.list \</div><div =
style=3D"font-size:small;text-decoration-style:initial;text-decoration-colo=
r:initial">&amp;&amp; printf &#39;Package: *\nPin: release a=3Dunstable\nPi=
n-Priority: 150\n&#39; &gt; /etc/apt/preferences.d/limit-unstable \</div><d=
iv style=3D"font-size:small;text-decoration-style:initial;text-decoration-c=
olor:initial">&amp;&amp; apt-get update &amp;&amp; apt-get install -y wireg=
uard</div><div style=3D"font-size:small;text-decoration-style:initial;text-=
decoration-color:initial"><br></div><div style=3D"font-size:small;text-deco=
ration-style:initial;text-decoration-color:initial">ENTRYPOINT [ &quot;wg-q=
uick&quot;, &quot;up&quot;, &quot;wg0&quot; ]</div><div style=3D"font-size:=
small;text-decoration-style:initial;text-decoration-color:initial"><br></di=
v><div style=3D"font-size:small;text-decoration-style:initial;text-decorati=
on-color:initial">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-</div><div style=3D"fon=
t-size:small;text-decoration-style:initial;text-decoration-color:initial"><=
br></div><div style=3D"font-size:small;text-decoration-style:initial;text-d=
ecoration-color:initial">I run this containers with:</div><div style=3D"fon=
t-size:small;text-decoration-style:initial;text-decoration-color:initial"><=
br></div><div style=3D"font-size:small;text-decoration-style:initial;text-d=
ecoration-color:initial">sudo docker run -it -v $(pwd)/config:/etc/wireguar=
d/ -v=C2=A0 /dev:/dev=C2=A0 -v=C2=A0 /lib/modules:/lib/modules=C2=A0 --cap-=
add=3DALL --privileged &lt;image name here&gt;</div><div style=3D"font-size=
:small;text-decoration-style:initial;text-decoration-color:initial"><br></d=
iv><div style=3D"font-size:small;text-decoration-style:initial;text-decorat=
ion-color:initial">where wg0.conf is located in &quot; $(pwd)/config/<span =
style=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">wg0.=
conf</span>&quot; on host machine</div><div style=3D"font-size:small;text-d=
ecoration-style:initial;text-decoration-color:initial"><br></div><div style=
=3D"font-size:small;text-decoration-style:initial;text-decoration-color:ini=
tial">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-</div><div style=3D"font-size:small=
;text-decoration-style:initial;text-decoration-color:initial"><br></div><di=
v style=3D"font-size:small;text-decoration-style:initial;text-decoration-co=
lor:initial">and here is my wg0.conf file:</div><div style=3D"font-size:sma=
ll;text-decoration-style:initial;text-decoration-color:initial"><br></div><=
div style=3D"font-size:small;text-decoration-style:initial;text-decoration-=
color:initial">[Interface]</div><div style=3D"font-size:small;text-decorati=
on-style:initial;text-decoration-color:initial">Address =3D<span>=C2=A0</sp=
an><a href=3D"http://172.26.10.1/24" style=3D"color:rgb(17,85,204)" target=
=3D"_blank">172.26.10.1/24</a></div><div style=3D"font-size:small;text-deco=
ration-style:initial;text-decoration-color:initial">SaveConfig =3D true</di=
v><div style=3D"font-size:small;text-decoration-style:initial;text-decorati=
on-color:initial">PrivateKey =3D &lt;server private key here&gt;</div><div =
style=3D"font-size:small;text-decoration-style:initial;text-decoration-colo=
r:initial">ListenPort =3D 40540</div><div style=3D"font-size:small;text-dec=
oration-style:initial;text-decoration-color:initial"><br></div><div style=
=3D"font-size:small;text-decoration-style:initial;text-decoration-color:ini=
tial">[Peer]</div><div style=3D"font-size:small;text-decoration-style:initi=
al;text-decoration-color:initial">PublicKey =3D &lt;client public key here&=
gt;</div><div style=3D"font-size:small;text-decoration-style:initial;text-d=
ecoration-color:initial">AllowedIPs =3D<span>=C2=A0</span><a href=3D"http:/=
/172.26.10.2/32" style=3D"color:rgb(17,85,204)" target=3D"_blank">172.26.10=
.2/32</a></div><div style=3D"font-size:small;text-decoration-style:initial;=
text-decoration-color:initial"><br></div><div style=3D"font-size:small;text=
-decoration-style:initial;text-decoration-color:initial">=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94-</div><div style=3D"font-size:small;text-decoration-style:i=
nitial;text-decoration-color:initial"><br></div><div style=3D"font-size:sma=
ll;text-decoration-style:initial;text-decoration-color:initial">So, How can=
 I fix this &quot;<b>Unable to access interface: Protocol not supported</b>=
&quot; error?</div><br></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div></blockquote></div>

--00000000000019ae4e057190de0a--
