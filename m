Return-Path: adriankoooo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d10a42dc
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 22:16:01 +0000 (UTC)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
 [209.85.223.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29caeffd
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 22:16:00 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id d66so1305323ioe.5
 for <wireguard@lists.zx2c4.com>; Tue, 31 Oct 2017 15:18:24 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
Date: Tue, 31 Oct 2017 23:18:03 +0100
Message-ID: <CA+Hw3eY4541LNE9TnS5tsU2O+n28BNQ-Spko5dpem8Ej2_ctFA@mail.gmail.com>
Subject: Fix Debian install guide on wireguard.com/install
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="94eb2c1fc0f8244e26055cdf22a0"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1fc0f8244e26055cdf22a0
Content-Type: text/plain; charset="UTF-8"

There is a missing step in the Debian installation guide, you must import
GPG keys before you can add the new repo:

gpg --keyserver pgpkeys.mit.edu --recv-key  8B48AD6246925553
gpg -a --export 8B48AD6246925553 | sudo apt-key add -

and also the key 7638D0442B90D010

gpg --keyserver pgpkeys.mit.edu --recv-key 7638D0442B90D010
gpg -a --export 7638D0442B90D010 | sudo apt-key add -

More about PGP and APT:

http://ccm.net/faq/809-debian-apt-get-no-pubkey-gpg-error

Regards,
Adrian Mihalko

--94eb2c1fc0f8244e26055cdf22a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is a missing step in the Debian installation guide, =
you must import GPG keys before you can add the new repo:<div><br></div>gpg=
 --keyserver <a href=3D"http://pgpkeys.mit.edu">pgpkeys.mit.edu</a> --recv-=
key =C2=A08B48AD6246925553 =C2=A0 =C2=A0 =C2=A0<br>gpg -a --export 8B48AD62=
46925553 | sudo apt-key add -<br><br>and also the key 7638D0442B90D010<br><=
br>gpg --keyserver <a href=3D"http://pgpkeys.mit.edu">pgpkeys.mit.edu</a> -=
-recv-key 7638D0442B90D010 =C2=A0 =C2=A0 <br>gpg -a --export 7638D0442B90D0=
10 | sudo apt-key add -<div><br></div><div>More about PGP and APT:</div><di=
v><br></div><div><a href=3D"http://ccm.net/faq/809-debian-apt-get-no-pubkey=
-gpg-error">http://ccm.net/faq/809-debian-apt-get-no-pubkey-gpg-error</a><b=
r></div><div><br></div><div>Regards,</div><div>Adrian Mihalko</div></div>

--94eb2c1fc0f8244e26055cdf22a0--
