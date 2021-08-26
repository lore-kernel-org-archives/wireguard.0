Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2523AC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Aug 2021 21:11:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3332160F4C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Aug 2021 21:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3332160F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7facaf0e;
	Thu, 26 Aug 2021 21:11:36 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 75306b1a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Aug 2021 21:11:32 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso5282464otu.7
 for <wireguard@lists.zx2c4.com>; Thu, 26 Aug 2021 14:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nMZfMGCf7gEgKHWB3C2579v7LEh9Aqv/g0GiXmajcO8=;
 b=VeAYrG7JhdG9lEaLgS+Dk01I/olhHr0XeClaFGGoHuiNnYkYVQ52j6jbfDuE/czUVA
 owDsOiYaj27UeRyXeJv7i3p4ccmiua1G9O3N+1oZs8NfzqRq+zVaTz4qZ1KJFp2bZW8+
 e7aGNw31la5nGQ20hdtNkxpU8neUgqZjo7S74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nMZfMGCf7gEgKHWB3C2579v7LEh9Aqv/g0GiXmajcO8=;
 b=fD/Hmj/34fYL3+v/uEd9ffib/iW2RvYwBySNbezZTm4iMi1t5LAF2f+y2BUAD3pWfY
 lG6nHGFM+xABkvfjYDj/mLYMjcYWRvRQAoppEkQttUjjHriHsmFrQxXsCCIUsfGqvc+T
 G0ymrfZ6CX15ii1dALammH7HuyPT8K2wPxC9kmGx47PU5KIL+vZ4Nsy8BqqP1uXAYOKK
 urU6c8rYqnZSRn85/9FsqVa1CR67J6oimKI+827Zz9D/7pClwdUIJ7MUMhlYSISOFhRF
 pHD54dc8LOkblSYqDwJbWS/05Qz6eUFuPeamD+Lhu2MizmTIH8zkie2ImVDdOw9qUz/j
 xTFA==
X-Gm-Message-State: AOAM533Btd3q+LZR+rLRa2c48vBhYsY0YAR3lHkV0Zmg3CxviuokdxHz
 MZTKbaMsyQz9/0vyr+5yBQLm4Q==
X-Google-Smtp-Source: ABdhPJyKZDOGl5fi2xMFbJRUiuvQnXN5rxY8OeWvFk7Qi+6N0Fgqg8TQRq0VO9vUwYRDKp/uyvN0Aw==
X-Received: by 2002:a9d:6398:: with SMTP id w24mr5079936otk.140.1630012290267; 
 Thu, 26 Aug 2021 14:11:30 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id u27sm830726otj.6.2021.08.26.14.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 14:11:29 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] selftests/wireguard: Rename DEBUG_PI_LIST to
 DEBUG_PLIST
To: Li Zhijian <lizhijian@cn.fujitsu.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Cc: philip.li@intel.com, linux-kernel@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20210826015847.7416-1-lizhijian@cn.fujitsu.com>
 <20210826015847.7416-4-lizhijian@cn.fujitsu.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0df0882e-53e5-e407-ed29-e21da7965bc4@linuxfoundation.org>
Date: Thu, 26 Aug 2021 15:11:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210826015847.7416-4-lizhijian@cn.fujitsu.com>
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

On 8/25/21 7:58 PM, Li Zhijian wrote:
> DEBUG_PI_LIST was renamed to DEBUG_PLIST since 8e18faeac3 ("lib/plist: rename DEBUG_PI_LIST to DEBUG_PLIST")
> 
> CC: "Jason A. Donenfeld" <Jason@zx2c4.com>
> CC: Nick Desaulniers <ndesaulniers@google.com>
> CC: Masahiro Yamada <masahiroy@kernel.org>
> CC: wireguard@lists.zx2c4.com
> CC: netdev@vger.kernel.org
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---

Can you please state what you are fixing and also keep the sentences
75 chars or less.

Where is LKP warning? Include the warning and explain why this
change is necessary.

thanks,
-- Shuah
