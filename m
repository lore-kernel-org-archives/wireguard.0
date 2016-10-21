Return-Path: pageexec@gmail.com
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aaac1081
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 08:01:42 +0000 (UTC)
From: "PaX Team" <pageexec@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 21 Oct 2016 10:02:32 +0200
MIME-Version: 1.0
Message-ID: <5809CB98.15179.767FB18@pageexec.gmail.com>
In-reply-to: <CAHmME9opbKv9c67uCk69K_J3=A0-8p0gkwmJos83wBiMJ9WmCw@mail.gmail.com>
References: <87mvi0jxsb.fsf@toke.dk>,
 <58096029.23859.5C451AE@pageexec.gmail.com>,
 <CAHmME9opbKv9c67uCk69K_J3=A0-8p0gkwmJos83wBiMJ9WmCw@mail.gmail.com>
Content-type: text/plain; charset=US-ASCII
Cc: Emese Revfy <re.emese@gmail.com>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
Reply-To: pageexec@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 21 Oct 2016 at 11:32, Jason A. Donenfeld wrote:

> On Fri, Oct 21, 2016 at 9:24 AM, PaX Team <pageexec@gmail.com> wrote:
> > in any case, whoever can reproduce this should print out the value of
> > head->mac_header before the increment. my guess based on past experience
> > on similar network problems is that the field is probably invalid (ffff
> > or similar) and adding to it will trigger the size overflow check. this
> > in turn means that there's usually some higher level logic bug and you'll
> > have to talk to netdev guys as i'm way out of my depths at that point ;).
> 
> Fixed:
> https://git.zx2c4.com/WireGuard/commit/?id=867c815c31c754bf97b5fb29afd295b7cf195159

are you sure it was for satisfying PaX only and not a bug itself? :) with the
ffff initial value you were basically off by one (unsigned arithmetic wraps so
it's as if you had initialized the fields to -1 instead of 0), didn't that matter
somewhere beyond the size overflow checks?

> >> >> OK, so turns out just getting rid of the __read_mostly fixes things.
> >
> > FWIW, i've been carrying such a local patch on my gentoo box too ;).
> 
> Got a good #ifdef for PAX that I should use to conditionally not use
> __read_mostly in case PAX is in use?

if you ask me, you should just get rid of __read_mostly unconditionally (which
is what i do in PaX as it interferes with constification) as rtnl_link_ops extends
over several cache lines so any concerns with false sharing with writable data
would at most affect only a few fields that are rarely used (or the fields could
be reordered and/or aligned for such affect). otherwise you'll need to have your
own #ifdef based on CONSTIFY_PLUGIN as suggested originally by Toke.

cheers,
 PaX Team
