Return-Path: <SRS0=Sp06=U3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202DBC4321A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 12:03:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7153D2086D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 12:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="b41265Uy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7153D2086D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c0e4111;
	Fri, 28 Jun 2019 12:03:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 823f1b5a
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 12:03:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a88c0e54
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 12:03:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b77484e
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 11:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=y5+NTD+uvMlcxMb3YrQusw7Z8pg=; b=b41265
 Uye52ZDnWldnBA7Bdv+u5Wc3kdciPIF8Mzh9GTZV05jkTO90poj+9BGAOxH3MKYj
 OlamEBMorJGkaTv4vNoLIFhOe1iMkdqVIW1z5Z1VCcx4DMNeixeM6YcjgqrU4jTG
 xMUa0V+nxPoShhU1qa5li3cTsSzDRj81d+XxWxk3U+Oya05UfvmiIG7xn1X33Xcv
 cWxCoMi+bRusTfnQg8cUp9+NLMIxT2YKzhXKATg7Zog7ELveCwSVxWvi8rkz2P/7
 MmONJobwtnaogn5l6Yd00VxaDUl0PYA/yNGjpPYx8k6oIr8kLmS0T44o1V5L99Yv
 G+PB7HJU9kHMwAwQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 422579aa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 11:29:00 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 65so4042911oid.13
 for <wireguard@lists.zx2c4.com>; Fri, 28 Jun 2019 05:03:17 -0700 (PDT)
X-Gm-Message-State: APjAAAVlKHJBtuHm4pQX4JqiGtmdlM5a4E24ZFQJumY0ss03XL3oLOEv
 Se3LlTcxf2uVFWYTwd8LOvtSmhNy167FJDd9NoA=
X-Google-Smtp-Source: APXvYqyFR3XO3cQXDIs2h+uTuEkzyZF5fK7/9FLg5uh7PP+lKcTXFVajhxTVnD/gjswZhMeJbK5NVXbnPXlYr1iuBRQ=
X-Received: by 2002:aca:ac4d:: with SMTP id v74mr1336075oie.66.1561723396594; 
 Fri, 28 Jun 2019 05:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <CADXv92b2P79-OJBzK+aXhKFr3k_VqZkkkAuZOg5dALui8aNTiA@mail.gmail.com>
In-Reply-To: <CADXv92b2P79-OJBzK+aXhKFr3k_VqZkkkAuZOg5dALui8aNTiA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 28 Jun 2019 14:03:05 +0200
X-Gmail-Original-Message-ID: <CAHmME9qi6eb+YCKx8NdtN85ouTszDBrCsrshT1sYFTUXw8K_zQ@mail.gmail.com>
Message-ID: <CAHmME9qi6eb+YCKx8NdtN85ouTszDBrCsrshT1sYFTUXw8K_zQ@mail.gmail.com>
Subject: Re: RHEL8 package install or build fail
To: Michael <gravitygrazer@gmail.com>
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

Hi Mike,

While RHEL8 is out, it looks like CentOS 8 is not yet, so I don't have
much of a way to make sure our compat layer works well for RHEL8. Do
you have any suggestions on how I could obtain access to a running
RHEL8 box and its kernel sources?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
