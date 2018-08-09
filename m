Return-Path: mdlayher@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68d980d3
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 00:19:16 +0000 (UTC)
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9c5dbc6
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 00:19:16 +0000 (UTC)
Received: by mail-qk0-x22d.google.com with SMTP id 191-v6so2873541qki.13
 for <wireguard@lists.zx2c4.com>; Wed, 08 Aug 2018 17:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <8b63f0e3-3f0f-d028-59de-5eb08af2e26a@gmail.com>
 <CAHmME9qi0v1yMbTK+tTjB2RYjriZeRJBDH5i7yNfQcopfmJfOA@mail.gmail.com>
In-Reply-To: <CAHmME9qi0v1yMbTK+tTjB2RYjriZeRJBDH5i7yNfQcopfmJfOA@mail.gmail.com>
From: Matt Layher <mdlayher@gmail.com>
Date: Wed, 8 Aug 2018 20:30:14 -0400
Message-ID: <CAHQtf6-gQRYWfb0eiWuMmke5S9LO3tf26h+YczKwtAZNALtJiA@mail.gmail.com>
Subject: Re: Kernel module sends infinite netlink messages on v0.0.20180802
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="000000000000b5fcd00572f5bb0b"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000b5fcd00572f5bb0b
Content-Type: text/plain; charset="UTF-8"

Excellent! That's much more concise.

- Matt

On Wed, Aug 8, 2018, 8:11 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Thanks for letting me know. I've got a simpler reproducer now:
>
>     #!/bin/bash
>
>     a=( )
>     for i in {1..197}; do
>             a+=( abcd::$i )
>     done
>
>     s="$IFS"
>     IFS=,
>     a="${a[*]}"
>     IFS="$s"
>
>     ip link del wg0
>     ip link add wg0 type wireguard
>     wg set wg0 peer "$(wg genkey)" allowed-ips "$a"
>     wg set wg0 peer "$(wg genkey)" allowed-ips "$a"
>     wg
>
> I'll have this fixed shortly and will ping back on this thread.
>
> Jason
>

--000000000000b5fcd00572f5bb0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Excellent! That&#39;s much more concise.<div dir=3D"auto"=
><br></div><div dir=3D"auto">- Matt</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Wed, Aug 8, 2018, 8:11 PM Jason A. Donenfeld &lt;<a =
href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Thanks for letting me know. I&#39;ve got a simp=
ler reproducer now:<br>
<br>
=C2=A0 =C2=A0 #!/bin/bash<br>
<br>
=C2=A0 =C2=A0 a=3D( )<br>
=C2=A0 =C2=A0 for i in {1..197}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a+=3D( abcd::$i )<br>
=C2=A0 =C2=A0 done<br>
<br>
=C2=A0 =C2=A0 s=3D&quot;$IFS&quot;<br>
=C2=A0 =C2=A0 IFS=3D,<br>
=C2=A0 =C2=A0 a=3D&quot;${a[*]}&quot;<br>
=C2=A0 =C2=A0 IFS=3D&quot;$s&quot;<br>
<br>
=C2=A0 =C2=A0 ip link del wg0<br>
=C2=A0 =C2=A0 ip link add wg0 type wireguard<br>
=C2=A0 =C2=A0 wg set wg0 peer &quot;$(wg genkey)&quot; allowed-ips &quot;$a=
&quot;<br>
=C2=A0 =C2=A0 wg set wg0 peer &quot;$(wg genkey)&quot; allowed-ips &quot;$a=
&quot;<br>
=C2=A0 =C2=A0 wg<br>
<br>
I&#39;ll have this fixed shortly and will ping back on this thread.<br>
<br>
Jason<br>
</blockquote></div>

--000000000000b5fcd00572f5bb0b--
