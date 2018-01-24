Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b994f1e
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jan 2018 22:47:48 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 856930f5
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jan 2018 22:47:48 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Kevin <anaknaga@inventati.org>
Subject: Re: Trouble building WireGuard since December releases
In-Reply-To: <CAHmME9o5N9P3aDV-Y+fm=qMqijMZQBryoP7XpkEEbwMbQJHmGA@mail.gmail.com>
References: <1516632145.2241.49.camel@inventati.org>
 <CAHmME9rEFgWHewhf8mC=7ec=NRdhqAJQtuG1ggby-Bzfd8zaaw@mail.gmail.com>
 <CAHmME9qY1rVUxsdkD+M91pZJNcncG+PrG-9ypK0YPvfb4k4_JA@mail.gmail.com>
 <CAHmME9o5N9P3aDV-Y+fm=qMqijMZQBryoP7XpkEEbwMbQJHmGA@mail.gmail.com>
Date: Wed, 24 Jan 2018 13:49:10 -0500
Message-ID: <87lggngkih.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon 2018-01-22 17:07:38 +0100, Jason A. Donenfeld wrote:
> Ahh, small update. When building this, I noticed:
>
> Makefile:944: "Cannot use CONFIG_STACK_VALIDATION=y, please install
> libelf-dev, libelf-devel or elfutils-libelf-devel"

fwiw, debian had the same issue around libelf-dev with their kernel
source packaging, and treated it as a bug there, which was resolved in
the kernel package itself, rather than requiring additional build
dependencies of all kernel modules: https://bugs.debian.org/886474

(this message is just about libelf-dev; i haven't followed the details
about objtool)

             --dkg
