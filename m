Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C58C10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 09:23:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8522173C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 09:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lniiaNDO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B8522173C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f54dbf80;
	Sat, 6 Apr 2019 09:21:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e57c31f5
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 09:21:15 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cfa10b3
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 09:21:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 932323d4
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=x+SUrFoDchSC8GXs5i/dPPKl1rc=; b=lniiaN
 DO17LKrY3Z8irGA52pKLJCvMigkMrWzmhNpSAvX+70SJflFA9OoXu46Wbr9TMWOQ
 vwQOCtSJIamY201PaVA9ocrtu5xGG2a1IZQKYAxrbjEjLZXoT5kT+nqVRFzo8o0z
 vgfhaYvTGfwXpKTIUkfnjFgXbIaT0MeStzYqty7LUHKXQPZBwg9X9KMFruReRHct
 b59hpLsC2uFj2Cf846ldwxBnMQg6ABc/Ny/jibA/MENc6KR9rgjBVnP4gFRXtQEd
 eFfHAbkzIcbEAYxOpjdp8HEICHcmfqecSUcuzaXYPoGSJgBaDlt9xrU8e3NkFqa0
 8GOdD0gddx8jnjnA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0565e716
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 09:00:01 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id e5so6875122oii.0
 for <wireguard@lists.zx2c4.com>; Sat, 06 Apr 2019 02:23:40 -0700 (PDT)
X-Gm-Message-State: APjAAAV/3FLkbjCNAHlHva7xFQEDrp4hkf+G0+xp6GtekbkLz3DUvxDT
 GaKRVkTK6Vg5wWFGvrr+j1+wuPsMT5m/yqXed8o=
X-Google-Smtp-Source: APXvYqw1TXCGaH7aUMIaWI1Y1vqUD80PzZKnW/F3m/FJARRmR9f4Tp2p+l9JzpygItFvD2yGQNSKQgM8G6Q35DvKa8I=
X-Received: by 2002:aca:e58b:: with SMTP id c133mr9705452oih.119.1554542619011; 
 Sat, 06 Apr 2019 02:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <505e458e-4df9-8fbe-9891-83bdc8933260@m7n.se>
In-Reply-To: <505e458e-4df9-8fbe-9891-83bdc8933260@m7n.se>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 6 Apr 2019 11:23:27 +0200
X-Gmail-Original-Message-ID: <CAHmME9o=2FVbqH0Sn6oD6ss-edsnJHNMKsXHehEAwDqv1juQEg@mail.gmail.com>
Message-ID: <CAHmME9o=2FVbqH0Sn6oD6ss-edsnJHNMKsXHehEAwDqv1juQEg@mail.gmail.com>
Subject: Re: Crashes in wg_allowedips_insert_X
To: mikma.wg@lists.m7n.se
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

Thanks for the report! I'll try to fix this and will let you know.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
