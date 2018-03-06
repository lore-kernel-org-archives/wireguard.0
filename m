Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de075416
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 09:07:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55f6973f
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 09:07:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 165f689c
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 08:58:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d4967cf9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 08:58:38 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id n74so17708692ota.1
 for <wireguard@lists.zx2c4.com>; Tue, 06 Mar 2018 01:16:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHT-BTRX+bgN8m7V95QqnKOD8g6vp3-+h_JozG5motqS0MLiZQ@mail.gmail.com>
References: <CAHT-BTRX+bgN8m7V95QqnKOD8g6vp3-+h_JozG5motqS0MLiZQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Mar 2018 10:16:49 +0100
Message-ID: <CAHmME9ofmO2UPs-TRLfE=6Zkf=cC4LFzHpiBSirm56XaDEBPCA@mail.gmail.com>
Subject: Re: Tunsafe Windows client for wireguard (not opensource yet they say
To: Ludvig Strigeus <strigeus@gmail.com>
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

On Tue, Mar 6, 2018 at 2:44 AM, Ludvig Strigeus <strigeus@gmail.com> wrote:
> The driver files are not modified at all. They still
> carry OpenVPN's codesigning signature.

Both good and bad to hear. That's a really really flaky driver, and it
_does_ need to be hacked to pieces, removing tons of things, in order
for it to be real software someone would want to run. On the other
hand, at least you get code signing for free.

> First of all could you change tone a little bit, personal attacks and
> rudeness do not have a place in those discussions unless you actually
> back them up with facts.

There are no personal attacks. I don't know much about you, beyond
uTorrent and adware.

Rather, my comments are in relation to your software -- which doesn't
implement the protocol correctly and has security issues. (Your
stripped binaries really wasted way too much time, by the way.) It's
not safe for users to use. I've got a duty to such users to inform
them when these types of security and interoperability issues crop up.

> but your attitude appears to be that everything that
> is not open source, and hosted under the WireGuard brand/webpage, is
> community-unfriendly and nasty. Is that what you mean by community
> unfriendly?

No I think the notion is a bit different than that. This community
here looks very closely at design decisions and implementations,
making sure we deliver secure software of high quality. Part of that
means working together and doing extensive code reviews and sharing
source code. Another part of that is keeping things unified as one
single project. From the beginning you've seemed interested in
bifurcation, and releasing hastily written software with little review
quickly.

> probably want it under my own name,
> on my own website, where I'm free to develop the project in any
> direction I want

Sounds to be like an interoperability and compatibility disaster in
the making, NIH gone bad.

> I don't want to spend weeks or months building a client for it to end
> up on some semi-hidden place on wireguard.com just because you
> prefer Rust or Go, where my contribution may get diminished into
> nothing at all.

Actually that's not the case at all. On a personal note, I've spent
decades writing C++, and I'm surprisingly fond of it, despite its
warts. I used to keep Stroustrup's book on the back of the toilet for
casual perusing. We have a Rust and a Go implementation because those
are what's been contributed by volunteers, and have the nice aspect of
being somewhat "safer" to write code in, especially Rust.

Aside from your flamebait email here, I (and other developers working
on WireGuard) still would be happy to work with you on the codebase to
ensure that it's written securely and compatibly, doing regular
releases as WireGuard software. But indeed that would mean working
with the community and doing things under one roof, not running off
and shipping bad bits.

> How would you deal with Microsoft if they wanted to add a closed
> source implementation of WireGuard in Windows. Would they also
> be considered a community-unfriendly proprietary author with a
> clear agenda of nastiness?

I'm pretty confident Microsoft would pick a reasonable strategy for
working with us here and releasing code responsibility. It's true they
have that classic history of "embrace, extend, extinguish" (is the new
CEO different? maybe?), but knowing some people working on their
security teams and crypto teams who would likely be implementing this
kind of thing, maybe this wouldn't happen? Or that's being too
optimistic? I oscillate between thinking recent github-friendly and
linuxsubsystem-writing Microsoft has really changed itself since the
2000s, and thinking this is just naivete on my part. So, who knows
what they'd do. One can dream I suppose.

> The only accepted
> implementation would be that one from yourself? No companies
> would be allowed to implement it or take part in discussions?
> This is not how Internet protocols typically work.

Actually no. There are several people working on several
implementations. This list here has extensive discussion about
different features, and the design of the protocol has, in extremely
large part, been driven by this mailing list. We're a quite open
community.

> to security. I share this view, and will address it eventually,
> in some way. Either just the wireguard protocol layer or the
> whole UI too.

That's great to hear. I look forward to you open sourcing your
project, and we can get to work in earnest on it once this happens.

> I'm not interested in being a slave in a dictatorship.

That's a pretty offensive and outrageous way of describing any of
this. We're an open source project of volunteers. Lots of people are
doing their invaluable part and contributing invaluable time. At least
two of us are doing this more or less full-time, because we want to.
Others are doing this between jobs or between classes or between
military deployments. We're all volunteers, working to do this the
best we can.

> You've
> ignored my attempts at communications for 2 weeks.

That's an odd thing to say. The last messages I have from you are you
indicating to me you're going to go the closed source way, and then
nothing after that for quite some time. In case IRC is irreliable for
me or for you, I prefer we speak privately over email --
jason@zx2c4.com usually works well these days.

> You ban me
> from #wireguard IRC even though I haven't talked there for weeks

As said prior, there's little interest in inundating users with
proprietary insecure software, not to mention freenode having some
policies about proprietary software. If you decide you'd like to open
source it at some point, rather than putting ads on it or selling it
like you've done in the past with software, we can talk. But insofar
as you're putting users in harm's way and fragmenting the project, I
ask that you stay away from these parts. Nobody is interested in
insecure software.

Yet in spite of your to-date brazenness, I'm still willing to work
with you if you'd like to turn things around. Shoot me an email if
you'd like to talk about open sourcing this work and integrating with
the community.

Regards,
Jason
