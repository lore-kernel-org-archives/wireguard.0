Return-Path: <SRS0=qOIe=3S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CD1C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:44:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1CBB2070E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CoVgGjj7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1CBB2070E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec3e3628;
	Wed, 29 Jan 2020 12:44:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65d4af78
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:44:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed820412
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:44:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 125fe781
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=JY/9NmjnGYgrIWbKyNr2HV9xwYM=; b=CoVgGj
 j7GMhAJpO6J7B+vxsIq/ay2DQDciP11v7tVCvpVSD4gmBQc3F4h+vcJQenuA4Qe0
 5AeYx5V1Pk5SZNGNNkrmi9bZH9EukX+lwdPcW/kdpyvS/8u+cJq2CshYeFkYiIDy
 zmXiVJkgvO1IplDDSmj10cS5BrTxD1lboDxLlII8wi70IqqCIpsuuZNzEECemXGy
 5DN9MCuVn4VcOL0418FnleFOkycTdQjasfmQ/HwNvn1kgV5M8B6j8voEwoPCzFo8
 y8jWQxUEZDx/6m5khMdyyorm+DubjUaZboHXFJCdghsRH29JqMohTNfb6/21bcuv
 rKz+lloRQUdkhGmA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3b6c0dc5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:44:22 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id c16so13814279oic.3
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 04:44:23 -0800 (PST)
X-Gm-Message-State: APjAAAWFpFSh0RYy8Qe0UfP/6EE2tEMVu+E8OpqsqALXFWK3demN6Mo5
 VaNuO7gL1/3TKRCJjcO8VDoXkgXC6FlJQ7DE+aw=
X-Google-Smtp-Source: APXvYqySgeiKLUcoDVd8kX0Ezzdplzww2UbLaEmzgs22k3kcUDviiOsHu1YTU1LlDHK7g2Pqrq6YoWUc0ty1fYw31tg=
X-Received: by 2002:aca:2109:: with SMTP id 9mr5933841oiz.119.1580301863108;
 Wed, 29 Jan 2020 04:44:23 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rProfVf4VGHGX9no3KTa08nL_oYkK8Nv+eknk4ewVMAw@mail.gmail.com>
 <20200129124001.ak2fo6nr2bqp2ywk@iyo>
In-Reply-To: <20200129124001.ak2fo6nr2bqp2ywk@iyo>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Jan 2020 13:44:12 +0100
X-Gmail-Original-Message-ID: <CAHmME9rEvnonTMZ95AyK1F1o2mwnBD06NkbVZ3prvz2nBSg1ng@mail.gmail.com>
Message-ID: <CAHmME9rEvnonTMZ95AyK1F1o2mwnBD06NkbVZ3prvz2nBSg1ng@mail.gmail.com>
Subject: Re: wireguard ci hooked up to quite a few kernel trees
To: dvn <mail@dvn.me>
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

On Wed, Jan 29, 2020 at 1:40 PM dvn <mail@dvn.me> wrote:
> Impressed by how comprehensive this is already. Would you be up for
> sharing some of the details of how this system works. Looks like it's
> largely custom. Obviously based on QEMU/KVM, as you say - are you
> emulating most of the architectures outside of x86_64?

It uses kvm on x86_64 and i686 and TCG elsewhere. I guess it's
"custom", but it's really just a makefile that assembles some
arguments for qemu and sets some compilation flags.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
