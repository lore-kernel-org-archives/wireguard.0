Return-Path: <SRS0=K6Kf=FG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A98CC64E7B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:38:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A7FE221FB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A7FE221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50186807;
	Wed, 2 Dec 2020 13:31:19 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 082358d9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 12:41:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id a6so4851906wmc.2
 for <wireguard@lists.zx2c4.com>; Mon, 30 Nov 2020 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=JsqUxGNII6hSenvy4yB84zlEgJYkyBFf6YpwKSjf6kg=;
 b=PmaoPSy53jBuG7dJLDl387jafjgd/cLZDx3ougkUyKNTzpv4bqg5kTScvYeiWbsaUM
 vG376LK9wmSyDFuxwEAxm3TtnWwNZ/p4UNyKDyjWK6A7bEOB5zO81q3w25beZYui/HFx
 xkmmtGYbzaxA4E4OZvJ+JvbLHzBx4FM95vJ1P/5aAklPpb2eX42nb8LRpIs9kxGTlsyc
 5pN4/WU/C/XtnRySkgCeXOvATezVpnWKOgWqAqZe+N/t3fro6vB+BdGltDBVCCuaxCtY
 KfskPWIirsXavClCeAjQ6KPtVvZ3QekCz0ODxMup7N1uX6NAArmuSGx4mDQZmH+oVUVn
 p+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JsqUxGNII6hSenvy4yB84zlEgJYkyBFf6YpwKSjf6kg=;
 b=N5bD9KjCa+j9LyuUQ1HdnYOpAlbP9fikVq2DTUOdcfE5tVrIHh504TC7t95icvY03x
 1Ck4P/0tG1/kN8bBs2RGGmPv57W66Qg/4F5XFaLsucf+ln53NJ0vhNBZaPXKox08lU3i
 t5d8pWXN10phuLiC5NE7nreJmvD6XRVxmmJf++otu0ZfqLXiszsh0KMFG6snQh3JLtgf
 VeZROPOKr8pC649pY6EixxK0JLftP8C5M/3D9jMZ7WpBh4zwiTmiuUhaDjdG4W4BD9zc
 3bspd1lQS2yFgZXsuxjZ88XMcU8LRrRHIuohOPY64q5xOo/JWmwJUp9kX6l4mZdxcCB3
 /POQ==
X-Gm-Message-State: AOAM533+rtBuCun7s/L17hv3Vmq+m6COWcdll4gWA/63UCc/vwb61c+/
 HDN78/9XwJnAb/TJeY/IS+bZSFdTs+2E1E5l
X-Google-Smtp-Source: ABdhPJw7hTeN2cePHx8w8w4xNjcDjZ3GqTc6R6vCgdYL06SrlczmTOu4kernhOkwfwugneko4m2DPA==
X-Received: by 2002:a1c:c90b:: with SMTP id f11mr3141780wmb.47.1606740461752; 
 Mon, 30 Nov 2020 04:47:41 -0800 (PST)
Received: from [192.168.25.215] ([2.25.87.112])
 by smtp.gmail.com with ESMTPSA id r1sm27060526wra.97.2020.11.30.04.47.40
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 04:47:41 -0800 (PST)
Subject: Probable Heresy ;-)
To: wireguard@lists.zx2c4.com
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
 <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
 <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
 <CABtXGiD7Q4904nit3C=A12AnJh0rmLeW3skhPoWXEYdP2mLTXw@mail.gmail.com>
 <CAHmME9ohy8Tfko=hO3jLDCJ92X6LQmYoCyTmCgH9N0R5EdPw5g@mail.gmail.com>
 <CABtXGiDREy3K00JLQfuCmu3hTrKnorBd0VrL5kKEL4_x3Lc1jA@mail.gmail.com>
 <CAHmME9o6MdOW=ODPH=Ksh5urUJaaE5Y8HPwkdL7F-_3XCa1KJQ@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <b80d2dd8-0423-20ea-eea4-6d7c45a7ff83@gmail.com>
Date: Mon, 30 Nov 2020 12:47:40 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9o6MdOW=ODPH=Ksh5urUJaaE5Y8HPwkdL7F-_3XCa1KJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 02 Dec 2020 14:31:19 +0100
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

I expect to be shot down regarding this suggestion, but has there been 
any thought given to adding and optionally allowing enabing of lz4-v2 
compression of the plaintext payload before Wireguard encryption?

The reason I ask is that I was doing some tests recently and was 
horrified to find that OpenVPN with it's lz4-v2 switched on seriously 
outperformed Wireguard by about 50% in my test case. Obviously YMMV 
depending on the data stream.

I believe that lz4-v2 is very fast and has no overhead in incompressible 
packets. I realise that there have been some attacks on compressed 
encrypted data (eg the CRIME and BReACH attacks on TLS) but I don't know 
if they apply here.

Just wondering if there is a reason why it has not been done?

Regards

Peter


