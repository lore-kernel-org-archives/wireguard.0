Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2C2C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 22:55:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B032C217F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 22:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="2IMHblIK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B032C217F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31449d9e;
	Tue, 27 Aug 2019 22:55:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6765673c
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:55:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9517a50b
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:55:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d7c8454
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Fy4XTm3XncZBTxSPMrLBK6Jm4DA=; b=2IMHbl
 IKK2PeAPMbn+vEw6H2A/VzMmGCnwU0+ENWLYUOOtrWyTQdDQRmpD4X06Rx8O8gT0
 +UAOnxG7+TOqg24nRJXeRigLguNae79fdYKZBpDhz3jM9j/8r+nT/YDQsppgM5WS
 pcPtUb5HsRCj3tHYWloBjwiD795bakosZ0NnaU6aaGNxn5HfiTi6kmYqZBZKdlrd
 G1UyoK3qusr2y7iUFF5z3eVuBlL1Zv3kcQRt2/Nvv7n11QRc+NUL8VePkb078Yt0
 VcMJHU8t7gdsx2d2oZSdG/8evcwOVSybgDOyjSFr457lJlIql9+OioPXs5tv7xYL
 nPdcnc8fzC770/EA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b18fcb54
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:13:03 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id f17so850106otq.4
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 15:55:09 -0700 (PDT)
X-Gm-Message-State: APjAAAVH3P2yN31SOxz5ILpDLzNieIPhlJNWSl6TTMl+vLJf+BTyB6OG
 ntrT+wO8ldEDcVryb5iYtIjv6hBQ4sDX+hJ+Bug=
X-Google-Smtp-Source: APXvYqxHklruYE9FfJLo2wH8FhTUqlbcSBBLrR4V/wNqXhzsp8VPLj4/+zv5tNQv/zR/W38HxXX6gDILwZaLUAS+xwM=
X-Received: by 2002:a9d:66d8:: with SMTP id t24mr895247otm.52.1566946508730;
 Tue, 27 Aug 2019 15:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <5d41995d.1c69fb81.35aae.ce0c@mx.google.com>
In-Reply-To: <5d41995d.1c69fb81.35aae.ce0c@mx.google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 Aug 2019 16:54:57 -0600
X-Gmail-Original-Message-ID: <CAHmME9pDABPALZ+P+3TO20FTcwu1Gni3ZumP-Y+nB6aHjBPO1w@mail.gmail.com>
Message-ID: <CAHmME9pDABPALZ+P+3TO20FTcwu1Gni3ZumP-Y+nB6aHjBPO1w@mail.gmail.com>
Subject: Re: [PATCH] device: in setZero, keep arr alive after being written to
To: nsajko@gmail.com
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

But this doesn't prevent the runtime from copying things to places we
can't control, right?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
