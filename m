Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7B9C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Apr 2022 18:40:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4b41889d;
	Fri, 8 Apr 2022 18:40:52 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3f37fd70
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Apr 2022 18:40:51 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id B3AD173244
 for <wireguard@lists.zx2c4.com>; Fri,  8 Apr 2022 18:40:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4KZnBT4Km7z3v8g
 for <wireguard@lists.zx2c4.com>; Fri,  8 Apr 2022 18:40:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1649443249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cWIqyTW5jJxGk/7WQbLfJi8pQbPqcyiUK3zQET8eJGE=;
 b=JBrtZNUPuPAPgfzw+Y2Ec2KQSvTyop882OJebiYw2TWfnNtHXWxXPBKYqDAqMBRZ1b1hXK
 FQ6Xl6/50K0nyTNvvmsrPatmlRGEovswFRWEye+TZx7Ig9SAxylRdeTPFArvRVEfFJamnl
 L4escS/RRxz63HYq+BZjoA/KylEVAFCc8ziL79nZ/H36Iq/HxI/pZh4NT8dcrJk/OGEXst
 qwDuwzRQEdGs/Vb3MNca1Ie63/ZvjVlqJs3ICC3bjZH4eNRYf4X2X6zVSk+Yo8u23rX6HC
 l0LWvmWfKDzR3lvyrgidH+adqEHifzCthwnVbJRbXfkM3FjUoy99giNsFHAXvw==
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 6FF792D6E3
 for <wireguard@lists.zx2c4.com>; Fri,  8 Apr 2022 18:40:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-lj1-f180.google.com with SMTP id h11so12614774ljb.2
 for <wireguard@lists.zx2c4.com>; Fri, 08 Apr 2022 11:40:49 -0700 (PDT)
X-Gm-Message-State: AOAM532w5AZOgRf1/AIZy4zdsVVNwknB+0hQsUECKinlWOJ4k9NSnTCw
 heB5jp7CGRTgp/ae2gPlKva1fqIAPXzSjWlQk6k=
X-Google-Smtp-Source: ABdhPJyXS2AOqbpvu00idyQHzkYhi+6xrLpQAUnk4GxMowPCsk4q4Iz5mNx2/qLmKyKdBbbNKjjeWbtXHFqrM5Y++qo=
X-Received: by 2002:a2e:7c16:0:b0:246:377b:f802 with SMTP id
 x22-20020a2e7c16000000b00246377bf802mr12393782ljc.155.1649443248071; Fri, 08
 Apr 2022 11:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <5bf5dd1f-8e21-ece2-ef3c-f62e752cb774@FreeBSD.org>
In-Reply-To: <5bf5dd1f-8e21-ece2-ef3c-f62e752cb774@FreeBSD.org>
From: Kyle Evans <kevans@freebsd.org>
Date: Fri, 8 Apr 2022 13:40:36 -0500
X-Gmail-Original-Message-ID: <CACNAnaH=4PU=MYVqRyf-mAkdcH20cN3zOu3ejcgrdj6cE00chQ@mail.gmail.com>
Message-ID: <CACNAnaH=4PU=MYVqRyf-mAkdcH20cN3zOu3ejcgrdj6cE00chQ@mail.gmail.com>
Subject: Re: Patches against wireguard-freebsd
To: John Baldwin <jhb@freebsd.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1649443249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cWIqyTW5jJxGk/7WQbLfJi8pQbPqcyiUK3zQET8eJGE=;
 b=qmLW6Q/E/2B8Rmyq8KgKgwqDj8b1TmlOK2xTaGckxicbW+WWvfl1K9WYi1vow9MIq2qT61
 2DphUIkXXrNIZ7vyEaCfkwKbeIhkw852pquFDPCVTqJ2KV3kBGE88sKNqXOFmn2IBbs7GJ
 oJu8KWzBIRCG+diuKddW42EQ4LE4muQ9t9L3RV+U5l0NmQVpG4PPXT0muyCHL2Y57cH30w
 dmd4IqAx5ua2u43P3ZJ3r1oLAIoBNrUtIXT3dhdfi2hYTAKNoX9Pf9bLq6Mtwlz966reNk
 YnSlpC+QUPIEc2Xr5O2eFnKj82iaGnsQSOuWB15+H039Ag9OiiZMp9qpQpS1lQ==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1649443249; a=rsa-sha256; cv=none;
 b=EScQ7MWiQhrOaSb/hZZHxhYAqX3ucJ4Z9BTBMOtuiXWUjc2BmjBaqWoR91PmxpPPPF8B06
 crbIQfUKST5kHcv+4YBWDaFLCerp1KeWhGWWCl2XuVtOpEaAZp8i/5XK+BFFj6qvwUjT4b
 jnpR6mnjgg3U7tQfYoWyjPeFw472FLLDRzPoZf4oeNAfZwoqtQGW08wmib+2dxU4XMACO0
 A+EllDhorYTOeFE3vg5tyEIKaLxlBiGiJIG5E6be9SQIVwKQGAQ4/Bfn88ekWLyw/XVxnr
 haaxvHgI17K/EmitGHfUG+KKo7s834+VAQI5Sh9u1AUHmUDjyq6fuhuY/5uk5g==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
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

