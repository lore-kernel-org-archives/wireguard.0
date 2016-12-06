Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b7e8fe3
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 18:09:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6abdad4
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 18:09:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 99ae46c0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 18:09:30 +0000 (UTC)
Received: by mail-wj0-f181.google.com with SMTP id v7so331902524wjy.2
 for <wireguard@lists.zx2c4.com>; Tue, 06 Dec 2016 10:14:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161206103551.038a3d3e@leda>
References: <20161203123044.25848-1-list@eworm.de>
 <20161203124233.27891-1-list@eworm.de>
 <CAHmME9pAz1e2keE0vH-cWORP7pRmhfoivFt0_=_4xEH9xUjLDA@mail.gmail.com>
 <20161206103551.038a3d3e@leda>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Dec 2016 19:14:47 +0100
Message-ID: <CAHmME9rxy-tzWdOYontRYDkxwWAgyx6jPURej1Qh2brMcrDEjw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] add dkms configuration file dkms.conf
To: Christian Hesse <list@eworm.de>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Dec 6, 2016 at 10:35 AM, Christian Hesse <list@eworm.de> wrote:
> "Jason A. Donenfeld" <Jason@zx2c4.com> on Sat, 2016/12/03 23:21:
> > I like the general idea here of including dkim in WireGuard now,
>
> 'dkim' is mail security... We have dkms. ;)

Lol!

> For Arch Linux we install dkms sources to /usr/src/$pkgname-$pkgver, so for
> wireguard we have: /usr/src/wireguard-0.0.20161129/
> To have something like this would be great:
> make DESTDIR="$pkgdir/" DKMSDIR="/usr/src/$pkgname-$pkgver" dkms

How does this look to you:
https://git.zx2c4.com/WireGuard/commit/?id=b70677fb8af28cbaec810146144858ad07a879ed

You can simply run:

make DESTDIR="$pkgdir/" DKMSDIR="/usr/src/$pkgname-$pkgver" dkms-install

You can also adjust SRCDIR or PREFIX, but I imagine you'll want to
keep these as is. All variables are also inherited from the
environment, so if the package manager sets these globally, things are
even easier.

What do you think of that?
