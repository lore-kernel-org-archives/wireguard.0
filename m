Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49596C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 20:41:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404DD60EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 20:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 404DD60EB9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00c70004;
	Tue, 10 Aug 2021 20:38:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 99817afa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Aug 2021 20:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628627910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x2Tr3MfYko7UN5BjjRz6LUERJJinu2Ltsb/pmJmgzaU=;
 b=MVpF0QBoPqVGLKLNLXbg2hydfyc0C6n80BsC5wiYDE1992jGQ9FowW1PXL1/hD+K7h1zr4
 8LGLMv4lkWcjuTznxGsUgvJdK3vWSHPzbpjzTMc7ZJXVrY4WyMxEpFYp9S86PMY4ANPpyh
 oGlmioBQdoY2DMO2J10YhfZ9ATFci5U=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f21798c6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Aug 2021 20:38:30 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id y16so258405yby.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Aug 2021 13:38:30 -0700 (PDT)
X-Gm-Message-State: AOAM5336Bfe9hjD6vDw6w977dXzKBcWEQEumSkR1T7BA/LrNfZWI0CID
 id2QEC734oObi8Kj9vO54Vbd2U4J6izbB216vRc=
X-Google-Smtp-Source: ABdhPJxEEL0tABWW/1Gm/Oqq1gyzX2DHnvm+LjnZ0AZ2G+L+gvSePnKNdY51fZk4zfh8k2WW4I5CrzJe4hlMTbTlnzg=
X-Received: by 2002:a25:a109:: with SMTP id z9mr39866166ybh.279.1628627910076; 
 Tue, 10 Aug 2021 13:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210810202936.1537-1-dotneutron@protonmail.ch>
In-Reply-To: <20210810202936.1537-1-dotneutron@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Aug 2021 22:38:19 +0200
X-Gmail-Original-Message-ID: <CAHmME9oc2yoSjuh+Mkv_ERTLSocoRDF1Lh4M6HrciRPNqRBx7w@mail.gmail.com>
Message-ID: <CAHmME9oc2yoSjuh+Mkv_ERTLSocoRDF1Lh4M6HrciRPNqRBx7w@mail.gmail.com>
Subject: Re: [PATCH] embeddable-dll-service: add ability to derive public key
 from private key
To: dotneutron <dotneutron@protonmail.ch>
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

Hi,

Why do you want this functionality in the tunnel.dll? What are you
doing that would require it?

Jason
