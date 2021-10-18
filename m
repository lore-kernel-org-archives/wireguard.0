Return-Path: <SRS0=I5vT=PG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27018C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Oct 2021 01:05:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061B560F24
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Oct 2021 01:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 061B560F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e1122b0;
	Mon, 18 Oct 2021 01:05:02 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8881367f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Oct 2021 01:05:00 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id g20so1657870qka.1
 for <wireguard@lists.zx2c4.com>; Sun, 17 Oct 2021 18:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=w5A68bD3R2h/WZUDKyPYsjIM+8gpFCmJx6FzObXufw8=;
 b=0I2S9r1TARZVUph0CL4fqL3Xnf7sy5JUDPvyUJ4EwEvAIGT05I1/r9zr3chNp7JcUe
 dWWe0STguKqB881SsGWnyJJK21xMXu4u+GrjHRcxvuczVQmYHlPXzZVHDkShTlFfDSfG
 CrO2v5ZCte2/zkwLT5LXxupLQfsWRb8bzkT6D3uJVgnxiIEB9Sx61M8DWWMwOaAp+oCC
 5xXlkRGXaLSXce/V31NSrKBmrpEH/dXk5v8npjwtXjwy9kGpUFAbbQOUmsGlUEMHXAzn
 PJuKsnyLUka/8oy7WE0Immeno1UEvRCrbKdrAXJFQ3/Ab7m0vmpOAVS1fo7qQu3T+Rd8
 sAtg==
X-Gm-Message-State: AOAM531PGaJwCZ2ZD+bKolJIhZphhESoLKc9Gr8G5oQhpK8xQQvNAKWM
 WCxOC2iYRpbTPNeFeTImjLV86CvlBIewtV0AG2UV5nr1/pb1Rg==
X-Google-Smtp-Source: ABdhPJzKUpl9IrQa6RsDFrC5HXXZdcb6Vnr4SE3N27ea5s3YXvIqIl00AHFZAT3vVdqHmeWCA0UAAHfgygGEub1KevY=
X-Received: by 2002:a37:f902:: with SMTP id l2mr19986220qkj.511.1634519099489; 
 Sun, 17 Oct 2021 18:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR01MB4444144DA39B5197C71D9762D7BA9@DM6PR01MB4444.prod.exchangelabs.com>
 <CAHmME9p=qmQhJ5SQRhorjZJzVDpaX7BK1EA7douTwY856y9t1A@mail.gmail.com>
 <DM6PR01MB44446FF0D5FB0D11873C337ED7BB9@DM6PR01MB4444.prod.exchangelabs.com>
In-Reply-To: <DM6PR01MB44446FF0D5FB0D11873C337ED7BB9@DM6PR01MB4444.prod.exchangelabs.com>
From: David Kerr <david@kerr.net>
Date: Sun, 17 Oct 2021 21:04:48 -0400
Message-ID: <CAJJxGdFsd+xr4rVBg79kQdx2Zqx1owfkQwbeuxkJ7khCVjyv2w@mail.gmail.com>
Subject: Re: [PATCH] Fixed null pointer exception when user namespace is empty
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

My QNAP system just recently did a system update to QTS version 5
which now includes Wireguard as part of their QVPN service.  I have
not tried it, but it is there along with the usual suspects of
OpenVPN, IPSec, PPTP, etc.

DAK.


On Sun, Oct 17, 2021 at 4:30 PM Aaron Avery <aavery77@hotmail.com> wrote:
>
> Thank you, Jason. Sorry I missed the Signed-off-by. As I said, I'm not th=
at familiar with Linux development.
> I'm quite sure I have the correct .config for my QNAP's kernel, and the W=
G kernel module I built works perfectly, with this patch. All of the *_NS e=
ntries in their config file are enabled.
>
> After more research, I agree with you completely that this could easily b=
e a QNAP-specific bug so shouldn't be merged. As a NAS, they probably have =
some custom network driver code and may have failed to initialize user_ns i=
n this situation. The only somewhat-relevant kernel commit I could find for=
 rtnetlink.c is https://github.com/torvalds/linux/commit/f428fe4a04cc339166=
c8bbd489789760de3a0cee and version 4.14.24 is more recent than that.
>
> A lot of people like me use a QNAP NAS as their always-on "home server". =
Hopefully Google will crawl this message list so that tech-savvy people sea=
rching for Wireguard QNAP will find this patch and have a chance to use WG =
to remotely access their home network.
>
> - Aaron
>
> From: Jason A. Donenfeld <Jason@zx2c4.com>
> Sent: Saturday, October 16, 2021 7:52 PM
> To: Aaron Avery <aavery77@hotmail.com>
> Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
> Subject: Re: [PATCH] Fixed null pointer exception when user namespace is =
empty
>
> Hi Aaron,
>
> That patch is missing your Signed-off-by line, so I won't be able to
> take it as-is.
>
> However, I also wonder if it makes sense. I just grepped the entire
> kernel and I couldn't find any other instances of net->user_ns being
> NULL checked. Is it possible that there's a bug in QNAP's kernel
> somewhere? Or you're compiling against the wrong .config so the struct
> offsets are wrong? Or something else? When should net->user_ns be
> NULL?
>
> Thanks,
> Jason
