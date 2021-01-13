Return-Path: <SRS0=J4Yg=GQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6560FC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:26:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9D42339D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C9D42339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f090c962;
	Wed, 13 Jan 2021 16:26:12 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 949d9829
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 16:26:10 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id a6so2140775wmc.2
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 08:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FbSEar9kvWex5iCqcWXXTLgl8CUFeCqjUrkJIlRY5r4=;
 b=JG1asGuZqQrhzAnedj678/YeNiQOz1dP7f/SAAbhJxOpTJlSNnS7Xw7fJA68qv4Hvi
 QbHr8l1vKnpn0UNfeGXcKLzON2k1nM6riFlJLe4lJz6AcBJdq96YD2fRq4iR0U89Oura
 GzCX+daOQrx1akpucOzLrrO3GcPV9WYCRT1odayloUu5F9ODlLAIkrBhMdk5olt087sE
 3IMjdYfjB6uui0pPCPikIx9f5wW1RopdzcY09Jd0ufZ/k8aicTwDN7E/CxEsaZNwUUSG
 PDImYAj8vo89OZ3ucDr0Q6QIROenVVUIKjOrnZQ55JMzUk1nU6PKH4IOTKw3QWZthRGH
 rkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FbSEar9kvWex5iCqcWXXTLgl8CUFeCqjUrkJIlRY5r4=;
 b=g8V1bJprjnIBnhS2Z+ceM6FJxYglI+7IEn0Qeu10eOSENG2rD6f2vWcVqqQ3vfjoic
 V5+MXzuM+EZn+5mrIraI6pU3kQah3vQHpkBJteCCom1qql7CqpVlTJw161HKAqTks5Hy
 gfgpBsGjVHrYc/6p+JZVZRGo1SNh4xU2gKk1bdmyRci8TxLdkhuxft89j7u88g3WU3oK
 TH59d0fo0onfQDZ/nPZtrMjtdFqAanTUuPR5BRCWBAXE6JaNlp0z1XyoyuUyiFaLTym4
 9Ui9f4szdegnJS7ja18K9s9fgXlM1k1YnCjWigpro9JJ3d6aUPGCj8Iew4XuVGnEkCEI
 tFgQ==
X-Gm-Message-State: AOAM533xbFZHh/HswCxpzgDoNRBRoTXtpSGiFmWK0wxoggLu7GiU/BPV
 G+Mjgbl6hFTfN8X15P3q9+SIlXRZZw3v3g==
X-Google-Smtp-Source: ABdhPJzU5X9DU5c6eITtmFjfTA3scqCCLbPhoNkwEQ2AwkKbXJgMH6+BWohTXQxbEfcGSHzeW9WrNQ==
X-Received: by 2002:a1c:6484:: with SMTP id y126mr79897wmb.76.1610555169526;
 Wed, 13 Jan 2021 08:26:09 -0800 (PST)
Received: from ?IPv6:2003:c5:5f1b:a901::3?
 (p200300c55f1ba9010000000000000003.dip0.t-ipconnect.de.
 [2003:c5:5f1b:a901::3])
 by smtp.gmail.com with ESMTPSA id f14sm3802116wme.14.2021.01.13.08.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 08:26:09 -0800 (PST)
Subject: Re: Userspace Networking Stack + WireGuard + Go
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
References: <X/8aDfdkod+rCPqK@zx2c4.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <33997a3d-591e-9aa3-92fe-a06a4d3c5b26@gmail.com>
Date: Wed, 13 Jan 2021 17:26:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X/8aDfdkod+rCPqK@zx2c4.com>
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

On 13/01/2021 17.04, Jason A. Donenfeld wrote:

 > Even if you're unprivileged and want a WireGuard interface for just a
 > single application that's bound to the lifetime of that application,
 > you can still use WireGuard's normal kernel interface inside of a user
 > namespace + a network namespace, and get a private process-specific
 > WireGuard interface.

That's what my patches from back in 2018 were trying to accomplish.
Unless I've missed something since, I do not see how what you're
describing would work.  Unless you also

- create a TUN device in the network namespace
- add a default route through that TUN device
- manually route all traffic between the init network namespace and your
   network namespace.

Is that what you meant or is there a simpler way?
