Return-Path: <SRS0=hzHk=FA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87A0C63777
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Nov 2020 09:55:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC1420DD4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Nov 2020 09:55:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=maidenheadbridge-com.20150623.gappssmtp.com header.i=@maidenheadbridge-com.20150623.gappssmtp.com header.b="prAovWNv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC1420DD4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maidenheadbridge.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce411581;
	Thu, 26 Nov 2020 09:48:49 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 710b8886
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Nov 2020 08:47:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id d142so1353336wmd.4
 for <wireguard@lists.zx2c4.com>; Thu, 26 Nov 2020 00:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maidenheadbridge-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=f1sJBhVgWCG7R5+8qJgwBge4ctCBgZocIoo6CKV9bwo=;
 b=prAovWNvO5arE27FLpUPK74Tge6eW0bmFvuD0BJTjn3eWnYBJzRVSmD2tBSlrmQeLS
 Q0F+96x9CIgu+ZWaM5BK/gPWjdiHz3EV6uXxGD3Q80fXmwEIQjc/yPX4b3tmKf+hm4O6
 B0gDuoRPqPDgSpS21Eg/c4DTFdWcHBWYXvB8KAuhuy04W0OhW2E2GFjozP2WOAXIYyQ6
 4yNojG8E3Cvp8yOalhUmbtmi6SzOCgZzoM4C/ojErbdQni3x4hWRT1Jn155BDC6S+8Qd
 CVHX7goQdRj9GjAjIeUy0yQtQpgNRFskrOoCWoPqhMj9BG0ahD9Ri+TQnSQXMG0hU2lx
 MDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=f1sJBhVgWCG7R5+8qJgwBge4ctCBgZocIoo6CKV9bwo=;
 b=hAGY5HmDt35kwYdaS2nMjTDUAlz9ZjGZ2J+DMKmoQHSqOxVkxPaacesKtqW16pZGIK
 0OZ3hvaYaZj6puY60ZByOyiYKEvzAH3GB8Cabct4iGH2WJN5/CP6MmkFs6WopU/2QCt6
 WNPfHaI6D/1WgueLoxCGkUwrFE4YMttwz0RM0NVvcuRqoYEnlZqejAIBcaZTcFg/sWqI
 UzyS2RuC39hSwbBLTtXTE+eLesfZSngNBzbKIr+NjeMIR1/aTmCeZxRFNeJMMQyqPASy
 yWoGwgyHtmZOF9RC6Znw1EDAPlfyPACYOTRjADx/e58CcQY6LtXGPDVnqnGCOVLslWHD
 LWcA==
X-Gm-Message-State: AOAM532SIC8yELEX9VtnRkM+xvLmYGDv8d1fdRaydArLTv/mq5MZUOY5
 YEwYIaK+V9QvsXd+upLoTYHL2G7kHynxNvSs
X-Google-Smtp-Source: ABdhPJyt4tI8bu6GWChFjiBA5M9HuruUz0AIn69F5CJsuBWxXup/uzeUBGfO2hcotLroUGJmhiiIYw==
X-Received: by 2002:a1c:3b87:: with SMTP id i129mr2190537wma.134.1606380797578; 
 Thu, 26 Nov 2020 00:53:17 -0800 (PST)
Received: from [192.168.1.140] (82-68-6-78.dsl.in-addr.zen.co.uk. [82.68.6.78])
 by smtp.gmail.com with ESMTPSA id w186sm7769353wmb.26.2020.11.26.00.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 00:53:16 -0800 (PST)
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Clint Dovholuk <clint.dovholuk@netfoundry.io>
Cc: Riccardo Paolo Bestetti <pbl@bestov.io>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
From: Adrian Larsen <alarsen@maidenheadbridge.com>
Message-ID: <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
Date: Thu, 26 Nov 2020 08:53:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 26 Nov 2020 10:48:44 +0100
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

One thing that is commonly implemented in other clients doing tunnels is 
the detection of "ON / OFF Corporate network".

Without any user intervention, the vpn client is capable to detect (on 
every network change) where the user is located and to active the client 
or not.

Values to detect are a combination of:

(usually you can do AND / OR of this values)

  1- Adapter domain (i.e. contoso.com) . This comes from DHCP values 
received.

2 - DNS servers IPs

3 - Hostname vs IP. (This is to create a local DNS A record on your 
internal DNS server that is resolvable only when you are ON corporate 
network and not outside)

The detection of this values are platform agnostic. You can use it on 
any client: Linux, Windows, Mac, etc; to detect when turn ON / OFF the 
vpn client automatically without user intervention.

Best regards

Adrian


On 25/11/2020 21:42, Jason A. Donenfeld wrote:
> On Wed, Nov 25, 2020 at 7:04 PM Clint Dovholuk
> <clint.dovholuk@netfoundry.io> wrote:
>> Out of curiosity - why not just use " S-1-5-4" Interactive - " A group that
>> includes all users that have logged on interactively. Membership is
>> controlled by the operating system."
>>
>> If the user logged on - let the turn the tunnel on/off?
> I guess that's the same argument as, "why doesn't Microsoft let users
> twiddle around with adapter settings and IP addresses if they're
> interactive?" Apparently there was some imperative for having control
> over this be more fine grained, so they provide the NCO group. Turning
> on and off WireGuard tunnels seems akin to disabling and enabling
> network adapters, in general, so linking the two seems coherent.
>
> More concretely, some folks are deploying WireGuard in a much more
> restricted setting, in which the end user has no control over when it
> goes up or down; that's all decided by some remote service out of the
> interactive user's purview. For some high sensitivity applications,
> not letting interactive users disable WireGuard is desirable. For
> other applications, it's the opposite. The NCO group seems to fit the
> level of granularity we're after.
