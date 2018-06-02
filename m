Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73072502
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 14:36:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 954c923f
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 14:36:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e2d0fd7
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 14:35:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 33373637
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 14:35:29 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id k5-v6so24873739oiw.0
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jun 2018 07:39:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180602070812.GA34693@puffer.in.lylie.net>
References: <CAKE2PDtV_5bkjPgtPBgtq4BgY2QaFB4eVD7r9MjqiLZNkAMjzQ@mail.gmail.com>
 <CAHmME9p7ZkaJO7FYTbyp39tQAKtfZhkD_5Lo5TfQpiOkM1a3kA@mail.gmail.com>
 <20180602070812.GA34693@puffer.in.lylie.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 2 Jun 2018 16:39:11 +0200
Message-ID: <CAHmME9rJGzWYrqejNXdyd6kcH4+M9Sw=nrCKG86unjGo0vMB0w@mail.gmail.com>
Subject: Re: Openbsd update recommendation
To: Jungle Boogie <jungleboogie0@gmail.com>
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

Hey Jungle,

On Sat, Jun 2, 2018 at 9:08 AM, Jungle Boogie <jungleboogie0@gmail.com> wrote:
> Interesting behavior. I don't know the reason behind it, though.

I figured the whole thing out, and wrote up a really detailed commit here:
https://git.zx2c4.com/wireguard-go/commit/?id=a050431f2660d73e191ab8100d2f0934c8aedbf9

Might be of general interest.

> I do still see this in the install file:
> curl -sLO "$URI_KMODTOOLS"
> curl -sLO "$URI_GO"

Nice catch -- I changed these to ftp(1) as well.

> The process for getting the tunnel working on openBSD is similar to linux, but
> the interface is tun and starts with tun0.

Yea, OpenBSD annoyingly does not support arbitrary network interface
names, so I have to do a fake mapping in wg-quick.

>
> Once I'm more confident with the steps, I'll write something up.

Great, thanks. Any status on actually getting these made into proper
packages, so people aren't as inclined to rely on the script, which is
only intended as a stopgap solution?

Jason
