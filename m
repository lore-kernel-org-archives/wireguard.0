Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1203C27C79
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 12:32:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4fd55de;
	Mon, 17 Jun 2024 12:32:24 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 293539a0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 12:32:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42189d3c7efso44656605e9.2
 for <wireguard@lists.zx2c4.com>; Mon, 17 Jun 2024 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718627541; x=1719232341; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1o1dlSQQVXm3fTaMaR+tlZ3T0U74blj9oHKevowjOJ8=;
 b=cLYM336VO20jDVEfEkJdryh3sJZ/5cF3Z+cbQ+d/Alxme78PEAI6NZdDTAV/GEL4v5
 gEe1Z7l6p1BoJocdY3VQxw4kkWEtfaHjBkU5X1XN5WCLiCnWxzQ+vG+yGWEm01wa6uw/
 jhU89+Z+ND0yrPW7UbK30lcXEs6EY9RnDMZIEHkAcPK0rOSxJLfnCbt7PuWZdiIQBTJT
 B4f8w26uAQXbGxtJRSL255PE/NxA3WgBv0/PHOAZBMZHI0JSLLAaMU5bhmE1o4/Pg01Y
 RdMKeaIpjVXinxYndG/V/tIf7jyy1u2aTCjq28OW1pPZIj4PrpD4ry+61bwLv2jFPH5+
 ZSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718627541; x=1719232341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1o1dlSQQVXm3fTaMaR+tlZ3T0U74blj9oHKevowjOJ8=;
 b=qYAglslm/zykxsDz1OnzxhprUDG/uliRwpwddaYCD9sQnXNnj+hxyETs+PHB27/CzE
 ht5FqDadPQS8gPugHYBKkig7rx5PyhLbZAKhhiUsMZmP8YbvUaY2UcxrTeCpryUe8IdL
 y5rkSulJj7vr4gH09S5rgHLxIoO7pRtqCVtV/Fp5IzgWu/gt4Qjtk5HVnfVuPmjJSD/Z
 QLGmXtlA0t2FfrbEvaYALfkGs5edKexHuSH6ozwgqndKV2m5lc2vElby6DJL8JAdZs1A
 qeW/AXO3szp6EfiHE/2pljVZD7NB7wMr+0xKFtYnCeLVSib/2IURdhnjp7X29vn/j3+J
 LxSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ5Ni5kdOtnRWDi5K9dO7H7MXqOtz7dcjtY810+miMVyfYUjaXb7rs42KycMFr9nXv94ie/j18pNqNc5atbl7F+n53sSLfxkHO
X-Gm-Message-State: AOJu0Yw7GXjcjd3A3VzMdKusH7gVzY0hjNPi8dpOk+Ram/CfUwvtmxPv
 nHBBuk916IWOzW2tjtKDFFsZVJ9Iev1z/vOHjvtb4UAfpv2+MlW2
X-Google-Smtp-Source: AGHT+IGzRJdq+S7NCMhwu+BgbdycTDUmQlpxLAVmL5EJvpN9wFbIyo8Dfoc6H1Pia4HZpXqmc3clxg==
X-Received: by 2002:a05:600c:3589:b0:423:6b7:55de with SMTP id
 5b1f17b1804b1-42306b75a55mr82010795e9.6.1718627541213; 
 Mon, 17 Jun 2024 05:32:21 -0700 (PDT)
Received: from [192.168.1.99] (93-48-172-72.ip258.fastwebnet.it.
 [93.48.172.72]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-422f6320c70sm157548185e9.30.2024.06.17.05.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 05:32:20 -0700 (PDT)
Message-ID: <4940a8fd-6e87-49a4-83e0-8daa69e7a68f@gmail.com>
Date: Mon, 17 Jun 2024 14:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Mini PCIE HW accelerator for ChaCha20
To: Antonio Quartulli <a@unstable.cc>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
 <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
 <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
 <f0279e84-9425-4bfe-be3c-009217bf24f8@online.de>
 <cd332c8e-96c7-49e7-9632-066327a009af@gmail.com>
 <ce8cd757-3df9-4a71-818e-ae2eda6c9690@unstable.cc>
 <ef44089b-1060-458f-906b-45fe682c6a10@gmail.com>
 <8f366adc-89a5-4b81-9a4f-8bcb1d08aad3@unstable.cc>
Content-Language: en-GB
From: Germano Massullo <germano.massullo@gmail.com>
In-Reply-To: <8f366adc-89a5-4b81-9a4f-8bcb1d08aad3@unstable.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 17/06/24 13:42, Antonio Quartulli ha scritto:
> Hi,
>
> On 17/06/2024 13:08, Germano Massullo wrote:
>> Il 17/06/24 11:45, Antonio Quartulli ha scritto:
>>> Have you tried running the test between a client, behind the omnia 
>>> turris and the wg server?
>>
>> Do you mean a configuration where the Turris Omnia is not acting as 
>> Wireguard peer/gateway? I could do it but I prefer not
>
> No no. Sorry I might have used the wrong words.
>
> Basically you should keep the wg setup as it is, but instead of 
> running the iperf client on the turris, you run it on another host 
> that uses the turris as gateway (as if the turris was the gateway of a 
> LAN).
>
> This way the tunnel is still established between the turris and the 
> server (which is what you want to test), but you move the traffic 
> generation to a different host (which is most likely what you will 
> have in a real scenario).
>
> I hope I clarified your doubt.
>
> Regards,
>
>
Got it. That configuration will not improve the throughput cause the 
reason why I started this benchmark is finding out the bottleneck in my 
configuration, which is very similar to the one you described
