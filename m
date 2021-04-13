Return-Path: <SRS0=j77k=JK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55543C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Apr 2021 13:01:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 159336109D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Apr 2021 13:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 159336109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 147c0073;
	Tue, 13 Apr 2021 13:01:30 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f334269f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Apr 2021 13:01:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so8123597wmg.0
 for <wireguard@lists.zx2c4.com>; Tue, 13 Apr 2021 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=QhgUY5vz1Iq2P3ksUhKwJhauGt2VcuQ1T0a43I9VFLQ=;
 b=Xc3zXLWS9WSvlSFNinl12h5DmKvQ97fM6U27PSoIjmpI43UGZtx8RcPA3GkwgvHrpd
 OXNdrYlWmgjq4xbQ1XkKQbcukgXb6vH3ZW4TEinVC1mVVnZNL45HFsG13KRS0l9DIxar
 2fsru0TPpwpEnHOJrdbMKKpvdrCZJ+Vz3U9K6kgDESdxXAw9+4sm76jMv41lDBtHvdLr
 XM1WciJlOlO5wXYwKHlur5GTDcHZYmJJSrDQUT5EM6nxiLImU3L+Lin/usKOHin4zksd
 TcjJN7nnQoBk0kl/QNMXxPWPul7ux1K6Ma1YgBs03x8uCszT4FVVkt3pBIlfPMXd1vZC
 vV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QhgUY5vz1Iq2P3ksUhKwJhauGt2VcuQ1T0a43I9VFLQ=;
 b=dAz9p10K9AGBnl+LFMC3CldCXHNypk648byHL97TdXvVAi9ijAlofp1ZIb+MNQfwvb
 /A2do1aAwGqgj6qxdSm+tANAkHXizjwtdsaJfO17Dd6QA4ZDQNBUXIUUmdXYStTRIdo7
 D+9qeWVLT1Hi4UY8x9JsT9r1E9ZuDurKJhj1m6tSjZm89dwNmbdgEbmQb2omUjDUSvDt
 fRAi540xMRRmpq7P2/15sZ98MxAIDpOKqumvXxLlYnMp/YX07R9CQMHPZC1C7va41u6v
 Cd1qTwbAq8dEHm4j7eqLb7T2aJcvKbWXJqscHt5BSMQ1DBPw2vXaztwoM6FcFNQY5h3v
 WQxw==
X-Gm-Message-State: AOAM531ITOlm4UfstZSv8uQPedyxXT/eWSxfaaAzXGmjJ1NNXtC+A8uX
 aB0GCGcllL2JW0OfcWa6HEMDZ3OBpIM=
X-Google-Smtp-Source: ABdhPJwVkRlM3kilawb3gVkOIloUcykXujvYa6JnDMBCnVb6g2igcnhRCFfkvW7gaHHmHfTDwXtzKA==
X-Received: by 2002:a1c:cc18:: with SMTP id h24mr4001556wmb.23.1618318888624; 
 Tue, 13 Apr 2021 06:01:28 -0700 (PDT)
Received: from [192.168.25.202] ([91.110.152.181])
 by smtp.gmail.com with ESMTPSA id x15sm2450303wmi.41.2021.04.13.06.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 06:01:28 -0700 (PDT)
Subject: Re: WireGuard for Windows crash "panic: ring is full" since release
 of 0.3.10
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CALaUSusmdvz2XAT6c24023dZroTwVPKr0k7S+y6YVAXW1-ubJw@mail.gmail.com>
 <CAHmME9qYHttPgwranGbUS4ijQOde96Je-f2VAM94LMvsNqSfVw@mail.gmail.com>
 <CALaUSutUZSCEdLjkire-cJAymWU34r57yB=rJvYoUO+AdxF9wQ@mail.gmail.com>
 <CAHmME9rPV3r9iTBR97e-5D97ffUqqt_30PXkszBssAuO2azNmg@mail.gmail.com>
 <CAHmME9o_yJkAtoVQ58WBYDJwuD2Q3QntaYaGpOA63VFG8CO9fA@mail.gmail.com>
 <3e55e6c9-6446-3e8f-20bd-87986ad5f4ac@gmail.com>
 <CAHmME9qUXd1iFAbrMfEedaF9C300Tz8e_-B72=hBvEGrmd7cNg@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <3855f3fb-84ac-cc8f-4a16-3167ae90b381@gmail.com>
Date: Tue, 13 Apr 2021 14:01:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9qUXd1iFAbrMfEedaF9C300Tz8e_-B72=hBvEGrmd7cNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

Yes thanks, it's fine again with 0.3.11.

Regards

Peter

On 12/04/2021 18:31, Jason A. Donenfeld wrote:
> Hi Peter,
>
> Please let me know if updating to 0.3.11 fixes the issue.
>
> Jason
