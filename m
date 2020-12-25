Return-Path: <SRS0=IEsR=F5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E8FC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 15:48:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07EA0206C0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 15:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07EA0206C0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb277ae8;
	Fri, 25 Dec 2020 15:39:06 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b80cdba6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Dec 2020 15:39:03 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7ceb53a
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Dec 2020 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:cc:content-type
 :content-transfer-encoding; s=mail; bh=CjUopaD1CtlbWDRnzRJYb2NJg
 kI=; b=FgsrurD94S1XmBev1b5U++52LrvoTXCzENYnFYfYjUtCe/hOw5r7M5bA+
 F5HTOu/TXG4+yrX3c9OSpyJUv3gLqS4fXhFWbC24UAqDHcrywy5JwDI3I7JZDkWT
 w2spAEhYM8OLAgHmEqM79qd7WeI7rqwvF6WqliVy0lsrDOA79dZbx4wtpn+UHe6Q
 mzx6rPoaeDB0IF8z/U/EkoCIT05G7TZtmLUPvhPA2ASmDQdRRfFjh1XVMzc47snt
 H5cjgBL28CIufM/I6bTmeRJkUifS9gErBhZY/CeoMeHk6VHHxdgow/TAa1rDK4cd
 1qnFLbg+plo6MEc+VWiEMisJjcWPg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1ca5f905
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Dec 2020 15:39:49 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id a16so4474791ybh.5
 for <wireguard@lists.zx2c4.com>; Fri, 25 Dec 2020 07:48:37 -0800 (PST)
X-Gm-Message-State: AOAM530MJWdnteWWlIlMxQEAlZhJpkxQDh2r+Yg8aK84OnUiNhc53ojK
 b0WTcBh+5/kjvokZ+o+kmfUoJ/EcnWGGZAh0Pjc=
X-Google-Smtp-Source: ABdhPJwUQIHJ5FnknLeXFwGCDm/knmJMbhOefnhkdqkNkn+Pn7705cPU3PG1beA3kr4BEOeh82lUQU/rP5HsRBy4UsY=
X-Received: by 2002:a25:d295:: with SMTP id j143mr51992679ybg.20.1608911316373; 
 Fri, 25 Dec 2020 07:48:36 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 25 Dec 2020 16:48:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9qUN7qTRGU3mFTGHZVGPXE-csdojziZQ-kX460W7pssJw@mail.gmail.com>
Message-ID: <CAHmME9qUN7qTRGU3mFTGHZVGPXE-csdojziZQ-kX460W7pssJw@mail.gmail.com>
Subject: re: "Wireguard [sic]: great protocol, but skip the Mac app" blog post
To: Rachel Kroll <rachelbythebay@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Rachel,

I'm writing this to you, but am CC'ing the WireGuard mailing list, as
I think there's relevant technical discussion to be had.

I woke up this morning with my inbox lit up by netizens outraged at me
for having allowed the WireGuard Project to produce such terribly
subpar and dysfunctional software for the Mac. That was a weird way to
wake up on Christmas, considering how much I really do care about
delivering polished software. I squinted at my telephone a bit trying
to figure out what was going on, when I finally wound up on a Hacker
News "top story" linking to your blog post [1].

Fortunately the top comment [2] correctly identified the technical
nature of the problem, upon which hopefully I can expound a bit in
this email:

>> Wireguard won't upgrade itself if it's still running=E2=80=A6
> This is not unique to Wireguard. I=E2=80=99ve had this happen with the Lo=
ckdown app too. This is an Apple problem. Apple should notify you that the =
VPN app needs to close in order to upgrade then offer you a simple way of d=
oing that.
>> I don't know exactly, and I don't really care.
> This about sums it up. This is a rant and it=E2=80=99s difficult not to j=
ust close tab half way through.

I thought it might be useful to reframe our efforts with the Mac in
terms of the technical hurdles we're facing with Apple's frameworks
and with the App Store, in hope that this motivates either you or
others to help contribute to making the app better. Again, I really do
care immensely about producing quality software for the Mac, and to
the extent that things are as dire as your post makes them sound, I'd
really like to fix that. You wrote, "What about the problems? Well,
it's free. They owe me nothing." But, owe you something or not, I
still care.

1. The App Store refuses to update when a network extension is running.

This is true! And it's not exactly clear the best way to fix it,
either. We're currently trying to detect it from the actual UI, which
sometimes receives a notification:

https://git.zx2c4.com/wireguard-apple/tree/Sources/WireGuardApp/UI/macOS/Ma=
cAppStoreUpdateDetector.swift
https://git.zx2c4.com/wireguard-apple/tree/Sources/WireGuardApp/UI/macOS/Ap=
pDelegate.swift#n144

The goal here is to detect the update and then do the right thing.
These are hard to test, though, because the app store doesn't allow
sideloading old versions to be updated, which means we need to manage
VM snapshots and wait cycles of app store updates. Apple being Apple
does not make this easy or pleasant to debug. It's possible this is
now broken in Big Sur. It also won't work if the app is closed but the
network extension is running.

