Return-Path: <SRS0=J4Yg=GQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87619C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:42:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABD8233F6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABD8233F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5768a267;
	Wed, 13 Jan 2021 16:41:07 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8e1849f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 16:41:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 3so2190595wmg.4
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S2dhEmjDRh6E+S1AkDHVMIH00BDvHhFUcCdTCjwl07Q=;
 b=jpo1Duh19vxBNauMavPIgPW+Ra2PhdSjEOPk5qW4xV4xf8EBPRpZ0gKTcPmXj3ot6+
 dOBG4p+snNDLnkELgMJw7AobqrJZPed/qqFXB2CVxQqT0dHOj81NobwP8gAdbv1i5BRK
 NdSXHI6oWr6nsB0vln6T1ZC88RvldS/g01O7ZntAWcz2TLChuktsxSIC5X69X/ADQYnt
 7fL4V7td/BF2V3MJv2/hi1IHx+PXtKiH8ajkhj4BgTwkPClHcirmSnetGLK55p190GSs
 Jrt1nXd98Pwj9A4PGBGWHCiBP9raulJ/+VJ9Z2IWDm66oLAQBMjI/rKOwGWGAVVg9g2o
 MsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S2dhEmjDRh6E+S1AkDHVMIH00BDvHhFUcCdTCjwl07Q=;
 b=Jxu/aXJXa5Y+z4pYDBqxj6tTJJznp0T/Z6th1fOfHq47dbqw298a85gNlw0AmXlf4M
 sNRE/q9L3M7jY55riJC9v20iX3FtyBR2+bxzQifuFFP36zMmE0jC45aseTn51Wo1gRZE
 13SCPot/usxmZvvAfZKJJVK9XNAZ2TC1D7NFbR4VfR41PCdTqFyLUa+AxDj85dAO9Uvr
 T5z3fh9ViO7bFkPYC+CmJnBsIL+hRsdhxmpDFeh6fM0Z6ZMErOwmUwvsSM3BmP2nND2B
 1tydfROyedLIzgL3KuRTdTj3bjxKQqeiihdrhCvlY8AVzIQod49BRwOhFa6TODBwr8JH
 nPAw==
X-Gm-Message-State: AOAM533mW2/D/+0DGYMK3LhuBiaJSSGEZTN1qSJGVVBgCmxphxBj9o7e
 MP9UGOGcnC+pG+I//tbHDWAVf5pKpAgfrw==
X-Google-Smtp-Source: ABdhPJzWJVrOrz26xtuxN6t8heNGLtrLvqQ1qUkoNo+7rAHdNRz/LLt+Pzg3DZQORJdtwmT0sN/08g==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr69901wme.183.1610556060623;
 Wed, 13 Jan 2021 08:41:00 -0800 (PST)
Received: from ?IPv6:2003:c5:5f1b:a901::3?
 (p200300c55f1ba9010000000000000003.dip0.t-ipconnect.de.
 [2003:c5:5f1b:a901::3])
 by smtp.gmail.com with ESMTPSA id 138sm4177594wma.41.2021.01.13.08.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 08:41:00 -0800 (PST)
Subject: Re: network namespace wireguard routing [Was: Re: Userspace
 Networking Stack + WireGuard + Go]
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <X/8aDfdkod+rCPqK@zx2c4.com>
 <33997a3d-591e-9aa3-92fe-a06a4d3c5b26@gmail.com>
 <CAHmME9rbUbEZah0MDtdRXhUxMtOSrcdo4BCN1LY-iDtXUWHy5Q@mail.gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <abbf2cfa-025b-78ac-1d26-aeb9ce9263a3@gmail.com>
Date: Wed, 13 Jan 2021 17:40:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rbUbEZah0MDtdRXhUxMtOSrcdo4BCN1LY-iDtXUWHy5Q@mail.gmail.com>
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

On 13/01/2021 17.33, Jason A. Donenfeld wrote:
 > In order to prevent this Go thread from being hijacked with Linux
 > concerns, I've changed the Subject line of the email. Please keep
 > follow ups in this thread rather than the other.
 >
 > Response is in line below:
 >
 > On Wed, Jan 13, 2021 at 5:26 PM Julian Orth <ju.orth@gmail.com> wrote:
 >>
 >> On 13/01/2021 17.04, Jason A. Donenfeld wrote:
 >>
 >>   > Even if you're unprivileged and want a WireGuard interface for just a
 >>   > single application that's bound to the lifetime of that application,
 >>   > you can still use WireGuard's normal kernel interface inside of a user
 >>   > namespace + a network namespace, and get a private process-specific
 >>   > WireGuard interface.
 >>
 >> That's what my patches from back in 2018 were trying to accomplish.
 >> Unless I've missed something since, I do not see how what you're
 >> describing would work.  Unless you also
 >>
 >> - create a TUN device in the network namespace
 >> - add a default route through that TUN device
 >> - manually route all traffic between the init network namespace and your
 >>     network namespace.
 >>
 >> Is that what you meant or is there a simpler way?
 >
 > What I meant was:
 >
 > 1. User opens his shell and runs ./blah. That executes in the init
 > namespace where all the physical interfaces are.
 > 2. blah creates a wireguard interface.
 > 3. blah creates a network namespace.
 > 4. blah moves that wireguard interface into that network namespace.
 > 5. blah calls `setns()` on one of its threads to use that network namespace.
 >
 > Thinking about this in more detail, I'm guessing you take issue with
 > step #2? Since that actually might require privileges in the init
 > namespace?

Exactly :). My patches in 2018 were trying to solve this by allowing the
user to change the "transit" network namespace after the device has been
created. The "transit" network namespace being the namespace in which
the Wireguard UDP socket lives. This would not require privileges in the
transit namespace, only some kind of proof that the user can create UDP
sockets in said namespace.

 >
 > Jason
 >
