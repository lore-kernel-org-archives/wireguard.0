Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BB6C65C2F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:16:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 630FA2145D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:16:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CMWhHpe7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 630FA2145D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 865befd8;
	Sun, 7 Oct 2018 01:15:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 271e64e7
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 01:15:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74fe0c09
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 01:15:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e487460
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=hgYbNCKDTu/C6Afe5jvajRrORaI=; b=CMWhHp
 e72+KbaoxfW8awag/eOO/wNLoM7AroV71EUry8Ft/DckjZtufuVcaJEmajbMfGC8
 KGjK36lIVrmaXCx68D8yZT4xX2fnRyzA5peYvxUVBUtxlbTXdkuEKH6IINICIj4u
 n/LQ2l+fei/YhOH7VMzoKGo1n1iHldMRpIDT7BONtKr1ZYrwRxXgRNpGfwLpoxhf
 EMRtRzSpCyenTsVE8DPOOfOC8AFYimDoN3ekBhqVZ5Tc/87LjczeOcn1gxqU93Lg
 eQoulbptuz2CWQEv3Z+sMJn/MC0rekMDyzkhxlk6sf+dT+6x7KlNhiXyMJdf1d3o
 6fBtNzVDJRK9OjMw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 71705b1d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 01:15:18 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id s69-v6so13243662oie.10
 for <wireguard@lists.zx2c4.com>; Sat, 06 Oct 2018 18:15:54 -0700 (PDT)
X-Gm-Message-State: ABuFfoiJlVazrKKwLlj1fFr3tnD+giqxgDJwpusacv8CLSJuz1GsJPy/
 F7aq9Zc5SYlR/imoMYpFMBMV2bZKWeYny/zxDU8=
X-Google-Smtp-Source: ACcGV60UU2nWs0I9bl/nW91S5KJ5faL58d3R2bnxiM/65ECZOLwDbBdVChxcED/gbqNZNzlNGKB28PL1NmKGBGzttwM=
X-Received: by 2002:aca:b04:: with SMTP id 4-v6mr2220511oil.192.1538874953899; 
 Sat, 06 Oct 2018 18:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACepnScV-2ypr+DahEnZTrsNNWpZ34xPkjsEiei=ymBSeTmduQ@mail.gmail.com>
In-Reply-To: <CACepnScV-2ypr+DahEnZTrsNNWpZ34xPkjsEiei=ymBSeTmduQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Oct 2018 03:15:42 +0200
X-Gmail-Original-Message-ID: <CAHmME9rz1+wPFriZTb57pzx1s6M7VW13KSEB9RDvNv__5qR2Qg@mail.gmail.com>
Message-ID: <CAHmME9rz1+wPFriZTb57pzx1s6M7VW13KSEB9RDvNv__5qR2Qg@mail.gmail.com>
Subject: Re: Fail to compile - redefinition of may_use_simd
To: nicorg2529@gmail.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks for pointing this out. I'm working on a fix now and it should
be rolled out to Android kernels shortly.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
