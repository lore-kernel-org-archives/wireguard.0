Return-Path: <SRS0=sGqt=WP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA39CC3A5A0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Aug 2019 18:15:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B84C22CEC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Aug 2019 18:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WGz3o5WD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B84C22CEC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c193330c;
	Mon, 19 Aug 2019 18:15:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39af011a
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 18:15:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44993273
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 18:15:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07174bf9
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=fzdFn5xq2i999fpBc15nYp+6hE4=; b=WGz3o5
 WD76kC2kLVVM7UQBT4yspTBcwV+RrYTg8ydyITv+PnlkkUfjcDhiu3Bs4a/A3QkW
 Wt8PIvnhkZag9JCV0nmWSL87MYT2hovlCVuNnhtEGy+gWQ7FPjO0EU2x8Tabb97y
 RpATzHnfaLcDNwvVDjgAzowono+IovJM9iEgN4Zn7tlxNAfPNI6MS0yHvXn6XkFM
 zMwdcJPYWI2s2YcZk44LT4mlmH1Byb4K15PBvPoG/oqN0mTLLuOfeoJ4JTSQ3RgO
 68AyL9J4pULmAi95n2pf0NEQsqr/51SsSgCsDhCk6B8y694NdsDSFuE4fdg+AKWp
 dArhjH6eJ/ZNdQ1Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f7826af
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 17:34:45 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id h21so2033322oie.7
 for <wireguard@lists.zx2c4.com>; Mon, 19 Aug 2019 11:15:48 -0700 (PDT)
X-Gm-Message-State: APjAAAUxNPu9veURTYiSfe7sEPfB4AY7Pfj7Oz9xIDat/ktm3tc1aNlQ
 2hylBe0WQBWUG9EGsim7rixftLi5YcF0ZIFBYVY=
X-Google-Smtp-Source: APXvYqwhWAXnOmX/QRwb4k/RX6pom9spohmIrrvVml3AmJ/ekwd7vQQKgJvmZTF1NAOA+yqeN6RdeYCmAsH+iObvB1g=
X-Received: by 2002:aca:4a53:: with SMTP id x80mr14577078oia.115.1566238547378; 
 Mon, 19 Aug 2019 11:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMWzGbheVD6iOm=UZxbkmHOWCPHq7QzCi3_BpGbZT4f2kA@mail.gmail.com>
In-Reply-To: <CAGyAFMWzGbheVD6iOm=UZxbkmHOWCPHq7QzCi3_BpGbZT4f2kA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Aug 2019 20:15:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9pOPkhYnE2D7-RhSVyECosL8NcrhsAL05C9SPSYiqVG5g@mail.gmail.com>
Message-ID: <CAHmME9pOPkhYnE2D7-RhSVyECosL8NcrhsAL05C9SPSYiqVG5g@mail.gmail.com>
Subject: Re: Volatile in Wintun
To: Lev Stipakov <lstipakov@gmail.com>
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

Generally volatile is used to prevent the compiler from reordering
reads and writes, but we don't assume that volatile implies a memory
barrier. We could probably switch to /volatile:iso.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
