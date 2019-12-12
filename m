Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB13C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 19:07:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4805121556
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 19:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GfeDyCoT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4805121556
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7bb7516;
	Thu, 12 Dec 2019 19:07:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5f93065
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 19:07:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b58131e
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 19:07:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dd05ceb
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Gap4hyb3YJho4i7tIDDW6ea2M7E=; b=GfeDyC
 oTdom0f29bx7WQEfihXhBCQdSLOdasAvB0dalfeNHjtmMQm89xwF6KrDQJ3gwZ7l
 chCkqbktrtUApPCE84fiRUalcI0PiIzvLmdGXpFf7Ao2wC9WKvbmdP8tRA75jhPI
 jENw/TCtpC1ZR/yxQiEhJhRUGS+2rJV0+KVyRr03hmhfUNQQPrTsYAKlN15U9XPN
 /CUYpZImVbfa7nFvkLjUTpwcUgXo6u3GQ01mcwPQeAicwi85FWduCEkPhz5MrEqc
 kwFw5NPSSUh6VoY6raDbQuEwkyoRRX0XCAzZt2PTCqda7bHQpbDwFeJJtHZNBhvU
 HCkuKEDj7IddxaFw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b123208a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 18:11:12 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id g18so3044225otj.13
 for <wireguard@lists.zx2c4.com>; Thu, 12 Dec 2019 11:07:02 -0800 (PST)
X-Gm-Message-State: APjAAAWRgheZxvH2mNY+cJFpgk0v1B9/PBV4oFIVyTp1TQweiuPCDRQe
 piImB9tgi1s4Ub3YZfLf5aJE1btYaN9nlSESxYE=
X-Google-Smtp-Source: APXvYqxCKAGJ2V7i7Z038u/aSejmowoq1mmb2+5F30wgv9JmKhhntQi57wRLGO7+Adc9XeyCGdQX/971aGYA9LxcTVo=
X-Received: by 2002:a05:6830:1b6a:: with SMTP id
 d10mr10174984ote.52.1576177621494; 
 Thu, 12 Dec 2019 11:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20191212091527.35293-1-yuehaibing@huawei.com>
 <20191212.105258.579549471896891617.davem@davemloft.net>
In-Reply-To: <20191212.105258.579549471896891617.davem@davemloft.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Dec 2019 20:06:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9osYEbi1BDmJL=4N+A1rbb7_MPqVijogHSFhU39rRCbdw@mail.gmail.com>
Message-ID: <CAHmME9osYEbi1BDmJL=4N+A1rbb7_MPqVijogHSFhU39rRCbdw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: Remove unused including <linux/version.h>
To: David Miller <davem@davemloft.net>
Cc: Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
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

Hi Dave,

On Thu, Dec 12, 2019 at 7:53 PM David Miller <davem@davemloft.net> wrote:
>
> From: YueHaibing <yuehaibing@huawei.com>
> Date: Thu, 12 Dec 2019 09:15:27 +0000
>
> > Remove including <linux/version.h> that don't need it.
> >
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>
> Appropriate subject line for this should have been:
>
>         Subject: [PATCH net-next] wireguard: Remove unused include <linux/version.h>
>
> 'net' is too broad a subsystem prefix as it basically encompases half of the
> entire kernel tree.  When people look at the git shortlog output you need to
> be specific enough that people can tell what touches what.

I have these fixed up how you like in the wireguard-linux.git repo,
and I'll submit these in a series to net-next next week all together.

https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git/log

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
