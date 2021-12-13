Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2803CC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 16:42:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4402a872;
	Mon, 13 Dec 2021 16:39:29 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 34bc8c90
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 16:39:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so11997021wms.3
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 08:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Oc5GE9jEiJTWMFxEvwdVqaWvI4oL9p54G19XCnDeonw=;
 b=JbsOzf9jPubZiI/Dzwy9sNaWS2saU0equHjlY7Na6Q5hWpke5S/GmAj1+is6Ng4vIH
 ByQaaogAMMyoROXeNqwGSKlqiPtQpVa1iNOgG03TmMRsAxhvvF1Ts2V2qeoXUDpZEr0I
 rI5Lp5J00HqOfUKP6BR96MZgY1f5IpuTr+A/L/MCNck2I6d43VOsplam2PpQKeewu+hy
 yjTXFOMqWbuBvLJJpG0b2vIyK0EPY3Y+AlBT7rtTeSJnEGl8tmBRJ2y466KkXvEpWQXo
 cux2gpFGA2ia6fTgvwVNuJQsm94FTzntH2ucMW4prvwEk6/CW/l/u32FL+5B12rlkb4T
 /lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oc5GE9jEiJTWMFxEvwdVqaWvI4oL9p54G19XCnDeonw=;
 b=QmuDAJOmuFFTxm2h0dzSDgYMJypuePEpJ+Gw5GCcoinN7skGhVoMh2BjFLSaE1KZjh
 XiiavEDO+KfbJJnZtcyo9Oq+tXQcK1o7wIx8uw0k4XSpPby3CIM5me+5opVu9gw1UsOb
 alvUVvlcg1wSLw3CH+vEPymHJjHO9AaX+J7xKHoABdN1phr/ONvUF6+ph8xBRmaafpwC
 +yzkWhKpTk5gnLXxIb57V7v8WZroD2RrZe+k91T4UfA3AcIHvlQuYrCLQ/ywJBakZ+d3
 rPHiGffq/yXa9FoImuf4fH2HfrvHgWZD7CuGPFdRdC2abkHNetdFLion8vnqex94rxmA
 eYSg==
X-Gm-Message-State: AOAM5305wTKzHLsZAjGch3u486TmvwVbU2m8bNxUM7gik1wuTzNPn96w
 V6+Wu9c9EuISMHWlryRIJL1hEZJ5X95DCQ==
X-Google-Smtp-Source: ABdhPJz4wkbDOIRtJzRsndDTFGrE0GingKg8tXTyKe0AnRo/uR7wmDlWFjGJmWdjCofepWVNusMkLQ==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr38238825wma.162.1639413567708; 
 Mon, 13 Dec 2021 08:39:27 -0800 (PST)
Received: from ?IPv6:2003:f6:af02:e900:e406:554b:c2af:e2f9?
 (p200300f6af02e900e406554bc2afe2f9.dip0.t-ipconnect.de.
 [2003:f6:af02:e900:e406:554b:c2af:e2f9])
 by smtp.gmail.com with ESMTPSA id v9sm9254505wrb.107.2021.12.13.08.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 08:39:27 -0800 (PST)
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Aymeric Fromherz <aymeric.fromherz@inria.fr>,
 Karthik Bhargavan <karthikeyan.bhargavan@inria.fr>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <3a1be638-4ddd-44c0-87aa-56cd26f4f396@grsecurity.net>
 <2026222873.1815432.1639405220767.JavaMail.zimbra@inria.fr>
 <fa249625-2698-3890-7e39-9273072810b9@grsecurity.net>
 <CAHmME9pC=eVFq-4eiU6iFVGOqZfr7RgniAP7H5YGBXDqc7W9jg@mail.gmail.com>
 <ffb81284-53e4-dc94-75ec-d31b6a79f269@grsecurity.net>
 <CAHmME9oh4Zx01E-+5S3Ds6mj6tVhJj81sTnSreDAujaFSX1u_Q@mail.gmail.com>
From: Mathias Krause <minipli@grsecurity.net>
Message-ID: <d52c29d2-3530-e2e9-7096-77da1eb21078@grsecurity.net>
Date: Mon, 13 Dec 2021 17:39:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9oh4Zx01E-+5S3Ds6mj6tVhJj81sTnSreDAujaFSX1u_Q@mail.gmail.com>
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

Am 13.12.21 um 17:33 schrieb Jason A. Donenfeld:
>> root@box:~# ./run.sh
>> [+] Setting no-turbo to status 1
>> [+] Setting non-boot CPUs to status 0
>> [+] Inserting module to run tests
>> insmod: ERROR: could not insert module kbench9000.ko: Unknown symbol in
>> module
>> [+] Gathering results
>>                  ever64: 115100 cycles per call
>>            ever64_out_r: 115080 cycles per call
>>           ever64_out_rm: 113957 cycles per call
>> [+] Setting non-boot CPUs to status 1
>> [+] Setting no-turbo to status 0
>>
>> Slightly faster.
> 
> Huh, that's actually a pretty nice speedup for just changing register
> allocation... What CPU is this?

It's an "Intel(R) Core(TM) i9-9900 CPU @ 3.10GHz" But shouldn't matter
all that much, as the inline ASM is integer ops only.

Mathias
