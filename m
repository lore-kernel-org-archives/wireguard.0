Return-Path: richterphilipp.pops@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dde621b0
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 07:24:42 +0000 (UTC)
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6995dd95
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 07:24:42 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id w7-v6so11181610uan.9
 for <wireguard@lists.zx2c4.com>; Fri, 07 Sep 2018 00:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Vb7hrqMcT3Qwr0_ZRQXE645do9iBZnJaL5Qh4GqCKSncejtg@mail.gmail.com>
 <CAHmME9ps967EZUMwL+2Scw=8pSLF16SO2C6bZ+B8LexMb7DqGQ@mail.gmail.com>
In-Reply-To: <CAHmME9ps967EZUMwL+2Scw=8pSLF16SO2C6bZ+B8LexMb7DqGQ@mail.gmail.com>
From: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Fri, 7 Sep 2018 09:24:49 +0200
Message-ID: <CA+Vb7hpM1BBg+nR8shSgg298sLt5+PPmxed9vdrYP3cRF1e9jQ@mail.gmail.com>
Subject: Re: Missing <asm/neon.h> with 0.0.20180904 on arm with kernel 3.10.107
To: Jason@zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000cbaca2057542e73d"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000cbaca2057542e73d
Content-Type: text/plain; charset="UTF-8"

Hello Jason,

yes this works indeed thank you!

This means however that NEON SIMD instructions are not used, right ? The
datasheet of the board mentions that it includes the NEON SIMD coprocessor
: https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf

And CONFIG_NEON=y is activated in the kernel. Forgive me, I don't know much
about what it means for the wireguard module not using the neon simd
instructions.

Best Regards,
Philipp Richter

*Fingerprint* : *452F 7EBD 2716 B179 5E3E  A2CB AE2B 7FFA CA43 4586*
*PGP Public Key* <https://u.teknik.io/ytoEw.asc>


On Fri, 7 Sep 2018 at 04:47, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Philipp,
>
> Thanks for the report. Can you tell me if this fixes it for you?
>
>
> https://git.zx2c4.com/WireGuard/commit/?id=dcb765a453fa22e4195bc42de1792567fe511c67
>
> Jason
>

--000000000000cbaca2057542e73d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Jason,<div><br></div><div>yes this =
works indeed thank you!</div><div><br></div><div>This means however that NE=
ON SIMD instructions are not used, right ? The datasheet of the board menti=
ons that it includes the NEON SIMD coprocessor :=C2=A0<a href=3D"https://dn=
.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf">https://dn=
.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf</a></div><d=
iv><br></div><div>And=C2=A0<span style=3D"color:rgb(0,0,0);font-family:mono=
space">CONFIG_NEON=3Dy=C2=A0</span>is activated in the kernel. Forgive me, =
I don&#39;t know much about what it means for the wireguard module not usin=
g the neon simd instructions.</div><div><br></div><div>Best Regards,</div><=
div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><=
font face=3D"arial narrow, sans-serif">Philipp Richter</font></div><div><br=
></div><font face=3D"monospace, monospace" size=3D"1"><u>Fingerprint</u> : =
<b>452F 7EBD 2716 B179 5E3E =C2=A0A2CB AE2B 7FFA CA43 4586</b></font><div><=
font face=3D"monospace, monospace" size=3D"1"><a href=3D"https://u.teknik.i=
o/ytoEw.asc" target=3D"_blank"><b>PGP Public Key</b></a><br></font></div></=
div></div></div><br></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Fri, 7 Sep 2018 at 04:47, Jason A. Donenfeld &lt;<a href=3D"m=
ailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Hi Philipp,<br>
<br>
Thanks for the report. Can you tell me if this fixes it for you?<br>
<br>
<a href=3D"https://git.zx2c4.com/WireGuard/commit/?id=3Ddcb765a453fa22e4195=
bc42de1792567fe511c67" rel=3D"noreferrer" target=3D"_blank">https://git.zx2=
c4.com/WireGuard/commit/?id=3Ddcb765a453fa22e4195bc42de1792567fe511c67</a><=
br>
<br>
Jason<br>
</blockquote></div>

--000000000000cbaca2057542e73d--
