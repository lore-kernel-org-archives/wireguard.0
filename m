Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC63FC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 17:21:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 350C62053B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 17:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRM+q4WX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 350C62053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85607094;
	Fri, 6 Dec 2019 17:20:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aab4ee7f
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 17:20:56 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1d09257
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 17:20:56 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 4so3646443pfz.9
 for <wireguard@lists.zx2c4.com>; Fri, 06 Dec 2019 09:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FhB6UiFBYVKAZFXEqmpWWWYpVagRebRiIVn6oEAmHho=;
 b=bRM+q4WX1RbcTlHnWOnODPkykJm/bAo0U8Jg5c/eoMal+VHgwQg1tb/9MU+vWI0y4q
 ZcgkE6osrFTFPtnP7qk7KXyOyIEjvzZ2FTh/O9gAU+MBTNvoZd/9x+skmy/Notc6M6E9
 WzLEjxBeiDl2BmtYlRW5XdxsDZC/DObJ5rrCvBol02SyfjwPriXYUQKad5TDjQ496QFB
 kYLxi78JS5Mm3IyRsCid3PqVR1nBhSv+fbrbblIUpao4Ab076WrwawKhaaiZgFNPdKmr
 KHhIoW94TuvU5EQOs+/f5hFzohd9z33PKpQ0I6Nyrov6uhNXeyl6J+q7IEa3SR7Cx7Bz
 xIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FhB6UiFBYVKAZFXEqmpWWWYpVagRebRiIVn6oEAmHho=;
 b=Ket9Qtn+tnAVycWgj+GGkG0VJwuzszFNcBtQbAav+bDIcwNalq+YLO3Qy65M3Q7s0y
 EKdhGh8vmIMYq4kl/Tar9jPi3CoL5huaUw3/h5LSTSPiyS+SgeKIiJMosoq5nU5EmLI0
 h3jPTeN6hgtnPHXGwOadxGDALY1HD/eyobsaB/ixPRbYMezcnw3UXejwPmVNlwE7Yv9u
 EqNmF+02jgfyitn+1Ot8GOjOFlqOR02L8MwnEDZKBDgBZyCAZRMY2BCaKiNr6olfdljl
 BnFMX1c3SjUVTSWAbeIbM9lxyR+x+2yIOo4PZ4SRk2BpPHelfSc+DDtyL8rni8rV7eIC
 7A9w==
X-Gm-Message-State: APjAAAVmNXMl2+wZjM920G5d4b+TYcm1MjusJeAvG4ktBNGTfYDVK4be
 X3aFnaE94IDgpUsIesi44KB4LUMHdZ/gBQ==
X-Google-Smtp-Source: APXvYqy5nrzRK4p+3O5CxPJ7Z4Dkq40osSltVFRBVPTPj8KuN7NX8VhNEaTh16LS4qR4oKDPot6UBA==
X-Received: by 2002:aa7:968b:: with SMTP id f11mr15816199pfk.209.1575652855393; 
 Fri, 06 Dec 2019 09:20:55 -0800 (PST)
Received: from [0.0.0.0] ([166.70.207.2])
 by smtp.gmail.com with ESMTPSA id r62sm18091782pfc.89.2019.12.06.09.20.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Dec 2019 09:20:55 -0800 (PST)
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
 <fdc450ad-f382-87d7-4c63-c31d595295df@gmail.com>
 <CAHmME9pTt2MPH3gxks8S=3hVKS6P2XFkJd5eT7uivsoK7QPMJg@mail.gmail.com>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <6e0b3973-7874-275f-a9ec-cb7bf684cc7b@gmail.com>
Date: Fri, 6 Dec 2019 20:21:08 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9pTt2MPH3gxks8S=3hVKS6P2XFkJd5eT7uivsoK7QPMJg@mail.gmail.com>
Content-Language: en-US
Cc: "William J. Tolley" <william@breakpointingbad.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 06.12.2019 18:18, Jason A. Donenfeld wrote:
>
>>   But for the sake of wg-quick
>> the filter can be enables for wireguard interface only to be sure it
>> wouldn't break anything else
> How do you propose this works? That'd require adding -d, right? In
> that case we're back to more or less the original rule. If you do it
> with -i, then it fails to filter the bad packets that we want to be
> filtering.

Actually it appears to be harder than I first think

The -d option will let broadcast addresses to pass the rule. Is it a 
problem here? In the original bulletin authors talk about TCP. Testing 
for interface name doesn't make much sense either, as you said...
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
