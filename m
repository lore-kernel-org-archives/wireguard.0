Return-Path: barhom@netsat.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02c50266
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:18:54 +0000 (UTC)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d59e8b05
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:18:54 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id d127so72266966wmf.0
 for <wireguard@lists.zx2c4.com>; Mon, 29 May 2017 13:31:49 -0700 (PDT)
MIME-Version: 1.0
From: Ibrahim Tachijian <barhom@netsat.se>
Date: Mon, 29 May 2017 20:31:36 +0000
Message-ID: <CACTq0bRv6KcKCvw3iYnkeFU+vvr0WTgHU5nT=TskYQ7F5NodmA@mail.gmail.com>
Subject: Multiple peers to one wireguard "server"
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c0e3f3075bd8d0550af9308"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c0e3f3075bd8d0550af9308
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If I understand correctly if I need to connect 10 different wg "clients" to
one wg "server" I will require one wgX interface per-client on the "server"=
.

Is this correct? Does this mean also that each wgX interface on the
"server" needs to listen on its own UDP port or can the "server" reuse the
same UDP port?

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

--94eb2c0e3f3075bd8d0550af9308
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If I understand correctly if I need to connect 10 differen=
t wg &quot;clients&quot; to one wg &quot;server&quot; I will require one wg=
X interface per-client on the &quot;server&quot;.<div><br></div><div>Is thi=
s correct? Does this mean also that each wgX interface on the &quot;server&=
quot; needs to listen on its own UDP port or can the &quot;server&quot; reu=
se the same UDP port?</div><div><br></div><div>Thanks,</div></div><div dir=
=3D"ltr">-- <br></div><div data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><b style=3D"color:black;font-family:arial,sans-serif;font-size:small"><=
span style=3D"font-size:11px;line-height:12.2667px">Ibrahim Tachijian</span=
></b><div class=3D"gmail_signature" style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:small"><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div dir=3D"ltr"><p><span style=3D"color:black;font-size:7.5pt;line-height:=
11.5px">CEO Net Sat AB<br></span><span style=3D"font-size:7.5pt;line-height=
:11.5px"><font color=3D"#000000">Mobile: +46723321377<br></font></span><a h=
ref=3D"mailto:barhom@netsat.se" target=3D"_blank" style=3D"color:rgb(17,85,=
204);font-size:7.5pt;line-height:11.5px">barhom@netsat.se</a></p><p style=
=3D"line-height:14.72px"><span style=3D"font-size:7.5pt;line-height:11.5px;=
color:black">_________________________<br><b>Net Sat AB<br>C/O Jayway AB<br=
></b></span><span style=3D"color:black;font-size:7.5pt;line-height:11.5px">=
Klara =C3=96stra Kyrkogata 2B, 1TR, 111 52 Stockholm, Sweden<br></span><spa=
n style=3D"color:black;font-size:7.5pt;line-height:11.5px">Office: +46 (0)8=
 408 394 53</span></p></div></div></div></div></div></div></div>

--94eb2c0e3f3075bd8d0550af9308--
