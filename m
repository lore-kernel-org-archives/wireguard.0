Return-Path: barhom@netsat.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 720608fa
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:46:39 +0000 (UTC)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c401ca8f
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:46:39 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b84so68477387wmh.0
 for <wireguard@lists.zx2c4.com>; Mon, 29 May 2017 13:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <CACTq0bRv6KcKCvw3iYnkeFU+vvr0WTgHU5nT=TskYQ7F5NodmA@mail.gmail.com>
 <CAHmME9rzL8ZRb0zpOFXp2i_3eGsWaMSm=MQ2ODyYOs+vAxpz_Q@mail.gmail.com>
In-Reply-To: <CAHmME9rzL8ZRb0zpOFXp2i_3eGsWaMSm=MQ2ODyYOs+vAxpz_Q@mail.gmail.com>
From: Ibrahim Tachijian <barhom@netsat.se>
Date: Mon, 29 May 2017 20:59:23 +0000
Message-ID: <CACTq0bTz_TtTnrc9S+q314iUSAd0JL7FduO68+tUn9zac81mEA@mail.gmail.com>
Subject: Re: Multiple peers to one wireguard "server"
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c1af9f8cca7ab0550aff678"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1af9f8cca7ab0550aff678
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes of course, bad of me to have missed having multiple peers in one config
file.
Thank you for your help.

On Mon, May 29, 2017 at 10:54 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:

> Hi Ibrahim,
>
> On Mon, May 29, 2017 at 10:31 PM, Ibrahim Tachijian <barhom@netsat.se>
> wrote:
> > If I understand correctly if I need to connect 10 different wg "clients=
"
> to
> > one wg "server" I will require one wgX interface per-client on the
> "server".
> >
> > Is this correct? Does this mean also that each wgX interface on the
> "server"
> > needs to listen on its own UDP port or can the "server" reuse the same
> UDP
> > port?
>
> No. Each WireGuard interface may have multiple peers:
>
>            [Interface]
>            PrivateKey =3D yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=3D
>            ListenPort =3D 51820
>
>            [Peer]
>            PublicKey =3D xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=3D
>            Endpoint =3D 192.95.5.67:1234
>            AllowedIPs =3D 10.192.122.3/32, 10.192.124.1/24
>
>            [Peer]
>            PublicKey =3D TrMvSoP4jYQlY6RIzBgbssQqY3vxI2Pi+y71lOWWXX0=3D
>            Endpoint =3D [2607:5300:60:6b0::c05f:543]:2468
>            AllowedIPs =3D 10.192.122.4/32, 192.168.0.0/16
>
>            [Peer]
>            PublicKey =3D gN65BkIKy1eCE9pP1wdc8ROUtkHLF2PfAqYdyYBz6EA=3D
>            Endpoint =3D test.wireguard.io:18981
>            AllowedIPs =3D 10.10.10.230/32
>
> Please see the man page wg(8) or the front page of the website --
> www.wireguard.io -- for more details.
>
> Regards,
> Jason
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

--94eb2c1af9f8cca7ab0550aff678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes of course, bad of me to have missed having multiple pe=
ers in one config file.<div>Thank you for your help.</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr">On Mon, May 29, 2017 at 10:54 PM Jason A. Do=
nenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c=
4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Ibrahim,<br=
>
<br>
On Mon, May 29, 2017 at 10:31 PM, Ibrahim Tachijian &lt;<a href=3D"mailto:b=
arhom@netsat.se" target=3D"_blank">barhom@netsat.se</a>&gt; wrote:<br>
&gt; If I understand correctly if I need to connect 10 different wg &quot;c=
lients&quot; to<br>
&gt; one wg &quot;server&quot; I will require one wgX interface per-client =
on the &quot;server&quot;.<br>
&gt;<br>
&gt; Is this correct? Does this mean also that each wgX interface on the &q=
uot;server&quot;<br>
&gt; needs to listen on its own UDP port or can the &quot;server&quot; reus=
e the same UDP<br>
&gt; port?<br>
<br>
No. Each WireGuard interface may have multiple peers:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Interface]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PrivateKey =3D yAnz5TF+lXXJte14tji=
3zlMNq+hd2rYUIgJBgB3fBmk=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ListenPort =3D 51820<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Peer]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PublicKey =3D xTIBA5rboUvnH4htodjb=
6e697QjLERt1NAB4mZqp8Dg=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Endpoint =3D <a href=3D"http://192=
.95.5.67:1234" rel=3D"noreferrer" target=3D"_blank">192.95.5.67:1234</a><br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AllowedIPs =3D <a href=3D"http://1=
0.192.122.3/32" rel=3D"noreferrer" target=3D"_blank">10.192.122.3/32</a>, <=
a href=3D"http://10.192.124.1/24" rel=3D"noreferrer" target=3D"_blank">10.1=
92.124.1/24</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Peer]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PublicKey =3D TrMvSoP4jYQlY6RIzBgb=
ssQqY3vxI2Pi+y71lOWWXX0=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Endpoint =3D [2607:5300:60:6b0::c0=
5f:543]:2468<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AllowedIPs =3D <a href=3D"http://1=
0.192.122.4/32" rel=3D"noreferrer" target=3D"_blank">10.192.122.4/32</a>, <=
a href=3D"http://192.168.0.0/16" rel=3D"noreferrer" target=3D"_blank">192.1=
68.0.0/16</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Peer]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PublicKey =3D gN65BkIKy1eCE9pP1wdc=
8ROUtkHLF2PfAqYdyYBz6EA=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Endpoint =3D <a href=3D"http://tes=
t.wireguard.io:18981" rel=3D"noreferrer" target=3D"_blank">test.wireguard.i=
o:18981</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AllowedIPs =3D <a href=3D"http://1=
0.10.10.230/32" rel=3D"noreferrer" target=3D"_blank">10.10.10.230/32</a><br=
>
<br>
Please see the man page wg(8) or the front page of the website --<br>
<a href=3D"http://www.wireguard.io" rel=3D"noreferrer" target=3D"_blank">ww=
w.wireguard.io</a> -- for more details.<br>
<br>
Regards,<br>
Jason<br>
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><b style=3D"color:black;font-family:a=
rial,sans-serif;font-size:small"><span style=3D"font-size:11px;line-height:=
12.2667px">Ibrahim Tachijian</span></b><div class=3D"gmail_signature" style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><p><span style=3D"color:=
black;font-size:7.5pt;line-height:11.5px">CEO Net Sat AB<br></span><span st=
yle=3D"font-size:7.5pt;line-height:11.5px"><font color=3D"#000000">Mobile: =
+46723321377<br></font></span><a href=3D"mailto:barhom@netsat.se" target=3D=
"_blank" style=3D"color:rgb(17,85,204);font-size:7.5pt;line-height:11.5px">=
barhom@netsat.se</a></p><p style=3D"line-height:14.72px"><span style=3D"fon=
t-size:7.5pt;line-height:11.5px;color:black">_________________________<br><=
b>Net Sat AB<br>C/O Jayway AB<br></b></span><span style=3D"color:black;font=
-size:7.5pt;line-height:11.5px">Klara =C3=96stra Kyrkogata 2B, 1TR, 111 52 =
Stockholm, Sweden<br></span><span style=3D"color:black;font-size:7.5pt;line=
-height:11.5px">Office: +46 (0)8 408 394 53</span></p></div></div></div></d=
iv></div></div></div>

--94eb2c1af9f8cca7ab0550aff678--
