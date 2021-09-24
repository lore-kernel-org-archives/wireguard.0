Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06180C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 00:23:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2259A61152
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 00:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2259A61152
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a5defaa;
	Fri, 24 Sep 2021 00:22:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc546142
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 00:21:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E47FF60F6B
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 00:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Y3me3Vfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632442915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XcJ0ejLiCg3d9qeOfTlE9JSEqxmmwt+BLYQhbNLAoxw=;
 b=Y3me3VfncqhpiI4ix2T56+mBjJDp8w7AhLXehnWOAPeGqpDbr05aBtJZ4hQPJ8OSkPdrCE
 6xWTiJ1eGzQ2eh2tG8Rey9WcQfu1Z40CDpPYmmy/gulaHy8RQVSXpTPPTKCEe8JdifqQk3
 MI66Tmo9TA+EKY0RFy0UAsfMtPPDDM0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 58ed6ceb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 00:21:55 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id i12so2058009ybq.9
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 17:21:55 -0700 (PDT)
X-Gm-Message-State: AOAM532dPVLCIStwpSVPVd1eg+zoIYYymIDhy+op1vWIPsLCtW8RJwK/
 EvTVt3pVVbsaIsBm80o4u4scGR/zk0Ik++kF+g8=
X-Google-Smtp-Source: ABdhPJw1I61AzG4JOQcP8mThH+doQKdQkNh6WdYhPFgXswD2il4SzKlkeNbwblr2iCeM/Uj6CC/kGp9BS5RSfm3LtI4=
X-Received: by 2002:a5b:d48:: with SMTP id f8mr8692245ybr.449.1632442914995;
 Thu, 23 Sep 2021 17:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
 <CAHmME9pgz6PiXdFqcRw90EafHK-Jq9RfcgLUZaJ1ARrtdnjG0w@mail.gmail.com>
 <ddf37ac0-0d04-ad84-73c7-b334655c066c@physik.uni-bonn.de>
In-Reply-To: <ddf37ac0-0d04-ad84-73c7-b334655c066c@physik.uni-bonn.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Sep 2021 18:21:44 -0600
X-Gmail-Original-Message-ID: <CAHmME9ojB6wt13NyoZhuGm0KHq1eJ2oyvurUGA8vwUkHtxTsuQ@mail.gmail.com>
Message-ID: <CAHmME9ojB6wt13NyoZhuGm0KHq1eJ2oyvurUGA8vwUkHtxTsuQ@mail.gmail.com>
Subject: Re: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
To: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
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

Hi Oliver,

On Wed, Sep 22, 2021 at 8:02 AM Oliver Freyermuth
<freyermuth@physik.uni-bonn.de> wrote:
> I tried to boot one of the machines with boot/startup logging (I'm not sure this is the correct English translation, it is one of the options next to safe mode in the WinRE),
> and ntbootlog.txt ended during network driver loading.

If you're able to supply the ntbootlog.txt and any other logs on the
system (setupapi log, wireguard log, event logs, and so on), that
would be much appreciated. I'm still a bit puzzled about this report
and I'd like to get to the bottom of it.

Jason

-- 
Jason A. Donenfeld
Deep Space Explorer
fr: +33 6 51 90 82 66
us: +1 513 476 1200
