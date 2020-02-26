Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDECC4BA0B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:44:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 122F52067C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6HLUa52"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 122F52067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef5f7fe7;
	Wed, 26 Feb 2020 03:41:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f48fb7e2
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:41:08 +0000 (UTC)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f65227d9
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:41:08 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d10so1311289ljl.9
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 19:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=pWdzIz3mxSnyURqRwDkyN+07nNLLDIwXVxKGDkGpbzU=;
 b=Z6HLUa52SJaSQciXvAmLlt/+48pgubOP0+r4sq10WV8935/0JlbyI9KzID1Se9TB5s
 BWUjMVthK1MIcXVEaUFd6xuWDuPzxQCwJe52h1IDYSxxPFPR3kHx+WpFrCrjIxDtwxah
 HWYjQFoaFfQnjvbEUPP6aOkwF29RgxLsm+Hj7Fj42C1EXCVMA78npNnWzD0IWyK2KvW1
 PG5owN1u801bGN01Wn1j2PZxO9w83zI48p3PiOA8toIbrhNjSepA9oo7UCBCzwzrJ5PC
 XaS5d1QdxgjKK76Uwqd+Ir6wsXMcvxoRqruzbwE1luiOuAtGev5BhFkcpTseQk5Cdr+K
 qMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pWdzIz3mxSnyURqRwDkyN+07nNLLDIwXVxKGDkGpbzU=;
 b=cpUv6ArDztY5BNaHZk02AZQLovoscXKuK5VYAd7GstlxkVBPUJb9dg9cXl9WXXu2ro
 O47Z6VZTBRTx0CP8/7t+doIESmA3Yltb3KY1/vFt5+4kjOtufNuvkcAY8LAaBprgecqp
 Wi3WljaNh6jcyPB+l5NQKwviBIZp8XQ9u7DUEpV4cF83uA7RWzQvWGhEtgTJc7UeTpC1
 IzBX5QhTO/JnEYc7PGDD9+rxKrz6hQe6Y0Tk/7wNa+iBcBdpWT86NDoRFIV+YXamlAUe
 lE3YK/HwwAFemGLzpOjEhG1GBf0eu3MLkStYCAhlbEIArWm1oiZG0HDKzstV86queKo+
 wwpA==
X-Gm-Message-State: ANhLgQ3GK/3RUCscX6B/0+PiIYW2h3geGf8J9LWxqe/6n314DuEGYiIF
 Xpa38rCMC7peifZIXx/zKgs1DtuOTfU=
X-Google-Smtp-Source: APXvYqwp1E5Mtm/2yJVynzqjO9sUK7AhEHKKKukSamMQpD6lvlvt5kZNDHx08dlvypX8jVl+wn+Jiw==
X-Received: by 2002:a2e:e12:: with SMTP id 18mr1441373ljo.123.1582688683211;
 Tue, 25 Feb 2020 19:44:43 -0800 (PST)
Received: from [0.0.0.0] ([178.165.72.177])
 by smtp.gmail.com with ESMTPSA id j26sm261702lfm.3.2020.02.25.19.44.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 19:44:42 -0800 (PST)
Subject: Re: [PATCH] Update Simplified Chinese translation
To: Samuel Holland <samuel@sholland.org>, wireguard@lists.zx2c4.com
References: <20200223111248.1083-1-srb12345@vip.qq.com>
 <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
 <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
 <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <1eb99bf8-f07e-9b13-f543-017b14a3df5f@gmail.com>
Date: Wed, 26 Feb 2020 06:44:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
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

On 26.02.2020 5:56, Samuel Holland wrote:
> On 2/25/20 2:13 AM, Eiji Tanioka wrote:
>> Hi Samuel.
>>
>> I already translated in Japanese, but I didn't concern about plurals.
>>
>> Japanese doesn't have plurals, so does "values-ja/strings.xml" needs these fix?
>> - remove plurals
>> - add string resource that have same "name" attribute as plurals
> Resources that have <plural> tags in the untranslated XML should use <plural> in
> translations as well. However, the only <item> tag inside them should be
> "other". (It should look like the Chinese translation did before this patch.)
>
> So the only thing to fix is removing the <item quantity="one"> tags.

It seams that russian translation is very basic and not utilize 
quantity="two" and quantity="few" forms, without them some plurals reads 
odd. Do you need help fixing it or it is done on purpose?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
