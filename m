Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1465BC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:40:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44ABD20672
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:40:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="y2DLac39"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44ABD20672
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4edfe333;
	Mon, 17 Dec 2018 07:39:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14afabdc
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:39:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d5d0ea0
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:39:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd4ac726
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=6ApJHjZRaF017PcHyWkc9c5bAhs=; b=y2DLac
 39oQpddO3iQwPQl+D92U+lt5EqcvvKBis3clhEUW232EDCPd1iH/qeHvWau7HhiF
 39P0X+dZNyvu0qGMLxioG/tlV2CPx4/ec2uo1aAdC+EieIWbfLDFaPMLn8D91eus
 qW9CblUZYiycsgKtsiWaWYDaIuD75WI+5hY8JxhPNurYdGwnCT9ERmVpEo6zGsoB
 18oaOfkXjUcsXHCasnqwqBUV9LboOIXWmVAqbqrC1no5doUqpXCH+7wULpwOhUA8
 2rDacMO7+xQaIloKCp0SJ/xXb7JqZzmDkfgRfdcBSnF+wtGHhX91PC0ho+WpNTpH
 OAcy2fQKS7kCXhpg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b3e0ca8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:30:40 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id s5so11273726oth.7
 for <wireguard@lists.zx2c4.com>; Sun, 16 Dec 2018 23:40:12 -0800 (PST)
X-Gm-Message-State: AA+aEWa8dbuLj/TgQpBzFeoL5QyM7sZDTJWyCDMAv6qca95z+/siNhhU
 fMpl8Rs+kvAMN3roEVYFZnC3RlEF+Tu/eMQ2rA4=
X-Google-Smtp-Source: AFSGD/UuXNAUARe4I+W1JeJeIERBVDdhUwtV9YsdN9unaTim5tmdLXn1wUHqb315WxO1ujlm0p6Gmkhs9to/dQs1+iQ=
X-Received: by 2002:a9d:7e87:: with SMTP id m7mr9568700otp.225.1545032410593; 
 Sun, 16 Dec 2018 23:40:10 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
In-Reply-To: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 Dec 2018 08:39:59 +0100
X-Gmail-Original-Message-ID: <CAHmME9pzif4L4okrDMZdsLb73oXegaMvGHXKkY3twbw_wkYnug@mail.gmail.com>
Message-ID: <CAHmME9pzif4L4okrDMZdsLb73oXegaMvGHXKkY3twbw_wkYnug@mail.gmail.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
To: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
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

On Mon, Dec 17, 2018 at 2:42 AM KeXianbin(http://diyism.com)
<kexianbin@diyism.com> wrote:
> AllowedIPs = 10.1.0.3/32
> [...]
> If I want to limit the peer to a fixed IP 10.1.0.3, any wg1.conf
> OPTION to config it?
>
> Currently,  the peer can set any IP, for example 10.1.0.4, and can
> send packets to my http://10.1.0.1:80 from 10.1.0.4.

Setting that peer's allowedips to 10.1.0.3/32 should accomplish
exactly what you want; that peer is _only_ allowed to send packets as
that IP. If the peer attempts to send packets as 10.1.0.4, WireGuard
should reject those packets. If it doesn't, that sounds like a major
bug.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
