Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685B3C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 22:56:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09B19217F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 22:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YT7/6TdG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09B19217F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 239ba930;
	Tue, 27 Aug 2019 22:56:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93927b91
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:56:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30b5970f
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:56:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 055d7e88
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=TNmtr/Myr4Bh/QY8+ZloEXY9hfg=; b=YT7/6T
 dGgoW8mNWSo6wwwy51xpztmi0y5gJHAbhuLCaZtxx8vIvwker3bzAkiY71mP8lmj
 caBhKWMdgg7FxyAshKksTC9i9syMq/UMO4I0cPILeKQJIEGLrmbCpN7MeJe2CB09
 XxOhnC6osCCTfLeKOp2M77qDys2levwgoeEWvU6ce8R0AlDLiD/T7ufgd1wgQNYA
 Y3d23gVF8cukT5/96VEBphrCljx5/+mhorV7YKOSxBQeOoLfz3uZqC/k6Kq+Kzwo
 T2aULK92HaFeAWbRVHpmNU5fs7wOn8BfcIbq2MvWqiFCxXciYCKEOb/MQ5HL0B1x
 oyMEnfu7DDLqIwJg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 491c52eb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 22:14:25 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id f17so852975otq.4
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 15:56:31 -0700 (PDT)
X-Gm-Message-State: APjAAAWyNf423m5EKZJrJ3MOqdIALScHcJ2P3rNbuAxxsGUsMaSsCmkP
 KW0SYeB9NjGz7Yeub4Np85msM33/4aHZpeyvtJo=
X-Google-Smtp-Source: APXvYqx9yfV/Mnc+k9lqdSv5sVXB91XZhg895qqRj3Sk9YPEyalGCtDWANW6QMxLrse84fyAul4UvWRJYZU1cc2C0J8=
X-Received: by 2002:a9d:73c4:: with SMTP id m4mr874287otk.369.1566946590889;
 Tue, 27 Aug 2019 15:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <8f2456ea-9f59-96c5-1053-1567f28a7a2c@airmail.cc>
In-Reply-To: <8f2456ea-9f59-96c5-1053-1567f28a7a2c@airmail.cc>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 Aug 2019 16:56:19 -0600
X-Gmail-Original-Message-ID: <CAHmME9pdjLpHrQRXjCRAtxj0w58W+nuG2HnJ2z2VUNAbb-uoCw@mail.gmail.com>
Message-ID: <CAHmME9pdjLpHrQRXjCRAtxj0w58W+nuG2HnJ2z2VUNAbb-uoCw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: rework kernel version logic
To: Mikkmar <mikkmar@airmail.cc>
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

This patch doesn't apply. Can you resubmit using git-send-email?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
