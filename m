Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50231bfc
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 12:27:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 034e63bb
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 12:27:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b997f0c
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 12:25:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3f0558c5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 12:25:47 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id g7-v6so24940073otj.11
 for <wireguard@lists.zx2c4.com>; Wed, 23 May 2018 05:28:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49690.1527065737@cathet.us>
References: <CAHmME9pWK75RZAvTzMigCBH31g_ftr3d5c6yAsLTs-7nZyLCYg@mail.gmail.com>
 <49690.1527065737@cathet.us>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 May 2018 14:28:13 +0200
Message-ID: <CAHmME9rYhZZ7AgmssYPuyFgfw3OZcD741aALWoocK-4j-+TjXw@mail.gmail.com>
Subject: Re: WireGuard for OpenBSD
To: "Anthony J. Bentley" <anthony@anjbe.name>
Content-Type: text/plain; charset="UTF-8"
Cc: ports@openbsd.org, WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, May 23, 2018 at 10:55 AM, Anthony J. Bentley <anthony@anjbe.name> w=
rote:
> Attached is one. It will need to be updated to use the next tag once
> it's released.

Looks good to me. Indeed I don't like this manually carrying files
from the next release in ${FILES}, but that problem goes away entirely
when I do actually tag that next release.

I've also moved all the usages of install's -v switch in the Makefile
to be the first switch, so now you can simply run: sed -i 's/install
-v/install/g;s/@install/install/g' src/tools/Makefile

>
> Is there a way that I'm missing to display the actual compile commands
> during build, rather than the "CC blah.o" output?

Yes -- pass "V=3D1" in MAKE_FLAGS.

>
>> 2. wireguard-go
>> Runtime dependencies: none
>> Buildtime dependencies: gmake, go
>> Fixup: sed -i 's/ -v / /g' Makefile
>> Build: export GOPATH=3D$(pwd)/gopath; go get -d; gmake
>> Install: gmake PREFIX=3D/usr/local install
>> URL template: https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-V=
ERSIO
>> N.tar.xz
>
> I don't know anything about Go ports, so my attempt at this didn't get
> very far and hasn't built yet.

I simplified it quite a bit last night, so hopefully it's easier now:

Runtime dependencies: none
Buildtime dependencies: gmake, go
Fixup: sed -i 's/install -v/install/g;s/@install/install/g' Makefile
Build: gmake
Install: gmake PREFIX=3D/usr/local install
URL template: https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-VERS=
ION.tar.xz

The installer curl|sh disaster has also been updated: https://=D7=90.cc/IKu=
Bc62Z
