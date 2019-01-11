Return-Path: <SRS0=OwtD=PT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31E0C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 07:04:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7D420870
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 07:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wdhxXTtZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B7D420870
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e64ab25;
	Fri, 11 Jan 2019 07:00:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d88878a
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 07:00:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad805543
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 07:00:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93690e5a
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 06:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=1PnU0g3Sf/Pmn+05h5cm7/vtIgg=; b=wdhxXT
 tZySLVjpFnREAKcUdn6kFDLJwg4USaJbXTWUAzyKMY2lbxBkkhDvaXPKSFJKu7XT
 9TArLeLm8NJpa91h+kWskjw9+EsxiGoskjXtZYyrdUMQ51MVTuYrZlTooDwBYkcn
 pfJeu2dvqIbdneVuEg3dV11AFPiJpb9varCAsUPHhTV2i70oB6Clw4mysPxoGx6E
 NfmV1e8xdNIb00vXZXmwt6KenA/gaApOx9EF8C/H7zqLYFux59x+DbVN6hrRpz2l
 pvvatrNAHYYz/oJtLe9EOy4Ue7L3lO5O1TwZBzEM/v8+T0qsD0dJyuugjoZM0AUW
 cNwkH+pWBX+vAZIQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 20c73ce7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 06:51:05 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id x202so11404688oif.13
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jan 2019 23:03:50 -0800 (PST)
X-Gm-Message-State: AJcUukeO1BDTXL01hfbLIJesV847z5MON13scz9oNjALWcXql16RN7gN
 WLou7MeX5LIlr2ltJzD8mbNFUwr1L1vyJLUW/zc=
X-Google-Smtp-Source: ALg8bN4gGUYRrq1oYMwx7RrEpnMwaLOxS8Eg7JxBR3hpLcZmlrg+cgcs3TIbNBhX9kGx/ExAa5k6fA2Ub0NlfJFASwc=
X-Received: by 2002:aca:c003:: with SMTP id q3mr7900688oif.119.1547190229471; 
 Thu, 10 Jan 2019 23:03:49 -0800 (PST)
MIME-Version: 1.0
References: <CAPRZce230SKkA+GJHarc9xomOkfF87-MDN+PXjmTMtXUMT9cUQ@mail.gmail.com>
In-Reply-To: <CAPRZce230SKkA+GJHarc9xomOkfF87-MDN+PXjmTMtXUMT9cUQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Jan 2019 23:03:38 -0800
X-Gmail-Original-Message-ID: <CAHmME9r2Sh4zaqz_X2F+DOY+gieTmTVO-HWf6sTEeLUM0P5agQ@mail.gmail.com>
Message-ID: <CAHmME9r2Sh4zaqz_X2F+DOY+gieTmTVO-HWf6sTEeLUM0P5agQ@mail.gmail.com>
Subject: Re: ChaCha20Poly1305 is slow on ARM64
To: Edward Vielmetti <edward.vielmetti@gmail.com>
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

I'm at real world crypto right now with Fillipo discussing this stuff
with him. Hopefully that will bear fruit.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
