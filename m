Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6BBC388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:13:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3A7620674
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="r5dZI6FM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3A7620674
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf0fd317;
	Tue, 10 Nov 2020 13:09:56 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6230fb4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 13:09:54 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bdd273bc
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=XcC1uEJmudbNObZEUmGxIPA4pWE=; b=r5dZI6
 FMzgTobrO77A4o5buSBD44EsJilO6XFoWiUkT8axiASOONBQFdJqS33dgEPoRpx4
 kiu6Honghcz31A5MW0jbuQKhNoxKF0HdJNubpeEOWjjREtlHfYU79tXDR8RPzExJ
 0TDd1xcYBPynqlBOZw+zcDm8Ufiko2omdV1VGZ8X1J5DAgDafUbQnG4qZzhKizVl
 MmR7iEtF2DpoMsmG88+Pdhgh6rXqRJ0CrTt8lYpXA4d7Q64RkSyny8ytzd8ByAT3
 JxgHtAe9Kx+QAh4Qt4EFaXuZQwIC5qffUUfdnxXGM3PfqCHPRR0BSVWsXiBo02w5
 4oJY4vMoS48B1MIg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b201a104
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 13:10:40 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 10so8069034ybx.9
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 05:13:36 -0800 (PST)
X-Gm-Message-State: AOAM532cUP+5OPb/LIFkJdAaKcPHCz/0caVGq4sPElNNNmiDI8TNo3Z8
 MtSKRqVcUJBjxBEieN2UVDH3iHtoi0c6hwB4gsg=
X-Google-Smtp-Source: ABdhPJzRiHHDXdmzuZHQalwuJ1ya5il7Af+d5zpLR2cTc2UOBJUrk/MXkuUhERT/YQg6MbunAe47dr112hn21hf7xBI=
X-Received: by 2002:a25:4943:: with SMTP id w64mr26039707yba.178.1605014015850; 
 Tue, 10 Nov 2020 05:13:35 -0800 (PST)
MIME-Version: 1.0
References: <CAPhasKNCoDb2SYSO__qOpHxWrj846k1hQYF8jjTSqxxw-6gwYg@mail.gmail.com>
In-Reply-To: <CAPhasKNCoDb2SYSO__qOpHxWrj846k1hQYF8jjTSqxxw-6gwYg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Nov 2020 14:13:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9phxfiZ5hyrSsr-xPkek1PJRT=_6yRLcYoG8PFSyLjw5w@mail.gmail.com>
Message-ID: <CAHmME9phxfiZ5hyrSsr-xPkek1PJRT=_6yRLcYoG8PFSyLjw5w@mail.gmail.com>
Subject: Re: WireGuard-Android QR code import disappeared from chromebook
To: Jay Tuley <jay.tuley@ekonbenefits.com>
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

Hi Jay,

Sorry for breaking your flow and the late reply here. Fixed now, and
will be available in the next release:
https://git.zx2c4.com/wireguard-android/commit/?id=a300f269f154eddc244fe7fc3f8de556c6172993

Jason
