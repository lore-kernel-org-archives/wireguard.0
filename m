Return-Path: <SRS0=PDJl=4R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE83C3F2D6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 07:00:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA69A24699
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 07:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4l+ZLLx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA69A24699
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd52bb96;
	Sat, 29 Feb 2020 06:56:29 +0000 (UTC)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2697dfe9
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Feb 2020 06:56:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id i10so9788580wmd.1
 for <wireguard@lists.zx2c4.com>; Fri, 28 Feb 2020 23:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=SsxpUMbm5dPAqueSVcclLqRs9Su6NpUEP5a2YJgGO1c=;
 b=Z4l+ZLLxkmPSs3dw2pLog8c8+FFNE/KZ04ooFY5Uqv6WY0Hu4jfPOc1kO2+eWlfJZ9
 LvrGGgC/Pwi7lYxilGjmZqIa8ReLqCJS39P4yA3S/hE5N8asX1d7j6ZjVKQQ87WkS4A5
 SjF8CHrsA8zpx/8vHg0Qfon7T3og5CzAq+L+72AZtolO05c2Ss2O0b/fnZcpe30sbzJ6
 Ki0hfepHuPG87V0Ei3H71eoi0miak4ZaZ7/4Y2Fvjn8Eweq7lwVTMJAEUwNabG6yknvd
 3nn/FNYZjWBtz2Sxrf0HNFbPEAhVx9SWq2jWqyuK8PFDlxv+LoTfNuOT/jmLWzeIqBi+
 jsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SsxpUMbm5dPAqueSVcclLqRs9Su6NpUEP5a2YJgGO1c=;
 b=k+BQp92c2uCKIfatoN093FO+3AqWtiPjet7Stp4EbnJyqt1oS4AlINbaDJFYuAsho9
 0xh1GYJ003S8yVK3Kmhqh/+a4Y9AHSpYR86nlsB3qnExDoWwWYqqVyLbWLit9pftGNDz
 U9Ihw9NpXtKY3AJfuNdj78GHJPNPxqK0ogqTsWGohOAEOhLeukr133vsbjx4JsFplbq0
 PYcwxqmbXiA6j40BqojzWTfvVfNyRJfS4JOujuZZ6/i785EomNFS1RzlE+wOIoa4cnnd
 SfC5F1WbgST7rHqNKRa44GZkC/YidK7OgO3JvgAYVt33yOfNNahfaHFe0h6L+AC9182D
 Nb3g==
X-Gm-Message-State: APjAAAWBZgZjmnib+R51PakvfYoU9VSc+osV1sJGIarC2adFauB9YUMm
 h4e1qIcdwKx5amyrYx9ivrTKw6GYhfU=
X-Google-Smtp-Source: APXvYqykO0rvptJoUF826iMl6AZ9cHNLDd6S81GbCtXeQb/BtNjAPwlMZNmQphwzvh7eJkeo4iylBw==
X-Received: by 2002:a1c:9a51:: with SMTP id c78mr8722115wme.130.1582959625905; 
 Fri, 28 Feb 2020 23:00:25 -0800 (PST)
Received: from [0.0.0.0] (tor-exit-4.zbau.f3netze.de. [185.220.100.255])
 by smtp.gmail.com with ESMTPSA id i10sm9002861wrn.53.2020.02.28.23.00.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Feb 2020 23:00:25 -0800 (PST)
Subject: Re: [PATCH] Update Simplified Chinese translation
To: Samuel Holland <samuel@sholland.org>, wireguard@lists.zx2c4.com
References: <20200223111248.1083-1-srb12345@vip.qq.com>
 <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
 <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
 <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
 <1eb99bf8-f07e-9b13-f543-017b14a3df5f@gmail.com>
 <bc47c4f7-4aa4-fc6e-8f3c-34366c756236@sholland.org>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <3bce7f79-88df-8035-6eb9-1e19e51c01a5@gmail.com>
Date: Sat, 29 Feb 2020 10:00:25 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bc47c4f7-4aa4-fc6e-8f3c-34366c756236@sholland.org>
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 26.02.2020 6:59, Samuel Holland wrote:
> On 2/25/20 9:44 PM, Vasili Pupkin wrote:
>> It seams that russian translation is very basic and not utilize 
>> quantity="two"
>> and quantity="few" forms, without them some plurals reads odd. Do you need help
>> fixing it or it is done on purpose?
> I don't think it was done on purpose; likely the translator was unaware of the
> additional options for quantity in <item> tags. I am happy to merge patches
> improving the translation (which is really up to your judgement, since I don't
> speak any of these languages).

Have you received the patch?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
