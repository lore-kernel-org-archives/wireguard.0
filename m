Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C8CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:12:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295EE60F22
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 295EE60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 790b5fbe;
	Sun, 5 Sep 2021 11:12:51 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f45bdb17
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Sep 2021 07:24:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q11so6796590wrr.9
 for <wireguard@lists.zx2c4.com>; Fri, 03 Sep 2021 00:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=SBKOVM5nheXHvDq7JT0Dhwt+9wu9N/bvd73BkwRRDag=;
 b=ojE+Kxm222fXLPogo7OnJahatU3uHvw0JyCbTM/9HAgFLSB3fl9Z5rB5lN+PJHfrC/
 uzSHZRGfU1XHwpbXqRYdxgfgnOunQ3fmnoHGNi88EjJ5qwuNfxz5ZnR+2nzWEfCO4qZn
 kZYcsqfIG9fcZX5EZEeRFwDBtVI3eMWtGDw6eGROijdq3ELuFEqZuxoPo3mJYiJo33lK
 1E8ORNrnXO5Gtc0NztlthUZHx3HBAE+LHaKmT/XsLm6coOseCWNncp6nwBCdDfWviCBj
 Usz/f3Zn50CxQAU9niIg7sqnpVbcrKlcemzYKHA/FsWR+l8KapgEGSCq/WnkQ9nnEnrl
 ryZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=SBKOVM5nheXHvDq7JT0Dhwt+9wu9N/bvd73BkwRRDag=;
 b=IuAQIjK8YMaefknVNiq/EL49Cl8utJulefraRn70NR/SeSOhH4mifU1+1QyAdq+LbH
 FqGuZzghpPwm1T+GuDM4bhEkJ82rt6/RG6sGlsOfWdazCFjs5pHxTR3eiutY4HSqfYNf
 h/X9M8CZEUUsifsQTEK1km2GrdQH9a10U+MwusnmDpU9YfxTjZ8SDHTh1e2yWtpZAD76
 LTktj7DMHg2Pxr415jDBYH4RpOFJgAeHwFAOBPup0PaUP1vJiXc0kau7vLSkgchqlmxQ
 08p9BsgjS2j8Eej4kdhOi1anzqflS4uBCSJEIFEJa6BZhSPoet0KJ1GlQHfZhmrzi6Fb
 suCQ==
X-Gm-Message-State: AOAM531aNRiwYgPhiS35Hkkr0vQYy9xingBYO4o8Md2UDQG46kWdy2Hx
 hCwyousDIjhF53Rpi3/SvdFzhy9e9PRk1Q==
X-Google-Smtp-Source: ABdhPJyrg288kUrjkfEQHeKr+vdDzE++b7Iuc6+SBYjj1OwqznAHy4VPtBj3yx+CPUC7fvzWRcqZWw==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr2318554wra.245.1630653879781; 
 Fri, 03 Sep 2021 00:24:39 -0700 (PDT)
Received: from [10.0.0.46] ([92.63.55.105])
 by smtp.gmail.com with UTF8SMTPSA id o26sm3509441wmc.17.2021.09.03.00.24.39
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 00:24:39 -0700 (PDT)
Message-ID: <c538301f-980c-99c9-4857-65867127aba3@gmail.com>
Date: Fri, 3 Sep 2021 09:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: =?UTF-8?B?Vm9qdMSbY2ggS8OhbsSb?= <vojtech.kane@gmail.com>
Subject: Strange behavior when a peer has the same key as the interface
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 05 Sep 2021 11:12:49 +0000
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

Hello,

I would like to report a strange behavior of the Wireguard Linux kernel 
implementation — when you try to create a peer whose public key matches 
the public key of the interface, the call returns success, but nothing 
is done.


I don't have an opinion (and relevant deep understanding of the crypto 
involved) whether such a call should succeed or not. Especially since 
it's 99% not what you want. I came across this issue by mistake anyway. 
However I think an error should be returned when such a peer is rejected.


Steps to reproduce:

`wg genkey > priv`

`wg pubkey > pub < priv`

`ip link add wg type wireguard`

`wg set wg private-key priv`

`wg set wg peer $(cat pub) allowed-ips 1.1.1.1/32`

Observe:

The return code is 0.

`wg show wg` does not print any peer.


The same happens when using the wgctrl golang library.


Regards,

Vojtěch Káně

