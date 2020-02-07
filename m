Return-Path: <SRS0=RHSj=33=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CAAC352A2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 13:19:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50656217BA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 13:19:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2XQmQGQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50656217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0244894f;
	Fri, 7 Feb 2020 13:18:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 710e6d9c
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 13:18:03 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7d01540
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 13:18:03 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h23so2103219ljc.8
 for <wireguard@lists.zx2c4.com>; Fri, 07 Feb 2020 05:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyLnQGPjDgS0q6HNVw40elnm4wkAjixjpyTovJ7UGdk=;
 b=K2XQmQGQHrFKXEjU0VNjyV90P/2QTpr6jhqS7yTnd+0B75q9NAU63DDJXxPFbQWPax
 UtIU5Zqziu8BP1Fhpil0IM8OMqG+PYYw7Ep6MSYv9oF5/3SrC1Z11S+RaE6Qixz+IG2I
 31y+D9HHazBcMIEuRFHe0EHcSkQMO7WjWdIENTd433PijYVZ2y65m4aMPRc2k67//cS1
 craAANx1TSlp9IUOzGob/3Fe64IfhoWOI28GpSaWuhNLo5XvDczN96+9uzCqY7BIs9um
 /w0IteBVVUaOWL30xbhL1WPLIsFmp8HcOyh8j97MBhpYi4F/7HsUE4o+dMs4vLH6YH8D
 sDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyLnQGPjDgS0q6HNVw40elnm4wkAjixjpyTovJ7UGdk=;
 b=JwjraHknaTYUOKYgssPTMIdfUbq/0GpSiheRl6uD1VD5rOT3dkXi+M1HTCE4LxbsC1
 e+AaclH2iWQTHz8rhmlRtomxFi06wRQsrhSWN8v92ML523h/nBekhpQreWGGy+eDXcmY
 pRG+CCpFCnh3SD11d2n0kRPmC5FCsibLQ2lIUv5DacZr4E07jzCtFMOUQ4EYn8JGNpUn
 XGFYCjX1iPKHeJw04xe0oHIOXZRUvdEWYpt9cw7xRwkRyjn2UPUv70XSN2AaxRjK+4Ox
 XW7/DjfMGqZqt7WteRYmi99itKKZzjvOt/XfiviRDePXi08WZLNVQa6z+PpTZ2yR9Ohs
 Z1wQ==
X-Gm-Message-State: APjAAAXNAa/HWs5qAC3KS3x1Tivv64gcMrQQ2cy4oTsnk+jG2tpbbkRT
 2janTT0RmVrlrxPCJNPu0V3UP33ENF6jS8LkQi4=
X-Google-Smtp-Source: APXvYqynH0txbGSqkBRE7+I8ky0+308DzGfd128wVP9e+fA7TloaWiZZB+kkdBu/eXw14rB7a8p+KgpT/A0qgej9cAA=
X-Received: by 2002:a05:651c:d4:: with SMTP id
 20mr5208467ljr.269.1581081552502; 
 Fri, 07 Feb 2020 05:19:12 -0800 (PST)
MIME-Version: 1.0
References: <7bd93b7f-adef-e1b7-252b-1616914a6e4f@posteo.net>
 <CAHmME9pC5Ki=Rnj-W+=t7CZtmVP9aUQJRL0bCzV1MHm3eO60NQ@mail.gmail.com>
In-Reply-To: <CAHmME9pC5Ki=Rnj-W+=t7CZtmVP9aUQJRL0bCzV1MHm3eO60NQ@mail.gmail.com>
From: Ilie Halip <ilie.halip@gmail.com>
Date: Fri, 7 Feb 2020 15:19:01 +0200
Message-ID: <CAHFW8PSKTg5KAaZgTGhRkYVF+dBzY1ztHpK248B3HGC5R8mtOA@mail.gmail.com>
Subject: Re: Building module on Mint on 5.4 kernels: fatal 'make' errors
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Nicholas Joll <najoll@posteo.net>
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

My guess is you're installing the kernel from the Ubuntu PPA,
https://kernel.ubuntu.com/~kernel-ppa/mainline, is that right?

I can reproduce this build error with a fresh 5.4.6 kernel. Turns out, these
kernels are built with a newer GCC (9.2.1). As such, the kernel's generated
headers have CONFIG_CC_HAS_ASM_INLINE=1. But your GCC (probably 7.4.0? that's
what I have on Mint 19.3 machine) doesn't support this feature.

I installed GCC 9 from a PPA and was able to build the module manually:
    $ KERNELRELEASE=5.4.6-050406-generic
KERNELDIR=/home/ihalip/Projects/wireguard/kernels/ubuntu/usr/src/linux-headers-5.4.6-050406-generic
make CC=gcc-9
    [ ...snip... ]
      MODPOST 1 modules
      CC [M]  /home/ihalip/Projects/wireguard/wireguard-linux-compat/src/wireguard.mod.o
      LD [M]  /home/ihalip/Projects/wireguard/wireguard-linux-compat/src/wireguard.ko

I imagine you'd see the same issue building any out-of-tree kernel module.

I.H.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
