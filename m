Return-Path: jan@incubaid.com
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
 [209.85.215.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a8ecc9f
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 14:45:21 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id f6so12966700lfg.0
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 07:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
In-Reply-To: <20160707131324.GA18014@lud.polynome.dn42>
From: Jan De Landtsheer <jan@incubaid.com>
Date: Thu, 07 Jul 2016 14:45:22 +0000
Message-ID: <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: multipart/alternative; boundary=001a11406b36ec81a305370cbc1c
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11406b36ec81a305370cbc1c
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 7, 2016 at 3:13 PM Baptiste Jonglez <baptiste@bitsofnetworks.org>
wrote:

> On Thu, Jul 07, 2016 at 12:53:24PM +0000, Jan De Landtsheer wrote:
> >   - about changing ports:
> > hmmm. can't really say...
> > What I noticed: I could ping yesterday, without doing anything, I
> couldn't
> > this morning. that's when I saw the difference.
> > I had something like it yesterday, and thinking I did something wrong, I
> > set it in stone in a config file. applied it, had my ping, kept the
> > terminal session on the server open (had also an openvpn to the remote).
> > This morning, from the remote , there was no ping. Verified why. And
> then I
> > sent this mail ;-)
>
> Could there be a NAT or stateful firewall on your network, messing up the
> UDP source port of packets received from the server?
>

nope, Start with basics, use pub ip to pub ip
BTW, can a client run behind NAT ? (I assume not, as AFAICT both need to
listen on a port)

But like I said, I'll see if it happens again... went through my history
log still thinking it might be me, but it doesn't seem so.



> If you manage to reproduce, it would be helpful to have a packet capture
> before your wireguard client changes endpoint, with something like:
>
>   client# tcpdump -w wireguard.pcap -i eth0 -s 64 'udp and host
> xxx.xxx.xxx.126'
>
> Change the interface if needed, and xxx.xxx.xxx.126 is the public IP of
> your server.  The packet trace will only contain the packet headers and
> a small bit of encrypted data, but you can send it privately (to me and/or
> Jason).
>
> > Note: it's properly up since, so I don't know...
> > I'll keep it as it is, will let you know if something switches again.
> > Note2: No, no different peers, there is only one client, one server, so
> > there wouldn't be any overlap.
> >
> > running arch linux, latest & geatest
> >
> >   - about something else:
> > are these pure ip  tunnels, or could I envision to add the interfaces to
> an
> > OpenVSwitch bridge and use them as tunnel ports?
> >
> > Thx
> > Jan
> >
> >
> > On Thu, Jul 7, 2016 at 1:29 PM Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
> >
> > > Hi Jan,
> > >
> > > That's very strange. Are you sure there aren't other wireguard peers
> > > running thare using the same private key?
> > >
> > > Does it always change to the *same* wrong port?
> > >
> > > Jason
> > >
>
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > http://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--001a11406b36ec81a305370cbc1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Jul 7, 2016 at 3:13 PM Baptiste Jonglez &lt;<a href=3D"mailto:baptiste@bi=
tsofnetworks.org">baptiste@bitsofnetworks.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Thu, Jul 07, 2016 at 12:53:24PM +0000, Jan De =
Landtsheer wrote:<br>
&gt;=C2=A0 =C2=A0- about changing ports:<br>
&gt; hmmm. can&#39;t really say...<br>
&gt; What I noticed: I could ping yesterday, without doing anything, I coul=
dn&#39;t<br>
&gt; this morning. that&#39;s when I saw the difference.<br>
&gt; I had something like it yesterday, and thinking I did something wrong,=
 I<br>
&gt; set it in stone in a config file. applied it, had my ping, kept the<br=
>
&gt; terminal session on the server open (had also an openvpn to the remote=
).<br>
&gt; This morning, from the remote , there was no ping. Verified why. And t=
hen I<br>
&gt; sent this mail ;-)<br>
<br>
Could there be a NAT or stateful firewall on your network, messing up the<b=
r>
UDP source port of packets received from the server?<br></blockquote><div>=
=C2=A0</div><div>nope, Start with basics, use pub ip to pub ip</div><div>BT=
W, can a client run behind NAT ? (I assume not, as AFAICT both need to list=
en on a port)</div><div><br></div><div>But like I said, I&#39;ll see if it =
happens again... went through my history log still thinking it might be me,=
 but it doesn&#39;t seem so.</div><div><br></div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
<br>
If you manage to reproduce, it would be helpful to have a packet capture<br=
>
before your wireguard client changes endpoint, with something like:<br>
<br>
=C2=A0 client# tcpdump -w wireguard.pcap -i eth0 -s 64 &#39;udp and host xx=
x.xxx.xxx.126&#39;<br>
<br>
Change the interface if needed, and xxx.xxx.xxx.126 is the public IP of<br>
your server.=C2=A0 The packet trace will only contain the packet headers an=
d<br>
a small bit of encrypted data, but you can send it privately (to me and/or<=
br>
Jason).<br>
<br>
&gt; Note: it&#39;s properly up since, so I don&#39;t know...<br>
&gt; I&#39;ll keep it as it is, will let you know if something switches aga=
in.<br>
&gt; Note2: No, no different peers, there is only one client, one server, s=
o<br>
&gt; there wouldn&#39;t be any overlap.<br>
&gt;<br>
&gt; running arch linux, latest &amp; geatest<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- about something else:<br>
&gt; are these pure ip=C2=A0 tunnels, or could I envision to add the interf=
aces to an<br>
&gt; OpenVSwitch bridge and use them as tunnel ports?<br>
&gt;<br>
&gt; Thx<br>
&gt; Jan<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Jul 7, 2016 at 1:29 PM Jason A. Donenfeld &lt;<a href=3D"mailt=
o:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hi Jan,<br>
&gt; &gt;<br>
&gt; &gt; That&#39;s very strange. Are you sure there aren&#39;t other wire=
guard peers<br>
&gt; &gt; running thare using the same private key?<br>
&gt; &gt;<br>
&gt; &gt; Does it always change to the *same* wrong port?<br>
&gt; &gt;<br>
&gt; &gt; Jason<br>
&gt; &gt;<br>
<br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGua=
rd@lists.zx2c4.com</a><br>
&gt; <a href=3D"http://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"n=
oreferrer" target=3D"_blank">http://lists.zx2c4.com/mailman/listinfo/wiregu=
ard</a><br>
<br>
</blockquote></div></div>

--001a11406b36ec81a305370cbc1c--
