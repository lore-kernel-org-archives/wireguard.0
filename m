Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C61FA3743
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  1 Nov 2022 05:58:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 16f5ffff;
	Tue, 1 Nov 2022 05:58:09 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f9730179
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2022 05:58:07 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id cl5so7124047wrb.9
 for <wireguard@lists.zx2c4.com>; Mon, 31 Oct 2022 22:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FDri6rK/T5wv70oAKwTmqQtVY1Vxzs93fKJXgIcFPp4=;
 b=ERxJ8RiTp6z2gmGlAgEcGPVU/N/10qJCfqZ8EkWVJbj2MKhZSCUgbrL4uCdYWVF1zq
 t7JmO01HWcDKk33dxDCqGZRrM7azC4qrWgqcIW1DPG9W51aynbQn8OrqvNJRvneXAuMF
 zXcycl8b/o2wsmSU09/7sinSyeplfh/KHN3MP7CoIu9U0crWLCJiPpjwoT0ZKXBPbrK3
 olg2DJv+93vww1Cb+Og4NXmqkIvItSTrUNJB2Zf6zbNwmCRYVKoiwy6zoMHys8ovbOGF
 UIQxUq1o1W2+kQu+lvEnZ2au/tOaeex/nQDR8JqfRPBL7HSR7ErZJehlEFQa+g3R/zrx
 i+Jw==
X-Gm-Message-State: ACrzQf1ozZbB72s4dynqu0XQ9YPa3AG5J11Mt8oU23JH9MpdrTfAapCb
 dLEm2ATvWwSpcZetO+D45Pk=
X-Google-Smtp-Source: AMsMyM7UI7bi4YwA0k+uX/sWJ5q0x+pfrkM+7gsj9jH50FHa53pnmcxZAxDz/zX1qaeWlQyaETC/vg==
X-Received: by 2002:a5d:524e:0:b0:236:6a61:3b92 with SMTP id
 k14-20020a5d524e000000b002366a613b92mr10474144wrc.328.1667282287007; 
 Mon, 31 Oct 2022 22:58:07 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003b4ff30e566sm373237wms.3.2022.10.31.22.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 22:58:06 -0700 (PDT)
Message-ID: <29259fbf-ee4c-764e-8158-274bb3914b9f@kernel.org>
Date: Tue, 1 Nov 2022 06:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, Martin Liska <mliska@suse.cz>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org
References: <20221031114424.10438-1-jirislaby@kernel.org>
 <Y1/IoR44xGaVTRUf@zx2c4.com>
From: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] wireguard (gcc13): cast enum limits members to int in
 prints
In-Reply-To: <Y1/IoR44xGaVTRUf@zx2c4.com>
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

Hi,

On 31. 10. 22, 14:07, Jason A. Donenfeld wrote:
> On Mon, Oct 31, 2022 at 12:44:24PM +0100, Jiri Slaby (SUSE) wrote:
>> Since gcc13, each member of an enum has the same type as the enum [1]. And
>> that is inherited from its members. Provided "REKEY_AFTER_MESSAGES = 1ULL
>> << 60", the named type is unsigned long.
>>
>> This generates warnings with gcc-13:
>>    error: format '%d' expects argument of type 'int', but argument 6 has type 'long unsigned int'
>>
>> Cast the enum members to int when printing them.
>>
>> Alternatively, we can cast it to ulong (to silence gcc < 12) and use %lu.
>> Alternatively, we can move REKEY_AFTER_MESSAGES away from the enum.
>>
>> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=36113
> 
> Huh, interesting situation. It's interesting that 1<<60 even works at
> all on old gccs. I guess that in this case, it just takes the type of
> the actual constant, rather than of the enum type?

Exactly, on gcc <= 12, every enum member has a type depending solely on 
its value. And yes, using anything outside <INT_MIN, INT_MAX> is 
undefined (but obviously works). As well as using anything else than 
_constants_.

thanks,
-- 
js
suse labs

