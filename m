Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C7C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 11:05:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b00b5148;
	Fri, 22 Apr 2022 11:05:48 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5b268178
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 11:05:45 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id b15so7692783pfm.5
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 04:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:references:from
 :in-reply-to:content-transfer-encoding;
 bh=V49XXPRqZVtx2UU/TNJWpdf5433HZq7Qd2XpIdNUfUI=;
 b=NuBwyj0UsmldFS6ML8mz/hQDwn8wyidG0+IYCqlgvb6ra/XICgnQrTV/PWhdw9OOVz
 mZLZhqyCcCW90mLZZgtrQFfwHaiZV+ppglv+LKqqmnYFJC7/MHVOpmIbo4yrWt05yPqh
 esMz1JCgm2mpOBTVmEFFMe1OsrHsk4bndFI1uNWzgx6J+rGpiNCVrICW1Adl+2rqN9z0
 Tu1kc8H/C9l/QUBBamz/EfcIsBV65tMmjBpDI9jzi1jZd0OGqlVYTs31sXRSZ5lAAEnb
 ELkz53xz/3djLECiDjs8VMe/MyJ3UdC9B3hzj3MMUcuI+bQjLUgstrczfQRIp1CiStVa
 UiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=V49XXPRqZVtx2UU/TNJWpdf5433HZq7Qd2XpIdNUfUI=;
 b=wU76EqWd6USvIFvRTPQgkN/j1+XDy1ersHeHo3SJBtwdJxLx1zUGMRNekDv872q/W8
 sO5Bz+APqO6Z6/3XJLPLztL6D3htxJQHCW5vr3R6a6o9g9juViP4aSTz1X0FVnSShI74
 uPAPgw7TbtcKeWq9twJG37kBanV2Dl1f5l44f/eupSueD6r+dxCjxYyPz0cqvLaWIGCH
 Cru7aDoE+X1R020YQim8p+MX7iEmcFotyW8E2YzEeg0Lg2NL1Kcg8pgFTLLoczbFjWkI
 EvNyI3zYSLri+O3RDP75DEimpyr3cgH4Xdj2EDvrqoxVIroxFJGF8EtwKUvfT2t4oEqo
 EkDg==
X-Gm-Message-State: AOAM532R0Fdq5daCnwJAeITjbjG0UJlJralm5aUUvfLdLOriuXLMeBbw
 UPH/0ELEBe7AUlDBV4ldjHRq9/6akNY=
X-Google-Smtp-Source: ABdhPJwbDLnFqNrajT5vuRXxnF9dPPg8vVuNcMl3ZZEr1Zo44H8OTcvIGDljyTfaccubEQQUwiINrw==
X-Received: by 2002:a05:6a00:26cf:b0:4f6:fc52:7b6a with SMTP id
 p15-20020a056a0026cf00b004f6fc527b6amr4375511pfw.39.1650625543939; 
 Fri, 22 Apr 2022 04:05:43 -0700 (PDT)
Received: from localhost (59-115-140-93.dynamic-ip.hinet.net. [59.115.140.93])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a056a0016c200b004f7e3181a41sm2335669pfc.98.2022.04.22.04.05.43
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:05:43 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) 
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by upg.tw (Postfix) with ESMTPSA id 35A5A14019F
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 19:05:42 +0800 (CST)
Message-ID: <1b8b8a8d-0805-2b88-4fbb-f0a05cb2d0d0@gmail.com>
Date: Fri, 22 Apr 2022 19:05:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
To: wireguard@lists.zx2c4.com
References: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
 <fd11943c-99e1-d0a0-b28b-de7d5c617eb3@oern.de>
From: Nohk Two <nohktwo@gmail.com>
In-Reply-To: <fd11943c-99e1-d0a0-b28b-de7d5c617eb3@oern.de>
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

On 2022/4/22 14:16, Björn Fries wrote:
> Hello,
> 
> Am 18.04.22 um 04:12 schrieb Nohk Two:
>> This server allows the clients to access my LAN (e.g. 192.168.87.0/24) 
>> and 
> [..]
>> But when the phones connect to the Wi-Fi of my home's router, the DHCP 
>> assigns the IP addresses as 192.168.87.0/24, it's my LAN, to the phones. 
> [...]
>> Or do you have better ideas ?
> 
> the way I solve this is that I use a slightly larger /23-subnet in the
> AllowedIPs=192.168.87.0/23
> 
> and when I get a local IP inside 192.168.87.0/24 at home, the kernel 
> automatically uses the more specific route.
I think I know your point. And since my network is 192.168.87.0/24, I 
have to use 192.168.86.0/23 (not 192.168.87.0/23) in the AllowedIPs. 
Because "87" is an odd number and it's "1000 0111" in binary

However, it failed in my Android phone. There is no internet accessing 
as usual. I didn't try this in iPhone because Eugenio Tampieri told me 
that Wireguard for iOS has the feature I required (and worked nicely) 
but not Android.

Maybe I have to adjust my LAN's network to even number to make /24 
enlarge to /23 happy.

Thank you very much.
