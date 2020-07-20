Return-Path: <SRS0=i2uS=A7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F7FC433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:22:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48F3722C9D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jVb5sJNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48F3722C9D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a08eaa41;
	Mon, 20 Jul 2020 14:59:59 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 71b88a22
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:59:56 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30a6c5a4
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=mxOWRDGYdLT5Gm9vLX3z/cjjOXQ=; b=jVb5sJ
 NJaKRGzPWKO4fPFWICjL25FOFJrPxSmveKtE8E5gXb9ZGPjiWDkYlDZsqzPRz+1I
 yR6f6X0RI3I0bbTcQOu2WziIcImVGWFKADaPwACkyaieRkUmDHZkLoMR51GyVKp9
 IaQ2jxb2BfAF0JEDasIjWOwIzlqLAH/0IYNcFMa7DfXp78iSGDpFbSqK6Q/RanzQ
 mwffTtHgqM+3LnSmu1F+GHQezgmMRpS/Vk6UsULJB9dj4aVGteyexmGp4LBLOspr
 P9sdX995Sg2MPYDz+co0/H0wWbewAmgbVsVtQzQlKdvTzAleKpphNRVWtQ5BLVPr
 cbsGbAB23TKDeQGA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 68e45245
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:59:56 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id z6so485885iow.6
 for <wireguard@lists.zx2c4.com>; Mon, 20 Jul 2020 08:22:20 -0700 (PDT)
X-Gm-Message-State: AOAM5303IY9MMgBSEiatKk5xIDFmuhSvaeStZ7iEnbnZTd/hFHHbTu5U
 +RgvTZtbelxAFX2jDUYIbfzz6QvujF4gIjphFmQ=
X-Google-Smtp-Source: ABdhPJytjlYM20PmpSzOYURoBHN9DMOqbprDHXdImcTYAAn90a/4d+Je511giincI1SbPvQZXiXY0v3VFS9mc8FYgD0=
X-Received: by 2002:a6b:5813:: with SMTP id m19mr23215414iob.29.1595258540058; 
 Mon, 20 Jul 2020 08:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
 <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
 <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
In-Reply-To: <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Jul 2020 17:22:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9pyp7z7043ZwvRv0huy9n1zL3x6O7o4w5EsQdg5WsOsdQ@mail.gmail.com>
Message-ID: <CAHmME9pyp7z7043ZwvRv0huy9n1zL3x6O7o4w5EsQdg5WsOsdQ@mail.gmail.com>
Subject: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
To: Joachim Lindenberg <wireguard@lindenberg.one>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Andy Whitcroft <apw@canonical.com>
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

Looks like at the moment (July 20, 2020; ignore this email if you're
reading this >1 month from now) wireguard is still stuck in -proposed
on Bionic.

echo 'deb http://us.archive.ubuntu.com/ubuntu bionic-proposed main
restricted universe multiverse' >> /etc/apt/sources.list
apt update
apt install wireguard

That's annoying and odd. I'm CCing Canonical's Andy Whitcroft who can
fix this inside of Ubuntu.
