Return-Path: fukawi2@gmail.com
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
 [209.85.220.193])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a011c376
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 22:54:56 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id t2so11356299qkh.2
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2016 15:58:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oMaHXVZMqjjFbuy9tprCyfWh03dsg1XnEtudD-RuknLA@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9oMaHXVZMqjjFbuy9tprCyfWh03dsg1XnEtudD-RuknLA@mail.gmail.com>
From: Phillip Smith <fukawi2@gmail.com>
Date: Tue, 5 Jul 2016 08:57:17 +1000
Message-ID: <CAKAE9iTcZepnpH1FnGg2CM-HGerJENw+OC=yk44ZFkBepAtnHw@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=001a1146f1983882d70536d7439d
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1146f1983882d70536d7439d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Arch [AUR =E2=80=93 module, tools]
> $ yaourt -S wireguard-dkms wireguard-tools

yaourt is not a standard part of Arch, and it's often frowned upon to use
it.
That section should read something like:

> Use the AUR to install the `wireguard-dkms` and `wireguard-tools`
packages.


On 5 July 2016 at 01:50, Jason A. Donenfeld <zx2c4@gentoo.org> wrote:

> Hey guys,
>
> We're all set now!
>
> Updated the instructions on: https://www.wireguard.io/install/
>
> Debian, OpenWRT, Arch, and Gentoo seem to be solid.
>
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard
>

--001a1146f1983882d70536d7439d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default"><div class=3D"gmail_default">=
<font face=3D"verdana, sans-serif">&gt; Arch [AUR =E2=80=93 module, tools]<=
/font></div><div class=3D"gmail_default"><span style=3D"font-family:verdana=
,sans-serif">&gt; $ yaourt -S wireguard-dkms wireguard-tools</span><br></di=
v><div class=3D"gmail_default"><span style=3D"font-family:verdana,sans-seri=
f"><br></span></div><div class=3D"gmail_default"><span style=3D"font-family=
:verdana,sans-serif">yaourt is not a standard part of Arch, and it&#39;s of=
ten frowned upon to use it.</span></div><div class=3D"gmail_default"><span =
style=3D"font-family:verdana,sans-serif">That section should read something=
 like:</span></div><div class=3D"gmail_default"><span style=3D"font-family:=
verdana,sans-serif"><br></span></div><div class=3D"gmail_default"><font fac=
e=3D"verdana, sans-serif">&gt; Use the AUR to install the `</font><span sty=
le=3D"font-family:verdana,sans-serif">wireguard-dkms` and `wireguard-tools`=
 packages.</span></div><div class=3D"gmail_default"><span style=3D"font-fam=
ily:verdana,sans-serif"><br></span></div></div><div class=3D"gmail_default"=
 style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote">On 5 July 2016 at 01:50, Jason A. Donenfeld =
<span dir=3D"ltr">&lt;<a href=3D"mailto:zx2c4@gentoo.org" target=3D"_blank"=
>zx2c4@gentoo.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Hey guys,<br>
<br>
We&#39;re all set now!<br>
<br>
Updated the instructions on: <a href=3D"https://www.wireguard.io/install/" =
rel=3D"noreferrer" target=3D"_blank">https://www.wireguard.io/install/</a><=
br>
<br>
Debian, OpenWRT, Arch, and Gentoo seem to be solid.<br>
<br>
Regards,<br>
<div class=3D""><div class=3D"h5">Jason<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"http://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"norefe=
rrer" target=3D"_blank">http://lists.zx2c4.com/mailman/listinfo/wireguard</=
a><br>
</div></div></blockquote></div><br></div></div>

--001a1146f1983882d70536d7439d--
