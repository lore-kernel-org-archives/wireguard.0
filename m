Return-Path: steve@erayd.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b43427f
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 18:29:39 +0000 (UTC)
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
 [209.85.161.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e685cb74
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 18:29:39 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id x197so5286192ywg.11
 for <wireguard@lists.zx2c4.com>; Thu, 15 Mar 2018 11:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <NRNcntoOUgLRhHI2D7GnuCHirY9j2pMH83ET-HFr4qoamFy7aIIkR_ZVcKa0wTTbQ-SfhLEr5zih04Hs-FwFaj4UenOksFs8XCMp8yKnZEk=@protonmail.com>
 <db7326ed-e0f5-c1ee-ea61-30ef6d6fa3b3@sholland.org>
In-Reply-To: <db7326ed-e0f5-c1ee-ea61-30ef6d6fa3b3@sholland.org>
From: Steve Gilberd <steve@erayd.net>
Date: Thu, 15 Mar 2018 18:39:59 +0000
Message-ID: <CAJQSx3Y3EXWhtHJGi40kjYiha9nZHYs4i8v9LbbdO4PHaGnDnw@mail.gmail.com>
Subject: Re: Allowed IPs Toggling
To: Samuel Holland <samuel@sholland.org>
Content-Type: multipart/alternative; boundary="94eb2c128e684c490a056777d2ec"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c128e684c490a056777d2ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Allowed IPs is like a routing table; you can't have two routes for the
same set of IPs

If this is the case, then wireguard does not have proper routing support.

Normally, routing tables allow both multiple and overlapping routes
present. When making routing decisions, the most-specific route is chosen
(e.g. a /29 is higher priority than a /24 which overlaps with it). If there
are two identical routes of the same size, then the one with the lowest
routing metric is used.

I can understand not allowing identical routes of the same size, as
wireguard doesn't really have a concept of metric (although it could be
useful for backup links). However, it really should allow overlapping
routes of different sizes. There's no ambiguity with routing decisions, and
it's a standard feature that I would normally expect any IP routing stack
to have.

Cheers,
Steve

On Fri, 16 Mar 2018, 04:57 Samuel Holland, <samuel@sholland.org> wrote:

> Hello,
>
> On 03/15/18 10:31, Gianluca Gabrielli wrote:
> > I was setting two peers on the server, but every time I re-add one of
> these
> > two the other one is shown with (none) on "allowed ips" field. Of cours=
e
> that
> > blocks communications with that peer. If I try to re-add it, then the
> other
> > peer loses its configuration, same problem.
>
> Allowed IPs is like a routing table; you can't have two routes for the
> same set
> of IPs, or WireGuard doesn't know which peer to send the traffic to. You
> want to
> have non-overlapping Allowed IP ranges. This usually means that the range
> of
> Allowed IPs is smaller than the host's subnet. For example:
>
> Host A:
> IP configuration for WireGuard interface: 192.168.123.1/24
> Allowed IPs for Host B: 192.168.123.2/32
>
> Host B:
> IP configuration for WireGuard interface: 192.168.123.2/24
> Allowed IPs for Host A: 192.168.123.1/32
>
> The IP configuration tells the kernel which IP ranges are accessible via
> the
> WireGuard interface. The Allowed IPs tell WireGuard, which _subset_ of
> those IPs
> is associated with each peer.
>
> > Cheers,
> > Gianluca
>
> Cheers,
> Samuel
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
--=20

Cheers,

*Steve Gilberd*
Erayd LTD *=C2=B7* Consultant
*Phone: +64 4 974-4229 **=C2=B7** Mob: +64 27 565-3237*
*PO Box 10019 The Terrace, Wellington 6143, NZ*

--94eb2c128e684c490a056777d2ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>&gt;=C2=A0Allowed IPs is like a routing table; you can&#39;t have two =
routes for the same set of=C2=A0IPs</div><div><br></div>If this is the case=
, then wireguard does not have proper routing support.<div><br></div><div>N=
ormally, routing tables allow both multiple and overlapping routes present.=
 When making routing decisions, the most-specific route is chosen (e.g. a /=
29 is higher priority than a /24 which overlaps with it). If there are two =
identical routes of the same size, then the one with the lowest routing met=
ric is used.</div><div><br></div><div>I can understand not allowing identic=
al routes of the same size, as wireguard doesn&#39;t really have a concept =
of metric (although it could be useful for backup links). However, it reall=
y should allow overlapping routes of different sizes. There&#39;s no ambigu=
ity with routing decisions, and it&#39;s a standard feature that I would no=
rmally expect any IP routing stack to have.</div><div><br></div><div>Cheers=
,</div><div>Steve<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, 16 Mar 2018, 04:57 Samuel Holland, &lt;<a href=3D"mailto:samuel@sholland.=
org">samuel@sholland.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Hello,<br>
<br>
On 03/15/18 10:31, Gianluca Gabrielli wrote:<br>
&gt; I was setting two peers on the server, but every time I re-add one of =
these<br>
&gt; two the other one is shown with (none) on &quot;allowed ips&quot; fiel=
d. Of course that<br>
&gt; blocks communications with that peer. If I try to re-add it, then the =
other<br>
&gt; peer loses its configuration, same problem.<br>
<br>
Allowed IPs is like a routing table; you can&#39;t have two routes for the =
same set<br>
of IPs, or WireGuard doesn&#39;t know which peer to send the traffic to. Yo=
u want to<br>
have non-overlapping Allowed IP ranges. This usually means that the range o=
f<br>
Allowed IPs is smaller than the host&#39;s subnet. For example:<br>
<br>
Host A:<br>
IP configuration for WireGuard interface: <a href=3D"http://192.168.123.1/2=
4" rel=3D"noreferrer" target=3D"_blank">192.168.123.1/24</a><br>
Allowed IPs for Host B: <a href=3D"http://192.168.123.2/32" rel=3D"noreferr=
er" target=3D"_blank">192.168.123.2/32</a><br>
<br>
Host B:<br>
IP configuration for WireGuard interface: <a href=3D"http://192.168.123.2/2=
4" rel=3D"noreferrer" target=3D"_blank">192.168.123.2/24</a><br>
Allowed IPs for Host A: <a href=3D"http://192.168.123.1/32" rel=3D"noreferr=
er" target=3D"_blank">192.168.123.1/32</a><br>
<br>
The IP configuration tells the kernel which IP ranges are accessible via th=
e<br>
WireGuard interface. The Allowed IPs tell WireGuard, which _subset_ of thos=
e IPs<br>
is associated with each peer.<br>
<br>
&gt; Cheers,<br>
&gt; Gianluca<br>
<br>
Cheers,<br>
Samuel<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p dir=3D"ltr">Cheers,<=
/p>
<p dir=3D"ltr"><b>Steve Gilberd</b><br>
<font color=3D"#666666">Erayd LTD=C2=A0</font><b><font color=3D"#666666">=
=C2=B7</font></b><font color=3D"#666666">=C2=A0Consultant</font><br>
<i><font color=3D"#666666">Phone: +64 4 974-4229=C2=A0</font></i><b><i><fon=
t color=3D"#666666">=C2=B7</font></i></b><i><font color=3D"#666666">=C2=A0M=
ob: +64 27 565-3237</font></i><br>
<i><font color=3D"#666666">PO Box 10019 The Terrace, Wellington 6143, NZ</f=
ont></i></p>
</div></div>

--94eb2c128e684c490a056777d2ec--
