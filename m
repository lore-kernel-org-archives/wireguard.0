Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F90C2BD05
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Jun 2024 09:36:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10544c0d;
	Mon, 24 Jun 2024 09:36:12 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dba42bf9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Jun 2024 09:36:09 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52ce01403f6so1442275e87.0
 for <wireguard@lists.zx2c4.com>; Mon, 24 Jun 2024 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maidenheadbridge-com.20230601.gappssmtp.com; s=20230601; t=1719221769;
 x=1719826569; darn=lists.zx2c4.com; 
 h=content-transfer-encoding:in-reply-to:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3nbssd+SOrPelJEl3Nfbp389m7F0H+/rGBuI8zDDknM=;
 b=G1Mx5LNxBEwSkypezDCyV3s3vQmQICHH/3q4d87tAVTsw/t+rYLRIY5eGCeEBeiGUq
 T0TBfXE1TcwB6psJfCIELltRaoT4r42Fe9kWLgG75TXyKKaqxmYOPApIH57WoYNF2r/L
 w+ix4F6JO5dPWYX3Vx+vnC5haxABLHytIJe18MZkX8J5rFyacPBjPHkBSHUHm8pu8HJR
 Y/aLht52/NBTatsYUtpV4xlP8ElHaf8Y8URfDJ3l26arinZ4fyuoaeVMDiLYrThAkLaX
 vGpFHzb9+TmA+I60D285L3XSkRfko7rCDI4TCNG9KSr4X+0kq0XJXMu+mlT6+hY5CfDi
 Xl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719221769; x=1719826569;
 h=content-transfer-encoding:in-reply-to:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3nbssd+SOrPelJEl3Nfbp389m7F0H+/rGBuI8zDDknM=;
 b=itM5cwo/WWpm/sVHL1Gysl5pUYZM3s4tBVCrj4vUP0uZihS1Ax2xhjhC9DVBPISDn0
 oq3koZBH+YqlIzweqD7BWdEWR8zWEJSrJmcOISn44G9s1Q6laCzCep3P9M3ujgvvYJYi
 hKsbDtzwXuYAc9fMuyPXcR++GGMowlyw+1Ta7V+fNEednvq/FNBJDGPYZBaz+sLXW2O9
 hkbOyLh5VtiJ9Lup7qCFkDJWSjHQQtZLn+tY9xuvkWH3sapLP4PvB4OGDVhNk2yNn1Zl
 k1/IBlf+JdeUgcAYTLTMdLg47/YzjxqE+D6UMm6mBa6UwMv75AM48y0z+4wa8vzIzPtl
 cXag==
X-Gm-Message-State: AOJu0Yxs8TEcFr7oZvoBDcBrPCk83KLvyT508OXIhEqViPzsKu802MCc
 WooAOzawCzRkKJD8RxOgADGiOOZBjZYIgRccH96bgEOuBid3DXfhA2qXcvbhBTv62/P78wO7AU3
 8+0I=
X-Google-Smtp-Source: AGHT+IEyMfbGwpNHXMo77efQBDWp/5RdgSONKHFUn2K4VvwzKrFANMr4KoELon/4jnpcHsvAz1zl5Q==
X-Received: by 2002:ac2:514a:0:b0:52c:df9d:7cbe with SMTP id
 2adb3069b0e04-52ce183bf39mr2256249e87.39.1719221768475; 
 Mon, 24 Jun 2024 02:36:08 -0700 (PDT)
Received: from [192.168.1.140] (82-68-6-73.dsl.in-addr.zen.co.uk. [82.68.6.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424817b4ad8sm128092765e9.21.2024.06.24.02.36.07
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 02:36:08 -0700 (PDT)
Message-ID: <43aac110-8699-41b3-bad8-7a38bf984b45@maidenheadbridge.com>
Date: Mon, 24 Jun 2024 10:36:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: Wireguard address binding - how to fix?
Content-Language: en-US, en-GB
References: <740ee793-0ed2-4cf6-ba4a-07268b46b761@maidenheadbridge.com>
To: wireguard@lists.zx2c4.com
From: Adrian Larsen <alarsen@maidenheadbridge.com>
In-Reply-To: <740ee793-0ed2-4cf6-ba4a-07268b46b761@maidenheadbridge.com>
X-Forwarded-Message-Id: <740ee793-0ed2-4cf6-ba4a-07268b46b761@maidenheadbridge.com>
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

Hi Friends,

You can achieve address binding on a Linux box with a mix of marking, ip 
rules, ip route and Source NAT.

1) On WG interface, add "FwMark = 0x34" (the value 0x34 is an example, 
you can put any value here)

2) Create IP Rule "from all fwmark 0x34 lookup rt_wg0_out" -> this will 
force the outgoing packet to use the route table "rt_wg0_out"

3) On the route table "rt_wg0_out" create the default or specific route 
to force the packet market with 0x34 to leave using the interface where 
your desire "IP address" resides.

4) Create a POSTROUTING -> SNAT forcing mark 0x34 via the desired "IP 
address". This will bind your "IP address".

Done! The packet with mark 0x34 will be routed via the correct interface 
using the source IP you want.

I hope this helps.

Best regards,

Adrian Larsen
Maidenhead Bridge
Cloud Security Connectors for SSE vendors.
m: +44 7487640352
e:alarsen@maidenheadbridge.com

On 09/06/2024 16:39, Nico Schottelius wrote:
> Jason,
>
> may I shortly ask what your opinion is on the patch and whether there is
> a way forward to make wireguard usable on systems with multiple IP
> addresses?
>
> Best regards,
>
> Nico
>
> Nico Schottelius<nico.schottelius@ungleich.ch>  writes:
>
>> d tbsky<tbskyd@gmail.com>  writes:
>>> I  remembered how exciting when I tested wireguard at 2017. until I
>>> asked muti-home question in the list.
>>> wiregurad is beautiful,elegant,fast but not easy to get along with.
>>> openvpn is not so amazing but it can get the job done.
>> Nice summary, hits the nail quite well.
>>
>> Jason, do you mind having a look at the submitted patches for IP address
>> binding and comment on them? Or alternatively can you give green light
>> for generally moving forward so that a direct inclusion in the Linux
>> kernel would be accepted?
>>
>> Best regards,
>>
>> Nico
>>

