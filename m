Return-Path: quanzhou822@gmail.com
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
 [209.85.161.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2eb7faec
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 03:03:20 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id i12so2723792ywa.1
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jul 2016 20:04:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
From: Quan Zhou <quanzhou822@gmail.com>
Date: Tue, 12 Jul 2016 11:03:46 +0800
Message-ID: <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a114ddd0096751b05376785dc
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114ddd0096751b05376785dc
Content-Type: text/plain; charset=UTF-8

Thank you, Jason. This is very helpful.

I was bit confused with the term AllowedIPs, and connecting to a IPv6
Endpoint somehow didn't work, so I wanted to see the logs, and find out
what I did wrong in conf.

Exerpts from configuration:

/*  ==== Begin Exerpts from Server HND06 ==== */
[Interface]
// PublicKey is 3o0...3E8=
// Has IP Address 2400:...:8993
ListenPort = 41414

[Peer]
PublicKey = K1O...4xU=
AllowedIPs = 2600:....:1487
Endpoint = [2600:...:1487]:41414

/* ==== End of HND06 ==== */

/*  ==== Begin Exerpts from Server FMT03 */
[Interface]
// PublicKey is K1O...4xU=
// Has IP address 2600:..1487
ListenPort = 41414

[Peer]
PublicKey = 3o0...3E8=
AllowedIPs = 2400:..:8993
Endpoint = [2400:...:8993]:41414

/* ==== End of FMT03 ==== */


====

Somehow the connection was never established.

Warm Regards,
Quan


On Mon, Jul 11, 2016 at 6:18 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hello Quan,
>
> You can build the module with "make debug", and then you'll get lots
> of helpful debugging information in your dmesg.
>
> What problem are you facing specifically?
>
> Regards,
> Jason
>



-- 
Regards,

Quan Zhou
+------------------------+
|pub [expires 2019-05-04]|
|2C0C 4D88 E631 4C73 4C44|
|CDE0 C0E 5470 1D2D 3F3EE|
+------------------------+
|pub [revoked 2016-04-16]|
|44D2 0307 1643 E80F 2E31|
|F081 FAFA 6643 7F9F D46F|
+------------------------+
|quanzhou822@gmail.com   |
|https://keybase.io/qzhou|
+------------------------+

--001a114ddd0096751b05376785dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you, Jason. This is very helpful.<div><br></div><div=
>I was bit confused with the term AllowedIPs, and connecting to a IPv6 Endp=
oint somehow didn&#39;t work, so I wanted to see the logs, and find out wha=
t I did wrong in conf.=C2=A0</div><div><br></div><div>Exerpts from configur=
ation:</div><div><br></div><div>/* =C2=A0=3D=3D=3D=3D Begin Exerpts from Se=
rver HND06 =3D=3D=3D=3D */</div><div>[Interface]</div><div>// PublicKey is=
=C2=A03o0...3E8=3D</div><div>// Has IP Address 2400:...:8993</div><div>List=
enPort =3D 41414</div><div><br></div><div><div>[Peer]</div><div>PublicKey =
=3D K1O...4xU=3D</div><div>AllowedIPs =3D 2600:....:1487</div><div>Endpoint=
 =3D [2600:...:1487]:41414</div></div><div><br></div><div>/* =3D=3D=3D=3D E=
nd of HND06 =3D=3D=3D=3D */</div><div><br></div><div>/* =C2=A0=3D=3D=3D=3D =
Begin Exerpts from Server FMT03 */</div><div><div>[Interface]</div><div>// =
PublicKey is K1O...4xU=3D</div><div>// Has IP address 2600:..1487</div><div=
>ListenPort =3D 41414</div></div><div><br></div><div><div>[Peer]</div><div>=
PublicKey =3D 3o0...3E8=3D</div><div>AllowedIPs =3D 2400:..:8993</div><div>=
Endpoint =3D [2400:...:8993]:41414</div></div><div><br></div><div>/* =3D=3D=
=3D=3D End of FMT03 =3D=3D=3D=3D */</div><div><br></div><div><br></div><div=
>=3D=3D=3D=3D</div><div><br></div><div>Somehow the connection was never est=
ablished.</div><div><br></div><div>Warm Regards,</div><div>Quan</div><div><=
br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On=
 Mon, Jul 11, 2016 at 6:18 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a =
href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Hello Quan,<br>
<br>
You can build the module with &quot;make debug&quot;, and then you&#39;ll g=
et lots<br>
of helpful debugging information in your dmesg.<br>
<br>
What problem are you facing specifically?<br>
<br>
Regards,<br>
Jason<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><font face=3D"monospace, monospace">Regards,<=
br><br>Quan Zhou<br></font><span style=3D"font-family:monospace,monospace;f=
ont-size:12.8px">+------------------------+</span></div><div dir=3D"ltr"><f=
ont face=3D"monospace, monospace">|pub [expires 2019-05-04]|</font><br styl=
e=3D"font-family:monospace,monospace;font-size:12.8px"><font face=3D"monosp=
ace, monospace">|2C0C 4D88 E631 4C73 4C44|<br>|CDE0 C0E 5470 1D2D 3F3EE|</f=
ont></div><div dir=3D"ltr"><font face=3D"monospace, monospace">+-----------=
-------------+<br>|pub [revoked 2016-04-16]|<br>|44D2 0307 1643 E80F 2E31|<=
br>|F081 FAFA 6643 7F9F D46F|<br>+------------------------+<br>|<a href=3D"=
mailto:quanzhou822@gmail.com" target=3D"_blank">quanzhou822@gmail.com</a>=
=C2=A0 =C2=A0|<br>|<a href=3D"https://keybase.io/qzhou" target=3D"_blank">h=
ttps://keybase.io/qzhou</a>|<br>+------------------------+</font></div></di=
v></div></div></div></div></div></div></div>
</div>

--001a114ddd0096751b05376785dc--
