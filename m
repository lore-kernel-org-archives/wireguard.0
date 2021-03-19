Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9771AC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 13:04:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A54E164ECD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 13:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A54E164ECD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0ca680d;
	Fri, 19 Mar 2021 13:03:19 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ebaf9974
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 13:03:17 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 7137C9D804
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 13:03:15 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4F23wg2VC9z4kHS
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 13:03:15 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 442E97F82
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 13:03:15 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f181.google.com with SMTP id s2so6581938qtx.10
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 06:03:15 -0700 (PDT)
X-Gm-Message-State: AOAM530fMIjHCCGIv/FJWdaQ65DYZbW2hzdseWIYrRRvcCNj9CdW+kWc
 1YNvI7O3gdM4Kn44KkGxcI52ItTofOuLO8Dgi9s=
X-Google-Smtp-Source: ABdhPJxZzVWg1V4K8sjZ6vK4dbhyxpmG82JqeP7KaQAEX6KeQougxsCsjDkLO6WSPjO98+MK9RBoTO1cSU5i7bx1OLI=
X-Received: by 2002:ac8:5a0d:: with SMTP id n13mr8148600qta.211.1616158994557; 
 Fri, 19 Mar 2021 06:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <YE9zWanlutKYTlKL@zx2c4.com>
In-Reply-To: <YE9zWanlutKYTlKL@zx2c4.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Fri, 19 Mar 2021 08:03:01 -0500
X-Gmail-Original-Message-ID: <CACNAnaFsDK7moCr1j1GYLcEdR_UYE=My7vgKB6VLnFaNzKAzOw@mail.gmail.com>
Message-ID: <CACNAnaFsDK7moCr1j1GYLcEdR_UYE=My7vgKB6VLnFaNzKAzOw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BANNOUNCE=5D_WireGuard_for_FreeBSD_in_development_?=
 =?UTF-8?Q?for_13=2Ey_=E2=80=93_and_a_note_of_how_we_got_here?=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Mon, Mar 15, 2021 at 9:47 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi everybody,
>
> [... snip ...]
>
> The first step was assessing the current state of the code the previous
> developer had dumped into the tree. It was not pretty. I imagined
> strange Internet voices jeering, =E2=80=9Cthis is what gives C a bad name=
!=E2=80=9D

This was a highly unnecessary jab.

> There were random sleeps added to =E2=80=9Cfix=E2=80=9D race conditions

This is true.

> validation functions that just returned true

I looked back at the history here just now, and I count one,
wg_allowedip_valid, that pretty much got ripped out anyways.

> catastrophic cryptographic vulnerabilities
> whole parts of the protocol unimplemented

I'm not qualified to speak about these two, which are perhaps the
worst from the public's perspective.

> kernel panics

These are true.

> security bypasses
> overflows

I only recall one of each.

> random printf statements deep in crypto code

This is true.

> the most spectacular buffer overflows

English is a crappy language, but this sounds like you're advertising
more than one.  There was one, and for the record to anyone watching to
dispel "the word on the street" that it's potentially an RCE: based on what=
's
happening I cannot imagine how you could usefully turn it into an RCE.
Local privileged execution, 100%, but looking at it further, you've got to =
be
pretty skilled to make it before killing the kernel elsewhere.

> and the whole litany of awful things that go wrong when people aren=E2=80=
=99t
> careful when they write C.

This is an exceedingly broad statement, and it would have been good to prov=
ide
some pointers to these.

> [...]

You know that I don't appreciate how you handled this initial communication=
,
as I've told you a number of times. Now that I look at the history again, I=
'm
even more disappointed in how you handled this because there are some
pretty broad statements in here and language that could go either way.

I've additionally recommended, as a developer and not in any kind of offici=
al
capacity, that we can't include if_wg in any future version of base.  We ca=
nnot
have our users being put at the risk of this kind of publicity if we
can't get security
advisories issued in time. Ports is a fine place, where security issues can=
 be
addressed expeditiously and more in line with how the WireGuard project cho=
oses
to handle them.

Thanks,

Kyle Evans
