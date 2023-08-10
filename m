Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9214EEE49A3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 16:07:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05b384b6;
	Wed, 23 Aug 2023 16:07:14 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 170b7a8e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2023 14:50:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe45481edfso9686025e9.1
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2023 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691679032; x=1692283832;
 h=content-transfer-encoding:in-reply-to:autocrypt:to:content-language
 :references:subject:from:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nb2n0uv595eFjLrEgpvsrMrshNYI9uMInfb2ta5izuM=;
 b=Hrxhg8MkKaRh9ic1Tqtvf98KQ4pwuU9EXocqQbWd32vVs5yToh922gRjmOkcz+gn7K
 1YPgFlmbhd4+ZO9THVwNWBuzIuNdIVqHBV9MMqTbkW/LS6CAFR/gJwDt58G2Fr16M0LB
 F1O/ZhPyjsICTR0xpYqZdMfP6+9PRotQ7mIpBHOPBWXJ6daygUbtanSTpB4rCWJuhODu
 urhqp1/C2lNlFpLVNFgv75/8p+Zz1PtSNehc82wgcxQK4C2NQfhu/Q5C6eLp/2ZiHq6j
 DeHOAkvm+qokIDLNh4GSuyOVMZP/8vWH+RQf69zkpMyH/ZtKydfzCnL9cVtf7DyaZmKY
 a5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691679032; x=1692283832;
 h=content-transfer-encoding:in-reply-to:autocrypt:to:content-language
 :references:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nb2n0uv595eFjLrEgpvsrMrshNYI9uMInfb2ta5izuM=;
 b=bYVx5ob7GorKpdsUTTOL+2153bXVIdwR14Uza9K3rVZhQnmxczMoil2emQTpSBr4CM
 sNsKrgqV2dEF6IGAFV9tATXYa0D6WRBJgPVbtpS/Nv6dD/jHoCvseZemsFb07GefM8pb
 5S+QEdqHyZfC0P88S2NW2fnc8XiRzQb+cKnwTddFC2pfQvkAu2tdWgFJizUzGDmZv2gH
 RJBATNdlxCWcfXtAtBN2L2cKHtI5PqiRe8H4Ys7PfJ7SKe48M3z7itRU8m90P4B8ymrC
 vRUdmKtMukRwxHNq1gg/amxImp3i0VQIsKOeNjVfN9BXcAJRdOldC2bsqn2uGbxoSVY4
 Iuqg==
X-Gm-Message-State: AOJu0Yxj18R8hA6JvGDcYJQ6y07rW/+upUNZMzXKKAhkxAZ+1uDBqCD2
 YmGwohleZF8t8TC3oj38UiSgqPL44SI=
X-Google-Smtp-Source: AGHT+IFkPq2HRtbYQWf4aFpaoikoIN/xmnlik0o7uVUC0jh67Or6nR+qiV/jmX/oEReVstwj6fJqdQ==
X-Received: by 2002:adf:db42:0:b0:314:ca7:f30b with SMTP id
 f2-20020adfdb42000000b003140ca7f30bmr2159197wrj.54.1691679031884; 
 Thu, 10 Aug 2023 07:50:31 -0700 (PDT)
Received: from [192.168.178.23] (94-33-27-97.static.clienti.tiscali.it.
 [94.33.27.97]) by smtp.gmail.com with ESMTPSA id
 n11-20020a5d6b8b000000b0031417b0d338sm2384751wrx.87.2023.08.10.07.50.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 07:50:31 -0700 (PDT)
Message-ID: <83adf492-e8b7-40e2-95c8-76a72cff69d4@gmail.com>
Date: Thu, 10 Aug 2023 16:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matteo Franzil <matteofranzil@gmail.com>
Subject: wg-quick down not reverting DNS parameters on MacOS
References: <7cde2e10-b27d-0502-1b97-bacdbd9dd4a4@gmail.com>
Content-Language: en-US
To: wireguard@lists.zx2c4.com
Autocrypt: addr=matteofranzil@gmail.com; keydata=
 xjMEY8EjPRYJKwYBBAHaRw8BAQdAhzoO6y/vPyGYJPS0NxQCNULJz0okRfqlQMlwHTc49HbN
 KE1hdHRlbyBGcmFuemlsIDxtYXR0ZW9mcmFuemlsQGdtYWlsLmNvbT7CmQQTFgoAQRYhBAOT
 QK13jrIGsd9oot3F++7X6lOGBQJjwSM9AhsDBQkDwmcABQsJCAcCAiICBhUKCQgLAgQWAgMB
 Ah4HAheAAAoJEN3F++7X6lOGvZsA/1KsW3IWN22bXh2QJeeZKi4SnzSqRzkPzroCGvEu9szO
 AP9qzJeGAfdyWZNwE9UGQIt8HbCgqkVxkK0jFseE+ONlCs44BGPBIz0SCisGAQQBl1UBBQEB
 B0CmkNrtiqdN2xYTHoYD68ulpwcl05oR3a0nDtsV2pGwKAMBCAfCfgQYFgoAJhYhBAOTQK13
 jrIGsd9oot3F++7X6lOGBQJjwSM9AhsMBQkDwmcAAAoJEN3F++7X6lOGyAoBAPbsUUokpTdP
 x3WyIwxLK5yxc2eRMZuVOaUBoWR+/IfYAP4596bjzGp0vW7XjQA6gzI4cgwhK3yjgsQrfYib
 BP7CCQ==
In-Reply-To: <7cde2e10-b27d-0502-1b97-bacdbd9dd4a4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 23 Aug 2023 16:07:07 +0000
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

Hi!

I extensively searched for any discussion on this bug (or at least, I 
hope so), which has been bugging me for a while.

I am a Wireguard user on macOS Ventura (version 13.4.1 (c)), and 
installed wireguard via the wireguard-tools (version 1.0.20210914) and 
wireguard-go (0.0.20230223) commands on brew.

Assume I have set my DNS servers either via GUI or via DHCP (doesn't 
matter how), and I use wg-quick to connect to a wg conf file (also 
irrelevant what is the target server).

The moment I:
- use wg-quick to bring up the VPN,
- put my Mac to sleep,
- reopen the lid,
- use wg-quick to stop the VPN,

then DNS servers are not updated back to the original value, and instead 
stick to what the previous VPN configuration had commanded.

The workaround is just to verify what DNS servers are set with scutil 
--dns and cat /etc/resolv.conf, but editing them is a pain. I often work 
with an open VPN and closing the lid without remembering to turn it of 
is common.

Let me know if I also need to provide further details.

See also this GitHub issue, which was posted on an unrelated repository 
but perfectly matches what I have just said:

https://github.com/StreisandEffect/streisand/issues/1334


Matteo

