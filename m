Return-Path: steve@erayd.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7e0e731
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 18:45:20 +0000 (UTC)
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
 [209.85.161.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba4483b9
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 18:45:20 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id x197so5319952ywg.11
 for <wireguard@lists.zx2c4.com>; Thu, 15 Mar 2018 11:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <NRNcntoOUgLRhHI2D7GnuCHirY9j2pMH83ET-HFr4qoamFy7aIIkR_ZVcKa0wTTbQ-SfhLEr5zih04Hs-FwFaj4UenOksFs8XCMp8yKnZEk=@protonmail.com>
 <db7326ed-e0f5-c1ee-ea61-30ef6d6fa3b3@sholland.org>
 <CAJQSx3Y3EXWhtHJGi40kjYiha9nZHYs4i8v9LbbdO4PHaGnDnw@mail.gmail.com>
 <8debf4cc-572f-2a75-39c6-e109ebb8e73b@sholland.org>
In-Reply-To: <8debf4cc-572f-2a75-39c6-e109ebb8e73b@sholland.org>
From: Steve Gilberd <steve@erayd.net>
Date: Thu, 15 Mar 2018 18:55:40 +0000
Message-ID: <CAJQSx3bx5w7TySnJX2GJa+PG+6sQW6G+E=RJ0+jwRxr9qReXaA@mail.gmail.com>
Subject: Re: Allowed IPs Toggling
To: Samuel Holland <samuel@sholland.org>
Content-Type: multipart/alternative; boundary="94eb2c06148e64a3370567780ac3"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c06148e64a3370567780ac3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 > WireGuard *does* support overlapping ranges of AllowedIPs on different
peers. It
> doesn't support having *identical* ranges of AllowedIPs on different
peers,
> which was the situation here. (You're correct, there's no concept of a
metric.)

Oh good - looks like I just misunderstood your ordinal email then; I
thought you were saying that any situation with multiple routes to a single
IP was unsupported. Thanks for clarifying :-).

Cheers,
Steve

On Fri, 16 Mar 2018, 07:51 Samuel Holland, <samuel@sholland.org> wrote:

> Hello,
>
> On 03/15/18 13:39, Steve Gilberd wrote:
> >> Allowed IPs is like a routing table; you can't have two routes for the
> same
> > set of IPs
> >
> > If this is the case, then wireguard does not have proper routing suppor=
t.
> >
> > Normally, routing tables allow both multiple and overlapping routes
> present.
> > When making routing decisions, the most-specific route is chosen (e.g. =
a
> /29 is
> > higher priority than a /24 which overlaps with it). If there are two
> identical
> > routes of the same size, then the one with the lowest routing metric is
> used.
> >
> > I can understand not allowing identical routes of the same size, as
> wireguard
> > doesn't really have a concept of metric (although it could be useful fo=
r
> backup
> > links). However, it really should allow overlapping routes of different
> sizes.
> > There's no ambiguity with routing decisions, and it's a standard featur=
e
> that I
> > would normally expect any IP routing stack to have.
>
> WireGuard *does* support overlapping ranges of AllowedIPs on different
> peers. It
> doesn't support having *identical* ranges of AllowedIPs on different peer=
s,
> which was the situation here. (You're correct, there's no concept of a
> metric.)
>
> > Cheers,
> > Steve
>
> Cheers,
> Samuel
>
--=20

Cheers,

*Steve Gilberd*
Erayd LTD *=C2=B7* Consultant
*Phone: +64 4 974-4229 **=C2=B7** Mob: +64 27 565-3237*
*PO Box 10019 The Terrace, Wellington 6143, NZ*

--94eb2c06148e64a3370567780ac3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C2=A0&gt;=C2=A0WireGuard *does* support overlapping ranges of AllowedIPs o=
n different peers. It<br>&gt; doesn&#39;t support having *identical* ranges=
 of AllowedIPs on different peers,<br>&gt; which was the situation here. (Y=
ou&#39;re correct, there&#39;s no concept of a metric.)<div><br></div><div>=
Oh good - looks like I just misunderstood your ordinal email then; I though=
t you were saying that any situation with multiple routes to a single IP wa=
s unsupported. Thanks for clarifying :-).</div><div><br></div><div>Cheers,<=
/div><div>Steve</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">O=
n Fri, 16 Mar 2018, 07:51 Samuel Holland, &lt;<a href=3D"mailto:samuel@shol=
land.org">samuel@sholland.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Hello,<br>
<br>
On 03/15/18 13:39, Steve Gilberd wrote:<br>
&gt;&gt;=C2=A0Allowed IPs is like a routing table; you can&#39;t have two r=
outes for the same<br>
&gt; set of=C2=A0IPs<br>
&gt;<br>
&gt; If this is the case, then wireguard does not have proper routing suppo=
rt.<br>
&gt;<br>
&gt; Normally, routing tables allow both multiple and overlapping routes pr=
esent.<br>
&gt; When making routing decisions, the most-specific route is chosen (e.g.=
 a /29 is<br>
&gt; higher priority than a /24 which overlaps with it). If there are two i=
dentical<br>
&gt; routes of the same size, then the one with the lowest routing metric i=
s used.<br>
&gt;<br>
&gt; I can understand not allowing identical routes of the same size, as wi=
reguard<br>
&gt; doesn&#39;t really have a concept of metric (although it could be usef=
ul for backup<br>
&gt; links). However, it really should allow overlapping routes of differen=
t sizes.<br>
&gt; There&#39;s no ambiguity with routing decisions, and it&#39;s a standa=
rd feature that I<br>
&gt; would normally expect any IP routing stack to have.<br>
<br>
WireGuard *does* support overlapping ranges of AllowedIPs on different peer=
s. It<br>
doesn&#39;t support having *identical* ranges of AllowedIPs on different pe=
ers,<br>
which was the situation here. (You&#39;re correct, there&#39;s no concept o=
f a metric.)<br>
<br>
&gt; Cheers,<br>
&gt; Steve<br>
<br>
Cheers,<br>
Samuel<br>
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

--94eb2c06148e64a3370567780ac3--
