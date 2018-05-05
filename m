Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04462a08
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 17:31:22 +0000 (UTC)
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf7c79d8
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 17:31:22 +0000 (UTC)
Received: by mail-it0-x229.google.com with SMTP id 70-v6so7044351ity.2
 for <wireguard@lists.zx2c4.com>; Sat, 05 May 2018 10:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
 <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAKXLc7dZD1Qzx1q1fPPikXPvu+vAgCpKnBBiP_hKSiJOtTbxng@mail.gmail.com>
In-Reply-To: <CAKXLc7dZD1Qzx1q1fPPikXPvu+vAgCpKnBBiP_hKSiJOtTbxng@mail.gmail.com>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Sat, 05 May 2018 17:33:18 +0000
Message-ID: <CAHLp1Y=S0EmJHJ5kKJMJnd=0==QqCGVX4HXrYV62H=Nk+nx96Q@mail.gmail.com>
Subject: Re: WG interface to ipv4
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b4c7b3056b78d571"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000b4c7b3056b78d571
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If wg was binding to a particular interface, I don't think it would be
possible to support roaming scenarios. I have a travel wifi router, and I
love the fact that it will automatically switch between connecting through
the Ethernet interface or the USB tethering one.

The need you describe is orthogonal to the role of wireguard. If you want
to tightly control what wireguard is doing, you should use 1) good routing
rules and 2) iptables to match these rules.


On Sat, May 5, 2018, 11:33 Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:

> On Sat, May 5, 2018 at 10:18 AM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 =
<vtol@gmx.net> wrote:
> > I like to keep things neat/controlled and any necessary open socket is
> only
> > sticking out like a sore (wondering why it is opened when not wanted
> for).
> > It would certainly instill more confidence in network security/control
> if it
> > would be possible to define which sockets are opened by WG, like other
> apps
> > do.
> >
> +1 !
>
> > Which brings up the next point, I have asked previously twice about -
> > wildcard ip 0.0.0.0 . How to bind WG to a particular iface/subnet, as  =
a
> > another matter of network security?
> >
> It is not possible AFAIK. I am not sure in the intrinsic workings, may
> be it is not possible by design?
>
> Hmm, should be, given that it only listens to UDP on a single IP
> address (as configured on the wgX interface).
> Well, one can configure multiple addresses to a single interface, but sti=
ll
> What about when we have more than one wgX interface, do they share memory=
?
>
> Certainly, the source lists it is binds to any interface:
> https://git.zx2c4.com/WireGuard/tree/src/socket.c#n330
> unconditionally.
>
> So I guess we can use (from `man 7 socket`)
>
>        SO_BINDTODEVICE
>               Bind this socket to a particular device like =E2=80=9Ceth0=
=E2=80=9D, as
> specified in the passed interface name.  If  the
>               name  is an empty string or the option length is zero,
> the socket device binding is removed.  The passed
>               option is a variable-length null-terminated interface
> name string with the maximum size of IFNAMSIZ.  If
>               a socket is bound to an interface, only packets received
> from that particular interface are processed by
>               the socket.  Note that this works only for some socket
> types, particularly AF_INET sockets.  It  is  not
>               supported for packet sockets (use normal bind(2) there).
>
>               Before  Linux  3.8,  this socket option could be set,
> but could not retrieved with getsockopt(2).  Since
>               Linux 3.8, it is readable.  The optlen argument should
> contain the buffer size available to receive  the
>               device name and is recommended to be IFNAMSZ bytes.  The
> real device name length is reported back in the
>               optlen argument.
>
> Just a wild guess.
>
> Cheers,
> Kalin.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000b4c7b3056b78d571
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>If wg was binding to a particular interface, I don&#=
39;t think it would be possible to support roaming scenarios. I have a trav=
el wifi router, and I love the fact that it will automatically switch betwe=
en connecting through the Ethernet interface or the USB tethering one.<div =
dir=3D"auto"><br></div><div dir=3D"auto">The need you describe is orthogona=
l to the role of wireguard. If you want to tightly control what wireguard i=
s doing, you should use 1) good routing rules and 2) iptables to match thes=
e rules.</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, M=
ay 5, 2018, 11:33 Kalin KOZHUHAROV &lt;<a href=3D"mailto:me.kalin@gmail.com=
">me.kalin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Sat, May 5, 2018 at 10:18 AM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 &=
lt;<a href=3D"mailto:vtol@gmx.net" target=3D"_blank" rel=3D"noreferrer">vto=
l@gmx.net</a>&gt; wrote:<br>
&gt; I like to keep things neat/controlled and any necessary open socket is=
 only<br>
&gt; sticking out like a sore (wondering why it is opened when not wanted f=
or).<br>
&gt; It would certainly instill more confidence in network security/control=
 if it<br>
&gt; would be possible to define which sockets are opened by WG, like other=
 apps<br>
&gt; do.<br>
&gt;<br>
+1 !<br>
<br>
&gt; Which brings up the next point, I have asked previously twice about -<=
br>
&gt; wildcard ip 0.0.0.0 . How to bind WG to a particular iface/subnet, as=
=C2=A0 a<br>
&gt; another matter of network security?<br>
&gt;<br>
It is not possible AFAIK. I am not sure in the intrinsic workings, may<br>
be it is not possible by design?<br>
<br>
Hmm, should be, given that it only listens to UDP on a single IP<br>
address (as configured on the wgX interface).<br>
Well, one can configure multiple addresses to a single interface, but still=
<br>
What about when we have more than one wgX interface, do they share memory?<=
br>
<br>
Certainly, the source lists it is binds to any interface:<br>
<a href=3D"https://git.zx2c4.com/WireGuard/tree/src/socket.c#n330" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://git.zx2c4.com/WireGuard/tre=
e/src/socket.c#n330</a><br>
unconditionally.<br>
<br>
So I guess we can use (from `man 7 socket`)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0SO_BINDTODEVICE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Bind this socket to a part=
icular device like =E2=80=9Ceth0=E2=80=9D, as<br>
specified in the passed interface name.=C2=A0 If=C2=A0 the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name=C2=A0 is an empty str=
ing or the option length is zero,<br>
the socket device binding is removed.=C2=A0 The passed<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 option is a variable-lengt=
h null-terminated interface<br>
name string with the maximum size of IFNAMSIZ.=C2=A0 If<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a socket is bound to an in=
terface, only packets received<br>
from that particular interface are processed by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the socket.=C2=A0 Note tha=
t this works only for some socket<br>
types, particularly AF_INET sockets.=C2=A0 It=C2=A0 is=C2=A0 not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 supported for packet socke=
ts (use normal bind(2) there).<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Before=C2=A0 Linux=C2=A0 3=
.8,=C2=A0 this socket option could be set,<br>
but could not retrieved with getsockopt(2).=C2=A0 Since<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linux 3.8, it is readable.=
=C2=A0 The optlen argument should<br>
contain the buffer size available to receive=C2=A0 the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device name and is recomme=
nded to be IFNAMSZ bytes.=C2=A0 The<br>
real device name length is reported back in the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optlen argument.<br>
<br>
Just a wild guess.<br>
<br>
Cheers,<br>
Kalin.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--000000000000b4c7b3056b78d571--
