Return-Path: <SRS0=wsGv=TQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3031C46460
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 11:45:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D742087E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 11:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="abMGX9TZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08D742087E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83b25739;
	Thu, 16 May 2019 11:45:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64b2ecc7
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 11:45:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e5258a4
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 11:45:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e9aca99
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=QK+G8WtKP4ZkZl6t3EOiZTyB4Gg=; b=abMGX9
 TZ+C2HM2hsRjE3u9wR/CjGb8uT3nt6pgjw+C/EfzZIgFSFw1mxlRA1ryiAFAAhjT
 LvZHLWyc5c9VHcNwu8Y9ncLsJmDjmASNd2CJqbUt4U0k/B+AgFP5ZGqnI5CCehZB
 j1e8txQ4LQIbvRzua+/nCIFLDj8dbX1io8UV6hweYm2ZBMhlaz5mWxjiJN9Ce21Y
 SkiXpmMEzWnVM0yQ7RWBlCdIeUoRHf3XaZLS2wvW4hfCfJglzxtBKjTXtyD9oZTB
 teacy9EP4iclL2bYhEQbVgzv5sdbi+BcM/TpAnpjn4u1TaRgMr027BY2LYJUzJ56
 W1xlQsFZf+W6j+XA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bc77d867
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 11:16:22 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id n14so3136350otk.2
 for <wireguard@lists.zx2c4.com>; Thu, 16 May 2019 04:45:09 -0700 (PDT)
X-Gm-Message-State: APjAAAWcwE6pvme+3bQbCK++rsX5VU7oROuybBRrHsfLkoViCcBCQJ7S
 IDNDWOhtyUKgVqkFlsxf+E/FF6R1Zya4KUKlySM=
X-Google-Smtp-Source: APXvYqzj6MZWVbhJ7wCrTaPfJr+VQEPrB5p8Nm/a+KNcl5Qj4gLvmr8rYE9mdoDzAQmGNpdlGgSY0Xhza+x/mWQtDms=
X-Received: by 2002:a05:6830:164d:: with SMTP id
 h13mr981440otr.99.1558007107274; 
 Thu, 16 May 2019 04:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
In-Reply-To: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 16 May 2019 13:44:55 +0200
X-Gmail-Original-Message-ID: <CAHmME9rPH=DxH4e-BrLrc6BEoN0T98mVpm_+=w4RR=supSmo=g@mail.gmail.com>
Message-ID: <CAHmME9rPH=DxH4e-BrLrc6BEoN0T98mVpm_+=w4RR=supSmo=g@mail.gmail.com>
Subject: Re: Wintun performance results
To: Lev Stipakov <lstipakov@gmail.com>
Cc: openvpn-devel@lists.sourceforge.net,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Nice results! Sounds like Wintun has accomplished one of its goals then.

You mentioned on IRC that you need for the Wintun socket to be
openable by Administrator, not just SYSTEM. Here's some code you can
use to make that possible, without needing to modify the Wintun
source:

https://xn--4db.cc/rDtNikTB/c
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
