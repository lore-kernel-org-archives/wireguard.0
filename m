Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6470C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 00:28:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9DF461057
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 00:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9DF461057
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 085d45e3;
	Sun, 8 Aug 2021 00:28:54 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bbed6a55
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 00:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628382527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W6CCuPsg10lMctNd4Wj45noJWzyNJQxdHqbDjzewunc=;
 b=DnjCw/hKAF0WKA4TBSCTzF0oCNKbHkDfAwoL2IcNn1FxcYnW79Jt/V4Vljk5drVgHWtzOx
 vH7R7QWt52suIwWtIzwn9lBUGORTQYlJZJEW4qoXxJcGfcxtoI5WDsKWjOqeAcgrqYatUb
 wzjA/18ELBPiL/ppVWAH95dDB3WOzlQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 06da1d29
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 00:28:47 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id z18so22542982ybg.8
 for <wireguard@lists.zx2c4.com>; Sat, 07 Aug 2021 17:28:47 -0700 (PDT)
X-Gm-Message-State: AOAM532P0NY26gs8YlkekITbxkRI1j2y2WBRajZFqO8IYc0ECUzOUdSS
 aJFg8x5EMJ3ECYnoF08ED0z2eZ71qsC/+52RZPA=
X-Google-Smtp-Source: ABdhPJxam/36iLZOT/z3glnLQZRTuGvti99moXw0Sgr0myIU8eQOB93olvX9OEYbG/zHRyB9QZcPq05/Rh2s6QyTI8Q=
X-Received: by 2002:a25:8445:: with SMTP id r5mr23373381ybm.20.1628382526789; 
 Sat, 07 Aug 2021 17:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <CALaUSuusH4S23thAEj1zXp_4=WJ81cR5PETG6aHO9Of7ELViJw@mail.gmail.com>
In-Reply-To: <CALaUSuusH4S23thAEj1zXp_4=WJ81cR5PETG6aHO9Of7ELViJw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Aug 2021 02:28:35 +0200
X-Gmail-Original-Message-ID: <CAHmME9opTHXHGFGVnD15hx_1g5-g8Qqrv_0U_Bjie2vU0KEDiQ@mail.gmail.com>
Message-ID: <CAHmME9opTHXHGFGVnD15hx_1g5-g8Qqrv_0U_Bjie2vU0KEDiQ@mail.gmail.com>
Subject: Re: WireGuard for Windows 0.4.2 failed to start due to
 WintunSetAdapterName failure (Code 0x000006D9)
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
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

One interesting part of your log is the timestamps:

2021-08-06 19:46:44.047474: [TUN] [SCJ] [Wintun] SelectDriver: Using
existing driver 0.13
2021-08-06 19:51:51.408322: [TUN] [SCJ] [Wintun] WintunSetAdapterName:
Failed to set adapter name: There are no more endpoints available from
the endpoint mapper. (Code 0x000006D9)

Apparently it hung for almost exactly 5 minutes, before moving onto
the next step, which then died with the mysterious
EPT_S_NOT_REGISTERED error, presumably caused by
nci.dll->netsetupapi.dll->rpcrt4.dll. One strategy would be to put
yet-another-sleep-retry loop over SetAdapterName, but I imagine that
it'd still fail anyway, with the previous step somehow failing
silently after a 5 minute timeout, and not actually setting up the
interface, perhaps during registration. That's unfortunate.

Ultimately, after the 5 minute pause, it was no longer within 4
minutes of system boot, so it didn't try again. I could increase that
heuristic to be a bit larger than 4 minutes -- perhaps I should make
it 10? But ultimately that's just a heuristic.

Better would be to find the proper set of services that wireguard
should start after. Right now we pick "Nsi" and "TcpIp". We need
another one in there, perhaps, but I'm not yet sure what. "netprofm"
maybe? I'm open to suggestions here if you have any intuition on
Windows boot processes.

Jason
