Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08383C47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:33:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A193F206D9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YMWwSCEc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A193F206D9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fe67b10;
	Mon, 11 May 2020 21:19:04 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a17d816d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:19:00 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be9f4476
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=31gmvKyDK9KguipzaxGkA44nPm8=; b=YMWwSC
 EcGLBJLQdoyKfHgRGGzR4z0n++M286TapMKDplZNrJck4TIoFsSsNCqQvzzkfmJu
 bvXroVeFE00w1yMfIxVdauUnusi26OdajWtujgSGe5iEwFDw79AjiOo2iSlc1prT
 ZqtwD4wV7d8dimfCIwro5/FJJo0G+JTL0dHNr6CRoOWQiJ2Rwsmu8GpgxSUC7YMC
 jH72fzF2+FfUP0PqlwpAYXxNCGGRzHbAi7hmEvae+IyuQB+2/ksPSAJPvLN/R3rx
 7WP/f1JTdTMcgHzmRezDlDkCz3LixmmjMUD0tUGaM8Ad6qatpED2l+EUioFbAXPX
 e+9mjTnUPsnrq2AQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba0a7637
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:18:59 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id e9so11587958iok.9
 for <wireguard@lists.zx2c4.com>; Mon, 11 May 2020 14:32:20 -0700 (PDT)
X-Gm-Message-State: AGi0PuY2Clwvu8/Js5X57JYm8UVibK/mlVFffT1nNnwUf32X6Yi9GQL4
 0DPMoYbGyElmFG9y+Ir0vDBu7BT/qWLTiodbFxw=
X-Google-Smtp-Source: APiQypL+HRyFk7P/F9+yz4FHLAZZLNqo4D0tDPRH9GyxJ0E2hCTfQCTjid6bztq/7yKafZZdVzC2eer+7pJU1o+zboo=
X-Received: by 2002:a05:6638:ca1:: with SMTP id
 x1mr16589775jad.86.1589232740012; 
 Mon, 11 May 2020 14:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
 <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
 <CABtXGiAP6SvNrsTArCe2fNLqTUEeBEOy9Osx+uCinfm6q9Yz1Q@mail.gmail.com>
 <CAHmME9oaWsnghkXhWfSqSS0f52nWfpjNRoBQ7EF-58joPG2z6w@mail.gmail.com>
 <CABtXGiDvWgeU9E8qwhxBRXzOzzYj_uVrLu4_kb8=m2W89E54yg@mail.gmail.com>
In-Reply-To: <CABtXGiDvWgeU9E8qwhxBRXzOzzYj_uVrLu4_kb8=m2W89E54yg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 May 2020 15:32:08 -0600
X-Gmail-Original-Message-ID: <CAHmME9qEYvf3bh-X_1f13Q-6PZEC9SBvYDiDuSiehs2Ey8aAgQ@mail.gmail.com>
Message-ID: <CAHmME9qEYvf3bh-X_1f13Q-6PZEC9SBvYDiDuSiehs2Ey8aAgQ@mail.gmail.com>
Subject: Re: Search Domain/DNS Suffix
To: Phillip McMahon <phillip.mcmahon@gmail.com>
Cc: Ricardo Fraile <rfraile@rfraile.eu>, Simon Rozman <simon@rozman.si>,
 virtualdxs@gmail.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, May 11, 2020 at 3:31 PM Phillip McMahon
<phillip.mcmahon@gmail.com> wrote:
>
> Could be a little confusing as the wg site suggests if you install
> wireguard-tools you'll get v1.0.20200510, which is not the case right
> now.
>
> Shouldn't the released stable package be referenced?

No, because then people will harass the package maintainer after he is
no longer able to do anything about it, no matter the text or tristate
proposal.
