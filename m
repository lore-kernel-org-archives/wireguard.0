Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8C3C6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Sep 2022 17:21:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ebe0cfac;
	Sun, 4 Sep 2022 17:21:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 729f22df
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Sep 2022 17:20:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C82A260F6B
 for <wireguard@lists.zx2c4.com>; Sun,  4 Sep 2022 17:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111CEC433D6
 for <wireguard@lists.zx2c4.com>; Sun,  4 Sep 2022 17:20:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GvNbix/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662312055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LaIXfz0imTCAfXB9zvqApy4snNHWoaVD8tpZbtcbhco=;
 b=GvNbix/wfVOSeG/Iy5y1xPfyBCHZGPh2X/zl11cbnpui7wBdUym0V8l8Zuz1hU7+DkWFDW
 JvEOQdW90cTODv32lnIwJ/HOhnVqZO0nvtw3pKnc+QJQCw3Qbcat09hNkoqCGC8GKEt9Bc
 zQImptTHyTHl3gUUzCasbdmpD9stD9U=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c7eb94c1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Sep 2022 17:20:55 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-3450990b0aeso26512447b3.12
 for <wireguard@lists.zx2c4.com>; Sun, 04 Sep 2022 10:20:55 -0700 (PDT)
X-Gm-Message-State: ACgBeo1uA29Suj9eqHksTvbsPs0VzhfGVGskcuUUdyNm7OEZEDAZonUH
 LSPEVM/GaKCM2Q2w9gps1cTRXZGNkE+gC4UDhQE=
X-Google-Smtp-Source: AA6agR6Ma834+mdfLPzewxOrdphlDg8cnF7bQQ2JzVyB8k8jE14mE+t2EY78Ddy6p4rJR5YdJ3cZv5iHI0CcZbuqq4k=
X-Received: by 2002:a81:6ccc:0:b0:345:40da:7e06 with SMTP id
 h195-20020a816ccc000000b0034540da7e06mr1007389ywc.414.1662312054518; Sun, 04
 Sep 2022 10:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAA+Mow79-=J1LmFWdFOEnVnV4QCKyWb13YsvzOrsxtWV=GgJ7A@mail.gmail.com>
 <YwzmY6Q/lJIDZyfz@zx2c4.com>
 <CAPyFy2DWRu+9ctBiLRpzYdzRj7+tBB_fa1RQM7kwJTz7tTtLvA@mail.gmail.com>
 <CAHmME9oqxSuV2b4ZtHqenscfJfWi72mcQgebDi2pgTT7n_62Ng@mail.gmail.com>
In-Reply-To: <CAHmME9oqxSuV2b4ZtHqenscfJfWi72mcQgebDi2pgTT7n_62Ng@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 4 Sep 2022 19:20:43 +0200
X-Gmail-Original-Message-ID: <CAHmME9rN=kqPz0KgWUyhQ=4q=HLwkUL8cSXTnJ5ySmdgs4N8Xg@mail.gmail.com>
Message-ID: <CAHmME9rN=kqPz0KgWUyhQ=4q=HLwkUL8cSXTnJ5ySmdgs4N8Xg@mail.gmail.com>
Subject: Re: FreeBSD current socket-src changed. Wireguard not compiling.
To: Ed Maste <emaste@freebsd.org>
Cc: Michael Pro <michael.adm@gmail.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Kyle Evans <kevans@freebsd.org>
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

On Sun, Sep 4, 2022 at 7:07 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Ed,
>
> On Wed, Aug 31, 2022 at 8:18 PM Ed Maste <emaste@freebsd.org> wrote:
> >
> > On Mon, 29 Aug 2022 at 12:18, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > > On Tue, Aug 23, 2022 at 12:26:21PM +0300, Michael Pro wrote:
> > > > Tonight after updating kernel freebsd current I got coredump with
> > > > wireguard enabled kernel module.
> > > > ...
> > > Thanks. Is there a __FreeBSD_version__ change that corresponds?
> >
> > It is not an exact match, but was bumped to 1400066 shortly after and
> > should be a suitable value to check.
>
> Thanks.
>
> Michael - could you give this a try?
> https://git.zx2c4.com/wireguard-freebsd/commit/?id=89b7292797c17449e24f5b8b08cb2412a51d2484

Err, that would be the wrong code copy&paste. This, I meant:
https://git.zx2c4.com/wireguard-freebsd/commit/?id=20584d1c329ed2a71893375fa11ca4c56ed9f642
