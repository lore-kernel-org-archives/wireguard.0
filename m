Return-Path: <SRS0=wyc1=2U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DD6C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 11:53:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F28D206DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 11:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="yH+lLtu7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F28D206DB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39e51218;
	Mon, 30 Dec 2019 11:53:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 901542b8
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 11:53:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e89e4773
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 11:53:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c5baaad
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=K9kU8f7vpcBdKquNLw6L5VqjT84=; b=yH+lLt
 u7/EEWh5oMQ2WigU9thu/qivOlpkDpfIjWq1Ao6czdcWk2mbNWuBNoV0prnaxqFO
 lKGQ86dHKL4YJrEnVQn64iIvN5XpPWmbiqCRxYHBZuR9vkTSe7Q6vpzI8KdE3x55
 m8b3Ykm0gX3/Vho9I/9OM17J9Ub5llFw1K4sSRUmsrD01UbW0H7tIqWvQbgbaB2M
 dWbzBi3+4t0CtRQ2Z0Q4vk9fdBvlu4xOCuFUrnN+GxNUdmeN5+E38t3fP6sqQLyO
 Jd2BVbXTbrvUGqH7Ckh3mfYhisgqPSQSkdMdQdjDIVOhVQv6SNz4x4vNnNagys5s
 0KBqPX7G4r6Gm8jA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3509e3a1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:55:07 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id w21so38256027otj.7
 for <wireguard@lists.zx2c4.com>; Mon, 30 Dec 2019 03:53:13 -0800 (PST)
X-Gm-Message-State: APjAAAWuvkMhnzdLOx5w61tAcnc8EoBkbWY9lw3BgX01YOJ77gL9wtlq
 1vXmORD9fkKQckiDf29NtlFagONLxJA5boFeMzY=
X-Google-Smtp-Source: APXvYqwN++r0CyODfORHTWAE7i5PvIznujm9bxu80+/KpIMz+IQrYwfH/mm4Tx455mjzHhnF4QK4UVbxWse2btM3RHQ=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr59057071otm.52.1577706793402; 
 Mon, 30 Dec 2019 03:53:13 -0800 (PST)
MIME-Version: 1.0
References: <CtiLrRxfJF8VjxK15ZVRrI9eJBflmVjOBKiOTYAHVAmF7lVPMuQvg3luFb89M3FKdy2fvemWnkfXd-LRJ1MCGy0GC2TddQuX0-Wga9hBS_4=@protonmail.com>
 <A02FDAAF-B405-4735-9DD1-95A7F6CE9B3F@lonnie.abelbeck.com>
 <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
 <CAHmME9q1s8Ze40Uzi9+9PM8h=iWAs7_U=Zh2+5O8GjAjQKFeag@mail.gmail.com>
 <CAHmME9q=L1kyxSu8KBVMkZx6-A77RaAeCtXeOaYQbXGDho-Ujg@mail.gmail.com>
 <b01381cb-dd21-10fe-8223-19bbcf9fcca8@web.de>
 <CAHmME9pj1V5s3UzYx3BGmgD9ffuOepHM76k5OGU1f08Xr9j-oQ@mail.gmail.com>
 <54c26a82-4b7b-1bbd-4879-4c504392fc1a@web.de>
In-Reply-To: <54c26a82-4b7b-1bbd-4879-4c504392fc1a@web.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Dec 2019 12:53:02 +0100
X-Gmail-Original-Message-ID: <CAHmME9od-Nxx3YMqw7Q33_fJDCmE0O_OUM2jhLTfPKyRgL5upg@mail.gmail.com>
Message-ID: <CAHmME9od-Nxx3YMqw7Q33_fJDCmE0O_OUM2jhLTfPKyRgL5upg@mail.gmail.com>
Subject: Re: remove peer endpoint
To: em12345 <em12345@web.de>
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

On Mon, Dec 30, 2019 at 12:50 PM em12345 <em12345@web.de> wrote:
>
> Sorry, may be I was not clear enough. I didn't intend to ask for the
> removal of the ability to set an endpoint, but for the ability to
> configure a peer without knowing the endpoint at configuration time.
> Because the endpoint is only known at a later point.

This is already possible and not relevant to the discussion at hand.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
