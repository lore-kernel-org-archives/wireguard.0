Return-Path: <SRS0=4XTf=PR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8342FC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 15:34:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC5C60F23
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 15:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABC5C60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78bbf749;
	Fri, 29 Oct 2021 15:30:31 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e1f1b4c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Oct 2021 15:30:29 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 lx5-20020a17090b4b0500b001a262880e99so7615211pjb.5
 for <wireguard@lists.zx2c4.com>; Fri, 29 Oct 2021 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NIak2Y5FQ2Wjf4P7X8gzcJU94dOFnB5agLKanXkb2MU=;
 b=VonLltqQY+CqzFXaC7fWfjDqD+2Lersu0M8vMPoboW+ryJRlLf5OsDfV3K/HH3PppW
 xYqGwX7TpJgUu8VMh89eLXsVvcJSogw35ArfPy37oqH4goNQ1J+nku6J4K/D1vBpR/9W
 VMbLVFo59Z09TuF+NQtd1QmuDGxRWD8dSY4wIqXqg/7SKUYsXkEkRqfRKqj+XNBAi2qc
 8jtdDU5CW2jnmdvkeupKSMcvj1NibXpyBM59oWwAmDsU67RW1ZMXdU+sRdIAxavtyTms
 x2bVFWBlmcpwqpbV9RKrezg6vZYCo0QEdgRpZfOBg95QaC44DYEDytav2DfXAyw0FWQ3
 7hXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIak2Y5FQ2Wjf4P7X8gzcJU94dOFnB5agLKanXkb2MU=;
 b=1Q4cBxpudvJinuVwFfp9ykKvebEA5IW5OzYajvEukyC1lv2FApn5zQ6OdKfTgd87DI
 MFI9wGy6J/L8n7DL0yR9ZZPrI3vc+eMrGsQVRfc8R/aJi9XbOKuC0/182ywFwCsb20K+
 xcjOFQVoJ7i9Pak8sG/pbIlYWE5KZ7LDxcAOTFM4MHfblkrIpURN1hfVM5DrXLJ9/xAB
 +LIpvgt6OT7gApd8jen1vKVG0WZcvi7kzfqztbeNB2fowgGrIcEXwkTWWL2i4Vlm4g6R
 wm4BQRThPwjEPufmiLej95saOGCw3Ebkv+MyFhnCJbhYmMxgHfBYbmv16q/4GGmiwlTd
 1wFA==
X-Gm-Message-State: AOAM531r+lFswaBCvi34+yPPMgmUIaa1x0SsPsAN5uWxXOcLoxbKZr2/
 26f7svwErYrCELl2PNyoZQAirAgR4H0=
X-Google-Smtp-Source: ABdhPJyR8O6TcJoaRx+rHzlWxtjHT7cyn8u68xf4QLnyURRfv5wQj7opPBt0X9by/uz16wGcPgryvQ==
X-Received: by 2002:a17:90b:4d8f:: with SMTP id
 oj15mr4512687pjb.6.1635521427708; 
 Fri, 29 Oct 2021 08:30:27 -0700 (PDT)
Received: from [192.168.86.235] (c-73-241-150-58.hsd1.ca.comcast.net.
 [73.241.150.58])
 by smtp.gmail.com with ESMTPSA id v12sm6339671pjs.0.2021.10.29.08.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 08:30:27 -0700 (PDT)
Subject: Re: [PATCH] wireguard: queueing: Fix implicit type conversion
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, jiasheng@iscas.ac.cn
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <1635469664-1708957-1-git-send-email-jiasheng@iscas.ac.cn>
 <CAHmME9p9EA0qCw2ha_X9HR7NWSt1Zam4+srYHCs=-U4LvQiJdA@mail.gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <99a32425-ca42-8d99-1276-efb889300cce@gmail.com>
Date: Fri, 29 Oct 2021 08:30:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9p9EA0qCw2ha_X9HR7NWSt1Zam4+srYHCs=-U4LvQiJdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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



On 10/29/21 7:27 AM, Jason A. Donenfeld wrote:
> On Fri, Oct 29, 2021 at 3:08 AM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>> It is universally accepted that the implicit type conversion is
>> terrible.
> 
> I'm not so sure about this, but either way, I think this needs a bit
> more justification and analysis to merge. cpumask_weight returns an
> unsigned, for example, and is used as a modulo operand later in the
> function. It looks like nr_cpumask_bits is also unsigned. And so on.
> So you're really trading one implicit type conversion package for
> another. If you're swapping these around, why? It can't be because,
> "it is universally accepted that the implicit type conversion is
> terrible," since you're adding more of it in a different form. Is your
> set of implicit type conversions semantically more proper? If so,
> please describe that. Alternatively, is there a way to harmonize
> everything into one type? Is there a minimal set of casts that enables
> that?
>

I agree with you.

Even standard iterators play/mix with signed/unsigned in plain sight.

extern unsigned int nr_cpu_ids;

unsigned int cpumask_next(int n, const struct cpumask *srcp);

int cpumask_next_wrap(int n, const struct cpumask *mask, int start, bool wrap);

#define for_each_cpu(cpu, mask)				\
	for ((cpu) = -1;				\
		(cpu) = cpumask_next((cpu), (mask)),	\
		(cpu) < nr_cpu_ids;)

