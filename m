Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223F0C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:01:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0646324181
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:01:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PRq2o7Gi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0646324181
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5ad1536;
	Tue, 17 Nov 2020 20:55:21 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 74989308
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 20:55:18 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c287dd86
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 20:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=/zrCtl9IpeIS3ctBrP+tUm/INn4=; b=PRq2o7
 GiiwM1/eHe/FdN9Zm2IGG4y7gaSTYf8ANOW+b0nx/TmbHJ7MZNVQnsvO/NgOs1QO
 WzYm5JIzDEpFwMASIABr1ucDJS3nzsUGCg+nmo/1f2fHDIPNgcjj3frr6diovRnQ
 3MVegY5SWnHxkU3UXmVrm6M7GQG78cNwHalWWP8zIpiplxeEliIGaOWqrEs+xSto
 ZqtkB4vnQh+l1ioBaMRcsyMZaxUpUMagQEp58PKefIySI4bHkuPbTR97v0UMK2rk
 aHX4s9gZRUrLxikRgYQRomlHHluJ/sL+D4AMj3e8YKONhdEV1KPCqreYXYqw4b8m
 Td4JE4/wHjOF+gbA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5d391e94
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 20:56:04 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 10so20246113ybx.9
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 12:59:57 -0800 (PST)
X-Gm-Message-State: AOAM533tscJ2rxnPQ5nIYN2Sh794LOGMw16EN6Va78WNljj4QjLztdbI
 gzO7FEw0z9QyoQy+cI/xY7EuRuxx8U2tQ5MyVFM=
X-Google-Smtp-Source: ABdhPJyhAxR1xtYHmQbcDGqqOzSge2HjZNegtgTwXmWNTZrrlUHjd8FhZvj40tizCChQE99H7rObbdi17A9RknfH+iE=
X-Received: by 2002:a25:4943:: with SMTP id w64mr1612572yba.178.1605646797250; 
 Tue, 17 Nov 2020 12:59:57 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuu+HvW+W=2--V1P9w4_4JoKpH12A=TNC5QsMsiaNZcrKQ@mail.gmail.com>
In-Reply-To: <CALaUSuu+HvW+W=2--V1P9w4_4JoKpH12A=TNC5QsMsiaNZcrKQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 21:59:46 +0100
X-Gmail-Original-Message-ID: <CAHmME9ridRrB+HsZ_SHDszjrrEvkU8Vp1+hmqjPjBdOO2x38GQ@mail.gmail.com>
Message-ID: <CAHmME9ridRrB+HsZ_SHDszjrrEvkU8Vp1+hmqjPjBdOO2x38GQ@mail.gmail.com>
Subject: Re: WireGuard for Windows fails to enable firewall rules after update
 to v0.2.1
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Joshua,

Thanks for the very thorough error reports. It looks like the tunnel
went up and down and failed a few times, and then finally succeeded?
Did you do anything manually to make it succeed, or did its success
feel like a fluke when it finally worked?

Jason
