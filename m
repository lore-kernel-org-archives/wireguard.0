Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bb57ca2
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 01:22:47 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2af1ef38
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 01:22:47 +0000 (UTC)
Date: Mon, 22 May 2017 03:34:39 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: openresolv dependency
Message-ID: <20170522033439.38979b0a@msi.defcon1>
In-Reply-To: <CAHmME9pntk1UvFscCWsryW8eSCqzL66of0_F=H4KE0bmpZwA+Q@mail.gmail.com>
References: <2fa3ef35-fde6-55d2-0872-52aa2bcb87d2@biot.com>
 <CAHmME9pJEXKRhz8dbY6hrg33Ey-j6zD6O2uu125bMqx_vCKovg@mail.gmail.com>
 <20170522030211.6fb18de8@msi.defcon1>
 <CAHmME9pntk1UvFscCWsryW8eSCqzL66of0_F=H4KE0bmpZwA+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 22 May 2017 03:08:03 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Mon, May 22, 2017 at 3:02 AM, Bzzzz <lazyvirus@gmx.com> wrote:
> 
> > On Mon, 22 May 2017 02:41:13 +0200
> > "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> >
> > > https://github.com/EggieCode/wireguard-ppa/issues/19
> >
> > Following your comment, you could flip the resolvconf dependency from
> > a mandatory one to a a recommand or even a suggest, with a few
> > comment lines into the /usr/share/doc/README.Debian file.
> >
> 
> The problem is that I would like to be able to use the -x and -m
> switches of resolvconf, which only openresolv has.

I see, but most of LANs _should_ have a DNS properly configured, and
roadwarriors at least a dnsmasq; as a matter of fact, everything started
to work correctly for me when I forced resolvconf to stop.
[reminder: The head of my LAN, that is my WG entry point, is also the
main DNS server and my laptop is the secondary one.]

If what you mean is avoiding DNS leaking, my suggestion is to have the
LAN DNS into the /etc/resolv.conf of the roadwarrior(s).
This is what's happen when I connect: it is the LAN entry point that
resolves.
Of course, if people do not tunnel their whole traffic through the VPN,
this behavior will be a problem (but only if the client's DNS server/masq
is rendered inoperant by the VPN connection - duno: untested conf.)

> However, it appears
> that openresolv does not work very well out of the box on Ubuntu.

How in soft words these things are said :)
(almost everyone that had to battle against resolvconf had murder
pulsions at least once.)

> So, I'm not quite sure what I can recommend to Ubuntu users as a
> reliable way of setting a per-interface DNS override. Or even what
> command I could put in wg-quick to encapsulate that kind of logic.
> 
> Any ideas?

1- list all possibilities,
2- test  "        "      , or ask people that use each one to see
   which are DNS hampered,
3- write a few lines into the README file to cover all cases,
4- have a rollmops and relax.

ubuntu people must understand that an OS isn't and can't be a
click'o'matic all the time, and that sometimes they have to open
the hood and get some grease on the hands before the engine starts
properly - this is *always* a good thing.

Jean-Yves
