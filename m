Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64c9b3b3
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Feb 2017 15:04:55 +0000 (UTC)
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
 [209.85.215.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b96a08e
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Feb 2017 15:04:55 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id l12so9981540lfe.0
 for <wireguard@lists.zx2c4.com>; Fri, 24 Feb 2017 07:06:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <71F759EB-03D2-4769-9B8D-F92C4A19D2C6@danrl.com>
References: <CADdae-h1pmyzn5aTsnBG5nBaKCuLk03eu0wtQ0E1V0j+nBZsiA@mail.gmail.com>
 <241066D3-A3AD-4E76-B7E0-9C0DC26713D6@danrl.com>
 <CADdae-gK=tqCao84KBzBYrjpTyBRT_QSeSEyQ4rwybypE6wK8w@mail.gmail.com>
 <71F759EB-03D2-4769-9B8D-F92C4A19D2C6@danrl.com>
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Fri, 24 Feb 2017 16:06:06 +0100
Message-ID: <CADdae-hddrPL+z3Oy2R=yJXKUoxA2tGScJ9Z2sYyx6KgmV=cTw@mail.gmail.com>
Subject: Re: [ wireguard-dev ] About configuring allowedip
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: multipart/alternative; boundary=f403045e9e10b38e53054948114f
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045e9e10b38e53054948114f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ok thanks,
what is confusing me it that allowed ip is for :
- authorized source packet
- routing outgoing packet
and we can set allowedips with a lot of ip / netmask
Regards,
Nicolas

2017-02-24 14:10 GMT+01:00 Dan L=C3=BCdtke <mail@danrl.com>:

> Nicolas,
>
> I draw your network including the allowed_ips restrictions.
>
> > ping peer3 --peer1--->peer2 : not ok .
>
> This can not work! Peer 2 does not accept the source address from Peer 3.
> Please review your allowed_ips settings. Draw the things on paper, make
> PostIt notes representing the packets including their destination address
> and source address. Draw a little "firewall" on the tunnels (whitelist is
> allowed_ips, all the rest gets dropped!) and see if the PostIt can make i=
t
> through with it's source address. Yes, this sounds like child play, but i=
t
> works. I have taught complex firewalling and VPN setups to lawyers and la=
w
> makers this way. It helps understanding, if a simple diagram does not cut
> it.
>
> Allowed IPs is probably the most complex thing WireGuard has to offer fro=
m
> a user perspective. Rename it to Allowed Source Addrresses in your head i=
t
> becomes clearer.
>
> HTH
>
> Dan
>
> > On 24 Feb 2017, at 11:41, Nicolas Prochazka <nicolas.prochazka@gmail.co=
m>
> wrote:
> >
> > hello again,
> > my configuration ,
> > ping peer 1-->peer 2  : ok   ( on ipv6 wg0 )
> > ping peer 3 --> peer 1 : ok
> > ping peer3 --peer1--->peer2 : not ok .
> >
> >
> > On peer 1 , forwarding is setting
> > net.ipv6.conf.all.forwarding =3D 1
> > net.ipv4.conf.all.forwarding =3D 1
> >
> >
> > Peer 1 : wg configuration
> >
> > interface: wg0
> >   public key: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D
> >   private key: (hidden)
> >   listening port: 6081
> >
> > peer: dOXT9AvlEt9KSl3ricE12GuVa+U4XB0s1c92s8W+9VA=3D
> >   endpoint: 52.49.x.x:6081
> >   allowed ips: ::/0
> >   latest handshake: 8 seconds ago
> >   transfer: 71.29 KiB received, 60.28 KiB sent
> >   persistent keepalive: every 25 seconds
> >
> > peer: bqwiLTe/hr0JJMz3IvnDXqS5nOT6u/WL75dasmTE/ko=3D
> >   endpoint: 10.10.0.69:6081
> >   allowed ips: fd00::baae:edff:fe72:5094/128
> >   latest handshake: 45 seconds ago
> >   transfer: 5.49 KiB received, 6.36 KiB sent
> >
> >
> > Peer 3 :
> >
> >
> > interface: wg0
> >   public key: bqwiLTe/hr0JJMz3IvnDXqS5nOT6u/WL75dasmTE/ko=3D
> >   private key: (hidden)
> >   listening port: 6081
> >
> > peer: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D
> >   endpoint: 10.10.99.230:6081
> >   allowed ips: ::/0
> >   latest handshake: 33 seconds ago
> >   transfer: 4.92 KiB received, 7.55 KiB sent
> >   persistent keepalive: every 25 seconds
> >
> >
> > Peer 2 :
> >
> > interface: wg0
> >   public key: dOXT9AvlEt9KSl3ricE12GuVa+U4XB0s1c92s8W+9VA=3D
> >   private key: (hidden)
> >   listening port: 6081
> >
> > peer: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D
> >   endpoint: 77.156.x.x:58943
> >   allowed ips: fd00::eea8:6bff:fef9:23bc/128
> >   latest handshake: 1 minute, 43 seconds ago
> >   transfer: 52.59 KiB received, 79.01 KiB sent
> >
> >
> > 2017-02-23 14:41 GMT+01:00 Dan L=C3=BCdtke <mail@danrl.com>:
> > Nicolas: Could you provide the configuration files? Because from your
> little graphic or schema I can not even derive what you are configuring. =
I
> guess there is something overlapping prefixes maybe?
> >
> > Jason: I think we are approaching the point in time when there will be =
a
> -dev and a -users ML :)
> >
> >
> > > On 23 Feb 2017, at 14:03, Nicolas Prochazka <
> nicolas.prochazka@gmail.com> wrote:
> > >
> > > Hello, i'm trying to do this with wireguard, withtout success :
> > >
> > > peer1 ---> peer2   : config ok , works
> > > peer3 ---> peer1  : config ok , works
> > > peer3 --->peer1 ---> peer2  : not ok .
> > >
> > > I suspect allowed-ip configuration, but all my tests does not works.
> > > perhaps I must create two wireguard interface on peer 1 and do
> forwarding/routing ?
> > > i'm using ipv6 as internal ip.
> > >
> > > so my question is :
> > > - two interface ?
> > > - specifiq magic allowedip ?
> > > ( allowed ip is confusing for, it is using for routing and for
> evicting paquet ? )
> > >
> > > Regards,
> > > Nicolas
> > > _______________________________________________
> > > WireGuard mailing list
> > > WireGuard@lists.zx2c4.com
> > > https://lists.zx2c4.com/mailman/listinfo/wireguard
> >
> >
>
>

