Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698BEC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Apr 2022 02:03:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id cb0f7b55;
	Sat, 23 Apr 2022 02:01:37 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9091318e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Apr 2022 02:01:34 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id n18so14591222plg.5
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 19:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=ftDI3fGxYjSHQufYqbd+z4VxYRZZpLg3z3NT+8BHTIE=;
 b=Q+M/b61A6tYVshwlDHCfqgvcjHPsv1YZfSNwUqg80x3c7o7ZDwJshvwP61uM9Y/iYj
 N+wH0S0x2WSx9+iHDuJ4sc5zHJiPHnrQRgXtFGdb0Mi7Y/pcKfAm3v0vANyxZecloHLj
 coYNS25ZGjJRpShC3r1izFW2ZVTlnzqquUdCxLu5HdaVqC6aQYJ6qsoagyVcVS7bsFbl
 z3QHDlsA3xCKv9Wqng/PERf0ymHAXgb2FDuWf+q0MYOXRjfn698OhmW8d1y9DWzAGhp1
 3If7o5yCvVm8ShN3YR7hlvFcmrbmIacftPmnEIxV6FrJyv4bcDInfZ6Tkg61yHfmysiq
 YGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ftDI3fGxYjSHQufYqbd+z4VxYRZZpLg3z3NT+8BHTIE=;
 b=n8mth4vGflCQJAfuejBS1Hwb1OeIjCbGHbL8M2Y1K9Q9h/rz470qOuUPBDfVKyz9PU
 SEcsOaug+/jel6mIF2JA4EduB2DIrXEcEEys6kKxb7/BTd7OMyVD/+ii4ZIgJ1YLyDsl
 8Yk80CXZSnqquJ9etwd08HF3XAkX6KU2R0ytxC+P25MOyTqZbipD/VBN0vHraW81d/V2
 oErfojUivz9hTkNVSEsChJ9ghwImEwnsn4pYdpp0VDR4g4bc9oYMeQHG7oNdPDn2Fqrs
 jc722a4clyTJ/DBlB7NRTfAJb6oy3AO1eCcyN8SHwDlJVVXWgV4tPd8wKBiwauT0lCPI
 2FUw==
X-Gm-Message-State: AOAM532MRg8PB7Y0BekWlBlPJjPCzw6AthtfCW0TxJSYUD3IaAPaDOSW
 m0Zk2Y+cmDZbQeUD2ufAMW41Zi54ZUA9Bg==
X-Google-Smtp-Source: ABdhPJw8bHSTXJzkCj77u4D4M5ocC0fihjaKFqg1OsCffbLyqkyj4Nyx3Ryn8+ZNhHM5BK0I7KyJVw==
X-Received: by 2002:a17:902:c78b:b0:15c:e5dc:4f63 with SMTP id
 w11-20020a170902c78b00b0015ce5dc4f63mr895189pla.90.1650679293126; 
 Fri, 22 Apr 2022 19:01:33 -0700 (PDT)
Received: from localhost (59-115-140-93.dynamic-ip.hinet.net. [59.115.140.93])
 by smtp.gmail.com with ESMTPSA id
 gw16-20020a17090b0a5000b001cd4989fed1sm7256665pjb.29.2022.04.22.19.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 19:01:32 -0700 (PDT)
Received: from [192.168.50.10] (blum-vo.family.era [192.168.50.10])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.family.era (Postfix) with ESMTPSA id 07B5714019F;
 Sat, 23 Apr 2022 10:01:31 +0800 (CST)
Message-ID: <1dd6c632-0aa3-fffe-78fe-cfb61c22028e@gmail.com>
Date: Sat, 23 Apr 2022 10:01:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
To: Kai Haberzettl <khaberz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
 <CA+CGqo+038VDaCQv9UVJBrh_vKA67AUc78mEvDSYw8Npuy1L5Q@mail.gmail.com>
From: Nohk Two <nohktwo@gmail.com>
In-Reply-To: <CA+CGqo+038VDaCQv9UVJBrh_vKA67AUc78mEvDSYw8Npuy1L5Q@mail.gmail.com>
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

On 2022/4/23 02:23, Kai Haberzettl wrote:
> On Fri, Apr 22, 2022 at 2:26 AM Nohk Two <nohktwo@gmail.com> wrote:
>>
> [...]
>> So, I have this idea that if it is possible to configure the Wireguard
>> app to turn off or disable automatically when the network is established
>> on specific Wi-Fi SSIDs ?
>>
>> Or do you have better ideas ?
> 
> As a workaround, you can achieve what you want with tasker.
Indeed, this "tasker" app might work. Though it's some kind of overkill.

I will consider this workaround on the Android phone when there are no 
other solutions.

Thank you very much.
