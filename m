Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F47EC43214
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74A9C60E78
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74A9C60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d335471c;
	Sun, 8 Aug 2021 23:01:07 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8af776a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jul 2021 09:06:22 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id qb4so2135152ejc.11
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jul 2021 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=b1v390TnSwq5CINaDAMek1MTzRSfvQufGhCEEIWQpUs=;
 b=M30bhvSEAtX/kJGC6zenuyu85OnlTUxtdiKdj1GT/kmzDZylom88vyCDarMLWFLkbJ
 hoS/dTAai/pySuDxEzXfHDaIdxuQQlB76BFY+IMaR2qV6nVGkv6G9KpnrMwXa5PRZ5oy
 YswmnDGxM6DZmrAIUQy3ELsaHpguBxyb5uO33laf+Cda6yoLpmgSuxWIDRQK9DML4CAw
 2yYD0kB+hSbyqq0H5r0xq1xZDsPKPvxfwmIJue0GckJWCEK+awInZJYonOz01Gft6UIX
 ZJJiD22kWdIF9meeUrs8y9eNJHUkNZvE621NtHeXydip3TN68RYqYsk6YShkT/31Ueq+
 rUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=b1v390TnSwq5CINaDAMek1MTzRSfvQufGhCEEIWQpUs=;
 b=WLJjFm1BKNWVhPMGFLcSpQHzKN86kww/pgVzc36olyjtRNw87+F+WB56q72dKhYTNc
 dBXp2cctbPDn4zoO66P1ljM2BxvXL5+qnyO9z7llzGi0Um5anPbKi5FjdczdOvI2u7Ht
 Q2Tj06JmOCSzSeRbdEgxL48EQ9Gzm/muUMSHtn6I7wOdCRGT10nr0PXN6sn4XuPJJ+4C
 pnLU57UtA5wDlRV/3YfjAr5d27J5Jv4q3h9oD1JI5be/I3H9yr/Meq0zgQz/TFICzoPC
 cmfBOCP2vmCq9YNse3HkV+AxgAjtTDrIqpsOYUwwUBT0C01ZFqD446d0B8xir8cEOD+4
 E+Dg==
X-Gm-Message-State: AOAM532N3wruT6siNmhQNMD+9GaAvmjk7fujL0/1kbD+XCal0Gi7J+EJ
 bSNFlnwHT/3y7AsyZGUmnkUmT1ea2uc8+Q==
X-Google-Smtp-Source: ABdhPJz26N1z8jFAapwHS8zzlv8aXsHTkW/+ttiMutrezwtJPXFUsao5b1WRgqCN3XPkf38r8rzSrQ==
X-Received: by 2002:a17:906:a195:: with SMTP id
 s21mr11614730ejy.373.1626253581008; 
 Wed, 14 Jul 2021 02:06:21 -0700 (PDT)
Received: from [192.168.100.51] ([84.69.123.185])
 by smtp.googlemail.com with ESMTPSA id u5sm676041edv.64.2021.07.14.02.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 02:06:20 -0700 (PDT)
From: Simon McNair <simonmcnair@gmail.com>
Subject: Re: Android: more than one tunnel
To: Chris <wireguard@spam-free.eu>
Cc: wireguard@lists.zx2c4.com
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <296f17d0-3f0b-6021-7bb3-4b4bf576f6c7@spam-free.eu>
 <e8e94195-b1f0-df62-4393-929f20f762a3@spam-free.eu>
Message-ID: <b87f5a75-40e6-a55e-ae5c-74040748a624@gmail.com>
Date: Wed, 14 Jul 2021 10:06:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e8e94195-b1f0-df62-4393-929f20f762a3@spam-free.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Mailman-Approved-At: Sun, 08 Aug 2021 23:01:05 +0000
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

I think this is a limitation of android, not wireguard.


https://developer.android.com/guide/topics/connectivity/vpn 
<https://developer.android.com/guide/topics/connectivity/vpn>

"
There’s only one active service per user or profile. Starting a new 
service, automatically stops an existing service"

Sent again due to being formatted as HTML rather than text and/or 
forgetting to cc the list.

Simon


On Wed, 14 Jul 2021, 06:54 Chris, <wireguard@spam-free.eu 
<mailto:wireguard@spam-free.eu>> wrote:

    I have two distinct tunnels defined on Android.
    However, I can only toggle between the two. I cannot have both
    activated at the
    same time.
    I need both connections.
    Am I missing anything?
    Why not several tunnels with several wg servers???
    Why is this being prevented?

    BR
    Chris

