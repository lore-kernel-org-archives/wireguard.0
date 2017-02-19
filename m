Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0177152
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 19:02:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 494ed7e1
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 19:02:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a70b22d
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 19:02:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9589e13d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 19:02:03 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id x10so17657496otb.1
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2017 11:02:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ossQJ3U54yOmY98dcdG239xm6KeHQt+n8zb6R0x4yUZA@mail.gmail.com>
References: <EF6AB0BF-E341-41C1-8744-7CA8A5A778D0@dd19.de>
 <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>
 <E8A0979F-E0B0-4614-801C-A56F94039F4B@dd19.de>
 <ddd1e40b-1b18-3112-c70e-34d2998cab0c@eggiecode.org>
 <CAHmME9ossQJ3U54yOmY98dcdG239xm6KeHQt+n8zb6R0x4yUZA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 19 Feb 2017 20:02:37 +0100
Message-ID: <CAHmME9okhff5V4iiarnpcOcCFVvMFygGSA4NAFSTKkEqW9Ch7g@mail.gmail.com>
Subject: Re: wg binary in armhf deb from ppa missing; armbian with Allwinner
 A20 chip modprobe wg not working
To: Egbert Verhage <egbert@eggiecode.org>
Content-Type: multipart/alternative; boundary=001a1140a46267d1920548e6ca7c
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1140a46267d1920548e6ca7c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Make sure your binutils is up to date; an old one could account for the
error you're having. What version is your toolchain?

Jason


On Feb 19, 2017 18:22, "Egbert Verhage" <egbert@eggiecode.org> wrote:

Hey Alex,

The Banana PI boards here an Allwinner chip, which not great with the Linux
Kernel. All the kernels are custom builds (most of the time) to include
support for the chips/boards.
>From my experience the builds of armbian have the best images (Mind the I
have Banana PI M2, with an Allwinner A31S).

I can't help furder with wg on BananaPi board, sorry. Maybe somone else in
the mailing can help.

For the PPA package I need to figure out how the let him include make
install of wg/tools for armhf/arm64.

Greetz,
Egbert

On 2017-02-19 17:29, Alexander Morlang wrote:

Hi,
building on armhf reveals some effects i don=E2=80=99t understand:
On my raspi3 with raspian and kernel
uname -a
Linux raspberrypi 4.4.38-v7+ #938 SMP Thu Dec 15 15:22:21 GMT 2016
armv7l GNU/Linux
kernelmodule&wg are building just fine an the module loads. i had no
time for testing it, but it builds.

On Banana Pro with armbian an kernel
uname -a
Linux bananapipro 4.9.7-sunxi #1 SMP Thu Feb 2 01:52:06 CET 2017
armv7l armv7l armv7l GNU/Linux
it=E2=80=99s building, but the module will not load:

sudo modprobe wireguard
modprobe: ERROR: could not insert 'wireguard': Exec format error

modinfo wireguard
filename:       /lib/modules/4.9.7-sunxi/extra/wireguard.ko
alias:          rtnl-link-wireguard
author:         Jason A. Donenfeld <Jason@zx2c4.com> <Jason@zx2c4.com>
description:    Fast, secure, and modern VPN tunnel
license:        GPL v2
depends:        udp_tunnel,ip6_udp_tunnel,x_tables
vermagic:       4.9.7-sunxi SMP mod_unload ARMv7 thumb2 p2v8

In dmesg, it shows:
[ 1404.917772] wireguard: loading out-of-tree module taints kernel.
[ 1404.919392] wireguard: unknown relocation: 102

Next i will try with bananian and 4.4 kernel.

Gru=C3=9F, Alex


Am 19.02.2017 um 15:51 schrieb Egbert Verhage <egbert@eggiecode.org>
<egbert@eggiecode.org>:

Hey Alex,

Ow, I never tested the package on armhf. I will give test it tomorrow on
my own Banana Pi 2 and Raspberry pi 2.

If you are running the image of lemaker on your banana pi, maybe try
first to build the package from the git repo.

Greetz,
Egbert


On 2017-02-19 02:14, Alexander Morlang wrote:

Hi,
used the launchpad ppa in xenial on armhf (Banana Pro).
The wireguard-tools packet installed only /usr/share/doc

Is this a known problem?

I downloaded thehttps://launchpad.net/~wireguard/+archive/ubuntu/wireguard/=
+files/wireguard-tools_0.0.20170214-wg1~xenial_armhf.deb
and hat a look with dpkg -c <file>, getting the same result of no
binary in the packet.

regards, Alex
_______________________________________________
WireGuard mailing
listWireGuard@lists.zx2c4.comhttps://lists.zx2c4.com/mailman/listinfo/wireg=
uard

_______________________________________________
WireGuard mailing
listWireGuard@lists.zx2c4.comhttps://lists.zx2c4.com/mailman/listinfo/wireg=
uard

_______________________________________________
WireGuard mailing
listWireGuard@lists.zx2c4.comhttps://lists.zx2c4.com/mailman/listinfo/wireg=
uard



_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--001a1140a46267d1920548e6ca7c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Mak=
e sure your binutils is up to date; an old one could account for the error =
you&#39;re having. What version is your toolchain?=C2=A0</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Jason</div><br><div class=3D"gmail_extra" =
dir=3D"auto"><br><div class=3D"gmail_quote">On Feb 19, 2017 18:22, &quot;Eg=
bert Verhage&quot; &lt;<a href=3D"mailto:egbert@eggiecode.org">egbert@eggie=
code.org</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Hey Alex,</p>
    <p>The Banana PI boards here an Allwinner chip, <span class=3D"m_201002=
