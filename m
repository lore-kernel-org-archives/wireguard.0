Return-Path: <SRS0=evAC=JE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CC6C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Apr 2021 00:18:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 112CC610FB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Apr 2021 00:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 112CC610FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7db9f7a;
	Wed, 7 Apr 2021 00:17:28 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e1b6ba54
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Apr 2021 00:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1617754643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gKYZWXzrCbiYt4XwX9BopgHs8GQBm3kr/N/4G5DuvGQ=;
 b=kZDy61OKLuURKqgX+aWZlgAuHxW6wfYBdX9BqAjYhhkNUTdbw9ZXl1wtXRf63djj4YFCI1
 wlx6rh2QR66z8uI+qt29ot2fcfMmUdnyXPXs5BDwxOPRXEG2Ak8oiMa/rtp7FTd38c7MI2
 bdk3Y67L2Tpa1PbgGGCA3lGq+sMpLW8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0d556443
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Apr 2021 00:17:23 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id x189so18188728ybg.5
 for <wireguard@lists.zx2c4.com>; Tue, 06 Apr 2021 17:17:23 -0700 (PDT)
X-Gm-Message-State: AOAM531xrvUJIqQSAFMZiSwitpFf63+xo5ia9ZFTgU3/G1mzg0VQ20wM
 MBfItVMo/+02xHVmC69X2tlxIkI7RSg3bzaa9A4=
X-Google-Smtp-Source: ABdhPJwS7x0EhqkZsU00mWd6XiN/Il+LZ2flacD1GD0ch/smGPzxs+W/SMmPZZ9+hSRI7N6EZRWC9H/snL0s+XFgMaA=
X-Received: by 2002:a25:cc3:: with SMTP id 186mr904439ybm.178.1617754642876;
 Tue, 06 Apr 2021 17:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <e166447dac58ecaa73bf3f6a2b9bece6a01bf5cd.camel@infradead.org>
In-Reply-To: <e166447dac58ecaa73bf3f6a2b9bece6a01bf5cd.camel@infradead.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Apr 2021 18:17:12 -0600
X-Gmail-Original-Message-ID: <CAHmME9q-qw=sCxz6Fije+ENQTY2-GdS4bZLSakuh+6Eze4LR3w@mail.gmail.com>
Message-ID: <CAHmME9q-qw=sCxz6Fije+ENQTY2-GdS4bZLSakuh+6Eze4LR3w@mail.gmail.com>
Subject: Re: Duplicate IP address, and permissions problems on Windows
To: David Woodhouse <dwmw2@infradead.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Daniel Lenski <dlenski@gmail.com>
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

Hey David,

It's pretty typical behavior on Windows for IP addresses to be
exclusive per interface. WireGuard for Windows does something similar:
https://git.zx2c4.com/wireguard-windows/tree/tunnel/addressconfig.go#n22

With regards to permissions, you must be Local System, which is
already the case if you're running inside a service. If you'd like to
run as a mere Administrator process, you can steal a token with a
technique like https://git.zx2c4.com/wireguard-tools/tree/src/ipc-uapi-windows.h#n14
or https://git.zx2c4.com/wireguard-windows/tree/elevate/doas.go#n30

Jason
