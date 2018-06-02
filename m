Return-Path: jungleboogie0@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e73e7afa
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 07:05:50 +0000 (UTC)
Received: from mail-pg0-x22e.google.com (mail-pg0-x22e.google.com
 [IPv6:2607:f8b0:400e:c05::22e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c9b38a1
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 07:05:50 +0000 (UTC)
Received: by mail-pg0-x22e.google.com with SMTP id z1-v6so5280896pgv.12
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jun 2018 00:08:17 -0700 (PDT)
Return-Path: <jungleboogie0@gmail.com>
From: Jungle Boogie <jungleboogie0@gmail.com>
Date: Sat, 2 Jun 2018 00:08:12 -0700
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Openbsd update recommendation
Message-ID: <20180602070812.GA34693@puffer.in.lylie.net>
References: <CAKE2PDtV_5bkjPgtPBgtq4BgY2QaFB4eVD7r9MjqiLZNkAMjzQ@mail.gmail.com>
 <CAHmME9p7ZkaJO7FYTbyp39tQAKtfZhkD_5Lo5TfQpiOkM1a3kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9p7ZkaJO7FYTbyp39tQAKtfZhkD_5Lo5TfQpiOkM1a3kA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,
On Sat 02 Jun 2018  5:15 AM, Jason A. Donenfeld wrote:
> Hey Jungle,
> 
> On Sat, Jun 2, 2018 at 1:26 AM, jungle Boogie <jungleboogie0@gmail.com> wrote:
> > Hi All,
> >
> > For openBSD instructions here:
> > https://www.wireguard.com/install/#packages
> >
> > Curl is not apart of base, so you can either assume the users have
> > curl installed, or use ftp(1) in the example. If you're doing the
> > latter, you'll need a pkg_add to also include curl.
> >
> > https://man.openbsd.org/ftp.1
> 
> I love how OpenBSD commands keep evolving over time. Thanks for the
> suggestion. I've updated the page.
> 

Yeah, the ftp command from way back is different on Linux than on openBSD. It
can still do the plain ol' ftp connections, though. ;)

> > Also, I already have a go path setup. How do I get around this?
> >
> > cd .gopath/src/git.zx2c4.com/wireguard-go && dep ensure -vendor-only -v
> > /usr/src/wireguard/wireguard-go-0.0.20180531 is not within a known GOPATH/src
> > gmake: *** [Makefile:33: vendor/.created] Error 1
> > gmake: Leaving directory '/usr/src/wireguard/wireguard-go-0.0.20180531'
> 
> Somebody mentioned this on IRC the other day (maybe you?), but I
> didn't figure out what was going on then. I just now triaged the
> issue: in ksh(1), before exec'ing a new process, it resolves all
> symlinks of pwd. Try for yourself:
> 
> # ksh
> # mkdir a
> # ln -s a b
> # cd b
> # ksh -c pwd
> /root/a
> 
> That's pretty weird behavior, but maybe there's an interesting reason
> for it; I'll poke around tomorrow and see if I can figure it out.
> 

Interesting behavior. I don't know the reason behind it, though.

> In any case, I've worked around it now in the install script and
> tested on a fresh OpenBSD 6.3 install, so you should now be able to
> run:
> 
> # ftp -o - https://xn--4db.cc/IKuBc62Z | sh
> 
> Let me know how it goes, and thanks for the report.
> 

It went great! I was able to install wireguard on two amd64 arch platform
machines.

I do still see this in the install file:
curl -sLO "$URI_KMODTOOLS"
curl -sLO "$URI_GO"

I'd still recommend adding curl to the pkg_add section for fewer errors during
install.

The process for getting the tunnel working on openBSD is similar to linux, but
the interface is tun and starts with tun0.

Once I'm more confident with the steps, I'll write something up.

> Regards,
> Jason

Thanks,
j.b.
