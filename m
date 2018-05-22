Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 948d7b9f
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 15:49:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20e2332c
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 15:49:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68143cae
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 15:48:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c2f8511
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 15:48:20 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id k5-v6so16657143oiw.0
 for <wireguard@lists.zx2c4.com>; Tue, 22 May 2018 08:50:41 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 22 May 2018 17:50:39 +0200
Message-ID: <CAHmME9pWK75RZAvTzMigCBH31g_ftr3d5c6yAsLTs-7nZyLCYg@mail.gmail.com>
Subject: WireGuard for OpenBSD
To: ports@openbsd.org
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

[cross-posted to the WireGuard mailing list]

Hello OpenBSD Ports List,

I sent a very similar email [0] to the FreeBSD ports list yesterday.

I'm the author of WireGuard [1], a secure network tunnel protocol [2]
and a set of implementations of it. It was originally designed for the
Linux kernel, but we're now beginning to have implementations for
other platforms. Recently, parts of the Internet got excited [3] when
we put a Darwin version in Homebrew. We've been working on getting an
implementation running for OpenBSD, and things are coming along pretty
smoothly.

The ultimate goal in OpenBSD land is, of course, having this properly
in the kernel like it is on Linux, but that's a long ways off, so I
thought we should get rolling with this, since it's here now.

I'm not entirely familiar with the ports/pkg adding process, and so I
was hoping to find somebody who is part of the OpenBSD community to
adopt WireGuard and help maintain packages for it. We currently have
packages for many Linux distros [4], but not yet BSD ports. There are
two packages to add:

1. wireguard-tools, providing wg(8) and wg-quick(8)
Runtime dependencies: bash, wireguard-go, libc
Buildtime dependencies: gmake, c compiler, libc
Fixup: sed -i 's/ -v / /g' src/tools/Makefile
Build: gmake -C src/tools WITH_WGQUICK=yes
Install: gmake -C src/tools PREFIX=/usr/local install
URL template: https://git.zx2c4.com/WireGuard/snapshot/WireGuard-VERSION.tar.xz

2. wireguard-go
Runtime dependencies: none
Buildtime dependencies: gmake, go
Fixup: sed -i 's/ -v / /g' Makefile
Build: export GOPATH=$(pwd)/gopath; go get -d; gmake
Install: gmake PREFIX=/usr/local install
URL template: https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-VERSION.tar.xz

For reference, these two packages in Homebrew look like this:
https://github.com/Homebrew/homebrew-core/blob/master/Formula/wireguard-tools.rb
https://github.com/Homebrew/homebrew-core/blob/master/Formula/wireguard-go.rb

And for your horror, I've made a please-dont-pipe-like-that
copy-and-paste install script:
# curl https://xn--4db.cc/IKuBc62Z | sh

That script won't work as-is at the moment, since I haven't yet tagged
tarballs with OpenBSD support, but in the coming days, I'll tag one
that has this latest OpenBSD code in it. (In the meantime, you can run
`# curl https://xn--4db.cc/IKuBc62Z | sh /dev/stdin --master` to get
it from git master. See demo.wireguard.com for another script for a
little test server.) I was hoping that in the time between now and
then, we might find somebody willing and interested in packaging this
properly.

Does this sound fun to anyone?

Best regards,
Jason

[0] https://docs.freebsd.org/cgi/getmsg.cgi?fetch=116808+0+current/freebsd-ports
[1] https://www.wireguard.com/
[2] https://www.wireguard.com/papers/wireguard.pdf
[3] http://latacora.singles/2018/05/16/there-will-be.html
[4] https://www.wireguard.com/install/
