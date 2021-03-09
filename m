Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C03C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:08:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35BD565256
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35BD565256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c199aa68;
	Tue, 9 Mar 2021 21:05:05 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 17cd2ac2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 21:05:04 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id E2AF89A200
 for <wireguard@lists.zx2c4.com>; Tue,  9 Mar 2021 21:05:02 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Dw75B5pR9z3GP9
 for <wireguard@lists.zx2c4.com>; Tue,  9 Mar 2021 21:05:02 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id B5DD329C51
 for <wireguard@lists.zx2c4.com>; Tue,  9 Mar 2021 21:05:02 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f170.google.com with SMTP id x10so14603176qkm.8
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 13:05:02 -0800 (PST)
X-Gm-Message-State: AOAM530eQkkXoqXxo4Oc+O51kGDDOhsNr70E2sI0Ws5BZj1rJDWgXrdA
 YhpAXZ0G1ZD0Ijb6cOiCzmsPbsmKyKXmtdaeVM8=
X-Google-Smtp-Source: ABdhPJy3KUiEVsZlhmudV/sSPaTpE4KjgWyFwT/FejncCQ/OGQ9xEuxzdLD1BTRn8vTuCfwNBuQMkr9ebujUYdCZeGg=
X-Received: by 2002:a37:886:: with SMTP id 128mr29003845qki.430.1615323902262; 
 Tue, 09 Mar 2021 13:05:02 -0800 (PST)
MIME-Version: 1.0
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 9 Mar 2021 15:04:51 -0600
X-Gmail-Original-Message-ID: <CACNAnaHUO_GvqQd3BJ2i4Wh45L=0g-LSxJg11G_dEa3UKK6GUw@mail.gmail.com>
Message-ID: <CACNAnaHUO_GvqQd3BJ2i4Wh45L=0g-LSxJg11G_dEa3UKK6GUw@mail.gmail.com>
Subject: FreeBSD/wireguard-tools
To: wireguard@lists.zx2c4.com
Cc: =?UTF-8?Q?Bernhard_Fr=C3=B6hlich?= <decke@freebsd.org>
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

Hello!

I'll start off with a slight overview of where we're at from a base
system perspective: in November, an if_wg port from OpenBSD to FreeBSD
landed in our development branch, along with updates to ifconfig(8) to
manage it for the time being. We've committed a number of fixes and
improvements since then[0][1], and we will be shipping that in the
upcoming release of FreeBSD 13.0[2].

The only outstanding issue(s) that I'm aware of (please correct me if
I'm mistaken) are the following:

(1) wireguard-tools doesn't currently support FreeBSD/if_wg, but there
is a  branch (mm/freebsd) that generally does. There are further fixes
to this from the fine folks over at Netgate, see [3]. As a FreeBSD
developer, what can I do to help us move forward together?

(2) There's a preference for using wg(8) for configuration, but we
can't currently include it in base due to licensing. We've got plenty
of precedent for dual-licensed material in base, so if that's a route
that works then I'd like to go ahead and start that discussion.

From our standpoint, any of: BSD2, BSD3, MIT, ISC licenses can go in
undisputed, choices outside of that require red, yellow, and sometimes
even purple tape.

These are the points that I'd like to start discussing, at least; we
can punt #2 on a little further down the road, though I would like to
have some plan in place to hopefully be able to include it in base for
FreeBSD 13.1 and the integrated version of wg(8) in ports for testing
much sooner.

I appreciate your time and efforts in providing the excellent
WireGuard ecosystem.

Thanks,

Kyle Evans

[0] https://cgit.freebsd.org/src/log/sys/dev/if_wg
[1] https://cgit.freebsd.org/src/log/sbin/ifconfig
[2] https://www.freebsd.org/releases/13.0R/schedule/
[3] https://github.com/pfsense/wireguard-tools/commits/master
