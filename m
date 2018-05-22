Return-Path: outbackdingo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4047863c
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 00:33:36 +0000 (UTC)
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com
 [IPv6:2a00:1450:400c:c09::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41b36ce2
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 00:33:36 +0000 (UTC)
Received: by mail-wm0-x22d.google.com with SMTP id n10-v6so29456705wmc.1
 for <wireguard@lists.zx2c4.com>; Mon, 21 May 2018 17:34:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rJonVbSRHCPy0W7Pr=vmJoMbVTHbGw0C1xwBze4Px7uA@mail.gmail.com>
References: <CAHmME9rJonVbSRHCPy0W7Pr=vmJoMbVTHbGw0C1xwBze4Px7uA@mail.gmail.com>
From: Outback Dingo <outbackdingo@gmail.com>
Date: Mon, 21 May 2018 20:33:55 -0400
Message-ID: <CAKYr3zzm6E_KNXA3acW7QcJWHh1gw3+Laxh2fN+AS3E0LPn0gg@mail.gmail.com>
Subject: Re: WireGuard for FreeBSD
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Brady OBrien <brady.obrien128@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, freebsd-ports@freebsd.org
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, May 21, 2018 at 5:35 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> [cross-posted to the WireGuard mailing list]
>
> Hello FreeBSD Ports List,
>
> I'm the author of WireGuard [1], a secure network tunnel protocol [2]
> and a set of implementations of it. It was originally designed for the
> Linux kernel, but we're now beginning to have implementations for
> other platforms. Recently, parts of the Internet got excited [3] when
> we put a Darwin version in Homebrew. The last few days Brian (CC'd)
> and I have been working on getting an implementation running on
> FreeBSD, and things are coming along pretty smoothly.
>
> I'm not entirely familiar with the ports/pkg adding process, and so I
> was hoping to find somebody who is part of the FreeBSD community to
> adopt WireGuard and help maintain packages for it. We currently have
> packages for many Linux distros [4], but FreeBSD will be the first
> open source BSD project. There are two packages to add:
>
> 1. wireguard-tools, providing wg(8) and wg-quick(8)
> Runtime dependencies: bash, wireguard-go
> Buildtime dependencies: gmake, c compiler, libc
> Build: gmake -C src/tools WITH_WGQUICK=yes
> Install: gmake -C src/tools PREFIX=/usr/local install
> URL template: https://git.zx2c4.com/WireGuard/snapshot/WireGuard-VERSION.tar.xz
>
> 2. wireguard-go
> Runtime dependencies: none
> Buildtime dependencies: gmake, go
> Build: export GOPATH=$(pwd)/gopath; go get -d; gmake
> Install: gmake PREFIX=/usr/local install
> URL template: https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-VERSION.tar.xz
>
> For reference, these two packages in Homebrew look like this:
> https://github.com/Homebrew/homebrew-core/blob/master/Formula/wireguard-tools.rb
> https://github.com/Homebrew/homebrew-core/blob/master/Formula/wireguard-go.rb
>
> And for your horror, I've made a please-dont-pipe-like-that
> copy-and-paste install script:
> # curl https://xn--4db.cc/0BwTeeYe | sh
>
> That script won't work as-is at the moment, since I haven't yet tagged
> tarballs with FreeBSD support, but in the coming days, I'll tag one
> that has this latest FreeBSD code in it. (In the meantime, you can run
> `# curl https://xn--4db.cc/0BwTeeYe | sh /dev/stdin --master` to get
> it from git master.) I was hoping that in the time between now and
> then, we might find somebody willing and interested in packaging this
> properly.
>
> Does this sound fun to anyone?

to be honest, while it sounds nice, i for one would prefer to see a
kernel module ported to FreeBSD instead of userland
second to that, building a freebsd port of it is not all that hard,
however that being said, it also needs to be accepted
upstream and committed by a ports maintainer, while i can help with
creating it, i still feel a kernel module is a better fit

>
> Best regards,
> Jason
>
>
> [1] https://www.wireguard.com/
> [2] https://www.wireguard.com/papers/wireguard.pdf
> [3] http://latacora.singles/2018/05/16/there-will-be.html
> [4] https://www.wireguard.com/install/
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
