Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15945C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 01:18:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118EC64F7B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 01:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118EC64F7B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c933ec3b;
	Tue, 16 Mar 2021 01:18:26 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 26d48ea7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 01:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615857501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sEw3K1RryXBg4j5BxsdiSM9lwEplXlEFRGh4C3znQV8=;
 b=i/OYgkrzJGcm1pLGBkjBNYJ7ctoTQMzW3CGd/2JKraOyCb6Jhw9JCbM3l2QEU9gQBpJWDr
 zcl8zcAu1kBSxIFl6J/5x5WWDv6F7bpFa2MS5sD2qr4Jf3cqilDvtbqbpgOI8+tXsorMYy
 F2MO17KV/+lj1T8Qy+Ik9bXAscsGnUg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 29fccde5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 16 Mar 2021 01:18:20 +0000 (UTC)
Date: Mon, 15 Mar 2021 19:18:19 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com, Scott Long <scottl@netgate.com>
Cc: secteam@FreeBSD.org, cperciva@FreeBSD.org
Subject: Re: [ANNOUNCE] WireGuard for =?utf-8?Q?Fre?=
 =?utf-8?Q?eBSD_in_development_for_13=2Ey_?= =?utf-8?B?4oCT?= and a note of
 how we got here
Message-ID: <YFAHW1lfTinihSGj@zx2c4.com>
References: <YE9zWanlutKYTlKL@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YE9zWanlutKYTlKL@zx2c4.com>
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

Hi Scott,

It's certainly disappointing to receive your email like that. I see that
you're really upset, and I think we have a shared interest in
deescalating this. You've mentioned the desire to talk about this in
public, so I'm responding in the announcement thread to you, as this
seems like the appropriate venue for discussion.  I've also CC'd the
FreeBSD Security Officer. I've responded to your email and its threats
in line mailing-list style below:

On Mon, Mar 15, 2021 at 6:08 PM Scott Long <scottl@netgate.com> wrote:
> What you and Kyle did was tell the world that there are a number of
> zero-day exploits in the code.  You gave us no details until after the
> fact, gave us no time to mitigate, correct, and publish before your
> announcement and Kyle's code drop, and used the opportunity to
> bash the code, and by extension us, for your own self-gain.

I have no idea how you possibly have arrived at this here. FreeBSD 13 is
currently at RC2 or RC3, if I recall correctly. Our whole motivation for
working on this so tirelessly and with so much energy and devotion over
the week was to get things fixed up before 13 was actually released. I
dropped everything else I was working on to focus on this. I'm actually
with my folks in Colorado and should be spending more time with them but
the idea of FreeBSD 13 shipping with all those bugs seemed like a really
important thing to address.

Here's what we did, step by step:

1. We made a clone of the freebsd git repo where we could all push
   changes to master, to git.zx2c4.com like everything else.

2. We took turns taking big passes at the codebase, reading it, auditing
   it, fixing things. We did a lot of syncing and comparison with the
   OpenBSD code base. For example, in one step, we reordered the functions
   to match the flow of OpenBSD so we could see it more easily side by
   side.

3. We kept pushing commits like this in that manner.

4. We didn't know where we'd end up, but after a few days of this, the
   number of changes we had accumulated and fishy business we had observed
   was massive.

5. When we thought we reached a good resting point -- and when it became
   clear that our rapid fire changes were becoming too numerous -- we
   squashed that down to a summary commit, and Kyle committed it.

6. Seeing that the crypto needed to be re-accelerated, I published a
   call for help here --
   https://lists.freebsd.org/pipermail/freebsd-hackers/2021-March/057076.html

7. I published wireguard-tools with the improved wg(8) command here --
   https://lists.zx2c4.com/pipermail/wireguard/2021-March/006493.html

8. I sent a summary of everything to the mailing list here --
   https://lists.zx2c4.com/pipermail/wireguard/2021-March/006494.html

I also made sure to email a FreeBSD Security Officer, Colin, to keep
him posted about the state of this, so he was kept apprised.

