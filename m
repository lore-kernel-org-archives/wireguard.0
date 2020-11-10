Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693A7C4742C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:08:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC02620674
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:08:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pWl11fis"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC02620674
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 355dc257;
	Tue, 10 Nov 2020 13:03:18 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 60479b52
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 13:03:16 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8232f1bb
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=DuKaqTmPNniy11qKUerQfNp4UX8=; b=pWl11f
 ismnKNfd2ZfUMDtQ+jP+dalIc3vIcxoiKEdduk4cS8hVjKOPPdwUxW7z+ivtwPXV
 WtDcX98rjTrLEbMyemleMEJUuFTMueR9Spfu9P4uqVtQIx1IMCn91xRxpJG9vKSs
 lBblxoqvjvIFgge5asee+TnynY7Byx+5DQIYkjGmaxZzSsxKIl2Bv83xhJg7jFPC
 P17j0yFe5qbr8Bm0yrrQfALBM1cHbrhsFCe1vVJQ8ugNdpBcB6yCAGmiCvzYrpvZ
 +XbwRoj/cZhLcI8Tjsnf9xldXuT1pyZK4j8wYHV8Pw04ODbz4o3MQmVJlljCDI82
 s4V4X5L2c5AlA2hw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f59dc60f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 13:04:02 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id s8so11534267yba.13
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 05:06:57 -0800 (PST)
X-Gm-Message-State: AOAM533QXYyClnX2IV9EC8flbGZ3fakTJ6tdCUBZIOr/7h0Tj6sm5QJV
 8E0JZsnSwRrbSjMNPySQ/4vp4MGxUViPe29WsnY=
X-Google-Smtp-Source: ABdhPJyDNJEyFYGFqmOqpki8eTbxT9fNLfsPZNn7l4hxCGzGLnHLkbShc6VnAYHZ7QDUUKC2A8ms2bn89BWEF0utTig=
X-Received: by 2002:a25:6089:: with SMTP id
 u131mr26923572ybb.456.1605013617363; 
 Tue, 10 Nov 2020 05:06:57 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <20201110134743.1615fcf4@frign.de> <00fa01d6b760$da95c480$8fc14d80$@gmail.com>
In-Reply-To: <00fa01d6b760$da95c480$8fc14d80$@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Nov 2020 14:06:46 +0100
X-Gmail-Original-Message-ID: <CAHmME9ohdWGA=B=70FHe6xRA03h8GZEzMT9hVZ+x_sRB11c0RQ@mail.gmail.com>
Message-ID: <CAHmME9ohdWGA=B=70FHe6xRA03h8GZEzMT9hVZ+x_sRB11c0RQ@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: samuel.progin@gmail.com
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

On Tue, Nov 10, 2020 at 2:05 PM <samuel.progin@gmail.com> wrote:
> FWIW, Microsoft sells extended support (Windows 7 ESU) to corporate
> customers using Pro or Enterprise editions. It can be extended until Jan
> 10th 2023.
>
> https://docs.microsoft.com/en-us/troubleshoot/windows-client/windows-7-eos-f
> aq/windows-7-extended-security-updates-faq

I thought about this... One thing I wonder is: are purchasers of ESU
the same group of people that are likely to run newfangled security
software like WireGuard? How likely is there to be an overlap? I
realize my question implies, "not very likely," but I really don't
know too much about who Microsoft sells this stuff to, so if you have
any insights, I'm all ears.
