Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E6AC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:50:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15EA520792
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:50:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=noddingdog.org header.i=@noddingdog.org header.b="qOpC7KaF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15EA520792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=noddingdog.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0863986;
	Mon, 3 Aug 2020 16:25:51 +0000 (UTC)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e75bc16f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596473402;
 s=strato-dkim-0002; d=noddingdog.org;
 h=References:In-Reply-To:Date:Cc:To:Reply-To:From:Subject:Message-ID:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=BDIHMSbDik6Rn73nYHmd3n0r84rizohYjjl3+aIAo3c=;
 b=qOpC7KaFVakgARE2HASbHpDeMqSFh3Ej5J0tmReJ7p4UiUawmNJwgK9abLLvurxTga
 6D2dtI08Ym96HRFAB+YmMvnJgf9nt7hdWbPySwBCyBuCNiaEGGQXWuljvtJEqbWBHogy
 0qxFcezPV0EsfeZ5BWOmbiaO5PSEGVwHwKr5lWwealLAGlQG2i5TqDexej8/3VErE3TF
 I77IO4aVLOjQO6BJM45yxgsifEvtC2SdjHwzF1JMAkrdkAi5QE6mJuVbwmi8DULdatRA
 yMgkc9TIRKjHiqQtq4PunTgdGASLUC2l0L4s92JOY2/mVDHMSHYdg6H84gBIQ2mhNJ96
 5iKA==
X-RZG-AUTH: ":IGUXYVOIdfBKufcaBaD1VnaVHDFPyTRa+MRijjlybNMf0fcWFTusC99TG/RqMbkejJUmYQ=="
X-RZG-CLASS-ID: mo00
Received: from WN-XPS13.fritz.box by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id q00567w73Gnx8Jk
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 3 Aug 2020 18:49:59 +0200 (CEST)
Message-ID: <d45090e8a80c9324e1c57ae71b33171588176318.camel@noddingdog.org>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
From: NoddingDog <lists@noddingdog.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, Andy Whitcroft
 <apw@canonical.com>, W.Jackson@dell.com, unit193@ubuntu.com
Date: Mon, 03 Aug 2020 18:49:58 +0200
In-Reply-To: <CAHmME9raRNgM3+NPjpF4aPQpH9VUYNkrg=h9zUwb0jVfBgx=ZQ@mail.gmail.com>
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
 <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
 <CAHmME9oTLHTfRw+_QAqqZNb4=GCb1WnJaEBsm_tBhzJ7FzoFkA@mail.gmail.com>
 <2bf53aa68644d0595c76db514a5aca769a13f25f.camel@noddingdog.org>
 <CAHmME9raRNgM3+NPjpF4aPQpH9VUYNkrg=h9zUwb0jVfBgx=ZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Reply-To: lists@noddingdog.org
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, 2020-08-03 at 18:47 +0200, Jason A. Donenfeld wrote:
> On Mon, Aug 3, 2020 at 6:43 PM NoddingDog <lists@noddingdog.org>
> wrote:
> > 
> > Good you've found the issue.
> > 
> > That'll teach me to be an early adopter... ;-)
> 
> Sigh. Sorry you're having that experience with WireGuard. Usually
> things go quite a bit better with the WireGuard side of things, but
> this seems pretty par for the course with _Ubuntu_ and Canonical's
> kernel team. We've had perpetual issues over the last 6 months with
> getting Canonical to release high quality packages in a timely
> manner.
> A pretty large portion of my time is spent dealing with these bugs
> and
> Ubuntu in general. I'm hoping they can finally get their stuff worked
> out and support users properly, and I had hoped that everything was
> *finally* in order today, but it seems like it was not meant to be.
> Problems continue, alas. I've poked Andy on IRC and hopefully we can
> get fixes for this deployed as soon as their procedures and paperwork
> allow.

"Sorry you're having that experience with WireGuard."

No hard feelings at all... I'm using it extensively and this is the
first time I've had any problems with wireguard. Keep up the good work!

