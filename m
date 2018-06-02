Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98f74a77
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 03:13:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a00be02e
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 03:13:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbda5aba
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 03:12:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 98ccd197
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 03:12:11 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id l13-v6so31517772otk.9
 for <wireguard@lists.zx2c4.com>; Fri, 01 Jun 2018 20:15:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKE2PDtV_5bkjPgtPBgtq4BgY2QaFB4eVD7r9MjqiLZNkAMjzQ@mail.gmail.com>
References: <CAKE2PDtV_5bkjPgtPBgtq4BgY2QaFB4eVD7r9MjqiLZNkAMjzQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 2 Jun 2018 05:15:49 +0200
Message-ID: <CAHmME9p7ZkaJO7FYTbyp39tQAKtfZhkD_5Lo5TfQpiOkM1a3kA@mail.gmail.com>
Subject: Re: Openbsd update recommendation
To: jungle Boogie <jungleboogie0@gmail.com>
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

On Sat, Jun 2, 2018 at 1:26 AM, jungle Boogie <jungleboogie0@gmail.com> wrote:
> Hi All,
>
> For openBSD instructions here:
> https://www.wireguard.com/install/#packages
>
> Curl is not apart of base, so you can either assume the users have
> curl installed, or use ftp(1) in the example. If you're doing the
> latter, you'll need a pkg_add to also include curl.
>
> https://man.openbsd.org/ftp.1

I love how OpenBSD commands keep evolving over time. Thanks for the
suggestion. I've updated the page.

> Also, I already have a go path setup. How do I get around this?
>
> cd .gopath/src/git.zx2c4.com/wireguard-go && dep ensure -vendor-only -v
> /usr/src/wireguard/wireguard-go-0.0.20180531 is not within a known GOPATH/src
> gmake: *** [Makefile:33: vendor/.created] Error 1
> gmake: Leaving directory '/usr/src/wireguard/wireguard-go-0.0.20180531'

Somebody mentioned this on IRC the other day (maybe you?), but I
didn't figure out what was going on then. I just now triaged the
issue: in ksh(1), before exec'ing a new process, it resolves all
symlinks of pwd. Try for yourself:

# ksh
# mkdir a
# ln -s a b
# cd b
# ksh -c pwd
/root/a

That's pretty weird behavior, but maybe there's an interesting reason
for it; I'll poke around tomorrow and see if I can figure it out.

In any case, I've worked around it now in the install script and
tested on a fresh OpenBSD 6.3 install, so you should now be able to
run:

# ftp -o - https://xn--4db.cc/IKuBc62Z | sh

Let me know how it goes, and thanks for the report.

Regards,
Jason
