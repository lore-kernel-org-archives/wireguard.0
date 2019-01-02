Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C679C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:20:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B46AC218FC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pWJUqxTH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B46AC218FC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebc4e305;
	Wed, 2 Jan 2019 18:18:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 461833e4
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 18:18:15 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c38bb101
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 18:18:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0107ed2c
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 18:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=W4G+B9+F3jcPWoXpjVoIAQNsh+4=; b=pWJUqx
 THtK6kiIbU0JiQqLk7ZIOE+c3TKMLn4f2fz6V6P+YcNS4skRS3dD4hVPyXAysbPK
 /GDQb6acziM5YVsXwL+QKX1nsfKZfA4xQDqGUyv4QKf36XesAfkCmAG/ZfPQixoA
 NiG6cXNjPzuJXF4t5ZtbvWYtgW7kZNYDts66CHtJ+rTPEjOvSSDWGco+uZ84++4b
 mKFRyr1UjGt2TsQ5hngkyzfkdIFQR3SZLJd422EjGXiosN8y77rmM/+1kg+DkRFs
 xmGp+1smxmeccSfFovsKihYm9b1UzKg/l755pjMh9wAAz01zdlYtku8prtr7RkEl
 NK0gZNs27/wP694A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aa8ebafd
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 18:09:01 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 40so27389450oth.4
 for <wireguard@lists.zx2c4.com>; Wed, 02 Jan 2019 10:20:40 -0800 (PST)
X-Gm-Message-State: AJcUukelDmfC3WFZFvh6Q7T4plKNrsOwPgEFl55WuuzcA4dZslwg9ofQ
 BOr+u2i0BKYaWOMaDsBxHZQ1xQhLoPaaC/Sg5Dg=
X-Google-Smtp-Source: ALg8bN6qxuFfhBvs9Oe67EHdoBa1cXmHz9jiF5+8G2XmApdy5+myfTvg6YRfdBH2XXcYD+v/N92Ui4aKxWtPkyFMASo=
X-Received: by 2002:a9d:7e87:: with SMTP id m7mr33420068otp.225.1546453239446; 
 Wed, 02 Jan 2019 10:20:39 -0800 (PST)
MIME-Version: 1.0
References: <478b9a56-d09e-5908-f253-a32985898072@1n6.org.uk>
In-Reply-To: <478b9a56-d09e-5908-f253-a32985898072@1n6.org.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Jan 2019 19:20:28 +0100
X-Gmail-Original-Message-ID: <CAHmME9oHGSXyhaRHPWM4B9=haKBFrNV5K7NwDWJPiW0jKfgi9A@mail.gmail.com>
Message-ID: <CAHmME9oHGSXyhaRHPWM4B9=haKBFrNV5K7NwDWJPiW0jKfgi9A@mail.gmail.com>
Subject: Re: Understanding Protocol / State Machine
To: Iain Douglas <wireguard@1n6.org.uk>
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

On Wed, Jan 2, 2019 at 7:03 PM Iain Douglas <wireguard@1n6.org.uk> wrote:
> 1. Handshake < 119 seconds ago the link takes ~ 15 seconds to recover
> 2. Handshake between 120 and 179 seconds ago - 1st packet is lost then
> link recovers
> 3. Handshake >=180 second ago - link just works as normal.

For 1, it's hitting the timeout of detecting the dead peer before
reestablishing the handshake, since it still believes it has a valid
session.
For 2, it's the same as 1, except that when sending packets when your
current session is older than two minutes, it will start trying to
create a new one. The way to think of this that sessions live
optimally for only 2 minutes and maximally for 3.
For 3, the current session is unusable and already cleared from
memory, since it expired after 3 minutes, and so a new session is
established before the packet is sent.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
