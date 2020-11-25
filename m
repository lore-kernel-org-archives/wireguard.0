Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483BCC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 14:10:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7DF2076B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 14:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7DF2076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bestov.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 161b11bc;
	Wed, 25 Nov 2020 14:04:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 502794ff
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 14:04:26 +0000 (UTC)
X-Originating-IP: 151.79.131.81
Received: from localhost (unknown [151.79.131.81])
 (Authenticated sender: pbl@bestov.io)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 67FF66000E;
 Wed, 25 Nov 2020 14:10:02 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
From: "Riccardo Paolo Bestetti" <pbl@bestov.io>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 25 Nov 2020 15:08:55 +0100
Message-Id: <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
In-Reply-To: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
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

On Wed Nov 25, 2020 at 12:45 PM CET, Jason A. Donenfeld wrote:
> On Wed, Nov 25, 2020 at 11:30 AM Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
> >
> > On 11/25/20, Riccardo Paolo Bestetti <pbl@bestov.io> wrote:
> > > On Wed Nov 25, 2020 at 2:08 AM CET, Jason A. Donenfeld wrote:
> > >> Can you not add that group manually need be?
> > > I'm not an expert on Windows, but a quick lookup on the net suggests =
you
> > > cannot create a local group with a specific SID.
> >
> > I'm not convinced this is the case. We're talking about a local group.
> > Surely there's some on-disk representation of available groups and
> > associations, no? This line of inquiry needs to be fully exhausted
> > before we even consider alternatives.
> >
> > Has Microsoft documented this limitation?
>
> Well, I made Network Configuration Operators work just fine on Windows
> 10 Home edition.

Excellent. I will try to deploy this, hoping that it won't get nuked by
Windows updates.

Thank you for your help.
Riccardo