--f403045e9e10b38e53054948114f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ok thanks,=C2=A0<div>what is confusing me it that allowed =
ip is for :=C2=A0</div><div>- authorized source packet</div><div>- routing =
outgoing packet=C2=A0</div><div>and we can set allowedips with a lot of ip =
/ netmask</div><div>Regards,</div><div>Nicolas</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">2017-02-24 14:10 GMT+01:00 Dan L=
=C3=BCdtke <span dir=3D"ltr">&lt;<a href=3D"mailto:mail@danrl.com" target=
=3D"_blank">mail@danrl.com</a>&gt;</span>:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Nicolas,<br>
<br>
I draw your network including the allowed_ips restrictions.<br>
<span class=3D""><br>
&gt; ping peer3 --peer1---&gt;peer2 : not ok .<br>
<br>
</span>This can not work! Peer 2 does not accept the source address from Pe=
er 3. Please review your allowed_ips settings. Draw the things on paper, ma=
ke PostIt notes representing the packets including their destination addres=
s and source address. Draw a little &quot;firewall&quot; on the tunnels (wh=
itelist is allowed_ips, all the rest gets dropped!) and see if the PostIt c=
an make it through with it&#39;s source address. Yes, this sounds like chil=
d play, but it works. I have taught complex firewalling and VPN setups to l=
awyers and law makers this way. It helps understanding, if a simple diagram=
 does not cut it.<br>
