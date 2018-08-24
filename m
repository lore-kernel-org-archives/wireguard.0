Return-Path: dcow@eero.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57d3550d
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Aug 2018 19:53:19 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49ee7140
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Aug 2018 19:53:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id p10-v6so7774110ljg.2
 for <wireguard@lists.zx2c4.com>; Fri, 24 Aug 2018 13:06:30 -0700 (PDT)
MIME-Version: 1.0
From: David Cowden <dcow@eero.com>
Date: Fri, 24 Aug 2018 13:06:17 -0700
Message-ID: <CACN7iODgJZhvcjwc-Edd0z=4DxOwzL34+UbbXP_Xc87n=4ZdcQ@mail.gmail.com>
Subject: wireguard-android build error
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000004882ec057433e959"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000004882ec057433e959
Content-Type: text/plain; charset="UTF-8"

When building for android, I am seeing a linker error because the build
system is trying to pass an unsupported `-r` flag. I'm trying to build on
macOS. Does wireguard-android need to be built on Linux (or with a gcc
toolchain) right now, or is this an ndk issue, or a CMAKE configuration
issue? Here's the abridged error:

ln -sfrt ./src/git.zx2c4.com/wireguard-go/ratelimiter/
../wireguard-go/ratelimiter/ratelimiter.go; ... <many more>
ln: illegal option -- r
usage: ln [-Ffhinsv] source_file [target_file]
       ln [-Ffhinsv] source_file ... target_dir
       link source_file target_file

Thanks,
David

--0000000000004882ec057433e959
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>When building for android, I am seeing a linker error=
 because the build system is trying to pass an unsupported `-r` flag. I&#39=
;m trying to build on macOS. Does wireguard-android need to be built on Lin=
ux (or with a gcc toolchain) right now, or is this an ndk issue, or a CMAKE=
 configuration issue? Here&#39;s the abridged error:<br></div><div><br></di=
v><div><span style=3D"font-family:monospace,monospace">ln -sfrt ./src/<a hr=
ef=3D"http://git.zx2c4.com/wireguard-go/ratelimiter/">git.zx2c4.com/wiregua=
rd-go/ratelimiter/</a> ../wireguard-go/ratelimiter/ratelimiter.go; ... &lt;=
many more&gt;<br>ln: illegal option -- r<br>usage: ln [-Ffhinsv] source_fil=
e [target_file]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln [-Ffhinsv] sourc=
e_file ... target_dir<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link source_f=
ile target_file</span></div><div><span style=3D"font-family:monospace,monos=
pace"></span></div><div><br></div><div>Thanks,</div><div>David</div></div>

--0000000000004882ec057433e959--
