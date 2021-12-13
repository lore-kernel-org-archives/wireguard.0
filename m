Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0D4C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 16:48:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b4a890ad;
	Mon, 13 Dec 2021 16:46:58 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 94c64da4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 16:46:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t18so28061115wrg.11
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qy5YPa1BGHfsk2ZniPwsTK6yHTzaqJoQPe32f9wf4cA=;
 b=qOMGwAk2gX3Arjpkv2PkrVdAiOMhnItyNn1T+BDhotHA5q4MlFv9lRtoEcebPvawWC
 VsCZIZg00QEHfebyhKJY3og6mqOg7fs5wn2swcbQU3Bm4d7hxLq95ovT7KAsdEu5/y0I
 tdd0sjmFF18tZoKe5ynw/AxfIgfouBOHvyMhDh+Qe7I+kI9o1TmSkSctlX5dYGB7yB38
 ll/UqayCJz767SMVyNdGnyO54VH/MRegLwdmBeTSlEnk2KVT6EQEk6Fe9jNQ2wYbC94r
 wP1MNxj8uj6mu8DSn+bYy6vDwsl88k4NIZXrkghhDE/VJc6cQadN8VwtMwtOB+KDlA3f
 sqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qy5YPa1BGHfsk2ZniPwsTK6yHTzaqJoQPe32f9wf4cA=;
 b=QWeuFAh9wiMpdZn6ILzR4rQRvcyQDcymyd4vnZMc5FUN2LjatIx2I2ozybcj51HFW/
 Sh9COhiZV7Zv9mEqbpMiS0FfeRhZXLn9YbPjNWe0BjgXOuq21bmSGDGA2wzYK1TYJHvN
 lVCpuonI0G2eyuT5F8S8pY9aD7CIyUclUBaygFbx6429eBkjOn/53pPxAfG4C8pstVOI
 6L3rkp2UsjmwtgR5WNvOTtqnAF+982I6+R/Thoa7tjbqF2NXA3mCRT7kwDj1yQrc/0l1
 +spcZgjEey9ZxFJKJ1uTEL9F6VJGHrDnBCpLOYIbtorRy8GjVwfAymUpM9S+hj9AhCgU
 Rg2g==
X-Gm-Message-State: AOAM5302e6b3admuWM2/pV7erbTne0xp7xhD8d+l/z9vaFCQHJMm5fC3
 Hpf9jZSL6mHBzS0+Dkh+p4PCvRMQL1CnxQ==
X-Google-Smtp-Source: ABdhPJyhyQGRJRkGA0hQ4V1HHBK7obpB05b5f9fstjAEQf3iZZufZO16eBuKmaztZztS+hlw5r+DNw==
X-Received: by 2002:a5d:614f:: with SMTP id y15mr33337517wrt.587.1639414016016; 
 Mon, 13 Dec 2021 08:46:56 -0800 (PST)
Received: from ?IPv6:2003:f6:af02:e900:e406:554b:c2af:e2f9?
 (p200300f6af02e900e406554bc2afe2f9.dip0.t-ipconnect.de.
 [2003:f6:af02:e900:e406:554b:c2af:e2f9])
 by smtp.gmail.com with ESMTPSA id f7sm9000994wmg.6.2021.12.13.08.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 08:46:55 -0800 (PST)
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Aymeric Fromherz <aymeric.fromherz@inria.fr>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <CAHmME9ppTs-jmmV9uV+C0jbtQC5a5RWO5zJB5_-dRD3BMjDZZA@mail.gmail.com>
 <d1921390-7fcb-a627-11ea-ce580214db63@grsecurity.net>
 <CAHmME9r8udYyD+R9PPyN15G4QKsm45ZH_UbYXAjXXDwuvvob=g@mail.gmail.com>
 <CAHmME9qJottk_hHxjPKF=5Ls2Ux5=9YF6pdy1pwbS3L4UKZbcw@mail.gmail.com>
From: Mathias Krause <minipli@grsecurity.net>
Message-ID: <13edfd3f-7645-085e-df17-836732225613@grsecurity.net>
Date: Mon, 13 Dec 2021 17:46:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qJottk_hHxjPKF=5Ls2Ux5=9YF6pdy1pwbS3L4UKZbcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



Am 13.12.21 um 17:29 schrieb Jason A. Donenfeld:
> On Mon, Dec 13, 2021 at 12:36 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Hi Mathias,
>>
>> On Mon, Dec 13, 2021 at 8:54 AM Mathias Krause <minipli@grsecurity.net> wrote:
>>> So, after importing Aymeric's changes into wireguard-linux-compat, the
>>> alternatives change is still needed. I can help you create one, if you
>>> want me to (we have that change in grsec anyway, just used named asm
>>> operands here, as the %0/%1/%2/... was rather confusing and hard to follow).
>>
>> Sure, I'll take a patch for that. Let's wait until Aymeric
>> incorporates your suggestion on the out param, merges the PR, and then
>> I'll reimport that to wireguard-linux-compat, and you can send a
>> patch.
> 
> Actually, wasn't so bad, did it myself: https://w-g.pw/l/LjOY
> Hopefully nothing to butchered in the process.

Looks good to me. Actually had to fetch the repo and use `git show
--color-words -w` to get a sensible signal-to-noise ratio ;)

Mathias
