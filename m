Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4A2EE4993
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 16:07:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2f824be;
	Wed, 23 Aug 2023 16:07:09 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7dddd85
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Jul 2023 05:29:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc54cab6fso28871765e9.0
 for <wireguard@lists.zx2c4.com>; Sun, 23 Jul 2023 22:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690176572; x=1690781372;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nb2n0uv595eFjLrEgpvsrMrshNYI9uMInfb2ta5izuM=;
 b=SrPzXEu7MvZ506WfK/lcPTdv9DtW7njetfW6NRUFbZ3WaQ0SIaYX0kCTjNF3CVQCO/
 HYinltnt0+HVCh3DMTNLNRHipBq4Io12Bllktdq3HQqpylYyPOcKe+HSfoyYvCSoH7cx
 TYF6vAF+lS7HqtW4Y1Fq01uve6DZyTc0PBwBp2RzmPrrQbZLIR98ODoGEFYikxK/cKUu
 +kEdAbQDyIf1Gl5QdMDrPJ1WesGD2+ZPx6sPbysGGXaXkomr3wT6lOcB+p4iTsPmyNxQ
 WaMEZqdpkUFn+TVPyJXaMP6NaRm5aBiCoJVcPQmiPN6pn13a0aHoHtsEqwnsR5pQNty5
 t7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690176572; x=1690781372;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nb2n0uv595eFjLrEgpvsrMrshNYI9uMInfb2ta5izuM=;
 b=MX474bYFSXdaGM6h1rSPYU1zCh4FlELj8i6otmLIRDu1yAW+Ek0xkkjiaRHP4Q58dX
 t2tkhtvCQli3zBcx77VQz2jUNJrjaCYOvmmMmlR9ajgbg/KjPdDfSAgxXMqWMu/1oxpj
 3HhsnCr+XTJqcKxt7hwO2N4+xBFURYe2sHlXMjMq6HWF4GIvSpgYXZxfb0jiXyvdCtuJ
 XJM31AspQQjVnoDl+t/KiE69UhJtMAyMM95vD+77H+WjEAJ3BBrgrwOIT615HqXximwq
 oy6GfTmS6qSUjyvgViSwBT4K03Nd5nTCtg1K5ru2zR3wS/ltmMPjUZnL7wJ/QNSPbpnL
 XgFQ==
X-Gm-Message-State: ABy/qLZBPVlG2VQbtJxoh2E/dp7jxkzJgKuwMNpPzP6ZAg/G2ZxsyF+Z
 KRmj6gWnijZuDERMJo2EvHajjTobL88=
X-Google-Smtp-Source: APBJJlGYzKaSo+RJ6lLSl6cRZ3KFw4lI1C2ynjxTm4fMmAVIe9IxkMf3nfYYpv29qeJb6dALz63z1A==
X-Received: by 2002:a05:600c:257:b0:3fa:984d:7e9f with SMTP id
 23-20020a05600c025700b003fa984d7e9fmr5048440wmj.6.1690176572299; 
 Sun, 23 Jul 2023 22:29:32 -0700 (PDT)
Received: from [192.168.178.23] (dynamic-adsl-94-34-96-117.clienti.tiscali.it.
 [94.34.96.117]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d5492000000b003142e438e8csm11576823wrv.26.2023.07.23.22.29.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 22:29:31 -0700 (PDT)
Message-ID: <7cde2e10-b27d-0502-1b97-bacdbd9dd4a4@gmail.com>
Date: Mon, 24 Jul 2023 07:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: wg-quick down not reverting DNS parameters on MacOS
Content-Language: en-US
References: <7522f2c6-5782-25f5-6f25-75d05d50b868@gmail.com>
To: wireguard@lists.zx2c4.com
From: Matteo Franzil <matteofranzil@gmail.com>
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
In-Reply-To: <7522f2c6-5782-25f5-6f25-75d05d50b868@gmail.com>
X-Forwarded-Message-Id: <7522f2c6-5782-25f5-6f25-75d05d50b868@gmail.com>
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

