Return-Path: <SRS0=m2o5=BO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA238C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 13:14:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F1E0207FC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 13:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GrI6IdFQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F1E0207FC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 568a8530;
	Tue, 4 Aug 2020 12:50:26 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0a076031
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 12:50:22 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91ac49e3
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=C3vMxrbbbOjGjONrEM+Khd3ttRQ=; b=GrI6Id
 FQ7GOTzsLfXJj1ngJDGewKzgYMZPe+PoahFnIIEOeDQoSeF1BIrKwf4D+Fy67VzP
 rE/SnzPl20zITpim1Nt2I42um33KFdeEBkYCjLuVkPuOe+tYYuHqY3bVrnIGJ43p
 rRPwPoUJsR96qR19iXoyuhvqH80DS0It2CSCn6HAhCJ95owfSC9PEfrnS0uit68u
 QTw+GbMFQZNbvdk18Nl0qs/Wud/x99WE/6UhyCzVj8NLhiV1J1SSzXCKxptoTgMJ
 hQNA2YUd0REWfjoJL+viqm7A1DIseW0mhhY59oTuE1xBKhu0DgfVxjTl/3YAJkoe
 2miT6bM6W36M7BHg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 34b08b9a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 12:50:22 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id t15so33185277iob.3
 for <wireguard@lists.zx2c4.com>; Tue, 04 Aug 2020 06:14:44 -0700 (PDT)
X-Gm-Message-State: AOAM531PG8p8hHoyAvXbGHh8xN66gxndbGvkX1oVJgJoV0parhaAwkj0
 QcN2dg+3LDWf3idPHkRqcmhz8diBTVseenVLESY=
X-Google-Smtp-Source: ABdhPJxfhey77g38PEvD+fvbn9Q2wK3tg3EwmHn6GhQQdGBSYQ0kCGnWjVDo/Vq4/6IReIdnM+WK0Jvy+Vf8qtBrfzM=
X-Received: by 2002:a05:6602:150:: with SMTP id
 v16mr5002658iot.80.1596546883518; 
 Tue, 04 Aug 2020 06:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
 <20200804124942.GF6317@brain>
In-Reply-To: <20200804124942.GF6317@brain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 4 Aug 2020 15:14:32 +0200
X-Gmail-Original-Message-ID: <CAHmME9py-TWnjhSPqjx_7BhVEqWaC-hVxp_1ToTbZORsToBJsw@mail.gmail.com>
Message-ID: <CAHmME9py-TWnjhSPqjx_7BhVEqWaC-hVxp_1ToTbZORsToBJsw@mail.gmail.com>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
To: Andy Whitcroft <apw@canonical.com>
Cc: NoddingDog <lists@noddingdog.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com
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

On Tue, Aug 4, 2020 at 2:49 PM Andy Whitcroft <apw@canonical.com> wrote:
>
> On Mon, Aug 03, 2020 at 06:25:51PM +0200, NoddingDog wrote:
> > I'm sure I did apt update after removing the PPA, but just checked
> > again:
> >
> > apt update
> > apt install wireguard
> >
> > Same result - those gke kernels are included as dependencies and "will
> > be installed".
> >
> > Maybe Dell need to fix their bionic-oem repositories?
>
> The breakage here came from bad dependancies on the Debian wireguard
> packages which we backported to these series.  They incorrectly (for
> Ubuntu) depend primarily on wireguard-modules which triggers an actual
> dependancy on a kernel package; a severe no-no for exactly the issue
> hit here.  It should likely have been caught in review but was not.
>
> New packages are in the review queue and expected in -proposed today
> across the board.  They will be released as soon as is practicle.

The breakage is because you forgot the Provides: in the oem-meta
package. Debian's ordering of the Depends: just helped unearth the
problem, as explained in a message yesterday.
