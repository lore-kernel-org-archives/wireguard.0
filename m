Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33C4C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jan 2022 21:10:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 92b2252e;
	Sun, 16 Jan 2022 21:10:54 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b51c1c25
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 11:00:01 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id 19so1397373vkl.2
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 03:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P9xJBN5Sf81yronEcRpMEORUChn2S5aTbHnwQ7uOvsM=;
 b=75ZpCXVoEh1jeihH8BKL15veMdCUM+Orq7TR81eWbXdJ/2RWbWqSazKP6MVeQic1XI
 asyMH5LDt46Wf9fDwv3NeC3eyhh4fhvt5IZhxoPupzAcjRmaMd5vXyvZet0yCA+PYgBF
 3XSMLmc8gtW5a9ewU27YyfWPmLu7BMo5vjQ+1TsLNj8AHSDrAAO+xI7ZE9vEOJNroByv
 fubUbOjmrgWd15186n3pNFhTcNa9gRQxb722C0D/ZQk7RChAT7Qc+0FG8EMtySHzjgIp
 nddaiKTBp7uzditVbu0xX5fF0ZnWGzVg7oruxmcbjwoPbaHXH5IR1t92N05/p1jGJEy8
 5OkA==
X-Gm-Message-State: AOAM530pP+mKVuCSkkpHTUjiZPSZfR8gmaEf0vgdammEAP7IRlYToHzx
 szONcTPqflhUo/K3rQja5Xg0JsRzr6tvZJGC
X-Google-Smtp-Source: ABdhPJwvRT1TUZ821T0soBCY5O8IBS8bLdHq1Wakg2LEYEVXaAhhVmTeR4EFpihYCrCbwHlHic/Law==
X-Received: by 2002:a05:6122:d11:: with SMTP id
 az17mr4368139vkb.22.1641985200629; 
 Wed, 12 Jan 2022 03:00:00 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170])
 by smtp.gmail.com with ESMTPSA id s18sm4940968vkf.30.2022.01.12.03.00.00
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 03:00:00 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id h16so1383502vkp.5
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 03:00:00 -0800 (PST)
X-Received: by 2002:a1f:384b:: with SMTP id f72mr4324936vka.0.1641985199694;
 Wed, 12 Jan 2022 02:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20220111181037.632969-1-Jason@zx2c4.com>
 <20220111220506.742067-1-Jason@zx2c4.com>
In-Reply-To: <20220111220506.742067-1-Jason@zx2c4.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 11:59:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcJN_ZZLnx8TuhoXYV1DAKK9NsXjH2M0xAdn9JTS16wA@mail.gmail.com>
Message-ID: <CAMuHMdUcJN_ZZLnx8TuhoXYV1DAKK9NsXjH2M0xAdn9JTS16wA@mail.gmail.com>
Subject: Re: [PATCH crypto v3 0/2] reduce code size from blake2s on m68k and
 other small platforms
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, wireguard@lists.zx2c4.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 Theodore Tso <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>, 
 jeanphilippe.aumasson@gmail.com, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 16 Jan 2022 21:10:46 +0000
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

Hi Jason,

On Tue, Jan 11, 2022 at 11:05 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Geert emailed me this afternoon concerned about blake2s codesize on m68k
> and other small systems. We identified two effective ways of chopping
> down the size. One of them moves some wireguard-specific things into
> wireguard proper. The other one adds a slower codepath for small
> machines to blake2s. This worked, and was v1 of this patchset, but I
> wasn't so much of a fan. Then someone pointed out that the generic C
> SHA-1 implementation is still unrolled, which is a *lot* of extra code.
> Simply rerolling that saves about as much as v1 did. So, we instead do
> that in this patchset. SHA-1 is being phased out, and soon it won't
> be included at all (hopefully). And nothing performance-oriented has
> anything to do with it anyway.
>
> The result of these two patches mitigates Geert's feared code size
> increase for 5.17.
>
> v3 improves on v2 by making the re-rolling of SHA-1 much simpler,
> resulting in even larger code size reduction and much better
> performance. The reason I'm sending yet a third version in such a short
> amount of time is because the trick here feels obvious and substantial
> enough that I'd hate for Geert to waste time measuring the impact of the
> previous commit.
>
> Thanks,
> Jason
>
> Jason A. Donenfeld (2):
>   lib/crypto: blake2s: move hmac construction into wireguard
>   lib/crypto: sha1: re-roll loops to reduce code size

Thanks for the series!

On m68k:
add/remove: 1/4 grow/shrink: 0/1 up/down: 4/-4232 (-4228)
Function                                     old     new   delta
__ksymtab_blake2s256_hmac                     12       -     -12
blake2s_init.constprop                        94       -     -94
blake2s256_hmac                              302       -    -302
sha1_transform                              4402     582   -3820
Total: Before=4230537, After=4226309, chg -0.10%

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
