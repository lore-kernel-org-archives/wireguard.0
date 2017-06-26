Return-Path: barhom@netsat.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1dc107a
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:39:42 +0000 (UTC)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2597d76
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:39:42 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 62so5190318wmw.1
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2017 04:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAEpXMn2G5W8ta39WXReXOZe_G9+gGVTZ+31u4sJ8s54DMgSzmA@mail.gmail.com>
In-Reply-To: <CAEpXMn2G5W8ta39WXReXOZe_G9+gGVTZ+31u4sJ8s54DMgSzmA@mail.gmail.com>
From: Ibrahim Tachijian <barhom@netsat.se>
Date: Mon, 26 Jun 2017 11:55:53 +0000
Message-ID: <CACTq0bR=+0wB1u6JJk=LuVxxKnPSGWp49bDtOb8oS666zkE8-Q@mail.gmail.com>
Subject: Re: debian 8 setup
To: =?UTF-8?B?0KjQstCw0YDRhiDQodC10YDQs9C10Lkg0JLQu9Cw0LTQuNC80LjRgNC+0LLQuNGH?=
 <svschwartz@gmail.com>, wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="f403045c4bdcafd1ee0552dba279"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045c4bdcafd1ee0552dba279
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sergey,

You have probably recently done an apt-get update upgrade that installed a
newer kernel-image.
I believe if you run,


   - apt-get update and upgrade
   - reboot
   - rebuild wireguard from source (make, make install)

Then wireguard should work for you.

On Mon, Jun 26, 2017 at 1:35 PM =D0=A8=D0=B2=D0=B0=D1=80=D1=86 =D0=A1=D0=B5=
=D1=80=D0=B3=D0=B5=D0=B9 =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=D0=B8=D1=80=
=D0=BE=D0=B2=D0=B8=D1=87 <
svschwartz@gmail.com> wrote:

> Hi guys!
>
> I've build debs for jessie from unstable dsc, but wireguard module failed
> to load
>
> [34282909.202963] wireguard: Unknown symbol __sk_mem_reclaim_amount (err =
0)
>
> am I doing something wrong or is it jessie simply not supported ?
>
> Regards,
> Sergey
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
--=20
*Ibrahim Tachijian*

CEO Net Sat AB
Mobile: +46723321377
barhom@netsat.se

_________________________


*Net Sat ABC/O Jayway AB*Klara =C3=96stra Kyrkogata 2B, 1TR, 111 52 Stockho=
lm,
Sweden
Office: +46 (0)8 408 394 53

--f403045c4bdcafd1ee0552dba279
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Sergey,<div><br></div><div>You have probably recentl=
y done an apt-get update upgrade that installed a newer kernel-image.</div>=
<div>I believe if you run,</div><div><br></div><div><ul><li><font size=3D"2=
">apt-get update and upgrade</font></li><li><font size=3D"2">reboot</font><=
/li><li><font size=3D"2">rebuild wireguard from source (make, make install)=
</font></li></ul><div><font size=3D"2">Then wireguard should work for you.<=
/font></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Mon, Jun 26, 2017 at 1:35 PM =D0=A8=D0=B2=D0=B0=D1=80=D1=86 =D0=A1=D0=B5=D1=
=80=D0=B3=D0=B5=D0=B9 =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=D0=B8=D1=80=D0=
=BE=D0=B2=D0=B8=D1=87 &lt;<a href=3D"mailto:svschwartz@gmail.com">svschwart=
z@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div><div><div><div>Hi guys!<br><br></div>I&#39;ve build debs for =
jessie from unstable dsc, but wireguard module failed to load<br><br>[34282=
909.202963] wireguard: Unknown symbol __sk_mem_reclaim_amount (err 0)<br><b=
r></div>am I doing something wrong or is it jessie simply not supported ?<b=
r><br></div>Regards,<br></div>Sergey<br></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div><div dir=3D"ltr">-- <br></div><div data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><b style=3D"color:black;font-family:arial,sa=
ns-serif;font-size:small"><span style=3D"font-size:11px;line-height:12.2667=
px">Ibrahim Tachijian</span></b><div class=3D"gmail_signature" style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:small"><div dir=3D"=
ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><p><span style=3D"color:black;f=
ont-size:7.5pt;line-height:11.5px">CEO Net Sat AB<br></span><span style=3D"=
font-size:7.5pt;line-height:11.5px"><font color=3D"#000000">Mobile: +467233=
21377<br></font></span><a href=3D"mailto:barhom@netsat.se" target=3D"_blank=
" style=3D"color:rgb(17,85,204);font-size:7.5pt;line-height:11.5px">barhom@=
netsat.se</a></p><p style=3D"line-height:14.72px"><span style=3D"font-size:=
7.5pt;line-height:11.5px;color:black">_________________________<br><b>Net S=
at AB<br>C/O Jayway AB<br></b></span><span style=3D"color:black;font-size:7=
.5pt;line-height:11.5px">Klara =C3=96stra Kyrkogata 2B, 1TR, 111 52 Stockho=
lm, Sweden<br></span><span style=3D"color:black;font-size:7.5pt;line-height=
:11.5px">Office: +46 (0)8 408 394 53</span></p></div></div></div></div></di=
v></div></div>

--f403045c4bdcafd1ee0552dba279--
