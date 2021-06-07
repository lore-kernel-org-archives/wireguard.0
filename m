Return-Path: <SRS0=oHCC=LC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D97C4743E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jun 2021 10:59:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E756127A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jun 2021 10:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E756127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f95c2e22;
	Tue, 8 Jun 2021 10:57:25 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5c7cb2f4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 19:18:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so315862wmq.5
 for <wireguard@lists.zx2c4.com>; Mon, 07 Jun 2021 12:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:references:in-reply-to:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=MarO5aDoiA+jM++PU/sc/Ex4dzy0P9Q18ztq8zU6tzs=;
 b=MuRIMMhkpnjTfrhWGvjLsq+2gm0ar81IBcZWYFVFU7wR0/DI0UiDbF3a9HBenTP6X8
 Oy/zoiSNp/aYImKiQ9cV3nGtc58SDj+k2+eoUcjYC7BWXWMbScVsGOaOoFrApsVlnpyv
 65+Y2nEzFPwhZMFuuv7LqrWRAUdvSDKiJHjLhNMSDFH3tcojnrZrqi5pri44AVGeJk3C
 +4ydPKJY7Kjup8gpkBy41PDdReinezDBMw0jNShcOL8bbTXIBKCBCJ62BQIg/pC9qoV3
 5qr8Ll7A2J2HRztR8/z/O4S/KRxBT6M9pQNAgykgSKABNrvmN08lxCOo/SpjEdEcgB1f
 zKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:in-reply-to
 :message-id:date:user-agent:mime-version:content-transfer-encoding
 :content-language;
 bh=MarO5aDoiA+jM++PU/sc/Ex4dzy0P9Q18ztq8zU6tzs=;
 b=PI1J3rZi6Be95pfnCLs+/3uK7egMoFKUs1n+Bw5UuUgPka+0SVpT5jZuuAptci8Bt7
 5r4jlx2BegYM4lrYsnT7iY2DgmyHPkawsM22Zt+SWKceDRGjPXmA30cC0PCA+zN1H/Hp
 s87TF57uEfsn9qNEONC7FGBmtISmP32ihX9YqKxmBTbxXHw3DHu3qeOueWy+a5ivqGnb
 HSHVKaqp4Gcj/Ube9OPsmhLdNv9OpjvAaLTwuaEwppXRs9TmHXstBxFCSK9UJkKExxjp
 NTBNHNbQs+6EqIBDfHA7BQqauQMst/0PJyh09N52qtIRvEV3M9BzEn6TSpFQSuZqamEi
 i6gA==
X-Gm-Message-State: AOAM533zGXiE8e3i6rVeNkT9r76EBebeShzo4/BFOHNmMJ1Xp9TZj+0k
 zMuFteGtCAMhrIpRjrzRtfkHvxgmmJ+L7A==
X-Google-Smtp-Source: ABdhPJypOn4CIv3vHtDOPL4nQd9xMI0I8tPJBwPVe4JL3LUhLExMgdP+EzCis7XcsMLfR3UvfLLGMw==
X-Received: by 2002:a05:600c:1c1b:: with SMTP id
 j27mr18794442wms.133.1623093479703; 
 Mon, 07 Jun 2021 12:17:59 -0700 (PDT)
Received: from khjkh.local (tigger2014.plus.com. [31.125.127.13])
 by smtp.gmail.com with ESMTPSA id u2sm16887552wrn.38.2021.06.07.12.17.59
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 12:17:59 -0700 (PDT)
From: ben edmunds <tigger2014g@gmail.com>
Subject: Re: Certain private keys being mangled by wg on FreeBSD
To: wireguard@lists.zx2c4.com
References: <CAHmME9o6RhPmojbA4nTRA4GqFXVstEsmmfUj8SqmaJSvGsmmWQ@mail.gmail.com>
In-Reply-To: <CAHmME9o6RhPmojbA4nTRA4GqFXVstEsmmfUj8SqmaJSvGsmmWQ@mail.gmail.com>
Message-ID: <e8baa2e1-78e4-1b02-940a-b8058f86a6cc@gmail.com>
Date: Mon, 7 Jun 2021 20:17:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 08 Jun 2021 10:57:21 +0000
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

The issue here for pfSense is that the private key will be viewable just 
like it is within native wireguard clients in the peer config options 
and needs to be viewable here for admin and debug purposes.


With regards to clamping and hiding this from users its tricky as it 
leads to red heroin issues as people debug the tunnels via showcase for 
example and will see a different key to which they entered in the UI. So 
the only logical option is to:

1) inform the admin that the key has been clamped

2) show the admin the clamped key which they can see whilst debugging.


By not showing this to the user to avoid confusion we actually would 
create confusion in this scenario as the kernel module is performing the 
clamping but the user would have no knowledge of this and leads to 
issues being opened that are a non issue. The aim is not to show the 
users anything about clamping unless the key needs to be clamped as it 
was not clamped already.

I belive it is key to remember that pfSense is not an end user 
application/tool and designed to be used by admins & network engineers 
so should be considered power users who are capable of being exposed to 
more information.


Regards

Tigger2014


