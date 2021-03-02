Return-Path: <SRS0=MYpk=IB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D272C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 08:15:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9526E64E4A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 08:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9526E64E4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dresearch-fe.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa54b23d;
	Wed, 3 Mar 2021 08:15:55 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 899205a1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Mar 2021 21:32:15 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id dx17so10546542ejb.2
 for <wireguard@lists.zx2c4.com>; Tue, 02 Mar 2021 13:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lU0zZhTVqjOZDgkYW3IlEagMQGmwRW/o6a3zWkDQyTI=;
 b=qrf0E2dq3kRHcVMmSZmBZbSF0z/Hy1bY003EGlmmh3ybzvbUUE3jXmk5X7pYkJyJGW
 BVrYsPBVqqZCIkmkkfDgoR/GL/1WwgUIAO5QJWPVy/UdZfrtylxSqEXWjQ0SBVYNmmbz
 2D3bQqyQERxi0yheeMjpP73iW/hHwzd5VzPZYpu/X7RAMwetVutli0stxRhP6dF0nz4K
 lY9i7ax0V/dTbt1S7sA7iOiGDkHunu2czWVkDLl6K1ovWXkgBCoLz3QPYymqLGEczerX
 RM2AiXjN3ag+cmVwzW9dy7qIav3Xx6xJXgIK012eNgRiyj/P31kjPs8EQPgN8UNJAKLP
 kJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lU0zZhTVqjOZDgkYW3IlEagMQGmwRW/o6a3zWkDQyTI=;
 b=eyXEMDF+8vv+595F2b+k9T+XimMSc51sLe/yEpTjbVav9srF6BdeM3tcdlj+596UnN
 Sqyp/rn4hFJob9Vi1ZDg8YhBdrq6nGhMzjlz33IA+5Ck8jvglpowynbVzi8MgI8ZbOGo
 xlpFSlvMDuhVMqEh88OORdSzov7WbmFz2mqanR6aI6achO3BUQpKFik2WcMBsNA7MUFU
 VzcygFYD2z/Rh4vlyArLtcCS/GDMO0QU9r9Jlvp5k1l8QnLcO2QhE5C65+ANZkydzqpZ
 hyASj/aFPkyfgKdEEM+fTpMC5tMSnKng3mI+lQPuJx+Gnthu2yZE5W+VxtUiVH6zCJTm
 mnSA==
X-Gm-Message-State: AOAM531uJGdZE3qdlkBkaIC20NloxUjyZd2aQ6TsCV715erVSWuvE5Kh
 DZuL8rLvn2vYInm2HdsBU9AHvsGw93qItvTg
X-Google-Smtp-Source: ABdhPJxfCjnVw/YEcReNXDL3HqXa9HdoCK/NiMwb1DqSC7hSEJtGIaShV9mICLi0NHvcrg+ABbRKkg==
X-Received: by 2002:a17:906:4f8a:: with SMTP id
 o10mr23003005eju.484.1614720735177; 
 Tue, 02 Mar 2021 13:32:15 -0800 (PST)
Received: from ?IPv6:2001:bf0:c080:401::1? (recycler.deck1.zone42.org.
 [2001:bf0:c080:401::1])
 by smtp.gmail.com with ESMTPSA id g20sm18794413ejz.54.2021.03.02.13.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 13:32:14 -0800 (PST)
Subject: Re: Fwd: Problems with Windows client over PulseSecure VPN
To: Peter Whisker <peter.whisker@gmail.com>, wireguard@lists.zx2c4.com
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9ojL5JxWh5Vn_RsBB8baLabhFvotAuSoQ61fJeht=2qEA@mail.gmail.com>
 <2dc629e2-93c9-4ed9-ea57-4318c8b62a73@gmail.com>
 <397bedc7-3913-08bb-a6f3-691d9fab663c@gmail.com>
 <CAN5wt5r9rQpYcCkshBimOARoAxx7T529oUw6RSNnr4q3_y_31g@mail.gmail.com>
 <CAN5wt5ojzay9uEjubrrivd6vZqOGNJ40M25ELzOYTK42zozijQ@mail.gmail.com>
 <1a18b8f5-3c98-24c5-a0ce-90515a8528ae@gmail.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <775ac4cf-eeb1-5fa5-29fa-f5ddb8255959@dresearch-fe.de>
Date: Tue, 2 Mar 2021 22:32:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1a18b8f5-3c98-24c5-a0ce-90515a8528ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 03 Mar 2021 08:15:49 +0000
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

On 19.01.21 11:39, Peter Whisker wrote:
> I built Wireguard with the change you made below and ...
> 
> Is there a reason this fix can not be adopted?

According to https://www.wireguard.com/repositories/ should send a properly formatted patch including a Signed-off-by: line using git-send-email to this list.

I suggest to CC the maintainers of the wireguard-windows repo Simon Rozman <simon@rozman.si> and Jason A. Donenfeld <Jason@zx2c4.com>.

Regards,
Steffen

