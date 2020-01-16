Return-Path: <SRS0=8jGa=3F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E73C33CAF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Jan 2020 18:50:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3812F2072E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Jan 2020 18:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="abiZKK8X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3812F2072E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85bfeca4;
	Thu, 16 Jan 2020 18:49:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b494667e
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 18:49:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4119aa27
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 18:49:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8f099a3
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 17:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=KKjL0O8PkPmN8l3sQx1/bvT0msc=; b=abiZKK
 8X9ZHft/+deg7O/L/HFU+L9t54tbbg5tbx2knVC5DnNlRWDocfpgXMFYnNKFEvYI
 Mw0jCj2krkJW1RM+R10eKa2vn+4vut4NGjgTAlC43M6LUScX1Cyi59WbiR0KaQY3
 YS53HGxf5HmhaSNw1XThmVzX1oG6xzGvcY+bzVilg4y8d7pGrZ7M0+XBtfRfwytu
 tUDBHRz9O6N5DCCzC/Su2spfNaoOm/vjj1mnfSLQMu55umuRb6o0brJRJGR/XWsD
 RANHn4tScwj1LUp+zkJaDsr69xM4g8zU5HaZqHEPtUIftEXGxNjaDdI/3ptWTS2a
 t3FfpGk50PUkd1XQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 88bf88ef
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 17:49:19 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id p8so20300277oth.10
 for <wireguard@lists.zx2c4.com>; Thu, 16 Jan 2020 10:49:39 -0800 (PST)
X-Gm-Message-State: APjAAAVq8VdWKsiTrHOVsInfQ85L5gXLPggMur1N1JR9IF26yU0NOsr+
 1Jv4+PUQc2Lad8OYag3FofEqB+uuj3AC9uezQ5g=
X-Google-Smtp-Source: APXvYqzLVKJE3ClVxSidVNsmkyFX8fyKBVgWHxDfR1gFZ77EgssSdKb+y4ynvTElEcQHBqylsA8dOiXiZbaGeSE4Bq0=
X-Received: by 2002:a9d:4f18:: with SMTP id d24mr3238927otl.179.1579200578636; 
 Thu, 16 Jan 2020 10:49:38 -0800 (PST)
MIME-Version: 1.0
References: <c9aa2698-b245-31ef-3b47-956f2b9d2d52@53c70r.de>
 <fccf5fd0-4b23-1893-ea55-c49992fe3909@53c70r.de>
In-Reply-To: <fccf5fd0-4b23-1893-ea55-c49992fe3909@53c70r.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 16 Jan 2020 19:49:27 +0100
X-Gmail-Original-Message-ID: <CAHmME9qXPTzFPU2i5_7NN3+5q+R4ShOXngDH0SfpG_7RDw6_Hg@mail.gmail.com>
Message-ID: <CAHmME9qXPTzFPU2i5_7NN3+5q+R4ShOXngDH0SfpG_7RDw6_Hg@mail.gmail.com>
Subject: Re: dkms module build fails since at least 20191226 on CentOS
To: Silvan Nagl <mail@53c70r.de>
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

Update to CentOS-8 1911.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
