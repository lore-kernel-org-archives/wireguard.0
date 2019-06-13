Return-Path: <SRS0=vkhh=UM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280D9C31E45
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2019 09:42:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9892721473
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2019 09:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JLWu0mhB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9892721473
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24f98c39;
	Thu, 13 Jun 2019 09:42:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 405912a2
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 09:42:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aafff711
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 09:42:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bad2e700
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=NTztezx+Yd+vzXCwbg9jhfvxAyg=; b=JLWu0m
 hBeaOcBpT78UxnZ0/2l5yfF9XGNk+/SpDc8Yi8QKRHdTVcR+R0FFyqFiABPNcWxo
 c+3Ym0r59VdeSKfifrp5UWAxRuZAyUet22ToOUl+bdHEKNHThMVCS6UYRC9SpsWe
 UIQcLd2qQUBWhAJ0QFCkDr/rBHpk47TYtHtmfOypvDI/f5SELeR6Iw4BO1mjSIrv
 Lp3XdW1ThSgDLyC88ziP2rMFquShoZp89wLdmW8Ddf6kjzhzI4c0DNq/ra8lCZOk
 0pkzN5BtB9z8VttrofOJ+6M+Lf28yeV3jS8LZRm2rvbrOOMRYh3RJcAblBlLoPwE
 xBS1mfa2IoCELZNQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f9ecb023
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 09:10:22 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id w196so13939331oie.7
 for <wireguard@lists.zx2c4.com>; Thu, 13 Jun 2019 02:42:43 -0700 (PDT)
X-Gm-Message-State: APjAAAVXaNMoGQ6t+MbHiNChXVLkiUuBESII+GKZYLENj9sVOuQLEfVf
 VijweyPRfCWVtv25FFKbBvgQ7fq7WGGCwtkpQR4=
X-Google-Smtp-Source: APXvYqyz9hU+vTH9hApY/Xn6IMek92tHz56OQh1gr/Ady9snaTSjhezOEBW9Asqb7GelNtuVH5/uJO7u/BZH8m12l8E=
X-Received: by 2002:aca:ccd2:: with SMTP id c201mr2228270oig.119.1560418963078; 
 Thu, 13 Jun 2019 02:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094016.11992-1-opensource@vdorst.com>
In-Reply-To: <20190613094016.11992-1-opensource@vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 13 Jun 2019 11:42:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9rR3X9mo1UjzRRgafFz-emvWYPOafUcimtbfR23qird+Q@mail.gmail.com>
Message-ID: <CAHmME9rR3X9mo1UjzRRgafFz-emvWYPOafUcimtbfR23qird+Q@mail.gmail.com>
Subject: Re: [PATCH] timers: local_clock() is defined in linux/sched.h in
 kernel below v4.11
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
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

Hey Rene,

Thanks for this. I may merge this today, but I might revert the
local_clock commit all together and replace it with something
different, based on some in-progress discussions on LKML. I'll let you
know.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
