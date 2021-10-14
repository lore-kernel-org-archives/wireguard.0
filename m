Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDE6C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 01:31:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A9C5611BF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 01:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A9C5611BF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fd5c385;
	Thu, 14 Oct 2021 01:31:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 910f3e50
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 01:30:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E617611BD
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 01:30:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="OiNZTst0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634175054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zv/OLJIwSOCNh5fvEdPIp11ef/ppo+SJJVb+7WYZB9M=;
 b=OiNZTst0SnW6u741aGZNHppiaOl32oJhCl7E8Ru2K5f/KZtaBesQGyeC4uDUfo0dKEAr/N
 mZk+aZWVjCWK+cYivJ3cegFBnucMGrc/UOErUMoT3Ot5EKuWA17MbnfKy1RqukFZ+Ll9Jn
 APpqB2/evNTbODxr7Xu3DVBNsoZq4Wc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 87903efe
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 01:30:54 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id u32so10810975ybd.9
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 18:30:54 -0700 (PDT)
X-Gm-Message-State: AOAM530bWETelZKrDCvLJr37kJrN/OfC183rwHOe1HbNWu4KAmN3qLkQ
 /r+MdOmRExjI8d0N3kGBvHqvBTKBhQB/qrXe7zU=
X-Google-Smtp-Source: ABdhPJwc/OnFS51w5rFIVB0JQeaqoOb/nZl/LS+sibFmHq+YHFqNGBCN0hP7hUhSAfSdaQDkhHzzsikbMHtE8c/ITNM=
X-Received: by 2002:a25:854c:: with SMTP id f12mr2986092ybn.95.1634175053905; 
 Wed, 13 Oct 2021 18:30:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:61c1:b0:fa:e5:57f7 with HTTP; Wed, 13 Oct 2021
 18:30:53 -0700 (PDT)
In-Reply-To: <5656bb014ee2161f6c8ea5f35d354563@mail.gmail.com>
References: <5656bb014ee2161f6c8ea5f35d354563@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Oct 2021 19:30:53 -0600
X-Gmail-Original-Message-ID: <CAHmME9ogMJfvvHWf065-QO4WrC9-FTNzE+4g6+=wdjJ=SJmpCQ@mail.gmail.com>
Message-ID: <CAHmME9ogMJfvvHWf065-QO4WrC9-FTNzE+4g6+=wdjJ=SJmpCQ@mail.gmail.com>
Subject: Re: wintun.dll + go CreateTun crash
To: Clint Dovholuk <clint@openziti.org>
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

If you're using the latest wireguard-go, make sure you're also using
the latest wintun.dll (v0.14 as of writing). You can download the dll
from wintun.net.
