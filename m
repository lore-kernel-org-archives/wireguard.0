Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F423FECAAD3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Sep 2022 17:09:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5f8de313;
	Sun, 4 Sep 2022 17:07:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 93b6b8c8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Sep 2022 17:07:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2754F60FC6
 for <wireguard@lists.zx2c4.com>; Sun,  4 Sep 2022 17:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6A6C433D7
 for <wireguard@lists.zx2c4.com>; Sun,  4 Sep 2022 17:07:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gNc1mNZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662311264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VZXwzT5pdU3X9pyOPIuFa5lznEV74ZXAQ7EOKG0Emnw=;
 b=gNc1mNZbCoA1CXp/ti81/5kClk85Ax6l5JTgWio81r58PG2c5pgKOLgiIxJzVzeuqeLfrJ
 SyCz9edc2q79YE00zXevpi8c6FhQfhspK21JbKSnSXbZ0uml4hfCGKPsVxsdNaocCUv0RT
 gMdSNI3ICkN8nG8Gk53gZDQUA3f1keY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 04348501
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Sep 2022 17:07:44 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 83so3657193ybd.2
 for <wireguard@lists.zx2c4.com>; Sun, 04 Sep 2022 10:07:44 -0700 (PDT)
X-Gm-Message-State: ACgBeo2pIZ2MbREveylgfZ/bqjwMis+RTwglEx+O4rW+Zarw6ez3S42c
 eqFoQUcf/VmV98MUPUIS30KeSD+t044Vw9dJps8=
X-Google-Smtp-Source: AA6agR56ow5d4ywnVcXWLkwHXv2HVYv1ogO2hzCmTWc0Jptc6tyvrZxW/YBQkWcPa/nn2FDSA2yeg0y8IPK8JiG++bo=
X-Received: by 2002:a25:1c5:0:b0:6a9:3222:72e6 with SMTP id
 188-20020a2501c5000000b006a9322272e6mr331813ybb.351.1662311263450; Sun, 04
 Sep 2022 10:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAA+Mow79-=J1LmFWdFOEnVnV4QCKyWb13YsvzOrsxtWV=GgJ7A@mail.gmail.com>
 <YwzmY6Q/lJIDZyfz@zx2c4.com>
 <CAPyFy2DWRu+9ctBiLRpzYdzRj7+tBB_fa1RQM7kwJTz7tTtLvA@mail.gmail.com>
In-Reply-To: <CAPyFy2DWRu+9ctBiLRpzYdzRj7+tBB_fa1RQM7kwJTz7tTtLvA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 4 Sep 2022 19:07:32 +0200
X-Gmail-Original-Message-ID: <CAHmME9oqxSuV2b4ZtHqenscfJfWi72mcQgebDi2pgTT7n_62Ng@mail.gmail.com>
Message-ID: <CAHmME9oqxSuV2b4ZtHqenscfJfWi72mcQgebDi2pgTT7n_62Ng@mail.gmail.com>
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

Hi Ed,

On Wed, Aug 31, 2022 at 8:18 PM Ed Maste <emaste@freebsd.org> wrote:
>
> On Mon, 29 Aug 2022 at 12:18, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > On Tue, Aug 23, 2022 at 12:26:21PM +0300, Michael Pro wrote:
> > > Tonight after updating kernel freebsd current I got coredump with
> > > wireguard enabled kernel module.
> > > ...
> > Thanks. Is there a __FreeBSD_version__ change that corresponds?
>
> It is not an exact match, but was bumped to 1400066 shortly after and
> should be a suitable value to check.

Thanks.

Michael - could you give this a try?
https://git.zx2c4.com/wireguard-freebsd/commit/?id=89b7292797c17449e24f5b8b08cb2412a51d2484

Jason
