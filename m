Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A9EC76186
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 09:46:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EE920880
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 09:46:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qquFwdGT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EE920880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a4c6dfc;
	Wed, 17 Jul 2019 09:45:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9259f1ff
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 09:45:31 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20ef8603
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 09:45:31 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id i21so22971681ljj.3
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jul 2019 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=iMbBqEzQo6KocyccnHttEatCOh1k4o8noiB60lMMlwc=;
 b=qquFwdGT9XE58NfHOuBWUwYMgcB8PAomsfo+sH1/1cnrR8LqfoUxRKEPr2EY8BEKAP
 +CVj5/jzMEOmrWMCK6JabubOYjS2pAvmW6ZXk0DVj7BUEnZgrL3uB3TspxLCpok4hrJq
 YTbmk1spxplKCbdpcBvlswvEZdTQiOkp69hgKr/Hnhgfl3MYdHM2ssr8cXi4Tgf+KEUG
 tC+c2xQB4VDjLR4GpK8sGyLUIHSwECTWZ7EMF9Gh4YcMxpDZCYhmuOcBYMR1ByLO/54W
 OGrPssuF34rytyrZ7XkWWx/FYYKE3szf70n4pKjdnF9paX9ORLMSg9BAzGeLNgRNHn9I
 pN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=iMbBqEzQo6KocyccnHttEatCOh1k4o8noiB60lMMlwc=;
 b=KM0Goial/8bWfHM+POoqpsIHZFqax9p5iS/c8AaNesdHr2269gLOIX/CZEz6wp8ROF
 OKGDChof6tS14IHEa2VQjPaN8NF1WaRu7T15uMIlyfcGUk3g2LPmYzrvmSoE11Pr/GHA
 52NjSgmaBSSOWSUrrdrat8NYzqhfZ3KMWdn0MZJKnROltTs/B0D8DmZ120CLkLQv+XPR
 ATm5/47ciIIp3NhVUXUGPPEXXhg1BC1MInZvez3EGBSK/wvqmkca+X6SwEGruEL26Qzz
 TyCov0eghVPQ+XS9xa/NwA33ij7ndSGm/3eAsHIiUFZvLXvXo2cd74F8TWGa68ksUKdV
 X7PQ==
X-Gm-Message-State: APjAAAWGRFp6/0aEQ1HZJXzfZPnoiPmYHu0g8ucC1sI6eq+qF+IaJ4o4
 0pK16AKW9qGDiG+1p8owAXiHa+ldJyqiHW34/WHIyI3QYGQAsw==
X-Google-Smtp-Source: APXvYqw1DkSJcKXD2/7q/KIkWKiIfYgviNa5xpQpGomUp0G1pgvWGw2d1+9TZcG8ypvpACNE09FNhL/ENyo+EHbVZ3M=
X-Received: by 2002:a2e:9b83:: with SMTP id z3mr19635175lji.84.1563356730254; 
 Wed, 17 Jul 2019 02:45:30 -0700 (PDT)
MIME-Version: 1.0
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Wed, 17 Jul 2019 17:45:18 +0800
Message-ID: <CAECwjAjN1FUKsDy1tpa7ihvjZSZr9XqnWoVwbCdt07WOgQ13RA@mail.gmail.com>
Subject: Improve "[WireGuard] Header / MTU sizes for Wireguard"
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi,

For WireGuard overhead breakdown [1], maybe it's worth also mentioning
that N the length of encrypted data will be padded to be multiples of
16.

I am only aware of this when fragmentation was spotted.  With 1500 as
MTU for ethernet, PPPoE has MTU 1492 (1500 - 8).  I thought 1432 (1492
- 60) for wireguard should work for ipv4-only traffic. It needs to be
1424 to avoid fragmentation.

Google also directed me to an old deprecated link [2] with pointer to
[1].  So maybe it's useful this info should have a place in the
wireguard website.

 [1] https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html
 [2] https://lists.zx2c4.com/pipermail/wireguard/2016-July/000314.html

Regards,
                yousong
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
