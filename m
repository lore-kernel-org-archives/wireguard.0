Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C513C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 15:55:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1f5b5ec0;
	Fri, 22 Apr 2022 15:55:16 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2ea0b079
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 15:55:13 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id n18so11755313plg.5
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 08:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:references:from
 :in-reply-to:content-transfer-encoding;
 bh=TxFrfz5seaIherLuPJfaIYTfdEgemCljuE+JZMhjmC0=;
 b=MR8nj67x/cTk5Jlba+h4yuKuzNH3oKhF7vS2n01yuTNsKkOIi63BNLkGZnLDzoXVKm
 eyw1Gcy4LI8BXX4JV0g9DV9itUJLP2mOcpgmBfVIVUgNRtj/jCHdlA6W/Db3fM8NmmRv
 gs3++djmF7Pf0AGwl1PMH0KTnPqthObrj/QlslU6jXUmr/6ECBKPULCXxYyO1tBtmwwZ
 EgJcI6vIhUQDx4N+w6KT+/6HyJxEjdSIB5OClkPIgAnndceasDKD/9NCYPV6DVa2vhjX
 Z1/XUJ/Xn8rZHAl9XmrJg6LXUHUVAWDdUn2eBqJ54rNIt7fMQ3wNidaAtjDhlnaCS4bi
 Y2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=TxFrfz5seaIherLuPJfaIYTfdEgemCljuE+JZMhjmC0=;
 b=DqS0tjESIMnS3p/ptW0+XFCVqo3E4sWsqwXRAfIKkXyhZLXrb5AlkGqDB/xMK9dvPj
 UiCNBiGjmXvQNEvhMayLex/kgoUCtWqrD7joeHwyvdSQ6W6il/4OzUSD7LsTNDsybJrQ
 f541uXmAeqOI5/ENG7Uz8QcKpxA3U75O/XL8MK14q1D//iSk6y7KIllakkYp+FPuzxDg
 OIyTl9Eo/aar75VumwNUD8A1+5rJ89p0+28EZ4sZ5G8wRqXraAEqNrWhWxQhhAlkOPYj
 KCVwZ8F7zCRtelnU2pE8CelS8bzr9mhs72Fjw+v/Q7LR40NBB3pC2Y2805zLHEt9VmON
 ewKQ==
X-Gm-Message-State: AOAM533lh4svYv6TXT4QM2GrBGG9fCJHSi4+sdXWvS/hgPNcohO3dRCj
 JzM1kol4GxpWeujI0EzyDAozjR7xcUM=
X-Google-Smtp-Source: ABdhPJyuPxkKNtN8NBgcxqCFNQQoni4yXatTj2wtRPU7vPw9n9+BnHeEWKRNhNKHQ7ODLjabuXjE9g==
X-Received: by 2002:a17:90b:4f85:b0:1d2:828f:9860 with SMTP id
 qe5-20020a17090b4f8500b001d2828f9860mr6084448pjb.54.1650642911862; 
 Fri, 22 Apr 2022 08:55:11 -0700 (PDT)
Received: from localhost (59-115-140-93.dynamic-ip.hinet.net. [59.115.140.93])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm3398505pfj.79.2022.04.22.08.55.11
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:55:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) 
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by upg.tw (Postfix) with ESMTPSA id 60F7E1404DC
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 23:55:06 +0800 (CST)
Message-ID: <256303f0-d167-3677-67c6-721a195129fa@gmail.com>
Date: Fri, 22 Apr 2022 23:55:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
To: wireguard@lists.zx2c4.com
References: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
 <fd11943c-99e1-d0a0-b28b-de7d5c617eb3@oern.de>
 <1b8b8a8d-0805-2b88-4fbb-f0a05cb2d0d0@gmail.com>
 <7b684ba4-60d8-2189-7aac-41804a02da99@oern.de>
From: Nohk Two <nohktwo@gmail.com>
In-Reply-To: <7b684ba4-60d8-2189-7aac-41804a02da99@oern.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2022/4/22 21:40, Björn Fries wrote:
> 
> 
> Am 22.04.22 um 13:05 schrieb Nohk Two:
>> However, it failed in my Android phone. 
> I don't use wireguard on my phone on the moment, but perhaps there was a 
> difference whether you use the (non-root) wireguard-go implementation or 
> the kernel module on android.
> I guess I used the kernel module as I nearly weekly try new custom roms 
> on my phone.
I just checked my Wireguard for Android App, the settings page shows:

   WireGuard for Android v1.0.20211029
   Go userspace backend eb6302c

So my wireguard on my Android phone is the non-root wireguard-go 
implementation.

So said that I don't use custom ROMs, I always use official ROMs.

At least I still can turn off the wireguard manually. :)
