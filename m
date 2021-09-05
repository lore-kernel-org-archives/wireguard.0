Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3531AC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 20:27:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4190F60F92
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 20:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4190F60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 687cd65f;
	Sun, 5 Sep 2021 20:27:29 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b7e5442
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Sep 2021 20:27:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i3so3141239wmq.3
 for <wireguard@lists.zx2c4.com>; Sun, 05 Sep 2021 13:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ro8kReNcyTWlZTzjykMDF1FAy+bnIKxVLEn/WNN4lOk=;
 b=dYd0x8fuWEJJA6sCi9mmdqtywXk7E9/BeCZU2tNftGqMA3VSMI2y/VEHUKsd9XG4GB
 3DNheK1NjKT+q+JDcz99ta/deA8yTJ4px1az998Jnt/1kT9fX3TzHcQ+is+ZQXpqFkLr
 qzJ9MkxJDVMEzG419DFFIhTbete/+9s2GV7EHAaICfL9FxccW1T7m8uaElBIR0twoZSI
 xRhrWZRirlIuUevxyAySKZ7C3gbM3RF/2L7b1zBD96HpLwnWS28U6fZXnpDjRnssxD8J
 +Xpg21JMKdy6VOjIYvlvVTpVe8NFqLi8P6QdyZtAdP3hVTXAjs+XsZYLK7HU3dFnzRyz
 CvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ro8kReNcyTWlZTzjykMDF1FAy+bnIKxVLEn/WNN4lOk=;
 b=hqea7kGP7uBAWPwiSShuYGGu3CVUnnmfHMaEcF+YAujatLhucXICXYSdEki0j2z57j
 B+2YQUiGWlgNV0UUIRnJ2pmk81WZxBJJ0dbYN88UZONzBRuXLe6S++VgRWwz7QHYskSq
 YI/3A+LuFI21VZzD0LYuAynV+0a/qRpR7UDzf2W/LA8KRs9Ucg6D/T5KppzOVR8tmFyE
 MHB+06qwOmsuW2Z6YQ52FwCuI8p1KJfUhFmYzxKq/LoLFvpS+vAPeKbfoXyVzm0bqYNz
 EN5rs6RVnpNq0HHOMSA6ogam5TXIatunCvPfsaCgovVVbOOgiY2f2QJXqob8tYCLwIDF
 vHPQ==
X-Gm-Message-State: AOAM532g1fTqtt3Fm7Bk6FRn3wxYqKs7JO/CSjX5LOfaRgyLPYfA4Gqs
 5LsKpiJPBDoPNsppz8r0VmGaY/cuTWjk0Q==
X-Google-Smtp-Source: ABdhPJzmcBZjhWFW4l/2KwZjcg+B+bD1hUDp/MisRhCIkzS27zrdB2Api1Rv2uEVLb1Wx7Xhp+cx2A==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr8131728wmb.11.1630873646798;
 Sun, 05 Sep 2021 13:27:26 -0700 (PDT)
Received: from [10.0.0.46] ([92.63.55.105])
 by smtp.gmail.com with UTF8SMTPSA id q4sm5864322wra.43.2021.09.05.13.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 13:27:26 -0700 (PDT)
Message-ID: <57e7c370-026a-1456-496f-cf069d392772@gmail.com>
Date: Sun, 5 Sep 2021 22:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Subject: Re: Strange behavior when a peer has the same key as the interface
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <c538301f-980c-99c9-4857-65867127aba3@gmail.com>
 <CAHmME9p0hTuYXar6LN2GyjF64k62z9vcokOE6La6eW-H06NVow@mail.gmail.com>
From: =?UTF-8?B?Vm9qdMSbY2ggS8OhbsSb?= <vojtech.kane@gmail.com>
In-Reply-To: <CAHmME9p0hTuYXar6LN2GyjF64k62z9vcokOE6La6eW-H06NVow@mail.gmail.com>
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

> This is by design across all implementations, so that multiple peers can share the same stanzas after the [Interface] section.
Does that mean it's unfixable in the meaning you cannot detect it and 
return appropriate error?


While being clearly my mistake, it took me multiple hours to understand 
the problem instead of simply getting `cannot set peer foo as it already 
is a public key of interface bar`.

