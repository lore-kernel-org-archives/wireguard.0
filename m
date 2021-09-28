Return-Path: <SRS0=89gA=OS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D045C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 23:16:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520D561350
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 23:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 520D561350
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7f22b94;
	Tue, 28 Sep 2021 23:16:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 58ae3191
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 23:16:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A4B361350
 for <wireguard@lists.zx2c4.com>; Tue, 28 Sep 2021 23:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lF6LZp9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632870984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBmYc32e8Y9U09nrvC7JFJLK0QiiQSYzA57+rQPIYc8=;
 b=lF6LZp9UBsQke/agoxCdMOd/DRlsGrFItQrMyEX83BEAgGbXOtOXbPP0U4WNpIV5SqnKla
 6lqYLVdeWtPqJu8eFREq46fXU4rtueqgjZ6HDLEHC/9lwo+vaKnHCphV8EJcZlDMtLQmgK
 iXLo2QHKzhDQ8kXYv0/zXd/LDqJIJ5w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aeeb2f4f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 23:16:24 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id r4so1219490ybp.4
 for <wireguard@lists.zx2c4.com>; Tue, 28 Sep 2021 16:16:24 -0700 (PDT)
X-Gm-Message-State: AOAM531tw14/SEju+q7iN76bihwmkiR78U/seC5CDRfI9hboAfTx7b+/
 02V7DpXmOcdvfjmMHUciYe0R2JBV7a2QTuJ6Sh0=
X-Google-Smtp-Source: ABdhPJw+ijOn1YT19Zy8fyUGQRUlGuAPII+ClNDta5B/XRelr/NugWLlKT9JlmDHvZH4XFKNg4korJh7kms2s0knWDQ=
X-Received: by 2002:a5b:783:: with SMTP id b3mr9512535ybq.328.1632870983904;
 Tue, 28 Sep 2021 16:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <163277858699.7.10950010429724590941.14337061@stdmail.de>
In-Reply-To: <163277858699.7.10950010429724590941.14337061@stdmail.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Sep 2021 17:16:13 -0600
X-Gmail-Original-Message-ID: <CAHmME9pnqk2Z_G3+SYzR4sYRuQQdOzJfncVYYXF7_Nigxc1fDw@mail.gmail.com>
Message-ID: <CAHmME9pnqk2Z_G3+SYzR4sYRuQQdOzJfncVYYXF7_Nigxc1fDw@mail.gmail.com>
Subject: Re: Feature request - Number of tunnel entries in root of tray icon
 context menu
To: wireguard_mailing_list_user@stdmail.de
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

Hi,

I don't want to add a knob for this, but I would take a patch that
uses a smarter heuristic than just "10". Feel free to send patches to
the list. The code in question is here:

https://git.zx2c4.com/wireguard-windows/tree/ui/tray.go#n225

For example, if you can calculate the number of entries that can fit
on the vertical height of the screen, maybe take a third? Or two
fifths?

Jason
