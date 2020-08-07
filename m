Return-Path: <SRS0=S+OT=BR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37CEC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Aug 2020 10:51:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3814120866
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Aug 2020 10:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jX6gfpmb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3814120866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b9c3eb3;
	Fri, 7 Aug 2020 10:27:10 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8f6703ba
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Aug 2020 10:27:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id p14so1343279wmg.1
 for <wireguard@lists.zx2c4.com>; Fri, 07 Aug 2020 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m8/FpvsUceqLXtWu1aY4yHACm9CifiGRR5ztFq8D5D0=;
 b=jX6gfpmbPbWX8Xi8PiyyQsLq7Aibk6Wiy6xmDwjy0FDAEJLl1jw/Phivi05n4rRCu3
 ZF+Zd8pbEa/l8Oyc3ob8+eBEIy3hQ6PIwuMH7mtno9wwWRqgr9v48lqWLz7Pu3wWdKZj
 xqheY0qRFz131yhPvkEaEYCA2iynAmlI92+3UoZORqjRiLlyB6N5JHe0PZmjG+wv9DVM
 IqLHyYEeq0JotoSi6V3cOIOV68lC8lHtD4xhi0YnEkyIGIgVa2I3GD6Ro6RYGJknLF9S
 iwTxlHDKiLSRBPTd5cDHPAQriHIzzzMZqtOa022Tnra8MCrA8hXdEUioVISIhE8mvcaj
 eTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=m8/FpvsUceqLXtWu1aY4yHACm9CifiGRR5ztFq8D5D0=;
 b=JumlyJMKcE8t1MyH2sMpMtBMzTkCVEe8p9rTF8ZHZwEovGA6n6Pq72xXUW9lVhLC/1
 eb1ns5GjL54w52+QjhfSmgGQ28Q/TBw2S5FxGV0llD6eCoMrJChBrTjcogXWhMP/VpqE
 Od1xcDm5iek7fRY44l+fcVQPbtTl2yq9VuG5wiIwIdCkjsJHyM9I5XlBN7M3aTVoSTZA
 OOBANFT5parHAsETPrVFD28r/E2SgUu8CckSGdaJt39IlRas5JG1jDDOhzuSAwDC7+zw
 YIDwpKNK5E5MvKI45t1lfgZY/EeqD0gqPi4/u0hXj59uB+ePpDl/yl9RKt2anmsd46T3
 1bSw==
X-Gm-Message-State: AOAM531R6YNThHljYbXXoQQFMn0BpZdSv8ilCUPK1uIea2EyIxC+l/+t
 IgeOgDmgm5QEPgZq8rlercRHY1cQ
X-Google-Smtp-Source: ABdhPJyrdisCBwOZYraV6qK4L0HQlkFxAqDDcQ0uG7df3Mi1xnw53lqgrbALs5zN85u9HMcVh4wlag==
X-Received: by 2002:a1c:7315:: with SMTP id d21mr11744236wmb.108.1596797506602; 
 Fri, 07 Aug 2020 03:51:46 -0700 (PDT)
Received: from [192.168.20.100] (20.157.63.94.rev.vodafone.pt. [94.63.157.20])
 by smtp.gmail.com with ESMTPSA id
 g18sm10528941wru.27.2020.08.07.03.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 03:51:45 -0700 (PDT)
Subject: Re: Android App not setting DNS when allowed IPS not 0.0.0.0/0
To: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Cc: wireguard@lists.zx2c4.com
References: <aa041580-d6e8-6fa1-abc6-86de7f2ef53b@gmail.com>
 <CADn-QaO2gn8vX0qA9jeitSGiSK11qengh0U5_JjonTmSND84Tg@mail.gmail.com>
From: Mauro Santos <registo.mailling@gmail.com>
Autocrypt: addr=registo.mailling@gmail.com; prefer-encrypt=mutual; keydata=
 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 hJqc
Message-ID: <338b5098-1125-584b-e3c9-19a6c6015926@gmail.com>
Date: Fri, 7 Aug 2020 11:51:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CADn-QaO2gn8vX0qA9jeitSGiSK11qengh0U5_JjonTmSND84Tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB-large
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

On 07/08/20 05:29, Alexander Skwar wrote:
> hello
> 
> Welcome to the club — that is EXACTLY what I'm talking about in the
> thread "WireGuard macOS App doesn't set system default DNS".
> 
> Are you on macOS as well? Using the WireGuard App or are you using wg-quick?
> 
> Regards,
> 
> Alexander
> 

Hello,

I'm not on macOS, this is a problem with the android app, just like the
subject says ;)

I don't know if wg-quick has the same problem, on my laptop I have
unbound running and I use that. I do not have any dns settings on my
wg-quick config files.

Regards,
Mauro Santos

> Am Do., 6. Aug. 2020 um 16:20 Uhr schrieb Mauro Santos
> <registo.mailling@gmail.com>:
> 
>>
>> Hello,
>>
>> Like the subject says I have found that when I'm not routing all traffic
>> through the vpn then my dns setting seems to be ignored (tested with
>> nsleaktest.com).
>>
>> If I route all traffic through the vpn then it works as expected.
>>
>> home network: 192.168.20.0/24
>>
>> vpn "server" is at 192.168.20.10 and internal vpn address is 10.4.4.1,
>> where I have the dns server running and a few other services accessible
>> only though the vpn.
>>
>> "server" config (with systemd-networkd)
>> wireguard.netdev:
>> [NetDev]
>> Name = wireguard
>> Kind = wireguard
>> Description = WireGuard VPN
>>
>> [WireGuard]
>> ListenPort = 4911
>> PrivateKey = ...
>> #Publickey = ...
>>
>> # Phone
>> [WireGuardPeer]
>> PublicKey = ...
>> AllowedIPs = 10.4.4.3/32
>>
>> wireguard.network
>> [Match]
>> Name = wireguard
>>
>> [Network]
>> Address = 10.4.4.1/24
>>
>> "client" config (android vpn app):
>> [Interface]
>> name: msi
>> public key: ...
>> addresses: 10.4.4.3/32
>> dns servers: 10.4.4.1
>>
>> [Peer]
>> public key: ...
>> allowed ips: 10.4.4.0/24
>> endpoint: 192.168.20.10:4911
>>
>> The problem also persists if I access the vpn from outside my internal
>> network and is "fixed" if I change the allowed ips from 10.4.4.0/24 to
>> 0.0.0.0/0.
>>
>> From what I have searched, other people with similar problems had a
>> configuration problem, but I don't think it is the case here since my
>> dns servers in on the same machine as other services and I can access
>> the other services without problems.
>>
>> Any ideas on what the problem could be? I have checked the log on the
>> android app but none of the messages in the log seems to indicate any
>> problem, should I be looking for some warning/error messages in particular?
>>
>> --
>> Mauro Santos
> 
> 
> 
> --
> 
> 
> 
> Alexander
> --
> =>        Google+ => http://plus.skwar.me         <==
> => Chat (Jabber/Google Talk) => a.skwar@gmail.com <==
>
