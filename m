Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEC6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jun 2022 11:44:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a6576661;
	Tue, 28 Jun 2022 11:44:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1d2a72c6
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2022 11:44:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97F3A61AC2
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2022 11:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFEEC3411D
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2022 11:44:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="j94Nj9CF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656416664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=b/OvmzsRVp4a2zW2VkWciwTMh5cYYzJvgCSfCgRWLow=;
 b=j94Nj9CF8QaCZydcTvBlrquxZIOUM4lOxq0axdpeRB0Y0N2FQIJXqruVqlqJBsquzHhrhZ
 JKRueO0W6gxKl8XsqnuUn89+QH2tCYEwKjATBmKHwaX0WDP1/zc/OhkdxOsPtuiJO37hfI
 YfkA7zSkGXGNkd4EyzquwIspaDpEO44=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 335c0004
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 28 Jun 2022 11:44:23 +0000 (UTC)
Date: Tue, 28 Jun 2022 13:44:20 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: The Future of RHEL7,8 Support in WireGuard
Message-ID: <YrrplG8DswM0zxQO@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi folks,

I'm confronted with a few hard facts, the first of which is good and
exciting, and the rest are kind of disappointing:

  1) RHEL9 has WireGuard baked into it by default, so there's no
     required compatibility backporting for it. If you use RHEL9, you
     can use WireGuard easily.

  2) The RHEL7 and RHEL8 kernels have build errors due to trivially dumb
     mismerges, if you try to build them using nearly anything other
     than the RHEL-supplied .config files. I've reported these bugs to
     Red Hat and I've sent series fixing these bugs (see this git repo,
     for example: https://git.zx2c4.com/rhel7-kernel-misery/log/ ), but
     Red Hat's perspective is that these are non-bugs that they won't
     fix, since the only purpose of the kernel for them is their own
     configs.

  3) Those build errors make it difficult to run WireGuard's CI on them
     without having to apply lots of extra patches. While RHEL7 is
     mostly set in stone now, the C8S kernel changes frequently.
     Recently I dropped RHEL from the CI, as C8S hadn't been building
     for some time. So now I have no way of ensuring that it continues
     to work.
 
  4) RHEL7 and RHEL8 is a behind-closed-door process, which makes
     tracking down new breakage and dealing with anything produced by it
     an exercise in pain.

  5) No companies who are using RHEL7 or RHEL8 with WireGuard have
     reached out to me about trying to fund this work. (And in general,
     now that WireGuard isn't a hip new marketing thing for VPN
     providers and whomever, funding has significantly dropped off.)

Given all this, I wonder whether the RHEL7 and RHEL8 backports have a
future, and if they do, what that future looks like.

Note, this isn't just a matter of "backporting is hard work that nobody
likes to do, but you do it anyway because that's what you gotta do."
Because in contrast, I'm quite content doing backports for the
kernel.org stable kernels that Greg and Sasha release. The process is
open and transparent, Greg and Sasha are nice to work with, the goals
are clear, the outcomes are dependable. It is still always work, but
developing for kernel.org stable kernels is reasonable engineering work,
as opposed to RHEL backporting, which is fighting uphill against
byzantine bureaucratic processes that aren't very welcoming of my
objectives.

And to be clear, it's not as though Red Hat is somehow evil here. Their
goals simply aren't aligned. The kernel.org stable releases are meant to
be general kernels that you can do things with, developed as part of an
open source project. The RHEL kernel, by contrast, is part of a
commercial product with a very specific single goal in mind. That's
fine, and there's nothing inherently wrong with that.

So when Red Hat tells me, "sorry, why should we care about this? RHEL7
and 8 don't support WireGuard. Tell people to use RHEL9 for that. We're
not going to make your life easier in RHEL7 and 8. It's not supported,"
I sigh exasperated, because as frustrating as their position is, it's
also an entirely reasonable position for them to have, based on what
their goals are and what they're doing.

That all is a very long way of saying that continuing to backport
WireGuard to RHEL7 and 8 kernels in the normal way with WireGuard's CI
as it currently exists is an uphill battle, just due to the nature of
the thing. It's constant struggle to put the square peg in the round
hole.

So what are our options here moving forward?

  A) I rip out RHEL7 and RHEL8 support completely, and expect people to
     just use RHEL9.

  B) Somebody extremely motivated and associated with Alma Linux or
     Rocky Linux or Oracle sets up a dedicated CI server using the
     official kernel builds and kernel headers, and runs `make test` on
     every commit to either the kernels or to wireguard-linux-compat,
     and then either:

      i) has the CI automatically send me an email notification on
         breakage so I can fix it like usual; or
     ii) fixes it and sends a proper patch to the mailing list in the
         correct style and format.
     
     Either one of those would work. (ii) would be nice, but there
     aren't tons of people who like both CI devops and kernel
     development, so I'd be fine with (i) too, which is more or less the
     status quo but with functional CI.

     Note, though, that this option (B) would have to be done well and
     reliably. Were it organizationally flaky, I'd prefer to do (A), as
     half-baked approaches tend to be worse than nothing.

     If this interests any readers with the backing of large
     RHEL-derivative projects, please get in touch.

  C) Several companies who are using WireGuard with RHEL7 and RHEL8
     provide significant project funding, and then I take care of
     setting up dedicated and reliable RHEL CI for the project, using
     official kernel builds and kernel headers. I could do this quite
     well, but it doesn't seem right to do that without real funding for
     it.

     If this interests any corporate readers, please get in touch.

  D) Other ideas the mailing list might have.

So that's about where my thinking is at the moment. As usual, I'm not
going to rush into any decision, and I'll do my best to keep RHEL
support as afloat as I can until a careful decision in one of these
directions has been made. None of this email is written with any real
sense of urgency. But still, I'd like to at some point choose a
direction and commit to it.

Let me know what you think.

Regards,
Jason
