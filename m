Return-Path: <SRS0=D3OD=CF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E17C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 13:35:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F07222BF5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 13:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXGu0l9l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F07222BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cec2007b;
	Thu, 27 Aug 2020 13:07:47 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5c6438b4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 13:07:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d10so4493483wrw.2
 for <wireguard@lists.zx2c4.com>; Thu, 27 Aug 2020 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=sCCm9EuD+k7HefFrqRG77OpssZnjSUTNDoUczgGcJww=;
 b=CXGu0l9lREpi3dsLeyMk8UYrm2ygj34EwiHL1vSIdXzJywIGwOREx9jE/YxhyIopVm
 MzmC4HbQBn99hIeD1hWWn2ihltIu4mKIZ73FqQ5BhSEy9P2ASCqgBQnPsQoZxfQEDrOa
 oflgKH/7F+KeMwRBT5jadDzdEC45z0JE/qO8FudV7qNE3UDxzwFpCK3VYvR03zYAL/2K
 s9N+5SLgK+tW/X0Zr/xoq9/uvzCr0GIQJn4NnMlaKnOVzCpAciiEm4OS8vFbwtHxNl2e
 mnEX5Zn6cxARGkMPHkrWj6xgYs+lxzZbDNXe8VsloRNN9kWHwms/hhB2Y8EZJIr6wCr9
 rrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=sCCm9EuD+k7HefFrqRG77OpssZnjSUTNDoUczgGcJww=;
 b=QBtrQZ7fva9Df8TwQJCuBW28Gakbf6FdBg/5Hybl8/feVK9clXotMPon8FtxgSeaZz
 /ciSkcTtwYe3ksqH5xq59XxUrf0/Now9ZrrVKSLKxPiJ5Fky7ZcmC8rbG6yU6RdB6MGZ
 I5kQUQqp3lNDRqpyOVpqalQqxrV1vlrxRWPqTPtsagGvvZZuiEileNWC1sFdBTZDtcPy
 pFq11uIHLEB39iv0jgHOsz+47FDDWXOhtLD9G6EFp6692GMjJVmGv+MMcobfkaPEW5iJ
 RPeaCd89g1z6RbKjpLwyV0Eh3ESK1ymOdfwLO+tfgECA0Ry2/BNStkP8t9aGRGJXBTRA
 zJ7A==
X-Gm-Message-State: AOAM5323P2lClysB43Qf4acaWE9A49X76d4Rc7YptJqy0Hmr3n8foiWm
 Ize4lu60FUxQv0MWvYeApm1gEHBQc3cN+g==
X-Google-Smtp-Source: ABdhPJx9bw/mTsldotDwSYGTWhcHd1V+WUHDPODslHXMUQG02J7R+3JujFxAM+sq7ZVnWnxzZnGqOg==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr1595624wru.44.1598535303778; 
 Thu, 27 Aug 2020 06:35:03 -0700 (PDT)
Received: from [192.168.25.135] ([2.25.87.76])
 by smtp.gmail.com with ESMTPSA id g9sm6399176wrw.63.2020.08.27.06.35.02
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 06:35:03 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Peter Whisker <peter.whisker@gmail.com>
Subject: Problems with Windows client
Message-ID: <69672027-558a-7ae4-484f-8d7573b3cf1b@gmail.com>
Date: Thu, 27 Aug 2020 14:35:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

The Windows client does not work over my work VPN (Juniper Pulse). I 
have project servers behind a firewall. I can use Wireguard over the 
office LAN but not over the VPN.

What proves to me that it is a Wireguard client problem is that the 
TunSafe Wireguard client works perfectly and connects to my project 
servers over the VPN with the identical configuration.

I get an error "Object already exists" from the real Wireguard client. 
None of the tunnel routes which are being created are there before.

This is a longstanding Wireguard Client problem.

I can send logs if requested.

Thanks

Peter
