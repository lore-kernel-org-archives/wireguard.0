Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B52C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Aug 2021 19:33:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BDA1610F9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Aug 2021 19:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BDA1610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85c0ba03;
	Wed, 25 Aug 2021 19:31:34 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4c0d38de
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Aug 2021 19:31:31 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso375095ots.5
 for <wireguard@lists.zx2c4.com>; Wed, 25 Aug 2021 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J6WVjBvRIT9A+PrV6sxYc5oJqYhffihj3mZfN9H1dBg=;
 b=cRh+wuj9sAm9jNkbwlr/GCHXATQ88pPCKppXfUIy6dkAQwiRWGUxp7B/uI5Qvv6SW9
 udoev0jxKXpaNed5mEERl71dmvdRngbtcrWxZB2DgfJBAojZiX1ktlzaoUMusoW0ZA6K
 Gh/+Hfl1aKsLDeEcA9z8w/swfj7HoWcrixe38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J6WVjBvRIT9A+PrV6sxYc5oJqYhffihj3mZfN9H1dBg=;
 b=DNjJx/xduB7y3UP8YP/naasaSon6BCqWU2B7oA+bL7Bow+B9+mxCQQpncdDxmxhQvJ
 aAFWzsYoT0htR2A7I+DM3iId1vIuSfDqlqzk/y7mKzonexRE4sMnd42aWTwFWZEeEopV
 cKz+ZR0RNY+UZWfkcBIxqKMna/nJujUHrwIc7e/HB7HUrJZtJz5qdlF+9vZjdAGes2+q
 fzpypPKQoaIa+17bKIWQRUTwJVwhU/ig1UM87L8u9UozpfgdjEY2lelV/zVAAwwD7PyE
 6QHm7zvyBg93cQuSuAIeKKGZ9MkJXRoq+EMhAZ2y9W8w3+7Wt6myDOeENjZ/vaaPkqpH
 7vZw==
X-Gm-Message-State: AOAM530iHMNX/4GcURuDghk1zFLfvqlYWvTf0qk8giLkMpGeVofoccXI
 CAs7t9+mRvuEtAAdba1HAdjB9g==
X-Google-Smtp-Source: ABdhPJzn7PpAMNIwAANraSQTOK7Ycgz1keQAfVRX9TYP4QAz30FZ/pSOKYIUDkIykLmZS5fZSUh6QQ==
X-Received: by 2002:a05:6830:2a06:: with SMTP id
 y6mr89291otu.134.1629919889711; 
 Wed, 25 Aug 2021 12:31:29 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id k19sm156565oiw.49.2021.08.25.12.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 12:31:29 -0700 (PDT)
Subject: Re: [PATCH] selftests: cleanup config
To: Li Zhijian <lizhijian@cn.fujitsu.com>, rjw@rjwysocki.net,
 viresh.kumar@linaro.org, shuah@kernel.org, Jason@zx2c4.com,
 masahiroy@kernel.org, linux-kselftest@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20210825050948.10339-1-lizhijian@cn.fujitsu.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <6547d239-56b7-71c0-70c9-20a67bdad1dd@linuxfoundation.org>
Date: Wed, 25 Aug 2021 13:31:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210825050948.10339-1-lizhijian@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

On 8/24/21 11:09 PM, Li Zhijian wrote:
> - DEBUG_PI_LIST was renamed to DEBUG_PLIST since 8e18faeac3 ("lib/plist: rename DEBUG_PI_LIST to DEBUG_PLIST")
> - SYNC was removed since aff9da10e21 ("staging/android: make sync_timeline internal to sw_sync")
> 

Please write a complete commit log explaining the change
and tell us what happens if we don't do this.

> $ for k in $(grep ^CONFIG $(find tools/testing/selftests/ -name config) | awk -F'=' '{print$1}' | awk -F':' '{print $2}' | sort | uniq); do  k=${k#CONFIG_}; git grep -qw -e "menuconfig $k" -e "config $k" || echo "$k is missing"; done;
> DEBUG_PI_LIST is missing
> SYNC is missing
> 
> CC: Philip Li <philip.li@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>   tools/testing/selftests/cpufreq/config              | 2 +-
>   tools/testing/selftests/sync/config                 | 1 -
>   tools/testing/selftests/wireguard/qemu/debug.config | 2 +-
>   3 files changed, 2 insertions(+), 3 deletions(-)
> 

Please split this into 3 patches

thanks,
-- Shuah

