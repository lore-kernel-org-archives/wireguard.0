Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B845C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 17:40:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70FAA65104
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 17:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70FAA65104
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19f9cfba;
	Tue, 16 Mar 2021 17:38:17 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 81bae0a1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 17:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615916291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0oGACFIL8J9SZamsqvs/X4H69lOZwPL2+iMeFK6MhcE=;
 b=U3OaT/czT4X0h5JSLTEeA5233hCkKp/L81RA06SAksefFKwouujUwmgm49X/j0npJ72idh
 nF71cIOzgE/24EIk93U7b9/Vu9cOe3mOQT2dYXt9DnxXYdHNxQdfFG6v7Tc3aB1+hSIV/k
 NlRQICD37KEVksvolRO/p/4ijUwLOx4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 601c1c6f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 17:38:11 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id u3so37692206ybk.6
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 10:38:11 -0700 (PDT)
X-Gm-Message-State: AOAM532z2H9kK6Qv7Kju1mOzvPaLoRNiGzzuI5Ndw+y2WWOwuy1gPXII
 LimmDlu5DN4nm7n7/321Zw4N0ZO1SMjiwBKjV3E=
X-Google-Smtp-Source: ABdhPJxi6Gau0FW2aWBjmPa2EXeZj1hs6B3t0fqJoDRxJLyS+8ZCrqyEFQdLeEpMKWsTelmANlJarC3SMiZ/7Zs/l1Y=
X-Received: by 2002:a25:1442:: with SMTP id 63mr13125ybu.123.1615916290654;
 Tue, 16 Mar 2021 10:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
 <CAH8yC8=3o+xDJH25DCWgMCaWbQpViX5QSAvud-ufZb7jpR03bg@mail.gmail.com>
In-Reply-To: <CAH8yC8=3o+xDJH25DCWgMCaWbQpViX5QSAvud-ufZb7jpR03bg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Mar 2021 11:37:59 -0600
X-Gmail-Original-Message-ID: <CAHmME9rFU8dknvVfWmRgbLud2bkQMNvVSBqNUfUiBcnTgV90yA@mail.gmail.com>
Message-ID: <CAHmME9rFU8dknvVfWmRgbLud2bkQMNvVSBqNUfUiBcnTgV90yA@mail.gmail.com>
Subject: Re: Removing WireGuard Support From FreeBSD Base
To: Jeffrey Walton <noloader@gmail.com>
Cc: Kyle Evans <kevans@freebsd.org>, freebsd-arch@freebsd.org, 
 FreeBSD Hackers <freebsd-hackers@freebsd.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Jeffrey,

On Tue, Mar 16, 2021 at 11:16 AM Jeffrey Walton <noloader@gmail.com> wrote:
> > In the next day or so, I will be committing a removal of all WireGuard
> > related bits from our 'main' branch, including the work that I recently
> > committed. It will be followed up by a removal of the implementation
> > from stable/13, and we will seek appropriate approval to remove it
> > from releng/13.0 as well. Please, do not be concerned by any of this;
> > this is being done with mutual support from all parties.
>
> The thing I find unusual is, the move appears to lack technical
> justification. The best I can tell, the reasons seem to be political.
> But like I said, maybe my feeds are missing something...
>
> As a naive outsider, if you are going to yank it, then the technical
> reasons for the action should be clearly enumerated. Everything else
> is just chatter or noise. The move just looks like a bunch of bruised
> egos and sour grapes.


I'd just like to chime in and point out that although this is
happening in a political context as you've pointed out, this is in my
opinion the *best possible technical situation*, and the one I would
have preferred in the beginning anyway if it were presented as a
choice.

Here's the technical background you asked for:
- We found tons of issues with the original code base.
- We spent a week rewriting that codebase.
So here's the rationale:
- Merging a week-old codebase into an operating system kernel is a bad idea.

It's really not more complicated than that. I'm *sure* we'll find more
things to fix. That's just the nature of it.

And from a practical perspective, it's a lot easier for me, anyway, to
casually push fixes as I code to a normal repo on git.zx2c4.com. When
there's a lot of potential code churn, sometimes it's easiest to be
able to move fast at first. When we get it to a place where we feel
extra good about it, then we can do the full review process on what
we've got, which has the added benefit of even more eyeballs and ways
of looking at things. I think the code will benefit from this type of
process.


> Maybe a good middle ground would be to take the existing code and put
> it in a Wireguard branch. Those who wish to keep Wireguard out of
> FreeBSD mainline have done so. FreeBSD users who wish to use Wireguard
> can build the Wireguard branch. And those who wish to improve
> Wireguard have a working branch for patches. Later, the branch can be
> re-merged back to master.

We're actually going to do something like that already. We'll have it
as an out-of-tree module, since it's fairly standalone anyway. And
then when it's ready, we'll send that for merging back into the
FreeBSD main branch. Also, from a technical perspective, dealing with
out of tree modules on FreeBSD seems way, way easier than on Linux.
There's not nearly as much API churn, as far as I can see. We probably
can even offer prebuilts at some point for people who want to test out
snapshots. So I'm really not very worried (at least at the moment; I'm
still new to FreeBSD kernel development).

Jason
