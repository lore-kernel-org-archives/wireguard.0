Return-Path: dave@natulte.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a061352
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 11:35:31 +0000 (UTC)
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
 [209.85.213.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6dfe75cc
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 11:35:31 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id t8so40612246vke.3
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 03:49:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qkRgySY61Cqm76Lqs_f3U3V3p5YF1G0kE1CCPd9u398Q@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
 <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
 <CAHmME9rumLr0V6yD=zoHk-GSN2-bCiGe644WHtt4EJvKrhtLoA@mail.gmail.com>
 <CAMx+r7VkgtkFdqkKVbeX_Pv=T1TO6KaTY-+T1iM2OphS-L8mWA@mail.gmail.com>
 <CAHmME9qkRgySY61Cqm76Lqs_f3U3V3p5YF1G0kE1CCPd9u398Q@mail.gmail.com>
From: David Anderson <dave@natulte.net>
Date: Sat, 11 Feb 2017 03:48:59 -0800
Message-ID: <CAMx+r7WLJ5S-Op_9dq4AY9BNmk6u7xMOwqwVoAis=_pqJX1_-g@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c07ad500577bf05483fce9f
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c07ad500577bf05483fce9f
Content-Type: text/plain; charset=UTF-8

Okay, I've set up a Debian stable builder as well... However, Debian stable
has a 3.16 kernel, and wireguard-dkms requires >=3.18, so installation
fails. Assuming 3.18 is a hard lower-bound on kernel versions, it looks
like jessie will never run in-kernel wireguard. Fortunately it'll be moot
in a few months when stretch becomes the new stable.

- Dave



On Sat, Feb 11, 2017 at 2:17 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Dave,
>
> Ahh right, that old debate.
>
> Jason
>

--94eb2c07ad500577bf05483fce9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Okay, I&#39;ve set up a Debian stable builder as well... H=
owever, Debian stable has a 3.16 kernel, and wireguard-dkms requires &gt;=
=3D3.18, so installation fails. Assuming 3.18 is a hard lower-bound on kern=
el versions, it looks like jessie will never run in-kernel wireguard. Fortu=
nately it&#39;ll be moot in a few months when stretch becomes the new stabl=
e.<div><br></div><div>- Dave<br><div><br></div><div><br></div></div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Feb 11, 20=
17 at 2:17 AM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:J=
ason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Dave,<br>
<br>
Ahh right, that old debate.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Jason<br>
</font></span></blockquote></div><br></div>

--94eb2c07ad500577bf05483fce9f--
