Return-Path: richterphilipp.pops@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 810fbe11
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 15:15:05 +0000 (UTC)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d5a8ea7
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 15:15:05 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id m26-v6so14162685uap.2
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 08:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Vb7hrqMcT3Qwr0_ZRQXE645do9iBZnJaL5Qh4GqCKSncejtg@mail.gmail.com>
 <CAHmME9ps967EZUMwL+2Scw=8pSLF16SO2C6bZ+B8LexMb7DqGQ@mail.gmail.com>
 <CA+Vb7hpM1BBg+nR8shSgg298sLt5+PPmxed9vdrYP3cRF1e9jQ@mail.gmail.com>
 <CAHmME9rAc77Z9XvvPG+mWy60OEYBycF95qddv9MrDnW_=Rgz3w@mail.gmail.com>
In-Reply-To: <CAHmME9rAc77Z9XvvPG+mWy60OEYBycF95qddv9MrDnW_=Rgz3w@mail.gmail.com>
From: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Sat, 8 Sep 2018 17:15:22 +0200
Message-ID: <CA+Vb7ho6sNPhN7jSb+XNKfAhOe_KNu=-_MrYS+M8611ZSomJJA@mail.gmail.com>
Subject: Re: Missing <asm/neon.h> with 0.0.20180904 on arm with kernel 3.10.107
To: Jason@zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000701e3405755d9819"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000701e3405755d9819
Content-Type: text/plain; charset="UTF-8"

Ah ok, I see. Thank you again :)
I hope some day all the necessary parts to make the board work will get
upstreamed.

Regards,
Philipp Richter

*Fingerprint* : *452F 7EBD 2716 B179 5E3E  A2CB AE2B 7FFA CA43 4586*
*PGP Public Key* <https://u.teknik.io/ytoEw.asc>


On Fri, 7 Sep 2018 at 16:22, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Philipp,
>
> Super ancient kernels like that cannot use Neon in kernel space.
>
> Jason
>

--000000000000701e3405755d9819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah ok, I see. Thank you again :)<div>I hope some day all t=
he necessary parts to make the board work will get upstreamed.</div><div><d=
iv><br></div><div>Regards,<br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><=
font face=3D"arial narrow, sans-serif">Philipp Richter</font></div><div><br=
></div><font face=3D"monospace, monospace" size=3D"1"><u>Fingerprint</u> : =
<b>452F 7EBD 2716 B179 5E3E =C2=A0A2CB AE2B 7FFA CA43 4586</b></font><div><=
font face=3D"monospace, monospace" size=3D"1"><a href=3D"https://u.teknik.i=
o/ytoEw.asc" target=3D"_blank"><b>PGP Public Key</b></a><br></font></div></=
div></div></div><br></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Fri, 7 Sep 2018 at 16:22, Jason A. Donenfeld &lt;<a href=3D"m=
ailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Hi Philipp,<br>
<br>
Super ancient kernels like that cannot use Neon in kernel space.<br>
<br>
Jason<br>
</blockquote></div>

--000000000000701e3405755d9819--
