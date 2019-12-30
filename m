Return-Path: <SRS0=wyc1=2U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5A6C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 11:03:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75873206E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 11:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sY5LOdte"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75873206E4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dace1c7;
	Mon, 30 Dec 2019 11:03:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 946a1a3a
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 11:03:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a811a663
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 11:03:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a427ead
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=VMYeoC0nIB37fIJ5OrkeUESLLkc=; b=sY5LOd
 te0LRxPz4k48kkQj6xQCilujyDGBPPKcLx7J6FHkDD5AN7k66efrm95HN9qVibaq
 3AS4uvFdvAZ/WiqUSJysaJqyXH/LciLnldcmnd/cEbJUBKq0/MCbUP/8eZZJJX41
 0d1JmOaSPsxgdrz6iOu3wgiMBWP2ucqmswJGBACGyw5E7nsUcVJr1EidxqbmRX8G
 O6u/FeFSp+Qp+r2ldYgGZpqO071f2XeH3YONTNjd4EDCT5KRM80yBS29u1hcRPU1
 MbaFGzra5thpElOq35weeqNYb6GwfnCDOWIuaula9j5vfgnVBYo9SKzQu7XY646T
 cxQPI/a1m+NTKrXg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e45efa8c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:05:26 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id l9so8015082oii.5
 for <wireguard@lists.zx2c4.com>; Mon, 30 Dec 2019 03:03:32 -0800 (PST)
X-Gm-Message-State: APjAAAVO5BMT6rC35lT9f+hy+JNqiwZ/2F+1MRletJzgB6mI/Oyp6pot
 JF2pJrPEkYQE9yyx2v5c1Hy4p2Opx+b8f9trgSE=
X-Google-Smtp-Source: APXvYqyEiPvIZS/+d6+1OG3OosAkbo1+Rq3w6hyINbcY2l/PUAAJgPJyYprGO5JNygBzwRXp4KJ1C2I9pCLOb7mLiTs=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr4694544oia.122.1577703811955; 
 Mon, 30 Dec 2019 03:03:31 -0800 (PST)
MIME-Version: 1.0
References: <CALXT2kFp9SPFELS97vHJFndGH7cFh0=gjC1h9Tuv2LgSMHeJ-Q@mail.gmail.com>
In-Reply-To: <CALXT2kFp9SPFELS97vHJFndGH7cFh0=gjC1h9Tuv2LgSMHeJ-Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Dec 2019 12:03:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9pXfPd3Vc=YqFV+kGyTv72Q-A3+O-EFAyf55fTiMZ-X6A@mail.gmail.com>
Message-ID: <CAHmME9pXfPd3Vc=YqFV+kGyTv72Q-A3+O-EFAyf55fTiMZ-X6A@mail.gmail.com>
Subject: Re: Data Connection Lost Win10 (Server) Win10 (Clients) 37
To: eric brandl <ericb0813@gmail.com>
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

Please send a complete log, not just an excerpt.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
