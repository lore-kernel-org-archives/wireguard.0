Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A84C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 18:24:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FBE65111
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 18:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FBE65111
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chocolatine.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9da78c1b;
	Tue, 16 Mar 2021 18:24:34 +0000 (UTC)
Received: from mx.chocolatine.org (mx.chocolatine.org [137.220.37.30])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e73c94a5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 18:24:32 +0000 (UTC)
Received: (qmail 86198 invoked by uid 1001); 16 Mar 2021 18:24:30 -0000
Date: Tue, 16 Mar 2021 18:24:30 +0000
From: Nicolai <nicolai-wireguard@chocolatine.org>
To: wireguard@lists.zx2c4.com
Subject: Re: Removing WireGuard Support From FreeBSD Base
Message-ID: <20210316182430.GA42183@chocolatine.org>
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
 <CAH8yC8=3o+xDJH25DCWgMCaWbQpViX5QSAvud-ufZb7jpR03bg@mail.gmail.com>
 <CAHmME9rFU8dknvVfWmRgbLud2bkQMNvVSBqNUfUiBcnTgV90yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9rFU8dknvVfWmRgbLud2bkQMNvVSBqNUfUiBcnTgV90yA@mail.gmail.com>
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

On Tue, Mar 16, 2021 at 11:37:59AM -0600, Jason A. Donenfeld wrote:

> Here's the technical background you asked for:
> - We found tons of issues with the original code base.
> - We spent a week rewriting that codebase.
> So here's the rationale:
> - Merging a week-old codebase into an operating system kernel is a bad idea.

Yeah, when I saw the recent sudden work to get WireGuard into FreeBSD
13, I was excited but also nervous since it's been in beta/RC for a
while, just a bit late to introduce important features.  I think the
current plan is sensible and will produce a result everyone likes.

> We probably can even offer prebuilts at some point for people who want
> to test out snapshots.

That's a great idea!  WireGuard is what finally got me to run
OpenBSD-current, so I could test the snaps.

Nicolai
