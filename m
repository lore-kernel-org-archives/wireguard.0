Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A141C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 19:23:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3F96207FF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 19:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jrJaJmtm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3F96207FF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab5cc452;
	Tue, 10 Dec 2019 19:22:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 404583be
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 19:22:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8f4c542
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 19:22:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fd98430
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 18:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=VbHyzhyRQQiVctWq95sZVWr/Lz4=; b=jrJaJm
 tmIK/UHwciE7dI7uKgegpjGc5igC4Ji6Tzb9d9poNzVdA/dwS1y7DfbyxOfLhxo1
 oxxLyYoHv1+iqcNiy2mra7d4onRlXDNDL0UcOhzf1jWtDZHhPilQvhu8HiyeF9sD
 LuDwwf1REgKXSFLc1wCbDI09XNtj5pACizHR2enfd5TbHpjnC2aFBeK0ppwPBUCV
 yHi2FTQ1kUQPGLSvXw7j91UNBoYrukDyT//XJ4rGNNodBGvj3t4wVLfR3eADhnvC
 bha0qHI3aO1ocegLv8DkzdtjAFwT4nAt/SbzFfcEKcOF15uw8bckSIBfZqG6VRjd
 5WS4qtcST4ZZurBQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 002f21fe
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 18:27:00 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 66so16548882otd.9
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 11:22:34 -0800 (PST)
X-Gm-Message-State: APjAAAUMHxqIO1R3tnWDvXst1n4gRWxJa0cPZ+c0wgUHAUO60ixRpm9d
 Jv09iCqAXcyzn59jpPdP0wdW8I0bKNtby/k3Sx4=
X-Google-Smtp-Source: APXvYqzd1TYKhpHwc/Hpk3WQnzUBVQo4E++QrDGDezJayjNdopmVLXIO0VQQeWz+xov0+EzFb9Alqe1mrmV5H55gCUU=
X-Received: by 2002:a05:6830:1141:: with SMTP id
 x1mr27504948otq.120.1576005754381; 
 Tue, 10 Dec 2019 11:22:34 -0800 (PST)
MIME-Version: 1.0
References: <04a38f45-1043-0db5-6c76-2ee573fd71cf@malte-wetz.de>
In-Reply-To: <04a38f45-1043-0db5-6c76-2ee573fd71cf@malte-wetz.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Dec 2019 20:22:23 +0100
X-Gmail-Original-Message-ID: <CAHmME9qwJ-+qv6CBLDL05qMQdi6KPkM5MS2aT7-5q7hM6QN+4g@mail.gmail.com>
Message-ID: <CAHmME9qwJ-+qv6CBLDL05qMQdi6KPkM5MS2aT7-5q7hM6QN+4g@mail.gmail.com>
Subject: Re: Windows client: PostUp/PreDown possible?
To: Mark Schmidt <knupps@gmx.de>
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

We'd considered it, but the fear is that it will be used to spread
malware and RCE. Linux command line users can generally be trusted to
check the config files they're writing into /etc/wireguard, but I
don't have that same feeling about plug-and-chug Windows users
pointing and clicking their way to BonziBuddy. That's possibly a bit
of a patronizing perspective, I realize, but the potential for havoc
is pretty high.

Thoughts?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
