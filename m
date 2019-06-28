Return-Path: <SRS0=Sp06=U3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59785C4321A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 12:07:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF56A208C4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 12:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="d8Lp7e/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF56A208C4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d93f1ab0;
	Fri, 28 Jun 2019 12:07:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f028eea9
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 12:07:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e9e738e
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 12:07:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b94dd19f
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=DIJ/ZJQEATWcNzi+MjvzHysPYrs=; b=d8Lp7e
 /ageeAju7rOVtWyInW3yBSIQLci1rZzvhlCHiRb4+Ef10pjjkCyEt2OoeQEv4D0i
 BKv+aG3qvaR3xFAkUmYcpLUI9THg7c+uR8D21BTcysBdDSkMJ/8SE1aiuGjqiDKF
 uYbzIyF9WPe3e2RlJD3auYaiYaVuuRkZUvPMQimkBynNb/koy1nbKLKIXheOq+8B
 y/NGt2pX/f7yb7FsxIe0atb8PEXR4GLZe/EC+dV584mwf/ConMCIyl3fg0QFhNM5
 Q+tL90SLHSjp1mAGF79HakAXyor3ceq8HxfnsOBDyWa71p3nwx1vxzGkrdgCGsa+
 NpA/wJSz9zW8jgLQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 07f8d19d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 11:33:02 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id s20so5727709otp.4
 for <wireguard@lists.zx2c4.com>; Fri, 28 Jun 2019 05:07:20 -0700 (PDT)
X-Gm-Message-State: APjAAAVojRSW4KoGSS0zs8I/EbQ/E0tw8H+dgDwJRcBW2NR4zHB9Uh4z
 NdkaVV0uhd5YpQZ/QnR5/RO6BrX1HKYdfhBe2oA=
X-Google-Smtp-Source: APXvYqyPpW9AOI/plzRhhGpYw0HGbjLuU9SGxivsvtbmUdJkM1ln1DuuCfVL3qeI7YDfnQI2WGK1KQyf4KjMtF0+2Dw=
X-Received: by 2002:a9d:73c4:: with SMTP id m4mr8222507otk.369.1561723639462; 
 Fri, 28 Jun 2019 05:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <CADXv92b2P79-OJBzK+aXhKFr3k_VqZkkkAuZOg5dALui8aNTiA@mail.gmail.com>
 <CAHmME9qi6eb+YCKx8NdtN85ouTszDBrCsrshT1sYFTUXw8K_zQ@mail.gmail.com>
 <CAKJniYQ-YcFrYm8hz2Q8aWaJf2jLTsa_g2VGy_UaqfEx2yBUtQ@mail.gmail.com>
In-Reply-To: <CAKJniYQ-YcFrYm8hz2Q8aWaJf2jLTsa_g2VGy_UaqfEx2yBUtQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 28 Jun 2019 14:07:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9rT11fPmBuRxa_sSRjW01ZN6eSJuDEpKOpGVbH2e=SZew@mail.gmail.com>
Message-ID: <CAHmME9rT11fPmBuRxa_sSRjW01ZN6eSJuDEpKOpGVbH2e=SZew@mail.gmail.com>
Subject: Re: RHEL8 package install or build fail
To: Christopher Bachner <hello@chrisbox.org>
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

Thanks for the heads up. I should have this settled shortly then.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
