Return-Path: hegyi.mokka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16905525
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 10:17:30 +0000 (UTC)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
 [209.85.223.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 128680e0
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 10:17:29 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id f3so3999369iob.13
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 03:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAApANAYEwJfsopDUvDOHv5jZ62oz88wHsggVPLPgjzUMzaWCkA@mail.gmail.com>
In-Reply-To: <CAApANAYEwJfsopDUvDOHv5jZ62oz88wHsggVPLPgjzUMzaWCkA@mail.gmail.com>
From: Zsolt Hegyi <hegyi.mokka@gmail.com>
Date: Mon, 16 Apr 2018 10:31:49 +0000
Message-ID: <CAJqFBzx2=aQox=RhtK-L0FsLZ+xKL19v4jQ0WGO6hxwubBYuGQ@mail.gmail.com>
Subject: Re: Bird OSPF Problems
To: cedric Kienzler <cedrickienzler1@gmail.com>
Content-Type: multipart/alternative; boundary="001a113fd9285fc9ee0569f4bb72"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113fd9285fc9ee0569f4bb72
Content-Type: text/plain; charset="UTF-8"

Hi Cedric,

As far as I know, wireguard doesn't support multicasts yet, which OSPF uses
for neighbor discovery. The reason why BGP works is because it uses unicast
TCP packets as means of communication.

To get around this, try telling BIRD that your wireguard interface is an
NBMA network (or a point-to-point link).

vista

On Mon, 16 Apr 2018, 11:27 cedric Kienzler, <cedrickienzler1@gmail.com>
wrote:

> Hey List,
>
> i'm currently facing issues with OSPF over the wireguard tunnel.
>
> I use both, IPv4 and IPv6 and everything works fine. I can ping through
> the tunnel, traffic flows perfectly, but when i try to configure OSPF using
> the Bird routing daemon, i didn't even see a HELLO message. Also when
> trying to list the interface using 'show ospf interfaces' i didn't even see
> the Interface.
>
> For IPv6 i use 2a03.... as prefix.
> Should i configure multicast IPv6 (fe80::) on the interface too to get
> OSPF working?
>
> Interesting fact: BGB using Bird works just fine.
>
> Anyone here that could help me?
>
>
> Thanks a lot.
>
> Best regards,
> Cedi
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--001a113fd9285fc9ee0569f4bb72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cedric,<div><br></div><div>As far as I know, wireguard doesn&#39;t suppo=
rt multicasts yet, which OSPF uses for neighbor discovery. The reason why B=
GP works is because it uses unicast TCP packets as means of communication.<=
/div><div><br></div><div>To get around this, try telling BIRD that your wir=
eguard interface is an NBMA network (or a point-to-point link).</div><div><=
br></div><div>vista<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On M=
on, 16 Apr 2018, 11:27 cedric Kienzler, &lt;<a href=3D"mailto:cedrickienzle=
r1@gmail.com">cedrickienzler1@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr"><div><div><div><div><div><div><div><di=
v><div>Hey List,<br><br></div>i&#39;m currently facing issues with OSPF ove=
r the wireguard tunnel.<br><br></div>I use both, IPv4 and IPv6 and everythi=
ng works fine. I can ping through the tunnel, traffic flows perfectly, but =
when i try to configure OSPF using the Bird routing daemon, i didn&#39;t ev=
en see a HELLO message. Also when trying to list the interface using &#39;s=
how ospf interfaces&#39; i didn&#39;t even see the Interface.<br><br></div>=
For IPv6 i use 2a03.... as prefix.<br></div>Should i configure multicast IP=
v6 (fe80::) on the interface too to get OSPF working?<br><br></div>Interest=
ing fact: BGB using Bird works just fine.<br><br></div>Anyone here that cou=
ld help me?<br><br><br></div>Thanks a lot.<br><br></div>Best regards,<br></=
div>Cedi<br></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>

--001a113fd9285fc9ee0569f4bb72--