9910875568225gt-baf-word-clickable">which</span> not great with the
      Linux Kernel. All the kernels are custom builds (most of the time)
      to include support for the chips/boards.<br>
      From my experience the builds of armbian have the best images
      (Mind the I have Banana PI M2, with an Allwinner A31S).<br>
    </p>
    <p>I can&#39;t help furder with wg on BananaPi board, sorry. Maybe
      somone else in the mailing can help.<br>
    </p>
    <p>For the PPA package I need to figure out how the let him include
      make install of wg/tools for armhf/arm64.</p>
    <p>Greetz,<br>
      Egbert<br>
    </p>
    <br>
    <div class=3D"m_2010029910875568225moz-cite-prefix">On 2017-02-19 17:29=
, Alexander Morlang
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>Hi,
building on armhf reveals some effects i don=E2=80=99t understand:
On my raspi3 with raspian and kernel
uname -a
Linux raspberrypi 4.4.38-v7+ #938 SMP Thu Dec 15 15:22:21 GMT 2016 armv7l G=
NU/Linux
kernelmodule&amp;wg are building just fine an the module loads. i had no ti=
me for testing it, but it builds.

On Banana Pro with armbian an kernel
uname -a
Linux bananapipro 4.9.7-sunxi #1 SMP Thu Feb 2 01:52:06 CET 2017 armv7l arm=
v7l armv7l GNU/Linux
it=E2=80=99s building, but the module will not load:

sudo modprobe wireguard=20
modprobe: ERROR: could not insert &#39;wireguard&#39;: Exec format error

modinfo wireguard=20
filename:       /lib/modules/4.9.7-sunxi/<wbr>extra/wireguard.ko
alias:          rtnl-link-wireguard
author:         Jason A. Donenfeld <a class=3D"m_2010029910875568225moz-txt=
-link-rfc2396E" href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">&lt;Jason=
@zx2c4.com&gt;</a>
description:    Fast, secure, and modern VPN tunnel
license:        GPL v2
depends:        udp_tunnel,ip6_udp_tunnel,x_<wbr>tables
vermagic:       4.9.7-sunxi SMP mod_unload ARMv7 thumb2 p2v8=20

In dmesg, it shows:
[ 1404.917772] wireguard: loading out-of-tree module taints kernel.
[ 1404.919392] wireguard: unknown relocation: 102

Next i will try with bananian and 4.4 kernel.

Gru=C3=9F, Alex

</pre>
      <blockquote type=3D"cite">
        <pre>Am 19.02.2017 um 15:51 schrieb Egbert Verhage <a class=3D"m_20=
10029910875568225moz-txt-link-rfc2396E" href=3D"mailto:egbert@eggiecode.org=
" target=3D"_blank">&lt;egbert@eggiecode.org&gt;</a>:

Hey Alex,

Ow, I never tested the package on armhf. I will give test it tomorrow on
my own Banana Pi 2 and Raspberry pi 2.

If you are running the image of lemaker on your banana pi, maybe try
first to build the package from the git repo.

Greetz,
Egbert


On 2017-02-19 02:14, Alexander Morlang wrote:
</pre>
        <blockquote type=3D"cite">
          <pre>Hi,
used the launchpad ppa in xenial on armhf (Banana Pro).=20
The wireguard-tools packet installed only /usr/share/doc

Is this a known problem?

I downloaded the
<a class=3D"m_2010029910875568225moz-txt-link-freetext" href=3D"https://lau=
nchpad.net/~wireguard/+archive/ubuntu/wireguard/+files/wireguard-tools_0.0.=
20170214-wg1~xenial_armhf.deb" target=3D"_blank">https://launchpad.net/~<wb=
r>wireguard/+archive/ubuntu/<wbr>wireguard/+files/wireguard-<wbr>tools_0.0.=
20170214-wg1~xenial_<wbr>armhf.deb</a>
and hat a look with dpkg -c &lt;file&gt;, getting the same result of no bin=
ary in the packet.

regards, Alex
______________________________<wbr>_________________
WireGuard mailing list
<a class=3D"m_2010029910875568225moz-txt-link-abbreviated" href=3D"mailto:W=
ireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@lists.zx2c4.com</a>
<a class=3D"m_2010029910875568225moz-txt-link-freetext" href=3D"https://lis=
ts.zx2c4.com/mailman/listinfo/wireguard" target=3D"_blank">https://lists.zx=
2c4.com/<wbr>mailman/listinfo/wireguard</a>
</pre>
        </blockquote>
        <pre>______________________________<wbr>_________________
WireGuard mailing list
<a class=3D"m_2010029910875568225moz-txt-link-abbreviated" href=3D"mailto:W=
ireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@lists.zx2c4.com</a>
<a class=3D"m_2010029910875568225moz-txt-link-freetext" href=3D"https://lis=
ts.zx2c4.com/mailman/listinfo/wireguard" target=3D"_blank">https://lists.zx=
2c4.com/<wbr>mailman/listinfo/wireguard</a>
</pre>
      </blockquote>
      <pre>______________________________<wbr>_________________
WireGuard mailing list
<a class=3D"m_2010029910875568225moz-txt-link-abbreviated" href=3D"mailto:W=
ireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@lists.zx2c4.com</a>
<a class=3D"m_2010029910875568225moz-txt-link-freetext" href=3D"https://lis=
ts.zx2c4.com/mailman/listinfo/wireguard" target=3D"_blank">https://lists.zx=
2c4.com/<wbr>mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <br>
  </div>

<br>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
<br></blockquote></div><br><br></div></div>

--001a1140a46267d1920548e6ca7c--
