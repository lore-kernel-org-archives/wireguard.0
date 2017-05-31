Return-Path: barhom@netsat.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cfa07e4
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 10:55:10 +0000 (UTC)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9492514
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 10:55:10 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id e127so14554470wmg.1
 for <wireguard@lists.zx2c4.com>; Wed, 31 May 2017 04:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <CACTq0bRBqH85OhjF2gRmkRGay91+L=XXy7Y6mAYuodGPz9L62w@mail.gmail.com>
 <CAHmME9qLvaHjC7E5ZwF49AQMfQXZbCXFkfmsoxYyUxYSKDo8yg@mail.gmail.com>
In-Reply-To: <CAHmME9qLvaHjC7E5ZwF49AQMfQXZbCXFkfmsoxYyUxYSKDo8yg@mail.gmail.com>
From: Ibrahim Tachijian <barhom@netsat.se>
Date: Wed, 31 May 2017 11:08:05 +0000
Message-ID: <CACTq0bT0AzQyDa4pJ7vufLuXU6E7P2rMb-i5ZFPpeDbjbME48Q@mail.gmail.com>
Subject: Re: Wireguard and MTU
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c1af9f8e2a27e0550cfefc9"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1af9f8e2a27e0550cfefc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The option mtu_fix was already inside my 'WAN' zone, so I went ahead and
added it to my 'LAN' zone instead and lo' and behold everything started
working.

Thanks again,

On Wed, May 31, 2017 at 12:59 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:

> Set the mtu_fix boolean to 1 in your firewall config.
> https://wiki.openwrt.org/doc/uci/firewall
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

--94eb2c1af9f8e2a27e0550cfefc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The option mtu_fix was already inside my &#39;WAN&#39; zon=
e, so I went ahead and added it to my &#39;LAN&#39; zone instead and lo&#39=
; and behold everything started working.<div><br></div><div>Thanks again,</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, May 31, 2=
017 at 12:59 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">J=
ason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Set t=
he mtu_fix boolean to 1 in your firewall config.<br>
<a href=3D"https://wiki.openwrt.org/doc/uci/firewall" rel=3D"noreferrer" ta=
rget=3D"_blank">https://wiki.openwrt.org/doc/uci/firewall</a><br>
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

--94eb2c1af9f8e2a27e0550cfefc9--
