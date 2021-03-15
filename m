Return-Path: <SRS0=5KBh=IN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BEAC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 14:47:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E8564EE5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 14:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7E8564EE5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07129e6d;
	Mon, 15 Mar 2021 14:46:58 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7e3d3ed2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615819613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zjML3xyk75LFzaYXCgPukyiE8r09lArv16kuKdC7BWc=;
 b=MEoi91hXOtERAP6bHAZ4JZVbAlBcqWWH4bm3KRVOKIauOrvCQlPZsBLFwQuMox4SLWRWUu
 2/5H2I+cZeqMLB8U1n2Dbhq7nlPTjG+i7Dlj5AoWRsTF1+ZJPQzcfZnwOQLkQDFyXobaD1
 ZPcK4nY03LfWcRC0lqmDRp+a4iWxYOg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9dc3b16a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 14:46:53 +0000 (UTC)
Date: Mon, 15 Mar 2021 08:46:49 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: [ANNOUNCE] WireGuard for =?utf-8?Q?FreeBSD?=
 =?utf-8?Q?_in_development_for_13=2Ey_?= =?utf-8?B?4oCT?= and a note of how
 we got here
Message-ID: <YE9zWanlutKYTlKL@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi everybody,

I’m pleased to announce that WireGuard now runs inside the FreeBSD
kernel, with a driver called if_wg. It has full support of wg(8) and
wg-quick(8) [5], as well as general integration into FreeBSD userland.
Performance should be decent. The implementation in FreeBSD’s main
branch should pretty much work, though it’s something of a so-so work in
progress. To learn what I mean there, read on…

Sometime ago, a popular firewall vendor tasked a developer with writing
a WireGuard implementation for FreeBSD. They didn’t bother reaching out
to the project. That’s okay, I figured, I’ll reach out and see if I can
help and coordinate. What followed over the next year was a series of
poor communications – messages unanswered, code reviews ignored, that
kind of thing. Usually collaborations I’ve had with others have been
full of excitement, but it just didn’t work out here. In the few
discussions we were able to have, I did get across some key points,
like, “you’ll save a bunch of time if you use the OpenBSD code as a
starting point.” But mostly it seemed like a stop-and-go effort that the
WireGuard project didn’t have much to do with. Then, at some point,
whatever code laying around got merged into the FreeBSD tree and the
developer tasked with writing it moved on.

Fortunately, two weeks before FreeBSD 13.0 was due to be released,
FreeBSD core developer Kyle Evans emailed the list about integrating
wireguard-tools (wg(8) and such). In the ensuing discussion I mentioned
that we really need to get the actual if_wg kernel implementation up to
snuff. We took the conversation to IRC, and agreed that we should work
on figuring out what to do before the release date. At the same time,
Matt Dunwoodie, who worked on the OpenBSD implementation, also took a
look at what had become of that implementation in FreeBSD. Over the next
week, the three of us dug in and completely reworked the implementation
from top to bottom, each one of us pushing commits and taking passes
through the code to ensure correctness. The result was [6]. It was an
incredible effort. The collaboration was very fast paced and exciting.
Matt and Kyle are terrific programmers and fun to work with too.

The first step was assessing the current state of the code the previous
developer had dumped into the tree. It was not pretty. I imagined
strange Internet voices jeering, “this is what gives C a bad name!”
There were random sleeps added to “fix” race conditions, validation
functions that just returned true, catastrophic cryptographic
vulnerabilities, whole parts of the protocol unimplemented, kernel
panics, security bypasses, overflows, random printf statements deep in
crypto code, the most spectacular buffer overflows, and the whole litany
of awful things that go wrong when people aren’t careful when they write
C. Or, more simply, it seems typical of what happens when code ships
that wasn’t meant to. It was essentially an incomplete half-baked
implementation – nothing close to something anybody would want on a
production machine. Matt had to talk me out of just insisting they pull
the code entirely, and rework it more slowly and carefully for the next
release cycle. And he was right: nobody would have agreed to do that,
and it would only have fostered frustration from folks genuinely
enthusiastic about if_wg. So our one and only option was to iteratively
improve it as fast as we could during the two weeks before release, and
try to make it as simple and close as possible to OpenBSD so that we
could benefit from the previous analysis done there. With that as our
mission, we set out auditing and rewriting code.

One curious thing of note is that there were 40,000 lines of optimized
crypto implementations pulled out of the Linux kernel compat module but
not really wired up correctly, and mangled beyond repair with mazes of
Linux→FreeBSD ifdefs. I wound up replacing this with an 1,800 line file,
crypto.c [1], containing all of the cryptographic primitives needed to
implement WireGuard. Aside from its place in the FreeBSD story, this is
kind of neat in its own right: these are simple, but fast enough,
reference implementations. It’s not deliberately tiny or obfuscated like
TweetNaCl is, yet is still just a single file, and the Curve25519 field
arithmetic in it is formally verified. Maybe other projects will find
use for it. Future releases will hopefully get rid of crypto.c and hook
into FreeBSD’s already existing optimized implementations [4], which
should give a nice performance boost, but given the time crunch, having
something boring, safe, and simple seemed like the way to go.

