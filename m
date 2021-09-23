Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DCFC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 15:54:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B260E60E9B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 15:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B260E60E9B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33f83324;
	Thu, 23 Sep 2021 15:54:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2dab8882
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 15:54:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6926461050
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 15:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aX3aje+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632412472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZYkFaWggWuaK4Q9+PU8kLmtuaeSfYV9LWVNn9JxpNNA=;
 b=aX3aje+uJ/zdSx+ZQLw+KxjnA0gcFLwcH6gjq4seBkx5xMFk6PEtTVhGTxeMCVl49Raxq5
 Un8+gBLHaMTKYp9ThfuU0SBJWUKeh//puX0luJp6pS0G2ii9KH/IKnHhzg5Lud0zRinWoV
 qL+k/5WaIw+EExIdDWCRFAVuHuDNNr0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c595bfab
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 15:54:32 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id m7so6788934qke.8
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 08:54:31 -0700 (PDT)
X-Gm-Message-State: AOAM530h7QS5Y+Rds7rN1QA0Z7vgWRmTlRnoQjqkB6JuL7SQIa8mBnc7
 vyxM4ZLIe29EHb3OT4tGyw6mkxVuGGsGlcip448=
X-Google-Smtp-Source: ABdhPJxrbskW2VBBDZ32MtTg04a7rpKlnEV4YC19zJYvVx0/WryK72+Q+qf4AsQzSNcYmRw4R3C1PU1x2sGU0yUfJl8=
X-Received: by 2002:a25:3214:: with SMTP id y20mr6620612yby.416.1632412471422; 
 Thu, 23 Sep 2021 08:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210923100513.1452-1-tklauser@distanz.ch>
In-Reply-To: <20210923100513.1452-1-tklauser@distanz.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Sep 2021 09:54:20 -0600
X-Gmail-Original-Message-ID: <CAHmME9rzGKO51oh5UBvPV+qn7J8yAXbQHsWXh-k+r1BkCHfVTw@mail.gmail.com>
Message-ID: <CAHmME9rzGKO51oh5UBvPV+qn7J8yAXbQHsWXh-k+r1BkCHfVTw@mail.gmail.com>
Subject: Re: [PATCH wireguard-go] tun: avoid leaking sock fd in CreateTUN
 error cases
To: Tobias Klauser <tklauser@distanz.ch>
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

Applied, thanks! I'm curious: is this a bug you ran into somewhere?