<br>
Allowed IPs is probably the most complex thing WireGuard has to offer from =
a user perspective. Rename it to Allowed Source Addrresses in your head it =
becomes clearer.<br>
<br>
HTH<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Dan<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; On 24 Feb 2017, at 11:41, Nicolas Prochazka &lt;<a href=3D"mailto:nico=
las.prochazka@gmail.com">nicolas.prochazka@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; hello again,<br>
&gt; my configuration ,<br>
&gt; ping peer 1--&gt;peer 2=C2=A0 : ok=C2=A0 =C2=A0( on ipv6 wg0 )<br>
&gt; ping peer 3 --&gt; peer 1 : ok<br>
&gt; ping peer3 --peer1---&gt;peer2 : not ok .<br>
&gt;<br>
&gt;<br>
&gt; On peer 1 , forwarding is setting<br>
&gt; net.ipv6.conf.all.forwarding =3D 1<br>
&gt; net.ipv4.conf.all.forwarding =3D 1<br>
&gt;<br>
&gt;<br>
&gt; Peer 1 : wg configuration<br>
&gt;<br>
&gt; interface: wg0<br>
&gt;=C2=A0 =C2=A0public key: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDs<wbr>EjO827duAwj=
X4=3D<br>
&gt;=C2=A0 =C2=A0private key: (hidden)<br>
&gt;=C2=A0 =C2=A0listening port: 6081<br>
&gt;<br>
&gt; peer: dOXT9AvlEt9KSl3ricE12GuVa+<wbr>U4XB0s1c92s8W+9VA=3D<br>
&gt;=C2=A0 =C2=A0endpoint: 52.49.x.x:6081<br>
&gt;=C2=A0 =C2=A0allowed ips: ::/0<br>
&gt;=C2=A0 =C2=A0latest handshake: 8 seconds ago<br>
&gt;=C2=A0 =C2=A0transfer: 71.29 KiB received, 60.28 KiB sent<br>
&gt;=C2=A0 =C2=A0persistent keepalive: every 25 seconds<br>
&gt;<br>
&gt; peer: bqwiLTe/hr0JJMz3IvnDXqS5nOT6u/<wbr>WL75dasmTE/ko=3D<br>
&gt;=C2=A0 =C2=A0endpoint: <a href=3D"http://10.10.0.69:6081" rel=3D"norefe=
rrer" target=3D"_blank">10.10.0.69:6081</a><br>
&gt;=C2=A0 =C2=A0allowed ips: fd00::baae:edff:fe72:5094/128<br>
&gt;=C2=A0 =C2=A0latest handshake: 45 seconds ago<br>
&gt;=C2=A0 =C2=A0transfer: 5.49 KiB received, 6.36 KiB sent<br>
&gt;<br>
&gt;<br>
&gt; Peer 3 :<br>
&gt;<br>
&gt;<br>
&gt; interface: wg0<br>
&gt;=C2=A0 =C2=A0public key: bqwiLTe/hr0JJMz3IvnDXqS5nOT6u/<wbr>WL75dasmTE/=
ko=3D<br>
&gt;=C2=A0 =C2=A0private key: (hidden)<br>
&gt;=C2=A0 =C2=A0listening port: 6081<br>
&gt;<br>
&gt; peer: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDs<wbr>EjO827duAwjX4=3D<br>
&gt;=C2=A0 =C2=A0endpoint: <a href=3D"http://10.10.99.230:6081" rel=3D"nore=
ferrer" target=3D"_blank">10.10.99.230:6081</a><br>
&gt;=C2=A0 =C2=A0allowed ips: ::/0<br>
&gt;=C2=A0 =C2=A0latest handshake: 33 seconds ago<br>
&gt;=C2=A0 =C2=A0transfer: 4.92 KiB received, 7.55 KiB sent<br>
&gt;=C2=A0 =C2=A0persistent keepalive: every 25 seconds<br>
&gt;<br>
&gt;<br>
&gt; Peer 2 :<br>
&gt;<br>
&gt; interface: wg0<br>
&gt;=C2=A0 =C2=A0public key: dOXT9AvlEt9KSl3ricE12GuVa+<wbr>U4XB0s1c92s8W+9=
VA=3D<br>
&gt;=C2=A0 =C2=A0private key: (hidden)<br>
&gt;=C2=A0 =C2=A0listening port: 6081<br>
&gt;<br>
&gt; peer: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDs<wbr>EjO827duAwjX4=3D<br>
&gt;=C2=A0 =C2=A0endpoint: 77.156.x.x:58943<br>
&gt;=C2=A0 =C2=A0allowed ips: fd00::eea8:6bff:fef9:23bc/128<br>
&gt;=C2=A0 =C2=A0latest handshake: 1 minute, 43 seconds ago<br>
&gt;=C2=A0 =C2=A0transfer: 52.59 KiB received, 79.01 KiB sent<br>
&gt;<br>
&gt;<br>
&gt; 2017-02-23 14:41 GMT+01:00 Dan L=C3=BCdtke &lt;<a href=3D"mailto:mail@=
danrl.com">mail@danrl.com</a>&gt;:<br>
&gt; Nicolas: Could you provide the configuration files? Because from your =
little graphic or schema I can not even derive what you are configuring. I =
guess there is something overlapping prefixes maybe?<br>
&gt;<br>
&gt; Jason: I think we are approaching the point in time when there will be=
 a -dev and a -users ML :)<br>
&gt;<br>
&gt;<br>
&gt; &gt; On 23 Feb 2017, at 14:03, Nicolas Prochazka &lt;<a href=3D"mailto=
:nicolas.prochazka@gmail.com">nicolas.prochazka@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; Hello, i&#39;m trying to do this with wireguard, withtout success=
 :<br>
&gt; &gt;<br>
&gt; &gt; peer1 ---&gt; peer2=C2=A0 =C2=A0: config ok , works<br>
&gt; &gt; peer3 ---&gt; peer1=C2=A0 : config ok , works<br>
&gt; &gt; peer3 ---&gt;peer1 ---&gt; peer2=C2=A0 : not ok .<br>
&gt; &gt;<br>
&gt; &gt; I suspect allowed-ip configuration, but all my tests does not wor=
ks.<br>
&gt; &gt; perhaps I must create two wireguard interface on peer 1 and do fo=
rwarding/routing ?<br>
&gt; &gt; i&#39;m using ipv6 as internal ip.<br>
&gt; &gt;<br>
&gt; &gt; so my question is :<br>
&gt; &gt; - two interface ?<br>
&gt; &gt; - specifiq magic allowedip ?<br>
&gt; &gt; ( allowed ip is confusing for, it is using for routing and for ev=
icting paquet ? )<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Nicolas<br>
&gt; &gt; ______________________________<wbr>_________________<br>
&gt; &gt; WireGuard mailing list<br>
&gt; &gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c=
4.com</a><br>
&gt; &gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" re=
l=3D"noreferrer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/lis=
tinfo/wireguard</a><br>
&gt;<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div>

--f403045e9e10b38e53054948114f--