Again, the whole idea was: two weeks until release! If I suggest the
code is just disabled, people will be really upset, so instead we'll try
to fix as much as fast as possible before the release. And actually,
really focused sprints like that are fun and stimulating. We were all
really enjoying writing code until the torrents of anger started coming
from you about our efforts. (And I also learned that this isn't the
first time you guys tried to intimidate an open source project -- see
this summary of the opnSense defamatory website Netgate created --
https://opnsense.org/opnsense-com/ .)

And in the process, too, I've tried to be in contact with you and Jim
and let you know what our intentions are and to diffuse tensions. I
spent time on a video call trying to describe to you some of the
security things we found, in case it wasn't possible for you to use the
new code right away. I've also made it abundantly clear to you how much
I want to work WITH Netgate. When that Reddit thread cropped up, I
offered to you multiple times to send a message to it telling people
that we've spoken and it looks like you have a good plan and every
things going to be okay, but you didn't respond to my offer.

On Mon, Mar 15, 2021 at 6:08 PM Scott Long <scottl@netgate.com> wrote:
> None
> of these actions reflect good-faith collaboration, and your statements
> that you think that our work is "really cool" ring hollow.  Maybe you
> and Kyle are really naive and thought that this was how people
> normally collaborate in the security and business worlds, and that
> everyone would rush to praise you and shower you with contracts
> and funding.  And hey, maybe that’ll happen, you certainly have
> made a splash.  That of course, comes at our expense, and it’s
> likely to be a pretty damaging one.  Now with the Ars article, I’m
> starting to wonder if this was a coordinated smear campaign.
> Normally we don’t get this kind of attention.  It’s going to be painful
> to navigate our way out.

I'm not sure how to address these types of... theories. I certainly AM
acting in good faith. I can't possibly see how it benefits anybody to
have WireGuard and Netgate at odds with one another. You guys make a
neat product based on open source software, and I think it's great
you're planning to add WireGuard to it. My interest is in making sure
the underlying operating system -- FreeBSD 13 -- does that well.  (Or, I
think you mentioned to me this morning that you're actually planning to
base it on FreeBSD 12 for some time, but same idea for the backport
you're working on, I guess.)

And there's no "smear campaign" -- that's outrageous. I have no idea how
that would help anybody at all. I should point out, again to you, how
grateful I am that Netgate got the initial work on this started. Had you
guys not gotten if_wg rolling, it's not clear to me that it'd exist in
the first place.

From your end, it's very disappointing that you're (below) planning to
attack security researchers and kernel programmers who took the time to
rewrite code to make it better, hustling to get it in before FreeBSD 13
is released.

On Mon, Mar 15, 2021 at 6:08 PM Scott Long <scottl@netgate.com> wrote:
> I’ll be writing an article tonight outlining the mistakes that we made
> and what we will be doing to correct it.  I’ll also be highlighting that
> this incident has been a textbook example of the wrong way for
> people to collaborate in the security community, and that extreme
> caution should be taken in any future dealings with you.  Your
> actions are self serving and in bad faith, and your words are
> hollow and untrustworthy.  I don’t care if you disagree or don’t see
> it this way, this is the effect that you’ve had.

It makes sense to communicate with your customers about things with your
upcoming products if you feel it's necessary. But threatening that
you're going to highlight "that extreme caution should be taken in any
future dealings with you" sounds to me like a threat of some intense
slander. And again, attacking security researchers and kernel
programmers who took time to rewrite code to make it better before a
release deadline...  That's ...wow. I wish you would not go on the
attack like that.

Instead, it seems like we can both be glad that we're on the path to
having better code! And that there's a team of people volunteering to do
this and enjoying writing that code. We're all working together to make
things better. We worked really super hard on fixing up this code base.
It was a LOT of work. And I would like to keep working on it and feeling
good about it.

So I'm just disappointed that somehow this has devolved for you into
making threats like that.

On Mon, Mar 15, 2021 at 6:08 PM Scott Long <scottl@netgate.com> wrote:
> I’ve also spoken with the FreeBSD Security Officer, and we’ve
> agreed that wireguard will be removed from all branches of FreeBSD
> until further notice.  I’ve also informed Kyle of this.  I do not support
> its reintroduction into FreeBSD, whether in the src tree or in the
> ports tree, at this time.  As for pfSense, we are conducting an
> audit and will decide on the best course of action for our customers
> and our company.

I actually think that's a great idea. I was under the impression
initially that removing it would be a total non-starter and would just
make people upset, hence this hurried mad dash to turn things around.
But having an opportunity to take it out of tree and develop it slowly
and carefully, like we did for Linux and OpenBSD, sounds a lot better.
This also meshes well with what we had planned to do, which I mentioned
in the announcement email this morning -- have this available as an out
of tree module that people can try out. Then, after we've got it really
solid, reintroduce it in the normal FreeBSD ways of doing that. (I'm not
so familiar with that latter process, but I trust that Kyle & folks know
that part well.)

On Mon, Mar 15, 2021 at 6:08 PM Scott Long <scottl@netgate.com> wrote:
>
> Scott

So, that's where we are. You're upset and making threats to slander
security researchers and kernel programmers. That's really
disappointing. All I can do is ask you: please don't? We have much more
to gain by supporting each other than being in conflict. I just want to
make sure FreeBSD 13 (or 14) gets a great WireGuard implementation. And
you want to make sure your customers get great products. I see no reason
why these are conflicting goals.

I hope this can deescalate, and we can work together on this. I'm
confident that our goals are ultimately aligned very well.

Regards,
Jason
