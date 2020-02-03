Return-Path: <SRS0=RmRV=3X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE07AC35247
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 22:14:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7388820674
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 22:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RjAxq5Ns"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7388820674
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be5e5a3b;
	Mon, 3 Feb 2020 22:13:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c6e7c05
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 22:13:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7099af4d
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 22:13:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aaa5213d
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 22:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=/H9BqmyJrIzZwcBnE3fI2hBkGKo=; b=RjAxq5
 Nsxqfp/FdA5UP4Na502gTN0eJG/kYnAU9BRtAXbaEx4SrZIeIyppybxmN6QRSkue
 RAJaqE+G74mZt+zdc27gBZ6IZL8Rj1lZlMX5F2+cZmfCO9v1QdSkWvkb104ix/P1
 mzDbNV39zUn2gN873dcyayv9Iqwn477LnBGG4RVYY0vJuRviMg4hGVtcHu1vsmDB
 YViTRN61h1U/Rvk2oikAnIY5AGnJPZoJNmrXOXEjObWApEjNG5zeIKrl2FMAmmiP
 wbB3RKLOrrVzrfYilbxZ7YYSRlx85l4scgO+TrgnbhXAtsTDJ1Sw2MFuWv7OQXq/
 hZG6knDSoU66SvIw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52ae8ff4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 22:13:26 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id a22so16335991oid.13
 for <wireguard@lists.zx2c4.com>; Mon, 03 Feb 2020 14:14:09 -0800 (PST)
X-Gm-Message-State: APjAAAVSQWtnJnmI+Fb6Cot0EZNfrUCqI08UKB3AN36CQBodqDxy0VTx
 LcDPcAWcOwBpqfv6E0ChQdm32qNSFsX9zyu9F7s=
X-Google-Smtp-Source: APXvYqwp7qcam9O/XRdahqvcgbjgeryuw1bVl06gmm1cs4737SOYMENp4X9TZNEMW3oUbevECtkq5jnJRebxIB2Z6/g=
X-Received: by 2002:aca:815:: with SMTP id 21mr941298oii.52.1580768048949;
 Mon, 03 Feb 2020 14:14:08 -0800 (PST)
MIME-Version: 1.0
References: <000000000000c8bcba059db3289b@google.com>
In-Reply-To: <000000000000c8bcba059db3289b@google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Feb 2020 23:13:57 +0100
X-Gmail-Original-Message-ID: <CAHmME9rR=6Vz=N+53vt+MV6rZabkNUsNpyL7YECrVJu__98dxw@mail.gmail.com>
Message-ID: <CAHmME9rR=6Vz=N+53vt+MV6rZabkNUsNpyL7YECrVJu__98dxw@mail.gmail.com>
Subject: Re: possible deadlock in wg_set_device
To: syzbot <syzbot+42d05aefd7fce69f968f@syzkaller.appspotmail.com>
Cc: Netdev <netdev@vger.kernel.org>, syzkaller-bugs@googlegroups.com,
 David Miller <davem@davemloft.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>
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

Looks like the same bug as before. I have a fix in my tree I'll send
out to netdev sometime soon.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
