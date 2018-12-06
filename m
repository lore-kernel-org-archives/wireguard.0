Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07741C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 16:41:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8780D20838
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 16:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xZ5ihREx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8780D20838
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 403e94ff;
	Thu, 6 Dec 2018 16:33:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 405709de
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:32:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a652be4c
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:32:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ef56066
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=EPBlDyd0/9gZpVMNk6vIvvp44BU=; b=xZ5ihR
 Exxw03S3aLqXpvJfBVQCJ02iOHg9g4MK9H51bK3X0L1QdJds4DjjzjhNACaPXTWN
 zR7fZ3TeiewUvGeIIq11QjSBdHsp3QFf0H+wRiInJ/9tZD3UlSv23pyUH7vyFb2h
 NXplkkss+4a3EwdZnjMqpzC3fGrIsbt5L+5BIpvAVCsw+oOoCyyBK84Ba0F34Qki
 29vdcPFYpH6Hbb6utg+cZzAFSvgPMtazwZhxQIojVyOKhro8A9W51V8fnAuE8fnd
 nPrkKWTrL9il2bE277Q2cIl6Rx4e6MqC4T4VxiPrUGVUdArFN9SlsaJa8j6TCme3
 5nj/No6tg1I+xUgA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3559419d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:32:58 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id b141so886458oii.12
 for <wireguard@lists.zx2c4.com>; Thu, 06 Dec 2018 08:41:09 -0800 (PST)
X-Gm-Message-State: AA+aEWYUXoHfD+LFVyrjN0gjalF2c1KTE9wMVp/VhseaqFXaLgZyw8Jr
 6eexn2Nh37ZepBE0Jd2Jf19V91mHId7qVWAES6E=
X-Google-Smtp-Source: AFSGD/VS9IZiyJJrVN+y2F7RU3MCqKPWZf7UNrBadPJGSf6k/sgpnvBqRgsbON8uWV+Nsxhp7A1Pvp1pXfMt6Okazq4=
X-Received: by 2002:aca:c003:: with SMTP id q3mr14417627oif.119.1544114469168; 
 Thu, 06 Dec 2018 08:41:09 -0800 (PST)
MIME-Version: 1.0
References: <CAMhRzNT3Ss4P4h4AFxiZLKcmEG59=sXYFDdFgmnpF9MMWOA0vQ@mail.gmail.com>
 <CAHmME9p7dkgEroU0orBkv9gTVw046TySyhgbrwhpDy9_CJuMJg@mail.gmail.com>
 <CAHmME9pyCqLvTOBHCFYttJJzYGSyf26Way1FmhUtr0NvB8jU6Q@mail.gmail.com>
 <CAMhRzNQ6QwgGT4_LTrVrZ-8LL8bO=T5roFzLRdyGWwVHChvf2w@mail.gmail.com>
 <CAHmME9oWo6dhFgw9eu6Cc0r_wp1v1-Le2b+H9asUP-UXDO=seA@mail.gmail.com>
In-Reply-To: <CAHmME9oWo6dhFgw9eu6Cc0r_wp1v1-Le2b+H9asUP-UXDO=seA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Dec 2018 17:40:58 +0100
X-Gmail-Original-Message-ID: <CAHmME9quC_b3jh+9Z=SnqcXn4Eq+8JhC2ZO-Dz4fNGZPtOqRrA@mail.gmail.com>
Message-ID: <CAHmME9quC_b3jh+9Z=SnqcXn4Eq+8JhC2ZO-Dz4fNGZPtOqRrA@mail.gmail.com>
Subject: Re: wireguard-go foreground mode broken on Linux
To: cbranch@cloudflare.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Dec 6, 2018 at 5:37 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Dec 6, 2018 at 5:31 PM Chris Branch <cbranch@cloudflare.com> wrote:
> > Your solution is the same one I tried, but I wasn't yet convinced it was the right one. I'll take it though!
>
> Did you run into issues with it? Or had particular doubts I should consider?

In case it helps in understanding this, the condition I'm trying to
enforce, rather than the hack that the fix commit removed, is that
rwcancel alone is responsible for calling SetNonblock, and after
rwcancel is instantiated, nobody calls .Fd() ever again, but instead
relies on the stored tun.fd member for access.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