On Tue, Apr 5, 2022 at 5:49 PM John Baldwin <jhb@freebsd.org> wrote:
>
> I have a series of patches against the FreeBSD driver available on
> the jb-wip branch which I believe is (mostly) a candidate for merging
> to master.  The changes in the branch include:
>
> - 9d1881a Only include compat.h for if_wg.c and fix build with an obj directory.
>
> This patch permits building the module as part of a kernel build via
> the LOCAL_MODULES hook in 'make buildkernel'.
>

LGTM.

> - 2c4b941 wg_queue_len: Remove locking.
> - 61b401e wg_queue_delist_staged: Use more standard STAILQ_CONCAT.
>
> Misc small fixes, generally cosmetic.
>

I wanted to argue against 2c4b941, but it occurred to me that since
the caller's not holding the lock we don't have any guarantees about
the state of the queue by the time we use the result anyways. LGTM.

> - d746eed wgc_get/set: Use M_WAITOK with malloc().
> - 9223fbb wg_clone_create: Use M_WAITOK with malloc.
> - 9095ebe wg_peer_alloc and wg_aip_add: Use M_WAITOK with malloc.
>
> The ioctl path in FreeBSD generally uses M_WAITOK rather than M_NOWAIT
> (e.g. the non-smalldata case in sys_ioctl()).  This slightly simplifies
> the code by avoiding additional edge cases to handle.  It is also true
> that FreeBSD admins do not generally expect 'ifconfig create' to fail
> non-deterministically (that is, they only expect failure for things
> like invalid arguments, missing kernel module, etc.).
>

LGTM.

> - 4fbba97 wg_mbuf_reset: Don't free send tags.
> - 0a5fa77 ratelimit_init: Use callout_init_mtx.
>
> More misc small fixes.

LGTM.

>
> - a679db5 DNM: Add counters for the times en/decrypt tasks do no work.
>
> This is the one commit that I don't think is a merge candidate, instead
> it adds some counters useful for evaluating the effect of the next
> commit.
>
> - 89f91dc Avoid scheduling excessive tasks for encryption/decryption.
>
> There is more detail in the commit log, but this commit changes the
> scheduling of encryption/decryption tasks to match the behavior of the
> WireGuard driver in Linux instead of the current approach of
> scheduling a task on all available CPUs for every packet.  In my
> performance benchmarks of this series, this commit had the single
> largest effect of any of the changes.  My benchmark consisted of
> running iperf across a tunnel between two jails on the same host (an
> X1 Carbon laptop with 8 CPU threads).  This commit generally resulted
> in a doubling of throughput for both UDP and TCP with 1, 2, 4, or 8
> streams.
>
> To better explain why this change matters, I sampled the counters
> added in the previous commit for a sample run of iperf with a single
> TCP stream.  The "empty" counters count the number of tasks which ran
> on a CPU but had no work to do, the "work" counters count the number
> of tasks which encrypted or decrypted at least one packet.
>
> Using the current code gave the following counts:
>
> hw.wg.encrypt_work: 992858
> hw.wg.encrypt_empty: 6274830
> hw.wg.decrypt_work: 1114235
> hw.wg.decrypt_empty: 7064707
>
> encrypt efficiency: 13.7%
> decrypt efficiency: 13.6%
>
> The efficiency is close to the 12.5% worst-case for an 8 CPU system.
>
> Using the code in this commit gave the following:
>
> hw.wg.encrypt_work: 1486616
> hw.wg.encrypt_empty: 783377
> hw.wg.decrypt_work: 1880567
> hw.wg.decrypt_empty: 657807
>
> encrypt efficiency: 65.5%
> decrypt efficiency: 74.1%
>
> Note: The increased "work" counts here are a result of the increased
> throughput
>
> In addition, a user recently mailed Jason and I directly to say that
> this commit greatly reduced the power usage for a WG endpoint in an
> ESXi VM putting the FreeBSD VM nearly on par with a Linux VM
> performing the same work.
>

Nice! LGTM

> - 4e0478f wg_module_init: Clean up more if the self tests fail.
> - b885223 Return an error code from mbuf crypt routines.
>
> Small fixes preparing to use crypto support from FreeBSD.
>

LGTM.

> - ce85779 Use OCF to encrpyt/decrypt packets when supported.
> - 8ad55a8 Use <crypto/chacha20_poly1305.h> when present.
> - 447abb Use curve25519 API from the kernel when available.
>
> Use crypto support from FreeBSD's kernel on new-enough versions (the
> OCF bits are available on 13.0-stable and later, the rest are only
> present in 14.0-current).  FreeBSD's kernel does not currently provide
> a suitable API for Blake2 that matches WireGuard's needs, but does
> provide suitable APIs for the other crypto algorithms used by
> WireGuard in 14.0-current.
>

Seems to LGTM.

Thanks!

Kyle Evans
