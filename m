Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6633C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 20:56:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B933560F5E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 20:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B933560F5E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e097393f;
	Sun, 5 Sep 2021 20:54:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3940428d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Sep 2021 20:54:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E445860F5E
 for <wireguard@lists.zx2c4.com>; Sun,  5 Sep 2021 20:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="DhHDC5es"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1630875263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ao1vxBwZ4lcuhxKWIbu3bPrXtvHhGLszT3lEE5seSmk=;
 b=DhHDC5es7BnIQbZu/krG9nf980rpYnwMUmruorkbTlHSJDRD6zkxlEgWmHs40zvJ+w4qBz
 p0IYGlNsGdRWVt3P0zR8GgMICQ5cEG1ZD7to4NIpkaAp/4I5pIdaVoghfDmk46Mwjo4q87
 xFt1KymWX0s0NQkyGkdV4DvrYJqpCCA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5354e83a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Sep 2021 20:54:23 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id e131so9514432ybb.7
 for <wireguard@lists.zx2c4.com>; Sun, 05 Sep 2021 13:54:23 -0700 (PDT)
X-Gm-Message-State: AOAM532wgVqnOtKjVrusGmn9mQjAJ8KB0Pl43vfSdX/SAuJaZLpglTgC
 Al17SHoyAAodvOAZAcINav9EV0G1Gu3cPjSBMSc=
X-Google-Smtp-Source: ABdhPJzyNZAx1saGIBMdGgSgYuvPFfxuqngI1cR17ckSm+befpqQj0q5BPY9KywU1/ZF1aDfiiTDWazyeFMuUKKFfSs=
X-Received: by 2002:a5b:783:: with SMTP id b3mr11846139ybq.328.1630875262524; 
 Sun, 05 Sep 2021 13:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <c538301f-980c-99c9-4857-65867127aba3@gmail.com>
 <CAHmME9p0hTuYXar6LN2GyjF64k62z9vcokOE6La6eW-H06NVow@mail.gmail.com>
 <57e7c370-026a-1456-496f-cf069d392772@gmail.com>
In-Reply-To: <57e7c370-026a-1456-496f-cf069d392772@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Sep 2021 22:54:11 +0200
X-Gmail-Original-Message-ID: <CAHmME9q=XVvkj8dPGKdzEFSXg2thisDMkUWqXHGtAfmW2==ZRA@mail.gmail.com>
Message-ID: <CAHmME9q=XVvkj8dPGKdzEFSXg2thisDMkUWqXHGtAfmW2==ZRA@mail.gmail.com>
Subject: Re: Strange behavior when a peer has the same key as the interface
To: =?UTF-8?B?Vm9qdMSbY2ggS8OhbsSb?= <vojtech.kane@gmail.com>
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

On Sun, Sep 5, 2021 at 10:27 PM Vojt=C4=9Bch K=C3=A1n=C4=9B <vojtech.kane@g=
mail.com> wrote:
>
> > This is by design across all implementations, so that multiple peers ca=
n share the same stanzas after the [Interface] section.
> Does that mean it's unfixable in the meaning you cannot detect it and
> return appropriate error?
>
>
> While being clearly my mistake, it took me multiple hours to understand
> the problem instead of simply getting `cannot set peer foo as it already
> is a public key of interface bar`.
>

It sounds like we really need to document that in more obvious places,
like wg(8), as that kind of confusion indeed must have been really
frustrating.

Jason