Do I know how to workaround that? Yes I do, but the app store's
guidelines won't let me employ any of those techniques. Should Apple
fix this, as the Hacker News commenter wrote? Yes, they should, but
it's been several versions now, and it still isn't fixed. I wouldn't
hold my breath; Apple doesn't usually fix old bugs (only new ones,
according to sources). In fact, I'd estimate that  _at least_ around
3/4th of time spent developing the macOS app has been devoted to
hacking around random Apple bugs. We've cataloged a few at the bottom
of [3].

2. Version 1.0.10, our first update in a ~year, introduced a
regression that didn't get fixed for several days.

Actually, I fixed that regression within minutes. But the App Store
review process is insane. We faced rejections in submitting the app,
because they decided to change their policy on the app having a link
in the "About WireGuard" tool window to
https:/www.wireguard.com/donations/ (which they previously had allowed
explicitly; now they want 30% or something), and then after removing
that [4], they reviewed the old app instead of the new one, and then
and then and then... Well, finally they approved the fix, but not
after a delay, during which time I fielded email after email of users
trying to figure out what was going on.

How and why did this regression sneak in in the first place? In the
process of introducing WireGuardKit [5], a developer new to the
codebase didn't realize that he was removing a workaround to
yet-another-Apple-bug. I should have caught it, and I take
responsibility for it, and probably workarounds need more comments so
this doesn't happen. But hey, regressions happen, especially dealing
with the hugely buggy and inconsistent Apple NetworkExtension
framework. And while I am nearly always available to stop what I'm
doing to fix a regression within minutes of reports, the App Store is
very far from being amenable to quick reactions, in an era when
knee-jerk blog reactions are even faster. There's also no TestFlight
on Mac, and as I'll mention below, no other alternative for
distribution.

3. "On-Demand" has weird and confusing semantics.

Again, this is how Apple's API is designed, and it's awful. Our next
big push after the holidays will likely be to overhaul how we expose
"On-Demand" so that we can somehow tame a bit of the NetworkExtension
framework's madness. It sounds like your issue with it is mostly
related to (1) above, but there are other issues too with just how
"sticky" it is. So the app is going to have to become a lot more
aggressive in fighting Apple's framework so that it behaves nicely.
Top of the to-do list.

4. A, uh, description of sorts:

> Just the way it failed told me something was up with the overall model he=
re.
> It feels like the UI is poking at the "thing doing the actual work" with =
very
> long and wobbly sticks. It's doing this in a dimly-lit room with oversize=
d
> gloves zip-tied to its hands, and its glasses are smeared with filth. In
> short, it's not in control of the situation, not really.

I'd say this is an accurate description of what it's like programming
for the NetworkExtension framework. We've put a *LOT* of effort into
taming it and presenting a UI that displays something consistent. But
it's mostly out of our control. Apple doesn't give us a lot of control
over anything, and if we try to take control, they'll flag the API
violations and eventually just ban the whole developer account. When
I'm debugging these issues, I'll often times spend a few hours in IDA
Pro (Apple doesn't provide debug symbols, unlike Microsoft, which
makes this process even more miserable than it already is), and after
identifying the issue I'll often have several ideas for "clever"
workarounds. Which of them are acceptable for the App Store? Usually
none! C'est la vie.


So that's the deal... The bottom line is that Apple's framework is a
buggy mess, and App Store policies make software release both more
risky and don't permit us to workaround issues as we'd like. That sort
of suggests another question, though: why are we in the App Store at
all? Because as far as I know, Apple only allows
NetworkExtension-based apps to be distributed via the App Store,
according to their developer relations guy [6], so we're locked in.
And even if they were to change that someday somehow, and we went to
standalone distribution, we would then have to support two parallel
distribution channels so as not to abandon former Mac App Store users,
presumably, which means we'd still be limited by App Store
restrictions. That's an unfortunate situation; we're trapped. The
other option would be to distribute a root-app and do things
ourselves, much like the version of wg-quick available in
wireguard-tools on brew (and MacPorts, as your blog post mentioned). I
could probably integrate this very deeply with the OS and make it work
well. But it's really only a matter of time before Apple closes down
that entirely too and forces everything into entitlement-based
frameworks. In other words, that's not a reliable base anymore in that
universe. And that also wouldn't work on iOS.

If you (or anyone else on the list) is interested in helping to tame
these APIs, we really could use a hand. The goal is to integrate with
native system functionality -- NetworkExtension, Keychain, and so on
-- so that it feels like a first-party app, while also being
distributable in the App Store and basically functional so that people
want to use it. It turns out this is a taller order than it may seem.

Hope this helps clarify. And sorry again for the buggy software.

Merry Christmas,
Jason


[1] https://rachelbythebay.com/w/2020/12/24/wg/
[2] https://news.ycombinator.com/item?id=3D25534089
[3] https://docs.google.com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat6=
2aZ6LYGY/edit
[4] https://git.zx2c4.com/wireguard-apple/commit/?id=3Da4fc0f64b8bca8afae5a=
bab37b81ba0b45836975
[5] https://lists.zx2c4.com/pipermail/wireguard/2020-December/006161.html
[6] https://developer.apple.com/forums/thread/81281
