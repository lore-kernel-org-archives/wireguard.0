Return-Path: <SRS0=jP9u=M6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99E5C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Aug 2021 23:02:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9DC161050
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Aug 2021 23:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9DC161050
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74111a07;
	Sat, 7 Aug 2021 23:00:36 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 31f68d0b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Aug 2021 23:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628377228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zJXtsCwbbaFgloJ7CJuZbqMzMV1LnFyaZF+GQh4K8zk=;
 b=Aujy6f3zqv8vyltH7lJxcIDQDAQ760bsdbRM1AmfoL+AkluvIqmmeQQXZmDWbjemcRLLly
 XpDt7EjjQPdHS1z19yrOkTQHdV7c7pSTYQU3+HJ+y4mPIUDsAku0aqjFdl2TKFmxjmIjkI
 V1sCCqdqFCiJ4Jm3E7mvWnq66ELQ5nQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 049246ad
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Aug 2021 23:00:28 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id x192so22440749ybe.0
 for <wireguard@lists.zx2c4.com>; Sat, 07 Aug 2021 16:00:28 -0700 (PDT)
X-Gm-Message-State: AOAM532CaloVzHNABIFFDTBrRki3cwbaa4C1awMz9q9YaW4eVhYSFNLm
 nycybbaFCgSXifM1IjyqVCOSroBuE3FUh4X3jX8=
X-Google-Smtp-Source: ABdhPJzraV5nXuPFmYWSNK7aiciZm3/nt4fO6QLDrTXQxps9liJHNbW2EvfG4RHYV2rUE/f0OHY2Za+U0N+vYHnb2SE=
X-Received: by 2002:a25:be09:: with SMTP id h9mr22699246ybk.239.1628377227799; 
 Sat, 07 Aug 2021 16:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <CALWFNqSFsa4N=1et_YcwekTyi1q6pduR9dg2SGBL-QmyiJWbSA@mail.gmail.com>
In-Reply-To: <CALWFNqSFsa4N=1et_YcwekTyi1q6pduR9dg2SGBL-QmyiJWbSA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Aug 2021 01:00:16 +0200
X-Gmail-Original-Message-ID: <CAHmME9p=eROypA_auS1s-pDySdCRApbJ8Obpi_iEQ0U9V6J6Hw@mail.gmail.com>
Message-ID: <CAHmME9p=eROypA_auS1s-pDySdCRApbJ8Obpi_iEQ0U9V6J6Hw@mail.gmail.com>
Subject: Re: wireguard-windows incompatible with Win10 hotspot
To: lsc@lv6.tw
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi lsc,

Thanks for the report. That's a curious bug indeed, especially given
that it affects both implementations.

For the wireguard-go/wintun implementation, we're using
setsockopt(IP_UNICAST_IF). For the wireguard-nt/kernel implementation,
we're using IP_PKTINFO in a cmsghdr. Judging by the description of
your report, it sounds like both of these cases are being ignored for
some reason when hotspot mode is enabled. Having a functional
IP_UNICAST_IF, and moreover a functional IP_PKTINFO, is extremely
important for things to work properly, and without it you wind up with
routing loops like the one you've described. It's actually not just
wireguard that uses those too -- I was reading the msquic source last
night and noticed that it does the same.

So, hm. I'll have to try to make a test environment for that, though
it might be slightly tricky given the hardware I have available. I'll
see what I can do.

Jason
