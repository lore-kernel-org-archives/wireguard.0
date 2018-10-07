Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,TVD_SPACE_RATIO,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623A7C64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:16:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D67206B2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:16:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WGNGMOZF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3D67206B2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e951563;
	Sun, 7 Oct 2018 01:14:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8842d91
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 01:14:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 724e95de
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 01:14:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76a087ba
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 01:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=bCbvBtnbbsjzAe5E6JzvZ3DG23Q=; b=WGNGMO
 ZFTzOGYsgbTF7EgroHRQcfEpsyi1tZFFncHTS2j6tKsFAp9mKsix6q9FRsCz9RTd
 NyIK7Dm98FZnLK6SzA0r39SpRYAhVs8vpRybiHW+1nTOosWm8czck0RFS6zs5IoJ
 46epiCKnH2GbT7AbYOMWeetORPfPXZDEyOHIUcwDj7FJDKVsI/QiuuvwD7lT7EyM
 zZhesZKmNj+tuu+dvK30e4wh7LEjZws32vyRjhJ/xMowczALF0vScCFpY26RTS5H
 u0Y+OUvaDdHGIZaYhr7mON3F+DYcDahhHBVAz8Mab9RDXMpCE3z8FJXmyk05iR+7
 HRhT+VUe4gjLuuMw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8b754e47
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 01:14:54 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id e17-v6so13243694oig.12
 for <wireguard@lists.zx2c4.com>; Sat, 06 Oct 2018 18:15:30 -0700 (PDT)
X-Gm-Message-State: ABuFfoikorLYkmZkB32iD6+AycxAUbQ0GJ6HLrpjiI9ND15aHtYOYqsV
 Jk8yAtgNGjJqEiCYmtWg3HLfcGbmLV0O6qx8IZI=
X-Google-Smtp-Source: ACcGV602VvRfwgmWxkNc659sI/+9de3sqDz9RiR2831p7J1WFo8K59Nk///bVMkZ9LeHWYHJMxrcoNcdrxusXDYv7LM=
X-Received: by 2002:aca:ac4:: with SMTP id
 k65-v6mr2508521oiy.265.1538874929824; 
 Sat, 06 Oct 2018 18:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <7739c357-0957-8382-a6e2-9c00c760fab4@gmail.com>
In-Reply-To: <7739c357-0957-8382-a6e2-9c00c760fab4@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Oct 2018 03:15:17 +0200
X-Gmail-Original-Message-ID: <CAHmME9rg59kGb0gAgFBJJaGTS76UCPzSj1reaSiSmGFXctq3Mw@mail.gmail.com>
Message-ID: <CAHmME9rg59kGb0gAgFBJJaGTS76UCPzSj1reaSiSmGFXctq3Mw@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181006` Available
To: Jason Edson <jaysonedson@gmail.com>
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

Thanks for the report. I'll have this fixed shortly.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
