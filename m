Return-Path: <SRS0=iDgY=II=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E723C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 03:16:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7141A64F36
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 03:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7141A64F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac0c9fc0;
	Wed, 10 Mar 2021 03:14:53 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7304d850
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Mar 2021 03:14:51 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id F3CC07E888
 for <wireguard@lists.zx2c4.com>; Wed, 10 Mar 2021 03:14:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4DwHHs6Hsdz3vnJ
 for <wireguard@lists.zx2c4.com>; Wed, 10 Mar 2021 03:14:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id C53F32C5F3
 for <wireguard@lists.zx2c4.com>; Wed, 10 Mar 2021 03:14:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f178.google.com with SMTP id l132so15467832qke.7
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 19:14:49 -0800 (PST)
X-Gm-Message-State: AOAM530JN1MzLFZRxdPGtiiXvFvp0ZFd7ng/w5kH86/JmBeWeM6aEMDw
 e4RuYGzeEOBPTQ6WOvRRLGaclUKk876woGykAQQ=
X-Google-Smtp-Source: ABdhPJza7dq9Z+UpU0iu9w/GHBBJ/wP7qViF6sVaq993Wm/DvyU/BTXSJ+ua8NaGoL3W0k5ZpsGrPupr3jVYwyDJkqQ=
X-Received: by 2002:a37:f50d:: with SMTP id l13mr849146qkk.34.1615346089348;
 Tue, 09 Mar 2021 19:14:49 -0800 (PST)
MIME-Version: 1.0
References: <CACNAnaHUO_GvqQd3BJ2i4Wh45L=0g-LSxJg11G_dEa3UKK6GUw@mail.gmail.com>
 <CAHmME9pQGWUo=Q0ohXUkXapS7rZ1qbP+GFHkDDOD2hp5VSD+Pw@mail.gmail.com>
In-Reply-To: <CAHmME9pQGWUo=Q0ohXUkXapS7rZ1qbP+GFHkDDOD2hp5VSD+Pw@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 9 Mar 2021 21:14:38 -0600
X-Gmail-Original-Message-ID: <CACNAnaHR+Jmyiaq8UfVp_W=BOA0OZh-_Cn0Lqts+Xj0eN9KY_w@mail.gmail.com>
Message-ID: <CACNAnaHR+Jmyiaq8UfVp_W=BOA0OZh-_Cn0Lqts+Xj0eN9KY_w@mail.gmail.com>
Subject: Re: FreeBSD/wireguard-tools
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 =?UTF-8?Q?Bernhard_Fr=C3=B6hlich?= <decke@freebsd.org>, 
 Matt Dunwoodie <ncon@noconroy.net>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Mar 9, 2021 at 3:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Kyle,
>
> Thanks for getting in touch. So far as I can tell, Matt Macy never
> finished either the port of wireguard-tools or the port of the actual
> kernel module from OpenBSD. I'm CCng Matt Dunwoodie, who has started
> working through the kernel module finding issues.

Ah, excellent!

> There was that awful error in 25519 (lack of scalar clamping) that somebody
> emailed me about a while ago. I don't know if that was ever fixed but I was quite
> surprised that got committed.

Indeed, that did get fixed.

> I got the impression from trying to work with Matt Macy that there wasn't too much
> interest in collaboration.  Your email is a very welcome change.

I can't speak much for the historical context here, but I do know that
we as a project
would benefit from collaboration if the end result is being able to
tap into the pre-existing
knowledge pool available here.

> I see the path forward for FreeBSD having a functional WireGuard
> implementation as something like this:
>
> 1. We work out kinks in the kernel module crypto and state machine. I
> need to sync with Matt Dunwoodie on his findings there. Maybe we can
> send patches ourselves, but maybe it'd be best to just have a
> screensharing call where we walk through this together, and after the
> call you can code/commit the problems that we identify from
> discussion? A similar undertaking has been on my todo list for a
> veryverylongtimenow for NetBSD, but that implementation is much, much
> further behind, while in contrast I think with FreeBSD we're a lot
> closer to things being where they should, and a lot of it will be a
> simple matter of syncing the OpenBSD code. So if you're willing to
> work with us, I think that's something we can get done together in a
> week or faster.
>
> 2. We fix/simplify the kernel module's IPC interface to just be a
> simple get/set, like every other implementation of WireGuard.
>
> 3. We write support for that IPC protocol as "ipc-freebsd.h" in
> wireguard-tools. Maybe we'll start with Macy's code, but he never
> incorporated the feedback I provided on that, so perhaps you'd like to
> start over. Whatever you please there is fine with me.
>

We discussed this out-of-band, but to re-iterate that for others that might
have tuned into the thread: I'm interested in maintaining the use of nvlists
for import/export to sidestep around some classes of ABI
concerns/considerations because we maintain two or three major branches
of FreeBSD (if you include the -CURRENT) that fixes/additions could be
backported to if we can manage backward compatibility. We're certainly open
to other possible changes here.

> 4. I relicense the tools as MIT. I've previously started on getting
> this done, and the only blocker was the embedded libmnl, which is LGPL
> and out of my control. But I think there are two reasons why this is
> not a real impediment: 1) I've been in touch with the author there,
> and I think he'll MIT it if poke again, and 2) that's only for Linux
> anyway, so you wouldn't need that file *at all* on FreeBSD.
>

This is excellent, thanks. As you guessed, we can just drop bits from
our vendor import that we won't be building, so no worries here as
long the pertinent parts can be cleanly considered MIT.

> Does that seem like a good plan? And if so, are you the right contact
> with whom to work on it? And what's the FreeBSD release schedule like?
> How long do we have to fix this?
>

This seems like a good plan, and I appreciate it. I'm more than happy
to play the ambassador role here, and hack on whatever I can be useful
with. The final build starts on the 26th and there's a strong
preference (or maybe it's even a hard policy) that there be no changes
between the last RC and the final build.

#1 above is, of course, the most critical step to accomplish prior to
the release. We could conceivably punt #2 to entirely post-release;
the ioctl interface isn't documented, so we could slap warnings in the
pertinent headers and ifconfig/ifwg.c to note that it's unstable and
will change between minor releases.

Punting it down the road a little bit entails a concession that stock
wg(8) will not be usable for FreeBSD 13.0, but we can work with decke@
to conjure up a patch against the port with our existing ipc-freebsd.h
with the limited functionality that it currently entails. I don't
think this is the worst concession we can make as long as it means
that we can focus on making the core functionality rock-solid and as
long as the situation is clearly advertised.

The ports model generally encourages problems with the port/pkg to go
through the port maintainer first, so theoretically decke@ would be
initially fielding any bug reports that arise from the suboptimal
situation in the ~yearish that 13.0 will hold tenure rather than you
seeing complaints from it upstream. The only folks building
wireguard-tools directly from upstream should be those wanting to work
against FreeBSD -CURRENT, but we can slap some __FreeBSD_version
checks in ipc-freebsd.h or somewhere to advise of the situation if
someone tries to use it against revisions that are incompatible with
the new UAPI.

Thanks,

Kyle Evans
