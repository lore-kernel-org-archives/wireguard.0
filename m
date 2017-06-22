Return-Path: barhom@netsat.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc5d2724
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Jun 2017 23:52:42 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
 [209.85.128.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5f53d8c
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Jun 2017 23:52:42 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id r103so1263864wrb.0
 for <wireguard@lists.zx2c4.com>; Wed, 21 Jun 2017 17:08:31 -0700 (PDT)
MIME-Version: 1.0
From: Ibrahim Tachijian <barhom@netsat.se>
Date: Thu, 22 Jun 2017 00:08:19 +0000
Message-ID: <CACTq0bTLXJ+HGasd7re7-T4bejfpX71VSojGEWH6fv_FDSxU5w@mail.gmail.com>
Subject: wg setconf - does it reinitialize ?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c1b53b6db447a0552814839"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1b53b6db447a0552814839
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Imagine you have a WG instance between two peers working fine.

When I run "wg setconf wg0 myconf" (myconf was not changed and is identical
to what was running) then current connections break and PING does not
transverse until some time (seconds up to a min?). Probably until the next
handshake.

Is there a way to run setconf without reinitializing all the peers?
Basically, look for changes and only those changes.

Thanks,
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

--94eb2c1b53b6db447a0552814839
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey,<div><br></div><div>Imagine you have a WG instance bet=
ween two peers working fine.</div><div><br></div><div>When I run &quot;wg s=
etconf wg0 myconf&quot; (myconf was not changed and is identical to what wa=
s running) then current connections break and PING does not transverse unti=
l some time (seconds up to a min?). Probably until the next handshake.</div=
><div><br></div><div>Is there a way to run setconf without reinitializing a=
ll the peers? Basically, look for changes and only those changes.</div><div=
><br></div><div>Thanks,</div></div><div dir=3D"ltr">-- <br></div><div data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><b style=3D"color:black;font=
-family:arial,sans-serif;font-size:small"><span style=3D"font-size:11px;lin=
e-height:12.2667px">Ibrahim Tachijian</span></b><div class=3D"gmail_signatu=
re" style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sma=
ll"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><p><span style=
=3D"color:black;font-size:7.5pt;line-height:11.5px">CEO Net Sat AB<br></spa=
n><span style=3D"font-size:7.5pt;line-height:11.5px"><font color=3D"#000000=
">Mobile: +46723321377<br></font></span><a href=3D"mailto:barhom@netsat.se"=
 target=3D"_blank" style=3D"color:rgb(17,85,204);font-size:7.5pt;line-heigh=
t:11.5px">barhom@netsat.se</a></p><p style=3D"line-height:14.72px"><span st=
yle=3D"font-size:7.5pt;line-height:11.5px;color:black">____________________=
_____<br><b>Net Sat AB<br>C/O Jayway AB<br></b></span><span style=3D"color:=
black;font-size:7.5pt;line-height:11.5px">Klara =C3=96stra Kyrkogata 2B, 1T=
R, 111 52 Stockholm, Sweden<br></span><span style=3D"color:black;font-size:=
7.5pt;line-height:11.5px">Office: +46 (0)8 408 394 53</span></p></div></div=
></div></div></div></div></div>

--94eb2c1b53b6db447a0552814839--
