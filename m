Return-Path: jungleboogie0@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ea0cdc3
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 20:04:40 +0000 (UTC)
Received: from mail-pl0-x22e.google.com (mail-pl0-x22e.google.com
 [IPv6:2607:f8b0:400e:c01::22e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85a98e8b
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 20:04:40 +0000 (UTC)
Received: by mail-pl0-x22e.google.com with SMTP id 31-v6so7323755plc.4
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jun 2018 13:07:11 -0700 (PDT)
Return-Path: <jungleboogie0@gmail.com>
From: Jungle Boogie <jungleboogie0@gmail.com>
Date: Sat, 2 Jun 2018 13:07:08 -0700
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Openbsd update recommendation
Message-ID: <20180602200708.GB5571@puffer.in.lylie.net>
References: <CAKE2PDtV_5bkjPgtPBgtq4BgY2QaFB4eVD7r9MjqiLZNkAMjzQ@mail.gmail.com>
 <CAHmME9p7ZkaJO7FYTbyp39tQAKtfZhkD_5Lo5TfQpiOkM1a3kA@mail.gmail.com>
 <20180602070812.GA34693@puffer.in.lylie.net>
 <CAHmME9rJGzWYrqejNXdyd6kcH4+M9Sw=nrCKG86unjGo0vMB0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9rJGzWYrqejNXdyd6kcH4+M9Sw=nrCKG86unjGo0vMB0w@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Jason,
On Sat 02 Jun 2018  4:39 PM, Jason A. Donenfeld wrote:
> Hey Jungle,
> 
> On Sat, Jun 2, 2018 at 9:08 AM, Jungle Boogie <jungleboogie0@gmail.com> wrote:
> > Interesting behavior. I don't know the reason behind it, though.
> 
> I figured the whole thing out, and wrote up a really detailed commit here:
> https://git.zx2c4.com/wireguard-go/commit/?id=a050431f2660d73e191ab8100d2f0934c8aedbf9
> 
> Might be of general interest.
> 

Good info! Thanks for taking the time to keep things running smootly across many
different platforms.

> >
> > Once I'm more confident with the steps, I'll write something up.
> 
> Great, thanks. Any status on actually getting these made into proper
> packages, so people aren't as inclined to rely on the script, which is
> only intended as a stopgap solution?
> 

I haven't seen any updates on the thread you wrote about. Maybe I'll drop a
line.
However, your script is probably the best option until you make a 1.0, or
non-snapshot release. The reason is the package may not be updated weekly, and
each week, you seem to bring in useful improvements and changes. The -release
build of openBSD doesn't receive new package updates. If your snapshot was
made into a port/package a few weeks before the 6.4 -release, it would be the
only available option until the next release. Fortunately, -release builds
happen very often, every six months.

> Jason

Best,
j.b.
