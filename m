Return-Path: <SRS0=erT1=NE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7668CC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 16:11:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C87C61038
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 16:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C87C61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60c9da6e;
	Fri, 13 Aug 2021 16:09:16 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ed33406
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Aug 2021 16:09:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so765343wme.1
 for <wireguard@lists.zx2c4.com>; Fri, 13 Aug 2021 09:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=arXZmUWyD28hTiAgoTe+rBqd/iUuxvQFKpcMmLk6/1s=;
 b=RQPHahV7PCv/pDpLyKqEnOO9gpEMpZJDBvSxZDN1JJjuqRYZjv+CgQq8JLkcrA7yXD
 GmbFU5In7+Az9rz3eW9pfc7Tf3iDtwcwGlsptGnjjtSN5WfPzK5uSrI4wT6hqjTvmtdW
 I/i4cMHKlOCzNBPK2U2lgLzTltBiWb1LW0SAnnea28OyXx7P2z/rt7fdsmkBb2d9x1tl
 lbhGr7ko27WyYwZI1SOjLx9sNency74pXKsxKzRQzWvyMsBXt1ffG4HMJmK2RLKkxg+W
 h7cQ1K2v6QCBxDSE2ZUD4YBTRXsGb2I5sHHDyoXjB3nsgBVdOYSPaC7fTvi5MAYgM1PX
 Abig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=arXZmUWyD28hTiAgoTe+rBqd/iUuxvQFKpcMmLk6/1s=;
 b=VltljW4TNzdyZ/FAszs0YqSpIAJbUiWxTYj9U1XzbH8o/rA/VhvJ+bMv6fknORV9Qj
 d1QBVYAIBplzvxsiyIVQR0IHhbrUePE2a1NH32bhX4xkirQz6yZIoKTdJYIH/XMAtfTw
 4ZNmDgGq9WsAQBH2qY0ac4F82isVpfSWHsMIaQ6anhor2kdOVTuwbREOkGf1wXK10f21
 VXyKzcJ9qwggMH5xcbDTqNlsaPYu9cQwwVRAs0+WK3nSPwp78Hv7OHp1060/xYyUCUWC
 HYQ3eEXPoOJLBA89hYxrE7nLe3sLL9yH1SzNKnRlJhia9pHxNBZneELZ3k1T1udK6G4N
 Nv0w==
X-Gm-Message-State: AOAM533+Td42Zbnit4owgp/e7NqhdmVs6O+jYltf94BXeGv7Uh5xLX4L
 1XE80AJlaNmwEElbJjzB0IOjd1YpvzM=
X-Google-Smtp-Source: ABdhPJy9e5gAXX4WVs6VBKF4WhSO7a54/AQ4FyUsUVNcnqZMZD2LfToiJ3EXkEj8OxlK6FI35DkFIw==
X-Received: by 2002:a05:600c:19c6:: with SMTP id
 u6mr3423509wmq.154.1628870948429; 
 Fri, 13 Aug 2021 09:09:08 -0700 (PDT)
Received: from [192.168.25.202] ([95.151.188.92])
 by smtp.gmail.com with ESMTPSA id y4sm1766073wmi.22.2021.08.13.09.09.07
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 09:09:07 -0700 (PDT)
Subject: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard
 implementation for the Windows kernel
To: wireguard@lists.zx2c4.com
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
 <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <1b9f3d3f-e630-a640-af85-47bf732cbe0b@gmail.com>
Date: Fri, 13 Aug 2021 17:09:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
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

Hi

I've been using it daily since 0.4.0 on a laptop and two servers in a 
mixed Linux/WNT/FreeBSD (pfsense) environment.

Since 0.4.1 it has worked perfectly for me.

Thanks for the effort. The tunnel is subjectively snappier than the pure 
Go implementation.

Best wishes

Peter Whisker

On 13/08/2021 12:52, Jason A. Donenfeld wrote:
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
