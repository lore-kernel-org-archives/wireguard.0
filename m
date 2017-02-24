Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68569295
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Feb 2017 10:39:58 +0000 (UTC)
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
 [209.85.215.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7324755
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Feb 2017 10:39:58 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id z127so7228185lfa.2
 for <wireguard@lists.zx2c4.com>; Fri, 24 Feb 2017 02:41:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <241066D3-A3AD-4E76-B7E0-9C0DC26713D6@danrl.com>
References: <CADdae-h1pmyzn5aTsnBG5nBaKCuLk03eu0wtQ0E1V0j+nBZsiA@mail.gmail.com>
 <241066D3-A3AD-4E76-B7E0-9C0DC26713D6@danrl.com>
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Fri, 24 Feb 2017 11:41:07 +0100
Message-ID: <CADdae-gK=tqCao84KBzBYrjpTyBRT_QSeSEyQ4rwybypE6wK8w@mail.gmail.com>
Subject: Re: [ wireguard-dev ] About configuring allowedip
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: multipart/alternative; boundary=001a11401db407451d0549445e0b
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11401db407451d0549445e0b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hello again,
my configuration ,
ping peer 1-->peer 2  : ok   ( on ipv6 wg0 )
ping peer 3 --> peer 1 : ok
ping peer3 --peer1--->peer2 : not ok .


On peer 1 , forwarding is setting
net.ipv6.conf.all.forwarding =3D 1
net.ipv4.conf.all.forwarding =3D 1


Peer 1 : wg configuration

interface: wg0
  public key: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D
  private key: (hidden)
  listening port: 6081

peer: dOXT9AvlEt9KSl3ricE12GuVa+U4XB0s1c92s8W+9VA=3D
  endpoint: 52.49.x.x:6081
  allowed ips: ::/0
  latest handshake: 8 seconds ago
  transfer: 71.29 KiB received, 60.28 KiB sent
  persistent keepalive: every 25 seconds

peer: bqwiLTe/hr0JJMz3IvnDXqS5nOT6u/WL75dasmTE/ko=3D
  endpoint: 10.10.0.69:6081
  allowed ips: fd00::baae:edff:fe72:5094/128
  latest handshake: 45 seconds ago
  transfer: 5.49 KiB received, 6.36 KiB sent


Peer 3 :


interface: wg0
  public key: bqwiLTe/hr0JJMz3IvnDXqS5nOT6u/WL75dasmTE/ko=3D
  private key: (hidden)
  listening port: 6081

peer: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D
  endpoint: 10.10.99.230:6081
  allowed ips: ::/0
  latest handshake: 33 seconds ago
  transfer: 4.92 KiB received, 7.55 KiB sent
  persistent keepalive: every 25 seconds


Peer 2 :

interface: wg0
  public key: dOXT9AvlEt9KSl3ricE12GuVa+U4XB0s1c92s8W+9VA=3D
  private key: (hidden)
  listening port: 6081

peer: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D
  endpoint: 77.156.x.x:58943
  allowed ips: fd00::eea8:6bff:fef9:23bc/128
  latest handshake: 1 minute, 43 seconds ago
  transfer: 52.59 KiB received, 79.01 KiB sent


2017-02-23 14:41 GMT+01:00 Dan L=C3=BCdtke <mail@danrl.com>:

> Nicolas: Could you provide the configuration files? Because from your
> little graphic or schema I can not even derive what you are configuring. =
I
> guess there is something overlapping prefixes maybe?
>
> Jason: I think we are approaching the point in time when there will be a
> -dev and a -users ML :)
>
>
> > On 23 Feb 2017, at 14:03, Nicolas Prochazka <nicolas.prochazka@gmail.co=
m>
> wrote:
> >
> > Hello, i'm trying to do this with wireguard, withtout success :
> >
> > peer1 ---> peer2   : config ok , works
> > peer3 ---> peer1  : config ok , works
> > peer3 --->peer1 ---> peer2  : not ok .
> >
> > I suspect allowed-ip configuration, but all my tests does not works.
> > perhaps I must create two wireguard interface on peer 1 and do
> forwarding/routing ?
> > i'm using ipv6 as internal ip.
> >
> > so my question is :
> > - two interface ?
> > - specifiq magic allowedip ?
> > ( allowed ip is confusing for, it is using for routing and for evicting
> paquet ? )
> >
> > Regards,
> > Nicolas
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--001a11401db407451d0549445e0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hello again,=C2=A0<div><div>my configuration ,=C2=A0</div>=
<div>ping peer 1--&gt;peer 2 =C2=A0: ok =C2=A0 ( on ipv6 wg0 )=C2=A0</div><=
div>ping peer 3 --&gt; peer 1 : ok=C2=A0</div><div>ping peer3 --peer1---&gt=
;peer2 : not ok .</div><div><br></div><div><br></div><div><div>On peer 1 , =
forwarding is setting</div><div>net.ipv6.conf.all.forwarding =3D 1</div></d=
iv><div><div>net.ipv4.conf.all.forwarding =3D 1<br></div></div><div><br></d=
iv><div><br></div><div>Peer 1 : wg configuration =C2=A0</div><div><br></div=
><div>interface: wg0</div><div>=C2=A0 public key: q5ypTBI7bN0vPGzvlGYyF6pCq=
YgrDsEjO827duAwjX4=3D</div><div>=C2=A0 private key: (hidden)</div><div>=C2=
=A0 listening port: 6081</div><div><br></div><div>peer: dOXT9AvlEt9KSl3ricE=
12GuVa+U4XB0s1c92s8W+9VA=3D</div><div>=C2=A0 endpoint: 52.49.x.x:6081</div>=
<div>=C2=A0 allowed ips: ::/0</div><div>=C2=A0 latest handshake: 8 seconds =
ago</div><div>=C2=A0 transfer: 71.29 KiB received, 60.28 KiB sent</div><div=
>=C2=A0 persistent keepalive: every 25 seconds</div><div><br></div><div>pee=
r: bqwiLTe/hr0JJMz3IvnDXqS5nOT6u/WL75dasmTE/ko=3D</div><div>=C2=A0 endpoint=
: <a href=3D"http://10.10.0.69:6081">10.10.0.69:6081</a></div><div>=C2=A0 a=
llowed ips: fd00::baae:edff:fe72:5094/128</div><div>=C2=A0 latest handshake=
: 45 seconds ago</div><div>=C2=A0 transfer: 5.49 KiB received, 6.36 KiB sen=
t</div><div><br></div><div><br></div><div>Peer 3 :=C2=A0</div><div><br></di=
v><div><br></div><div>interface: wg0</div><div>=C2=A0 public key: bqwiLTe/h=
r0JJMz3IvnDXqS5nOT6u/WL75dasmTE/ko=3D</div><div>=C2=A0 private key: (hidden=
)</div><div>=C2=A0 listening port: 6081</div><div><br></div><div>peer: q5yp=
TBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D</div><div>=C2=A0 endpoint: <a hr=
ef=3D"http://10.10.99.230:6081">10.10.99.230:6081</a></div><div>=C2=A0 allo=
wed ips: ::/0</div><div>=C2=A0 latest handshake: 33 seconds ago</div><div>=
=C2=A0 transfer: 4.92 KiB received, 7.55 KiB sent</div><div>=C2=A0 persiste=
nt keepalive: every 25 seconds</div></div><div><br></div><div><br></div><di=
v>Peer 2 :=C2=A0</div><div><br></div><div><div>interface: wg0</div><div>=C2=
=A0 public key: dOXT9AvlEt9KSl3ricE12GuVa+U4XB0s1c92s8W+9VA=3D</div><div>=
=C2=A0 private key: (hidden)</div><div>=C2=A0 listening port: 6081</div><di=
v><br></div><div>peer: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D</div>=
<div>=C2=A0 endpoint: 77.156.x.x:58943</div><div>=C2=A0 allowed ips: fd00::=
eea8:6bff:fef9:23bc/128</div><div>=C2=A0 latest handshake: 1 minute, 43 sec=
onds ago</div><div>=C2=A0 transfer: 52.59 KiB received, 79.01 KiB sent</div=
></div><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">2017-02-23 14:41 GMT+01:00 Dan L=C3=BCdtke <span dir=3D"ltr">&lt=
;<a href=3D"mailto:mail@danrl.com" target=3D"_blank">mail@danrl.com</a>&gt;=
</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Nicolas: Could you provide the c=
onfiguration files? Because from your little graphic or schema I can not ev=
en derive what you are configuring. I guess there is something overlapping =
prefixes maybe?<br>
<br>
Jason: I think we are approaching the point in time when there will be a -d=
ev and a -users ML :)<br>
<div><div class=3D"h5"><br>
<br>
&gt; On 23 Feb 2017, at 14:03, Nicolas Prochazka &lt;<a href=3D"mailto:nico=
las.prochazka@gmail.com">nicolas.prochazka@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello, i&#39;m trying to do this with wireguard, withtout success :<br=
>
&gt;<br>
&gt; peer1 ---&gt; peer2=C2=A0 =C2=A0: config ok , works<br>
&gt; peer3 ---&gt; peer1=C2=A0 : config ok , works<br>
&gt; peer3 ---&gt;peer1 ---&gt; peer2=C2=A0 : not ok .<br>
&gt;<br>
&gt; I suspect allowed-ip configuration, but all my tests does not works.<b=
r>
&gt; perhaps I must create two wireguard interface on peer 1 and do forward=
ing/routing ?<br>
&gt; i&#39;m using ipv6 as internal ip.<br>
&gt;<br>
&gt; so my question is :<br>
&gt; - two interface ?<br>
&gt; - specifiq magic allowedip ?<br>
&gt; ( allowed ip is confusing for, it is using for routing and for evictin=
g paquet ? )<br>
&gt;<br>
&gt; Regards,<br>
&gt; Nicolas<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com=
</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo=
/wireguard</a><br>
<br>
</blockquote></div><br></div>

--001a11401db407451d0549445e0b--
