Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CF9C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 13:41:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 29d2c979;
	Fri, 22 Apr 2022 13:41:13 +0000 (UTC)
Received: from m32-12.eu.mailgun.net (m32-12.eu.mailgun.net [141.193.32.12])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3d0b5629
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 13:41:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=oern.de; q=dns/txt;
 s=mta; 
 t=1650634872; h=Content-Transfer-Encoding: Content-Type: In-Reply-To:
 From: From: References: To: To: Subject: Subject: MIME-Version: Date:
 Message-ID: Sender: Sender;
 bh=WqW6vMiCzGRMCFXwbt1v/F497/iXtiDhcPQLxRwH/TU=;
 b=KojqEovV8I1aoKs1yGLMpMx2U2x/NnjY6jzNN2aGabGKt0Q+t+HleFdMaceRw2GIo5hvAk4R
 od+YwSuI9G3rwFzediVCFgftsKn7Q2YM0cCwFyj5+pSLEeb1+0x4LvNAMcpjL4Zc0Pm2+s8+
 J4ACN+37A4/0qwHkNVs64RRHJWiyD+KtBrrZ8loj6Jf5l5LIOFDSpszasWf7QPG9WL1f/Kf+
 WYeFL99rOiK/Yq1i7Ay1LOPyGTtBCTh97QWsNylk2U8v3w7Vz472UUnEojG7tl6li6qaA0bJ
 qC1kqkn0RXwqN/cmjV21oY1ySonPZxziXNfAXHbh1kHfTB1JUfamhA==
X-Mailgun-Sending-Ip: 141.193.32.12
X-Mailgun-Sid: WyI5YWZmYiIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImUwNzRkIl0=
Received: from mail.7lb.de (mail.7lb.de [2.56.212.54]) by
 smtp-out-n01.prod.eu-central-1.postgun.com with SMTP id
 6262b07689cc449b4d258179 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 22 Apr 2022 13:41:10 GMT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5FB2180FBA
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 15:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oern.de; s=laniv9ai;
 t=1650634866; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=WqW6vMiCzGRMCFXwbt1v/F497/iXtiDhcPQLxRwH/TU=;
 b=Qh8MVNXnXO3UuN5LR0/yNgU3hySmzCjAGvEBdh3JtiLYPIgPH7IOB/VJ2vBaQmLEsOllVN
 gB0289m/8fiv7GevLVIADQzWUBI7chhms8l9Ml2szaw/QiXFicT5EhLVa+r91LScu8Ubyd
 D+2HgwwzQGxIWZNQl3cVAC4ri+/aJHg=
Message-ID: <7b684ba4-60d8-2189-7aac-41804a02da99@oern.de>
Date: Fri, 22 Apr 2022 15:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
 <fd11943c-99e1-d0a0-b28b-de7d5c617eb3@oern.de>
 <1b8b8a8d-0805-2b88-4fbb-f0a05cb2d0d0@gmail.com>
From: =?UTF-8?Q?Bj=c3=b6rn_Fries?= <ml-wireguard@oern.de>
In-Reply-To: <1b8b8a8d-0805-2b88-4fbb-f0a05cb2d0d0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



Am 22.04.22 um 13:05 schrieb Nohk Two:
> However, it failed in my Android phone. 
I don't use wireguard on my phone on the moment, but perhaps there was a 
difference whether you use the (non-root) wireguard-go implementation or 
the kernel module on android.
I guess I used the kernel module as I nearly weekly try new custom roms 
on my phone.
