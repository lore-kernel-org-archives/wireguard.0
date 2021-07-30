Return-Path: <SRS0=xsnz=MW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C320C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Jul 2021 07:25:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F196103B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Jul 2021 07:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87F196103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7aefa6ac;
	Fri, 30 Jul 2021 07:25:03 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id def43c52
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Jul 2021 07:25:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so5709600wmb.5
 for <wireguard@lists.zx2c4.com>; Fri, 30 Jul 2021 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vU8ymmz+OILNs80LHIwBArWK8slJS97ql4FEVhjl8mg=;
 b=GEQbGTVuU3RQkpn4tIiM/zJwdKJKzLMGyeufpbfDfpswlyTZiZlESSf7AS67rteYMr
 ZCyR2F7Tg50o3uCyPeuK0a/zdRDfqKHsJ4UqNfIS+OtjUvtgqN9QN72z+7vRqc9N00sN
 n5nVkKOqYs8Nqc/Ff7xceeZVAuI/6PkgpPRd26U9PUXV678+z6UWA3wlYe+voaGoWFot
 2+OpK+1frW2NRRQrz3DfBD+yTcU5yoO+08FWoI/hIbKkAl47PbvyaHZphQLyrMoIcfko
 oSk+qninO1soXS0opI/1BOSUFFrhBypW10J2fz1APeZu7BG+fO6kymM+5Ma2JKRP0MMU
 qNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vU8ymmz+OILNs80LHIwBArWK8slJS97ql4FEVhjl8mg=;
 b=OqrgScaIjQdYCEf2fADq6Yd0roqmJD/8Dhm1VYSyaxkdLGrSB0LOqoWMwJbUquu8oT
 mc5lad2HyhCXonQ+N+NsKoPVBOgN07jvVA27Zjtb8+4USWGvEmqx8Uyzf13JtdXeQElV
 oOtCe2zq7hbj3fz9qyUPPci24T3gKJRW6Q1xYxKNZ9VNzC0MDNEQPjAZEDucZBA76cYT
 rfytZrFpzTNSRmsj2xIP82iqCg5ZESNKGQDXn0geb7CvqOoR3ux34MKkRFcuP99Dz+3L
 Hrp3f+s5WU2ljR3dEKgC9oqA8nOXVHmlgmVxHKdH/uwVkHdV/eh1fDbvcr2MvYJuyCmc
 6xzA==
X-Gm-Message-State: AOAM532mgo5hi91Gph7/kagSwrF0rc1WakuBfS4sKLW7iDpEQ6pbzuM3
 sylLUglGOx6NLFFF5lWYy+P1E8w4tv/ZNg==
X-Google-Smtp-Source: ABdhPJya7UT/MIR/Amdg91uyYLOofEGmlj0GhW5ELbPdjCOkCMP56ywAGXnmTlG+Ya9GnQf0FuN6bg==
X-Received: by 2002:a05:600c:5114:: with SMTP id
 o20mr1428766wms.176.1627629900384; 
 Fri, 30 Jul 2021 00:25:00 -0700 (PDT)
Received: from [192.168.25.202] ([31.127.152.180])
 by smtp.gmail.com with ESMTPSA id m7sm812507wmq.20.2021.07.30.00.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 00:24:59 -0700 (PDT)
Subject: Re: Problems with Windows client over PulseSecure VPN
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Heiko Kendziorra <kendziorra@dresearch-fe.de>,
 Christopher Ng <facboy@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
 <CAHmME9r5kecTj1iBGyqjvNRKsHZPRrXmN+fDXkaX3y==VPoMqA@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <29f66915-7fe8-94cd-cb17-bfba49072929@gmail.com>
Date: Fri, 30 Jul 2021 08:28:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9r5kecTj1iBGyqjvNRKsHZPRrXmN+fDXkaX3y==VPoMqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

Thanks Jason.

Does this mean that the driver speed will improve as it will move out of 
user space into the Windows Kernel in a similar way to Linux?

Peter

On 29/07/2021 12:00, Jason A. Donenfeld wrote:
> Hi Peter, Heiko, Christopher, and others,
>
> An update on:
>
>> I had a strange idea for how to fix this without requiring
>> recompilation or removal of that code.
>>
>> 1) Enable DangerousScriptExecution:
>> https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md#hklmsoftwarewireguarddangerousscriptexecution
>>
>> 2) Add a PostUp line to your [Interface] section:
>>
>> PostUp = wg set %WIREGUARD_TUNNEL_NAME% listen-port 0
> I just wanted to let you know that this problem has been entirely
> fixed (I think?) in the "WireGuardNT" kernel driver project I've been
> working on (and haven't yet announced aside from development
> screenshots on Twitter), and therefore the above steps will no longer
> be necessary. When that ships as part of the v0.4 series of the normal
> wireguard-windows client, you won't need the "listen-port 0" hack
> anymore, as the kernel driver uses a more clever trick than the one
> used by wireguard-go. So please do watch this mailing list in the next
> few weeks for an announcement of that project, as I'll be very
> interested in some real world tests and confirmation of the fix.
>
> Thanks,
> Jason
