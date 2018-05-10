Return-Path: henry.snow@nielsen.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d804c0b2
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 16:28:59 +0000 (UTC)
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3047cde1
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 16:28:59 +0000 (UTC)
Received: by mail-pf0-x22f.google.com with SMTP id p12-v6so1318515pff.13
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 09:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
 <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
In-Reply-To: <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
From: Henry Snow <henry.snow@nielsen.com>
Date: Thu, 10 May 2018 16:31:32 +0000
Message-ID: <CAFuSFDEf9gUMW5nOcStnFM22dvAa_mAtMAVnk92m-dRY2xFa5w@mail.gmail.com>
Subject: Re: wireguard-dkms and CentOS 7.5
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="000000000000092f73056bdc8e36"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000092f73056bdc8e36
Content-Type: text/plain; charset="UTF-8"

Perfect, that patch worked for me. Thank you for the quick fix!

On Thu, May 10, 2018 at 12:14 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi again,
>
> I've fixed that here:
>
> https://git.zx2c4.com/WireGuard/patch/?id=94f25e47b23ddeba26120de4ee3c098438fc2251
>
> This will be part of the next snapshot. In the meantime, you can apply
> that manually to the src directory, and perhaps Joe (CCd) can add it
> to the rpm.
>
> Jason
>
-- 
Henry Snow | Director, Site Reliability Engineering
eXelate, a Nielsen company <http://exelate.com/>
E: henry.snow@nielsen.com | M: 347.366.2700
675 6th Ave, 3rd Floor, New York, NY 10010

--000000000000092f73056bdc8e36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Perfect, that patch worked for me. Thank you for the quick=
 fix!<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, May 10, 20=
18 at 12:14 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Ja=
son@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi aga=
in,<br>
<br>
I&#39;ve fixed that here:<br>
<a href=3D"https://git.zx2c4.com/WireGuard/patch/?id=3D94f25e47b23ddeba2612=
0de4ee3c098438fc2251" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c=
4.com/WireGuard/patch/?id=3D94f25e47b23ddeba26120de4ee3c098438fc2251</a><br=
>
<br>
This will be part of the next snapshot. In the meantime, you can apply<br>
that manually to the src directory, and perhaps Joe (CCd) can add it<br>
to the rpm.<br>
<br>
Jason<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><font color=3D"#808080"=
 style=3D"line-height:normal;font-family:cantarell">Henry Snow | Director, =
Site Reliability Engineering</font><div><font color=3D"#808080" style=3D"li=
ne-height:normal;font-family:cantarell"><a href=3D"http://exelate.com/">eXe=
late, a Nielsen company</a></font><br style=3D"line-height:normal;color:rgb=
(0,0,0);font-family:cantarell"><font color=3D"#808080" style=3D"line-height=
:normal;font-family:cantarell">E:=C2=A0<a href=3D"mailto:henry.snow@nielsen=
.com">henry.snow@nielsen.com</a>=C2=A0|=C2=A0</font><span style=3D"color:rg=
b(128,128,128);font-family:cantarell;line-height:normal">M: 347.366.2700</s=
pan><br style=3D"line-height:normal;color:rgb(0,0,0);font-family:cantarell"=
><font color=3D"#808080" style=3D"line-height:normal;font-family:cantarell"=
>675 6th Ave, 3rd Floor, New York, NY 10010=C2=A0</font><br></div></div></d=
iv>

--000000000000092f73056bdc8e36--
