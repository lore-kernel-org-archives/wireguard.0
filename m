Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 067e1328
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jan 2018 23:03:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db005a88
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jan 2018 23:03:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bdefbdd6
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jan 2018 22:54:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f61d413b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jan 2018 22:54:32 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id c8so4008751oiy.9
 for <wireguard@lists.zx2c4.com>; Wed, 24 Jan 2018 15:07:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87lggngkih.fsf@fifthhorseman.net>
References: <1516632145.2241.49.camel@inventati.org>
 <CAHmME9rEFgWHewhf8mC=7ec=NRdhqAJQtuG1ggby-Bzfd8zaaw@mail.gmail.com>
 <CAHmME9qY1rVUxsdkD+M91pZJNcncG+PrG-9ypK0YPvfb4k4_JA@mail.gmail.com>
 <CAHmME9o5N9P3aDV-Y+fm=qMqijMZQBryoP7XpkEEbwMbQJHmGA@mail.gmail.com>
 <87lggngkih.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Jan 2018 00:07:39 +0100
Message-ID: <CAHmME9qM8woaJ9-g0_xZW55qsWyMPKBX3L8rBxuoBwBoGytpXw@mail.gmail.com>
Subject: Re: Trouble building WireGuard since December releases
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset="UTF-8"
Cc: Kevin <anaknaga@inventati.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jan 24, 2018 at 7:49 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
>
> On Mon 2018-01-22 17:07:38 +0100, Jason A. Donenfeld wrote:
> > Ahh, small update. When building this, I noticed:
> >
> > Makefile:944: "Cannot use CONFIG_STACK_VALIDATION=y, please install
> > libelf-dev, libelf-devel or elfutils-libelf-devel"
>
> fwiw, debian had the same issue around libelf-dev with their kernel
> source packaging, and treated it as a bug there, which was resolved in
> the kernel package itself, rather than requiring additional build
> dependencies of all kernel modules: https://bugs.debian.org/886474

Seems like a sane resolution.

>
> (this message is just about libelf-dev; i haven't followed the details
> about objtool)

The detail about objtool is just that they forgot to include it in
their headers, so when the build system tries to use it, it can't find
it and fails. Simple problem with a simple solution, thankfully.