We reduced the project structure down to four C files – the
aforementioned crypto.c, two files copied verbatim from OpenBSD –
wg_noise.c and wg_cookie.c – and if_wg.c, the actual interface device
driver implementation and protocol logic. The IPC interface was reworked
as well, and wg(8) in the wireguard-tools package grew support for it
(also rewritten from the original attempt). The three of us spent
countless hours across three time zones auditing state machine logic,
running trials,  and generally trying to get this working and workable.
There are now even a few automated tests!

I think we’ve mostly succeeded in producing something that behaves like
WireGuard. The net result certainly isn’t perfect, though – the Linux
and OpenBSD implementations were long, careful, slow projects by
comparison – but it is at least a base on which to build and improve
over time. Going forward, I think there’ll be additional systems coding
issues to work out – locking, lifetimes, races, and that sort of thing.
But now that there’s at least a stable base, developers can work out
remaining issues incrementally.

But perhaps this is a good moment to step back and ask how we got here,
and what WireGuard itself really is.

Traditionally, network protocols are specified in a document of protocol
behaviors. Then different organizations implement that specification.
Then everybody interoperates and all goes well. In practice, it often
doesn’t go well (see IPsec woes), but this at least has been the
traditional way of doing this on the Internet, and in some ways it
works.

But that is not the approach taken by the WireGuard project. In
contrast, WireGuard is both a protocol and a set of implementations,
implemented with a particular set of security and safety techniques.
That’s a radical departure from the traditional model, and one surely to
raise some grumbles amongst graybeards. But I believe this is a
necessary and beneficial quality for having the types of high assurance
software that is needed for core Internet security infrastructure. When
you use WireGuard, you’re not just using some protocol that is capable
of producing packets that are legible by others. You’re also using an
implementation that’s been designed to avoid security pitfalls, and that
provides interfaces for using it that mitigate footguns. In that way,
the WireGuard project is more expansive than a mere protocol project or
a mere software project or a mere cryptography project or a mere
specification project or a mere interface project. It combines all of
those things into a single unified approach. (For this same reason, the
original WireGuard paper [2] has been difficult for folks to categorize.
Is this a systems paper? A networking paper? A crypto paper?)

Because of that, I think this was an understandable predicament. After
all, why shouldn’t a company be able to task a developer with writing
some ring-0 WireGuard code in C? And why does it matter to me whether
the code is garbage if it can at least produce protocol packets? The
reason is that the WireGuard project’s mission is wider than that. We
deeply care about code quality and implementation particulars.

While we now have the FreeBSD code in a maintainable state, there are
other projects too that could use some attention from us. Looking
forward, for example, we hope to be able to lend a hand similarly to the
NetBSD developers soon to help them finish their implementation; this is
long overdue on my part, and I owe them some time and energy there. And
I hope that others don’t hesitate to email the list asking for
collaboration. This kind of thing is, of course, one of the reasons that
the project as an organization exists.

To return to the primary announcement, I had originally hoped to say
that this would be shipping for 13.0, and have some instructions for
setup there, but unfortunately, and contrary to our plans, it looks
exceedingly likely that given the grave issues we found in the existing
code, they’ll in the end just disable the module from the release, and
revisit for 13.1, rather than merging our fixes a few short days before
the release. That’s a bit of a bummer, given how hard we worked to get
things done in the time crunch, but it’s also probably a very wise
decision that takes some courage to make, and this will give us more
time to really get this rock solid for 13.1.

As well, hopefully we’ll have backport modules for the 13.0 and 12.y
release, making it as available as possible. Kyle or I will update the
list when  we’ve got a standalone backport module ready, with
instructions, as well as updating [3] per usual. There’s also ongoing
work to integrate WireGuard interface setup into rc, and hopefully that
will land during the the next release window, as well as the
aforementioned improvements to optimized crypto and systems issues.

Enjoy,
Jason

[1] https://cgit.freebsd.org/src/tree/sys/dev/if_wg/crypto.c?id=74ae3f3e33b810248da19004c58b3581cd367843
[2] https://www.wireguard.com/papers/wireguard.pdf
[3] https://www.wireguard.com/install/
[4] https://lists.freebsd.org/pipermail/freebsd-hackers/2021-March/057076.html
[5] https://lists.zx2c4.com/pipermail/wireguard/2021-March/006493.html	
[6] https://cgit.freebsd.org/src/commit/?id=74ae3f3e33b810248da19004c58b3581cd367843
