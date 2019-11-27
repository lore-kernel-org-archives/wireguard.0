Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF30C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:31:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5A22071E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="u0qzaz/L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B5A22071E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35c3f7fb;
	Wed, 27 Nov 2019 12:31:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d734d495
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:31:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9253eb3f
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:31:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56c8b8bb
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=CPLR0+t2KTD0jK0Z4M8dijwms14=; b=u0qzaz
 /LL6FReRdMEHdXKCeLD1/v8Wfl/s+S1hZNHYwhk/BkoNGUaI6r+thL9hAtMmi6j3
 nkKEIs3UEp9KH8CX3TPKzySZ+qMFyQ8e46nipFWR/aQqm1U+hq+azp43mWusWDr1
 A7LxQDMrShu9T8qVXEdit6GZ11+JvN4aSrJEywHeodOsm0RCkFi292CAKkUO18v3
 sBp5iRy9AdmurrRt6XTK+3jwpEsB6kvBdWG6RbagMHxvSFgPkPD6kyEsPJruo31C
 BIv5Cez6alfSX0+tekfA5wlei8JzOLqRo5K8kPl2f6Lo5eMuR8WvA15SYnuy2TSZ
 NFinzMOfeTJydRCQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8b745a2c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:37:30 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id d22so19915337oic.7
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 04:31:21 -0800 (PST)
X-Gm-Message-State: APjAAAUXZOPczg6ny4wncv1NH4WBQJbk24WApy6l0jqrKchc1t+015Cb
 mnYyl/fum65apwLBLUQH4lU89HzOSrmbxWZzh50=
X-Google-Smtp-Source: APXvYqz7yJNBXhpbvp0F7Aupfhrp+jROaFkeoxQRtSqYYoW14HjGQnWrn7P2DX4V4wsE7jDDVyR9Z6MEag2hZcyYdwU=
X-Received: by 2002:a05:6808:2c1:: with SMTP id
 a1mr3761812oid.66.1574857880535; 
 Wed, 27 Nov 2019 04:31:20 -0800 (PST)
MIME-Version: 1.0
References: <CAG6CVpU7L67oBqM5vi7-oXfYN=jMF9urvfxz_qZqFjdm-a+F=A@mail.gmail.com>
In-Reply-To: <CAG6CVpU7L67oBqM5vi7-oXfYN=jMF9urvfxz_qZqFjdm-a+F=A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 13:31:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9pzEg9sn1PJMXrmttWjYvSzsRRfXugphES5kPPhqN2WZw@mail.gmail.com>
Message-ID: <CAHmME9pzEg9sn1PJMXrmttWjYvSzsRRfXugphES5kPPhqN2WZw@mail.gmail.com>
Subject: Re: Bug in helper contrib/examples/reresolve-dns/reresolve-dns.sh
To: cem@freebsd.org
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

Thanks for the suggestion!

https://git.zx2c4.com/WireGuard/commit/?id=d05b6606886018853da20ca3ee8bda16524b53b9
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
