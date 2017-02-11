Return-Path: dave@natulte.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9adf0b6d
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 00:10:28 +0000 (UTC)
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
 [209.85.213.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6044a3c
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 00:10:27 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id t8so36796700vke.3
 for <wireguard@lists.zx2c4.com>; Fri, 10 Feb 2017 16:24:13 -0800 (PST)
MIME-Version: 1.0
From: David Anderson <dave@natulte.net>
Date: Fri, 10 Feb 2017 16:23:50 -0800
Message-ID: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
Subject: (Unofficial) wireguard packages for Debian Stretch (testing)
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=001a11415e88b6df330548363b05
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11415e88b6df330548363b05
Content-Type: text/plain; charset=UTF-8

Mellow greetings,

In case it's of use to anyone, I've built wireguard packages for Debian
testing. I wanted to play with wireguard on my Debian Stretch systems, but
wireguard is currently locked to Sid only until 1.0 brings API stability
guarantees.

So, I set up a cronjob that rebuilds the Sid source package on a Stretch
system, and the result is wireguard packages that track the latest release,
but don't pull in unstable versions of libc and whatnot when you try to
install them, as would happen if you tried to install via package pinning.

Naturally, you have only my word that the packages are unmodified rebuilds
of Debian's original package, and you're trusting packagecloud to not
tamper with the packages (it's their signing keys, not mine) so caveat
emptor. It works for me, it might work for you as well.

With the warnings and disclaimers out of the way, here's the repo:
https://packagecloud.io/danderson/wireguard?filter=debs

- Dave

--001a11415e88b6df330548363b05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Mellow greetings,</div><div><br></div><div>In case it=
&#39;s of use to anyone, I&#39;ve built wireguard packages for Debian testi=
ng. I wanted to play with wireguard on my Debian Stretch systems, but wireg=
uard is currently locked to Sid only until 1.0 brings API stability guarant=
ees.</div><div><br></div><div>So, I set up a cronjob that rebuilds the Sid =
source package on a Stretch system, and the result is wireguard packages th=
at track the latest release, but don&#39;t pull in unstable versions of lib=
c and whatnot when you try to install them, as would happen if you tried to=
 install via package pinning.</div><div><br></div><div>Naturally, you have =
only my word that the packages are unmodified rebuilds of Debian&#39;s orig=
inal package, and you&#39;re trusting packagecloud to not tamper with the p=
ackages (it&#39;s their signing keys, not mine) so caveat emptor. It works =
for me, it might work for you as well.</div><div><br></div><div>With the wa=
rnings and disclaimers out of the way, here&#39;s the repo:=C2=A0<a href=3D=
"https://packagecloud.io/danderson/wireguard?filter=3Ddebs">https://package=
cloud.io/danderson/wireguard?filter=3Ddebs</a></div><div><br></div><div>- D=
ave</div></div>

--001a11415e88b6df330548363b05--
