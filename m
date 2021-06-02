Return-Path: <SRS0=nrw4=K4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7ADC47083
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jun 2021 07:23:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36FC76101B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jun 2021 07:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36FC76101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a18befcf;
	Wed, 2 Jun 2021 07:23:15 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4cedbae8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jun 2021 07:23:13 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id g20so2448834ejt.0
 for <wireguard@lists.zx2c4.com>; Wed, 02 Jun 2021 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rfyB9xw2OLznDiyOvv7DR58C4Q98kqxLF2k4Q/X3Xcc=;
 b=hzs8p19HzBspsLF8hWSF9SWNtUAiL/Kxd7RW+i+le3Pz7oHkuEl8KR/G+drgbu97Gw
 FMkhYj79RtlAWVKYAJCjAfproqHP7Y7ojagBLt1HrmR8+WeLpdL+Wajr+R3QibHE0U2N
 F9J3qZryWaNoYdLZBeod03l8JuvYXtOks9y9mC7WihOVOC7myEicLgZu6SY6q5jkEFgT
 fy/BW+rtc0B4L0bpGbAzU4NoHb/astaZBrG/CdRvT7dXl/sARiLhP4HlHuFHUjZCl8m6
 b2u8FiI5pWCS/VoKi5Wqr2RilzaejUj2baQfNHdB0lUKcBGDEM0izEdpXjnDNQegpul2
 8atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rfyB9xw2OLznDiyOvv7DR58C4Q98kqxLF2k4Q/X3Xcc=;
 b=tadjHVQDW0/1Q9HKuyS45gBv6ufcsXQA4EwgU0W+So7kzMI2IgaY8OXJNlzbQHhSQV
 Voj1rrD2qAximi4jlzfQzgXzC0DehHAOwHO+obZ1Pc1FNcNzkAzqqW4EP8iDis/A9Tnl
 d67z+jq+s/MfS8cWt1JOXdOg0ia8Lk6SSxRQ0yZD2TZ5Rl8em3YxnFSk6pCW517c/ygf
 57ASrg489LxzTGEISqmgqo29Ygd+8EKPnsp2FdVDQJFQvSYckSrQCYsgErMrcK3wmsZx
 qCCPukI/tiYENqViDy0YcUQRxjDVvgkxBEKjFo5OAO5Z0W52dSoxTk70uCJaer5Tm7M0
 dTxA==
X-Gm-Message-State: AOAM531q4CycXGpu8BMFLNLnFTbEU49wtGYNUQRuOd/hLhRSdOsLvywA
 4L4vXejCLJOUFBaRsCb9zpEC+G3LCuYbgA==
X-Google-Smtp-Source: ABdhPJyz74nMZUgLXGL/is1Opt67OqwSt6a60P/AhWYBUOB2u9yE4OOKKPVlurhboL/71I2ZRhXhiQ==
X-Received: by 2002:a17:906:af7b:: with SMTP id
 os27mr18311413ejb.154.1622618593410; 
 Wed, 02 Jun 2021 00:23:13 -0700 (PDT)
Received: from hal.home ([86.126.22.60])
 by smtp.gmail.com with ESMTPSA id p15sm742182edr.50.2021.06.02.00.23.12
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 00:23:13 -0700 (PDT)
Subject: Re: tunnel no longer established :: how to debug? - solved
From: Adrian Sevcenco <adrian.sev@gmail.com>
To: wireguard@lists.zx2c4.com
References: <ef038c91-f2bd-9e05-f49a-c1700a0f25af@gmail.com>
Message-ID: <fa6a0663-22b0-01c1-ec29-3586e5e803e5@gmail.com>
Date: Wed, 2 Jun 2021 10:23:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ef038c91-f2bd-9e05-f49a-c1700a0f25af@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 6/2/21 9:36 AM, Adrian Sevcenco wrote:
> Hi! After a change of connection point (the same ISP but different location, but with the same wireless, and end-points)
> the tunnel no longer is established. Nothing in the wg configuration is changed ...
> from the "client" machine to the "server" end-point i can do:
> root@hal: ~ # nc -u -vz sev.HHHHHH 43333
> Ncat: Version 7.80 ( https://nmap.org/ncat )
> Ncat: Connected to HHH.HHH.HHH.HHH:43333.
> Ncat: UDP packet sent successfully
> Ncat: 1 bytes sent, 0 bytes received in 2.01 seconds.
> 
> How can i debug further to see why the connection is not established?
i apologize for the noise! the problem was a typo on the server configuration
where a peer was defined also with it's endpoint (dynamic) dns name.
this worked fine as long that name was resolving correctly but as soon as this
failed the connection could no longer be established.

Thanks!
Adrian
