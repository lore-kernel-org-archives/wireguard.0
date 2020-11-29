Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79864C3E8C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 12:51:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83EAA2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 12:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uNk3Evow"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83EAA2080C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 474f380e;
	Sun, 29 Nov 2020 12:44:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 73d3750c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 12:44:32 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60e59e1c
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=5QPZ+0WqJE/Fpk4fCCX7xn5zMj4=; b=uNk3Ev
 owjVxABwz8ObdtWlwQRHjzQOkscp1tX7gE9M/cp39lATvyipmQ195hf50TXg5h7i
 pDGqCiYVkLgMInRXkPsl0VBiQSX4V/GyA0yPrOyN+oTKsinBHVb2Hp5yWLeCEzf0
 uyHOa4OBMK9Cxjq/sQfA0R2MkYbSibOXErGxDgBjvSgW9uh6v7CQ01gL0yH3HeYa
 CaRwcUIP47cR+5x9XkKs6aogJggCRvAWocakyPglPcLRVb8HVYnjeAYxekdEcZHw
 3YUbnQNAsBPED0JeEUOHqOF68O9sT5E7KAEFhj/5pyJ0hcr1WFqJycrtjrT8rojo
 IGGNYW4WyMU6CP7g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 14ef5362
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 12:45:18 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id k65so8857132ybk.5
 for <wireguard@lists.zx2c4.com>; Sun, 29 Nov 2020 04:50:42 -0800 (PST)
X-Gm-Message-State: AOAM533wIKBnlx6aqAC8FJ8SXhUsgttr/sbQORimibNRbe0+uZSk5Grt
 +iawinTuinSQtDCO3RHxLAjoRQjuySoOENfSGbc=
X-Google-Smtp-Source: ABdhPJzTrQ8RSmgzsD9FcL0u9+g2bK8ctVSwngTUaq8y+KkUfTB4YNCnaFUaDtZ7YZfmxzRqVTinkIOtIQVAl47zedY=
X-Received: by 2002:a5b:2c6:: with SMTP id h6mr19605550ybp.306.1606654241843; 
 Sun, 29 Nov 2020 04:50:41 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
 <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
 <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
 <CABtXGiD7Q4904nit3C=A12AnJh0rmLeW3skhPoWXEYdP2mLTXw@mail.gmail.com>
In-Reply-To: <CABtXGiD7Q4904nit3C=A12AnJh0rmLeW3skhPoWXEYdP2mLTXw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Nov 2020 13:50:30 +0100
X-Gmail-Original-Message-ID: <CAHmME9ohy8Tfko=hO3jLDCJ92X6LQmYoCyTmCgH9N0R5EdPw5g@mail.gmail.com>
Message-ID: <CAHmME9ohy8Tfko=hO3jLDCJ92X6LQmYoCyTmCgH9N0R5EdPw5g@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Phillip McMahon <phillip.mcmahon@gmail.com>
Cc: Adrian Larsen <alarsen@maidenheadbridge.com>, 
 Clint Dovholuk <clint.dovholuk@netfoundry.io>,
 Riccardo Paolo Bestetti <pbl@bestov.io>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Sun, Nov 29, 2020 at 1:09 PM Phillip McMahon
<phillip.mcmahon@gmail.com> wrote:
>
> Interesting thread to follow.
>
> My larger concern here is that without an officially provided method
> to run wg as non-admin on supported Windows platforms the following
> may happen

Maybe you should keep following the thread? There _is_ an officially
provided method, and it has been released, and you can go to
wireguard.com/install/ to download it and read all about it in the
release notes posted to this list. This topic is closed and the
discussion over.

Then Adrian Larsen decided to jump in and request a totally unrelated
feature, rather than starting a new thread for that. I indulged, and
here we are.
