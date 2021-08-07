Return-Path: <SRS0=jP9u=M6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3C7C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Aug 2021 23:20:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5742C60EE8
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Aug 2021 23:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5742C60EE8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a94e30f;
	Sat, 7 Aug 2021 23:20:02 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 50890653
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Aug 2021 23:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628378396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GcZCZCWz/DVEPnE582pF0g0ytOgtR7WV/iW/ZHKhbZY=;
 b=JhlFrcFAtkquUs/bVyzMdBOsRdrdozqeaSqnZTLK+wxE6iz2pGyfjr+B5qZx2KRDQatdOF
 ALMVyeOwyiL9xa1u8TGBcvPWQO6/Rjb8BIGJI9c/Ry8Le13AsALaNxOMYW1Sku7HDTpWyY
 qmUECXyQRkFMBGVaI1Wl5ouT44kyI5Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86d047ed
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Aug 2021 23:19:55 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id x192so22493744ybe.0
 for <wireguard@lists.zx2c4.com>; Sat, 07 Aug 2021 16:19:55 -0700 (PDT)
X-Gm-Message-State: AOAM5312jENfitjrBRcD0DTvi9taj72TH/LJ/5ziisgjFYRAG/itc3Dc
 JDK74cqGBHsru/3W/IoadpRK8qyKw8yXwaNdabA=
X-Google-Smtp-Source: ABdhPJz1wFBz/C0+LqiSz6+McyBuwqjwbPsiJiwq08xJtWZJCRBEgzs6mXM2GznBamWArfP2jT9fPdcjlqFkozuvAR8=
X-Received: by 2002:a25:18a:: with SMTP id 132mr20998727ybb.123.1628378395184; 
 Sat, 07 Aug 2021 16:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <CALWFNqSFsa4N=1et_YcwekTyi1q6pduR9dg2SGBL-QmyiJWbSA@mail.gmail.com>
 <CAHmME9p=eROypA_auS1s-pDySdCRApbJ8Obpi_iEQ0U9V6J6Hw@mail.gmail.com>
In-Reply-To: <CAHmME9p=eROypA_auS1s-pDySdCRApbJ8Obpi_iEQ0U9V6J6Hw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Aug 2021 01:19:44 +0200
X-Gmail-Original-Message-ID: <CAHmME9qN5ZS65LU9JALhMo=m_v1NO7z8gF+CZXETWro+aB4=Bg@mail.gmail.com>
Message-ID: <CAHmME9qN5ZS65LU9JALhMo=m_v1NO7z8gF+CZXETWro+aB4=Bg@mail.gmail.com>
Subject: Re: wireguard-windows incompatible with Win10 hotspot
To: lsc@lv6.tw
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

On Sun, Aug 8, 2021 at 1:00 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> So, hm. I'll have to try to make a test environment for that, though
> it might be slightly tricky given the hardware I have available. I'll
> see what I can do.

Turns out a USB wifi adapter and a boring VM made this very easy to
reproduce. Indeed I can confirm the bug, though I don't yet understand
it. I assume that the Windows 10 Hotspot feature is using some sort of
redirection rules without taking into account IP_UNICAST_IF or
IP_PKTINFO, so likely a Windows bug. Hm...
