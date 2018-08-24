Return-Path: dcow@eero.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8375f1d6
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Aug 2018 23:16:24 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37916cb8
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Aug 2018 23:16:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id e23-v6so7831911lfc.13
 for <wireguard@lists.zx2c4.com>; Fri, 24 Aug 2018 16:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <CACN7iODgJZhvcjwc-Edd0z=4DxOwzL34+UbbXP_Xc87n=4ZdcQ@mail.gmail.com>
In-Reply-To: <CACN7iODgJZhvcjwc-Edd0z=4DxOwzL34+UbbXP_Xc87n=4ZdcQ@mail.gmail.com>
From: David Cowden <dcow@eero.com>
Date: Fri, 24 Aug 2018 16:29:23 -0700
Message-ID: <CACN7iOB=nP3RkXGBx_rEBObQyAnKVv2RN6KVDox080g7-oLpyw@mail.gmail.com>
Subject: Re: wireguard-android build error
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000009a01b4057436bf94"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000009a01b4057436bf94
Content-Type: text/plain; charset="UTF-8"

The project builds on a linux host.

On Fri, Aug 24, 2018 at 1:06 PM David Cowden <dcow@eero.com> wrote:

> When building for android, I am seeing a linker error because the build
> system is trying to pass an unsupported `-r` flag. I'm trying to build on
> macOS. Does wireguard-android need to be built on Linux (or with a gcc
> toolchain) right now, or is this an ndk issue, or a CMAKE configuration
> issue? Here's the abridged error:
>
> ln -sfrt ./src/git.zx2c4.com/wireguard-go/ratelimiter/
> ../wireguard-go/ratelimiter/ratelimiter.go; ... <many more>
> ln: illegal option -- r
> usage: ln [-Ffhinsv] source_file [target_file]
>        ln [-Ffhinsv] source_file ... target_dir
>        link source_file target_file
>
> Thanks,
> David
>

--0000000000009a01b4057436bf94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The project builds on a linux host.<br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">On Fri, Aug 24, 2018 at 1:06 PM David Co=
wden &lt;<a href=3D"mailto:dcow@eero.com">dcow@eero.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>When building for=
 android, I am seeing a linker error because the build system is trying to =
pass an unsupported `-r` flag. I&#39;m trying to build on macOS. Does wireg=
uard-android need to be built on Linux (or with a gcc toolchain) right now,=
 or is this an ndk issue, or a CMAKE configuration issue? Here&#39;s the ab=
ridged error:<br></div><div><br></div><div><span style=3D"font-family:monos=
pace,monospace">ln -sfrt ./src/<a href=3D"http://git.zx2c4.com/wireguard-go=
/ratelimiter/" target=3D"_blank">git.zx2c4.com/wireguard-go/ratelimiter/</a=
> ../wireguard-go/ratelimiter/ratelimiter.go; ... &lt;many more&gt;<br>ln: =
illegal option -- r<br>usage: ln [-Ffhinsv] source_file [target_file]<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln [-Ffhinsv] source_file ... target_d=
ir<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link source_file target_file</sp=
an></div><div><span style=3D"font-family:monospace,monospace"></span></div>=
<div><br></div><div>Thanks,</div><div>David</div></div>
</blockquote></div>

--0000000000009a01b4057436bf94--
