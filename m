Return-Path: <SRS0=iDgY=II=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD4DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 14:14:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC9C64FDF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 14:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC9C64FDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e391ec8;
	Wed, 10 Mar 2021 14:14:19 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84767061
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Mar 2021 14:14:17 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 18so33670683lff.6
 for <wireguard@lists.zx2c4.com>; Wed, 10 Mar 2021 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GyZltwHUTd0ZPIfHD4xKsKOUtchCh4PlLUd4ETIiVbY=;
 b=usB3NPOjphlKz0gijnxcr8rFKjc7pN/k6EdTZoTuoK4rNrnYbTHMwP0hA5VnY0pcSR
 hTPbRFM6xf12pk0KvUXGkmEVpKJOyM8rKGwI7dE8iDSAB3pZ0AgKDbPbAkLSJ33AMrD2
 ChlSZ6/JOdbk+Tlg7rUJtI0HJQhyFLpzUVDyRSlOvCis1X9rpCnZhRj95R1TDaJLdVGH
 n1KgBVRg7Gb62QBIMaJ5LXzJq3TmUUaniMEJyjeHQ2XY9ipA25vX1/GZveIhclCzo76X
 QTtBT9AXBLxE/V8Znu9mqD8YXMyVrYCCDgahQRiAfnuwrBC/UihiYIRTnVfjFhpNHKp2
 65pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GyZltwHUTd0ZPIfHD4xKsKOUtchCh4PlLUd4ETIiVbY=;
 b=FDuDK6RciiI5u6rIFFJZYhfwvlp6Gn97SeNLPfx8+YJyKuiQf0oOZA1UyhYzMwruwf
 DUjM+gBGH+6tiJUlZhfASR0sji56sw8tvweBYCGJpL0NY3Bw7ExOwOWBwfeZ2vQhwXLd
 L1oD7mliPYKhdqzy5F3P8EFwW7HZ+Dqbvrf6aqSdj6cnoESlHuyEJhMk8uxQWymgJMGy
 0dEt7y2B7xlW+O+196cyeJM/wkARkEtnZ7eS/mJ35/qFoJAOsf6Nvs7C10j9mZuScYLT
 jdUhhrLsTPyJAk70YMGc7uj5Pa3IJYxEjKcsRaMbIdVeY38d12mfJUzk8GCiev4zm1yx
 VKRQ==
X-Gm-Message-State: AOAM531h6UDI+Yd5P6L2b1I8OUujy2YdZqwJJq9vjBigOv3t7YUqnKUq
 70zrll3pak9yoZ64WBa7oo97x9uCA7AVU44eys0cd2I99ac=
X-Google-Smtp-Source: ABdhPJwQgXOf9z+IVrGEVO7hwBnflkvk2OnwX/Tc5aA0ue9ozlAP+37mhrpwUA9JJuqzbkbJcsLxAMXp4CGyBY6nQAU=
X-Received: by 2002:ac2:5fae:: with SMTP id s14mr2154055lfe.15.1615385657380; 
 Wed, 10 Mar 2021 06:14:17 -0800 (PST)
MIME-Version: 1.0
References: <CANaOhea6dQ6Y5A22B4dO2VEYbk4754rGEi=hw4vfMgvaBo1CAA@mail.gmail.com>
 <CAHmME9o96vy1bo=V+p0C0a5LXuG_6Cw2onoJfTL=5MDg6g=h3A@mail.gmail.com>
In-Reply-To: <CAHmME9o96vy1bo=V+p0C0a5LXuG_6Cw2onoJfTL=5MDg6g=h3A@mail.gmail.com>
From: kay <kay.diam@gmail.com>
Date: Wed, 10 Mar 2021 15:13:40 +0100
Message-ID: <CANaOheZoKG4m=hMUCbWcsU4PHbKPS5ZtYtqmYvddBPM3-NNv_A@mail.gmail.com>
Subject: Re: Windows: wintun MTU is not set
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Thanks. The following code worked for me:

        luid := winipcfg.LUID(tun.LUID())
        iface, err := luid.IPInterface(windows.AF_INET)
        if err != nil {
                return err
        }
        iface.NLMTU = 1302
        err = iface.Set()
        if err != nil {
                return fmt.Errorf("failed to set MTU: %s", err)
        }

On Wed, Mar 10, 2021 at 3:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Try using the object returned by luid.IPInterface(windows.AF_INET). Or
> in your example, use AF_INET instead of AF_UNSPEC.
