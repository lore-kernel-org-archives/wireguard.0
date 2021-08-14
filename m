Return-Path: <SRS0=LBMS=NH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FEBC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Aug 2021 09:53:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5798261B72
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Aug 2021 09:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5798261B72
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mc.cx
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e0ddd9e;
	Mon, 16 Aug 2021 09:53:10 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ae7a270
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Aug 2021 21:37:17 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id v2so10182174edq.10
 for <wireguard@lists.zx2c4.com>; Sat, 14 Aug 2021 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mc-cx.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=fguNyvjxRrougu82HCAtRqyu0m/7E9VzmFRftHnKtIE=;
 b=xgGlbdJa2Jk82NhgQYNRZ+3W5ptFJH/pE5FuyZ2lgYO4AEfAuAhiI+KqD1r4SiJ7b7
 IrpgBNhyWODAm5m6KDpKCuQEi74TJEAO9QMK9KeZgAZXgMwVHt468i0JDKGzdk+ZsH3c
 nMWhCi5SEFfvwIH++lntHfWrNOx8RoUzErFCNobpGb42210mogu1/wk9+DI49Mq47QMq
 kICHgUwe0IFpY4gwAFFyHOjryONU1vZmdjbziutUDeIxuQw1d2WX0HXct8zZSkdBBcGr
 m7v2lTV9JwpsRLIzBwchvdTeb5P5Dcn68zyiLUlios6OJxCftvyLqAsr+Le25fmRYy8S
 4GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fguNyvjxRrougu82HCAtRqyu0m/7E9VzmFRftHnKtIE=;
 b=CkrBfP9DCO0aDFkMJBreVOhN7lmoNTi4GduoLipIgYaNzJzhIclDH4Q34pHkkFqwY1
 jkwFhh+lluIYaNPtwRSbsQScQjkeKYodTe5CxHr/xsVprIkB2Z2V47rGqQRuwgnP6KyK
 YVmhmjudhqh1qOmTsyZML5olMisD6kCb7dP/VsGYLckcUK09xJsDW2s71NOikjyHds3l
 0iNtsyEn6I60syslvT5dehjZETWbSBf+XlAzzuUXJmY6VZRnnTVRabG3vVrMUFoaJb3I
 hwDu8LKD426bwwBSTcw2znlF13LsQuUJ4sqt1z48yYDa2GXBtx8Jl7NRde6EnP3oEVPP
 FgcA==
X-Gm-Message-State: AOAM531RZ3MgqPA9csfB6afbCEISrwt+I9aj+zTjUlvuXFJ6wM3tlWck
 WrK7KLMum8cJSpiLLw1y2FRBcAjQNrU5EA==
X-Google-Smtp-Source: ABdhPJxp7RzBOe+zhxOEJCbXu+Vrliothe4WSW27/UcYU08G5cFQx/Jok66GpGd+I1SvzFsXI7teyg==
X-Received: by 2002:a05:6402:1648:: with SMTP id
 s8mr10690339edx.214.1628977036939; 
 Sat, 14 Aug 2021 14:37:16 -0700 (PDT)
Received: from [10.10.6.189] (5.186.223.157.dhcp.fibianet.dk. [5.186.223.157])
 by smtp.gmail.com with ESMTPSA id
 w13sm2741319ede.24.2021.08.14.14.37.15
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Aug 2021 14:37:16 -0700 (PDT)
From: Morten Christensen <mc@mc.cx>
X-Google-Original-From: Morten Christensen <mc-mail@g.mc.cx>
Subject: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard
 implementation for the Windows kernel
To: wireguard@lists.zx2c4.com
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
 <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
Message-ID: <3e525055-4170-e893-795f-1c5ec51cdb52@g.mc.cx>
Date: Sat, 14 Aug 2021 23:37:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: da
X-Mailman-Approved-At: Mon, 16 Aug 2021 09:53:09 +0000
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

Den 13-08-2021 kl. 13:52 skrev Jason A. Donenfeld:

I have used it since first announcement. Not experienced any problems.

--
Morten Christensen

> Hi everyone,
>
> On Mon, Aug 2, 2021 at 7:28 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> Nonetheless, experimental or not, we still need people to test this and help
>> shake out issues. To that end, WireGuardNT is now available in the ordinary
>> WireGuard for Windows client -- https://www.wireguard.com/install/ -- with the
>> 0.4.z series, in addition to having full support of the venerable wg(8)
>> utility, but currently (August 2021; if you're reading this in the future this
>> might not apply) it is behind a manually set registry knob. There will be
>> three phases of the 0.4.z series:
>>
>>    Phase 1) WireGuardNT is hidden behind the "ExperimentalKernelDriver"
>>             registry knob. If you don't manually tinker around to enable it,
>>             the client will continue to use wireguard-go/Wintun like before.
> After the first few days, bug reports for WireGuardNT have died down
> considerably. It's hard to tell whether that's a sign that the
> software is stable or that nobody is using it. So, we're still in
> phase 1. However, with version 0.4.5 of the client, I've added a
> checkbox below the "activate" button in order to make the experimental
> testing more discoverable. I dislike such knobs, but I'd rather have
> more testing than less, before turning it on by default. Hopefully
> this will make it easier for alpha testers to give it a spin and
> report findings. If you have been testing the driver, and it's been
> working well for you, please write in to say so, simply as a signal
> that it is being tested. If things stay as quiet as they are now on
> the bug reporting front, we'll likely move into phase 2 -- enabling
> WireGuardNT by default, with a registry key to revert to the legacy
> implementation -- in 2 to 3 weeks.
>
> Jason


