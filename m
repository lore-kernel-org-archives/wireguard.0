Return-Path: <SRS0=89gA=OS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C0DC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 22:35:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E90B6115A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 22:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E90B6115A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e545d54d;
	Tue, 28 Sep 2021 22:35:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4efea2a3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 22:35:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C2D26139D
 for <wireguard@lists.zx2c4.com>; Tue, 28 Sep 2021 22:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="X68CzwJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632868519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPWuglAA+pM+844nfpR7jSxUXxh1nwnrVvWjOJ7zYX4=;
 b=X68CzwJA+tEq5BBoBob7pIZB4KTguLjfoHF42fyLFcgX9eUtUhZDi8npqgZn5CT9+VpPkr
 A2BnG8RHLFYqh9TMm9t1Hlv/djM0rqLxExaZJ6BAlkY+QYeZ8xUPOuT3OJXCbGrzv2VeS2
 LqOvBxIZs8+nxLvXNUS5aUeHkxB9agI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a7972405
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 22:35:19 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id v195so559458ybb.0
 for <wireguard@lists.zx2c4.com>; Tue, 28 Sep 2021 15:35:19 -0700 (PDT)
X-Gm-Message-State: AOAM533u6skdg8FETFV/xzlfF0RQlfvjseOTY8UrnlmdThEqsPlrC1T3
 lLWhtrk6l9QF9h5gzT39JxWKHPKtK917QdmRZww=
X-Google-Smtp-Source: ABdhPJztIE1n2egm9kh722hpynruMvz2FLQdgLLwsTr7zzqYYI+rbd0WIEPGD8GMRu5zzbdfTO9bKI0xp9sW6QMkRYQ=
X-Received: by 2002:a25:e792:: with SMTP id e140mr9061977ybh.416.1632868518792; 
 Tue, 28 Sep 2021 15:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210928221705.GA279593@embeddedor>
In-Reply-To: <20210928221705.GA279593@embeddedor>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Sep 2021 16:35:07 -0600
X-Gmail-Original-Message-ID: <CAHmME9o7dapX5-aQ76HtXWPmUHJ0GutxSfzWJ9TbpCrkvunt_g@mail.gmail.com>
Message-ID: <CAHmME9o7dapX5-aQ76HtXWPmUHJ0GutxSfzWJ9TbpCrkvunt_g@mail.gmail.com>
Subject: Re: [PATCH][net-next] net: wireguard: Use kvcalloc() instead of
 kvzalloc()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org
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

Hi Gustavo,

table_size never exceeds 8192, so there's really not an issue with
integer overflow here. However, I checked the codegen of before/after
this patch, and it looks like gcc realizes this too, and so elides
them to be basically the same. So I'll apply this to the
wireguard-linux tree. Thanks for the patch.

Jason
