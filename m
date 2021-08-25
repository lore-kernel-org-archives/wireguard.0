Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0298DC43214
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:02:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13CF760E90
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13CF760E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa1e3c0a;
	Fri, 27 Aug 2021 14:02:05 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [2607:f8b0:4864:20::130])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad0e2a24
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Aug 2021 19:05:31 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id x5so617101ill.3
 for <wireguard@lists.zx2c4.com>; Wed, 25 Aug 2021 12:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=52hmiqUwL9n+W4dT2mVw/klVkh38abL1SJNTa6jlLn8=;
 b=p1XUnI+qqr0RoYy3ymmbxVoBzNb7BRT+SRL0fmuUtE/5GXTynMHC/vkk+6/ccORfnc
 04/hrldcPUSFwgskE8fVg0ZEiJ7S6TQlaB6qpOoI6fMkfeINl4+3pXckYWjnIA9GqENn
 bOVuk+CbmB1ReEfxQ3o6AncaPRQYXnHtpb2x01oKBlBluYnNjV+MxwfcCJUtx5esprr9
 p5bFmU4+/YUzKtdm1VHt3YAu9cojOJXcYWaDzpamoSKTZNKKwxle3/kdvLzT8+wsLgZs
 ht+uUwdmrycy8/sWOLQ2pGvqFC1Cf/4i5A8bP5PVs8nZf54mGcxihDgBtVJCy8ljq5pS
 4Oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=52hmiqUwL9n+W4dT2mVw/klVkh38abL1SJNTa6jlLn8=;
 b=LeQZvVM4J2WvEpnqvEtsEJVgQsHk5QbcA1KCxpo8Wyf+z/E9jzNEp11xSYQFJ+w4xb
 I77SRJYBl/gpd8+toSygdNzKD990KBe+ehX6qD3v87IPnlgF8g8odQYhi85O6kyH4I1Y
 4siA0XyXBGacPA6EBcmMsdjcEfu7yPmI6VGFsUyaCuTVqKuSfB6BFyYxlIu1Zeg+RZav
 mzH1YBCxvPkxR8CwiSI1Ml51l4tVtL8OWtgMtXwcocaf8+CLuNz28uPU2umheqfaUauB
 hexdBiin1pNE1GMkxetEUxze5Bn3Gkrns7ZohqujvFu2Tz12lTtLmJr0N62XLLZxpqJq
 4Nzw==
X-Gm-Message-State: AOAM530047rYsrbFv2sTEdkF1H2hJeKMg3XSTslOhwNMfTOI552OnNFf
 VRpJzNZ2aivDcCZvKK6v/3N3wl8XeU1bKETqktp5hiCxUQM=
X-Google-Smtp-Source: ABdhPJymITRhBSqOIlGicLHrtZvtfBYwSD8RCS1yl9AhA4W/kL5TKVvzUSk3Jh91+mjD1CrUy2/83moeFYMqdDLzwA0=
X-Received: by 2002:a05:6e02:1c2b:: with SMTP id
 m11mr31363258ilh.242.1629918330388; 
 Wed, 25 Aug 2021 12:05:30 -0700 (PDT)
MIME-Version: 1.0
From: Gopakumar Choorakkot Edakkunni <gopakumar.c.e@gmail.com>
Date: Wed, 25 Aug 2021 15:05:19 -0400
Message-ID: <CABK1yFC+mH4=EzCGd7m20qFykAnwG=hxiAcvVets-HP1=JKA9Q@mail.gmail.com>
Subject: wireguard-windows: packets dropped in NativeTun Read()
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 27 Aug 2021 14:01:58 +0000
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

Hi,

I am experimenting with wintun as the choice of my driver for a vpn
client I am writing on windows. I was very quickly able to get
bootstrapped using the wireguard-windows repository (thanks!!), I
created a tunnel and when I use the Read() api (tun_windows.go), I see
that quite often I am missing packets. How do I know this ? - I run a
tshark on the tun interface (needs editpcap to convert from ethernet
to ip format), and then I compare packets there with what I get, and I
see my read missing packets present in wireshark.

The traffic rate is very low - just regular browsing to websites, no
major traffic. I am reading from the tun interface from a goroutine, I
suspected maybe I/O bound reads might be not scheduled enough by go
scheduler, so I increased the go threads. I thought maybe the ring
size need to increase so I made it 32Mb etc.. - still no good, I still
get Rx packets missing. Kind of clueless at this point - any
pointers/hints/suggestions will be appreciated a lot !!

Rgds,
Gopa.
