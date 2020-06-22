Return-Path: <SRS0=kilO=AD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C51FC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 13:15:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF9DF2068F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 13:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iggVLvI2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF9DF2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61e6f406;
	Mon, 22 Jun 2020 12:56:51 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8f80ba5a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jun 2020 12:56:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q5so4242674wru.6
 for <wireguard@lists.zx2c4.com>; Mon, 22 Jun 2020 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=5yVT4cpyKt5o2dtMv240iilWy/raCW97ukxK5g70JUQ=;
 b=iggVLvI2lB4mRRNE4IK7iod4IeNO8fbGaMImQ+DD4y1pRuhQ70jcOvcNgNsGGQdxGY
 7C5vT+fWu3YfLvU+Qw+GNxSqzXq52ceqDFom1P5azIy1YZmqq7EW0OM0BQOyUdTqUZvV
 liYRX15j9F8CFPFLW6URviZXNtuqAYlRybGGyOW2SGCreP6gBtTtTh1kP/M9XGPdh+DR
 7eWpixkQmObI6SZ1kBmU4TC5JEvhstdNoLNzHtMH0A60jgdB03EtrB37dSHVreQfITES
 meLpJmB8PGm9S5bqdG9byjy9NKz/Iih6njM9Q29s7uAd+p9dhISbamGcWYIOjwaIc91Z
 4Tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5yVT4cpyKt5o2dtMv240iilWy/raCW97ukxK5g70JUQ=;
 b=GgI0knZT69MjBjHqMN0GPAeEsYgcTZlYcfx2KN7BK3cmwN+gqx1pY490nLidO2QyGY
 pZqp5Mlsuw+yrY0/mXHgzZMdDiIUa9t93bBtto7v3B1mE7qNeaLYysLyKbb0/CriQ+nR
 D8qd+Sranm/d7avU78BcltiENHhn1PXoev5QieqXxzrpdkn+I2DCM43lSAboz6GDdbky
 yTqE2NmXxZ9HqRSVzfqLHHXsolZNRyqn32O+NC9i0NNgazaXM4n05U+ullkoDdMm13CC
 IFq2kA8dpDENN8BfZOtQhr9F02pz5jgXnWTBehwyBVlgoDoapm4KL3ndk9wD42JT8uzr
 KkqA==
X-Gm-Message-State: AOAM530Mcz8TP2MoRVOZV2xGmG0eWhGt6W72+BqKaiJ6SDasRw6zk8uA
 ffl8Wb6qvL9V1C0757wO8a4B577h
X-Google-Smtp-Source: ABdhPJyajpd9RgnjD8iONT8paKTWkpWZWxBLVqqr/6UnnfOvkNPwLXW0YO3gHURExVSsGv4otj25og==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr10587675wrq.343.1592831729761; 
 Mon, 22 Jun 2020 06:15:29 -0700 (PDT)
Received: from [192.168.25.202] ([2.25.87.121])
 by smtp.gmail.com with ESMTPSA id v24sm20518522wrd.92.2020.06.22.06.15.28
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 06:15:29 -0700 (PDT)
Subject: Re: Wireguard over VPN broken on windows
To: wireguard@lists.zx2c4.com
References: <CAN5wt5r_qoLFrZM6T2CJ6UhQpcqFTqf5AHUugpe0rN5LuL3YLQ@mail.gmail.com>
 <CAHmME9pfyKr62RrAmV81NKs938CmQbqRtcab=yJzKw9V8iMc1A@mail.gmail.com>
 <CAN5wt5q4iW07HcJE2GGWuEAwtiPKOUarNTiDGWyHJ6kOCNWA1g@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <130dfa72-527b-0a51-0465-47956fb56c56@gmail.com>
Date: Mon, 22 Jun 2020 14:15:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAN5wt5q4iW07HcJE2GGWuEAwtiPKOUarNTiDGWyHJ6kOCNWA1g@mail.gmail.com>
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

Hi

This has been a problem for me which I have only managed to overcome by 
using the Tunsafe client to connect over the VPN to my Linux Wireguard 
server.

I need to connect Wireguard over a PulseSecure SSLVPN. Wireguard 
attempts to connect but then gives up claiming to have received no 
handshakes. Tunsafe works fine with the identical configuration file. So 
it's not an insuperable problem!

Thanks

Peter

On 22/06/2020 11:56, Christopher Ng wrote:
> it worked for me on a local build, it never worked in any released version.
>
> i've been playing around with a local build, if i comment out the
> device.BindSocketToInterface calls in defaulltroutemonitor.go,
> everything seems to work fine.  in a single config i have one peer on
> an OpenVPN interface, and one on the default interface.  both are
> connected, i can ping both peers over the wg interface.  why must the
> socket be bound to a particular interface?  or perhaps i don't
> understand what those calls do.
>
>
>
> On Mon, 22 Jun 2020 at 09:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>> 59e556f on wireguard-go breaks
>> 59e556f fixes a regression, which never shipped in any release. There
>> is nothing here that "once worked and now doesn't." What you have in
>> mind has never worked.
>>
>> We're currently using IP_UNICAST_IF on the wireguard socket, attaching
>> it to the default route. I'd much rather have something like Linux's
>> policy routing and suppress_prefixlen, but I don't know how to do that
>> (yet?) on Windows. If you have any ideas or want to do some research,
>> I'd certainly be very interested.
