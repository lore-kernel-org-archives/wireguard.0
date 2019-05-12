Return-Path: <SRS0=HyV5=TM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B551C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 May 2019 15:41:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB3B20882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 May 2019 15:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FFI4wpN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB3B20882
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d4dad07;
	Sun, 12 May 2019 15:41:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 966bcd48
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 15:41:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a8a52b3
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 15:41:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d07f0f4
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=uA+BPPIsPk7HBUKw9/gTBSoZquE=; b=FFI4wp
 N3nxXYFkivmWO9tg+0KzBBZNb4WyOZm55IjuuV0aXOZbyqczA5FZn+5E78ellEOo
 yW4+N2mWagC+OQWcuD6zgMnItY0WBR54Inv0+YdjkwXmUpLYTRLogjA4ERbdpXL0
 6zVv15noxIFJMFiI9s16EPMKe2uEOW2RwmgZqrA86gMMCX2tDeGNxD/Giv7uM38Z
 FbSNsRVLdVxJtKfWVDIJRD886+48b+H26xHnLuMiH78TLBPtQhC8Z0muG4mSALs6
 lmBq6mw1qvRsrPhvEohMHTkF6AiuEQBg3pOmW/fvrSkoUyH0qUWBdpaHYRvU3bwy
 jzUDUuDPaWDEdTKQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 21435639
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 15:13:14 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id r10so8877601otd.4
 for <wireguard@lists.zx2c4.com>; Sun, 12 May 2019 08:41:32 -0700 (PDT)
X-Gm-Message-State: APjAAAU6K/+9tCtSEK8CrJYgTvOjxP9qWLDXgMo5gsSmztHtoCrTc1BU
 pS+FveZjOHU0STcWPgWoDAWWaivPZowRnAb9q8w=
X-Google-Smtp-Source: APXvYqwP01H7+Smup8LrE7f+wMs/gvZKw3qp+p2zu5ReYxOXdfaYt0VBIgYFKh4DYz9nFqRPOCC1XkIuxzcqjGLxcAk=
X-Received: by 2002:a05:6830:148e:: with SMTP id
 s14mr248375otq.54.1557675691708; 
 Sun, 12 May 2019 08:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAM3m09Q3LCCFRJEe6J1UO0mtTiuVOYEiiyhEJJppDnuDnZZTwA@mail.gmail.com>
In-Reply-To: <CAM3m09Q3LCCFRJEe6J1UO0mtTiuVOYEiiyhEJJppDnuDnZZTwA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 May 2019 17:41:20 +0200
X-Gmail-Original-Message-ID: <CAHmME9p49RAWOjJovPpdRE7n=bD9Vj7F=pt3HfA59itC1=Webw@mail.gmail.com>
Message-ID: <CAHmME9p49RAWOjJovPpdRE7n=bD9Vj7F=pt3HfA59itC1=Webw@mail.gmail.com>
Subject: Re: Wireguard Bug?
To: Ryan Whelan <rcwhelan@gmail.com>
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

Hey Ryan,

Can you confirm the following?

- You can easily reproduce this in a matter of seconds.
- The stacktrace you sent is from from the 32bit machine.
- The 64bit KVM machine, after triggering the stacktrace on the 32bit
machines, starts using tons of CPU.

Could you also send the .config of the 32bit machine and perhaps any
additional interesting information about the 64bit KVM machine?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
