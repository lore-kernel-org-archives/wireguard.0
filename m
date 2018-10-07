Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BD5C65C1D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 13:14:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E13132087D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 13:14:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Lv8DGPap"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E13132087D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba26a682;
	Sun, 7 Oct 2018 13:12:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8eab3aa7
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 13:12:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65f7b1a4
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 13:12:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79df7605
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=j2A0eH0yHivVaTDTI0Ax+7H+JW4=; b=Lv8DGP
 apPa83GivrjIqFczRLVess3YJmZtjq03IBxinynAhQ1JCxoXeizr5gka9v1LxpXs
 peWm8UauflWmoyubaPlqyxV4aogb9965OG47ww+lqr7Eq7EuNvmygtCX0QMCfFJh
 nswfTwE8Yjgy9FtTyW4Xx3S28xmYpnIQ5lhu2hRZS2QijgR8xLQ05FWQdXUzU98G
 yBPzileH/TRY/Qdzi46z6vADH97LPVOTxc2Mvy+gPmY/OewqzMDaHmJiODWx2t/A
 9dR6JIREN/Cc18Z9ROBKS2mVvdxGfPl3Kt1taEXz7ZHhj3/niOy4rGjdsyQh/W4S
 g4d5N1otN5Hl6ArQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2b435e96
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 13:12:54 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id l197-v6so13824228oib.8
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 06:13:33 -0700 (PDT)
X-Gm-Message-State: ABuFfogDEqp0ZQiPFOrAn13ni8T/A8cL2RW/HYrDTbTFWRZiAz/94qKQ
 HgBexin+PuQaDHEz8STgzOCtz/GwXmWSpxdfw7w=
X-Google-Smtp-Source: ACcGV61bcjfSE+sERtTGN9SsKS82wwIncOEt0ooLzB4728gc6SXzQeDz30xICkSuQrkJJJpKELIXNRV0L5d0Ikgw1Bs=
X-Received: by 2002:aca:ce4c:: with SMTP id
 e73-v6mr2898792oig.225.1538918013253; 
 Sun, 07 Oct 2018 06:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20181007091430.22212-1-list@eworm.de>
In-Reply-To: <20181007091430.22212-1-list@eworm.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Oct 2018 15:13:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9pZfNj9=PXaE2d9vA_bTqP2bOL0MCvcpszr4YB42-s_pA@mail.gmail.com>
Message-ID: <CAHmME9pZfNj9=PXaE2d9vA_bTqP2bOL0MCvcpszr4YB42-s_pA@mail.gmail.com>
Subject: Re: [PATCH 1/1] fix install target for dkms sources
To: Christian Hesse <list@eworm.de>
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thanks. I'll fix this up and cut a new snapshot.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
