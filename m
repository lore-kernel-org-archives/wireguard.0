Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28789C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 07:57:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2a2f7091;
	Mon, 13 Dec 2021 07:54:20 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8fa7f291
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 07:54:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id p18so11224463wmq.5
 for <wireguard@lists.zx2c4.com>; Sun, 12 Dec 2021 23:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B9nH0mSuH/Y4vyztJjNWUydhUpWXC4W3rp4XWpIoYWY=;
 b=iUH6tBbhPlroHwcCSzOx06qx1h5+o7vJgZLvPFLHrBZoBbCeKpA9fUBMrnLTI1kg4G
 y52OWrjguXGpruT3lKff88pTSXEbInOPetLyd2OJfRaMrpanT3mBTiKK7nk5Gedbqac8
 FrmzcKfyYGs3ZdSS9jqAXAyDyEHLUiVba6plxGaMzKT03YwY8t/aUBuZkBcoplAwF9Fq
 P94afu4DSowE85bBij0ZhyUrsFfe1x7xstF337+eIEj98why287y+ArzJQjwx4rr1KJi
 vqK4hvmuqcX64wW2j9FimkfBxm/VB/wUKpE4qmxtAFfF9zbC2qtKILPY4TyZftTZcRlN
 rw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B9nH0mSuH/Y4vyztJjNWUydhUpWXC4W3rp4XWpIoYWY=;
 b=sQ9xbae5UvoVly8dC0Ru8AtURa/NZCJCeFpJPmwyintUByhuykTQj0fLRab2ogsxPX
 9rCyw55ULUSIsMph0g+nZR5kH7lnyddkD6xbkGOFug2cm1XX33IRAs4HaP8Dy8b5WOic
 eVfM1MFqKpq4fUw9rM1a+LCJ3weotT8lzuIJCbv36O4Gp4MZs+ivJSJ6DUsaGif4JX2e
 PPKmNIi2zZC8wyunvt0fVZKmXr3oSyDZZF7GzZa5jU5xn2jWMRF/bOos+ews6mS5F6zj
 ep8tywLdWs2qKcAJS7RljTSBflyeJ77UtXStyfk7xAzSD/VhpLv7OquE9YU8JWIzHYuZ
 qc1A==
X-Gm-Message-State: AOAM533CAJ0vMD1xD2NEo9pJbfoQnXcaYGmfS9ZiZGujsQZ4hdTFJPCl
 qRkAf7FPLyc9TQwzSCVjGVkoZ8u14ngr6w==
X-Google-Smtp-Source: ABdhPJyQufjtwiim4ct9dbz4KyAVZ0QCCSP/PDIR2A0wxU4ipUcyxyQYD/O7nL4z2ibUNJGIBPvyOA==
X-Received: by 2002:a1c:2:: with SMTP id 2mr36224366wma.41.1639382058639;
 Sun, 12 Dec 2021 23:54:18 -0800 (PST)
Received: from [192.168.24.132] (pd9fe9b7c.dip0.t-ipconnect.de.
 [217.254.155.124])
 by smtp.gmail.com with ESMTPSA id m20sm6656601wmq.11.2021.12.12.23.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 23:54:18 -0800 (PST)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Aymeric Fromherz <aymeric.fromherz@inria.fr>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <CAHmME9ppTs-jmmV9uV+C0jbtQC5a5RWO5zJB5_-dRD3BMjDZZA@mail.gmail.com>
From: Mathias Krause <minipli@grsecurity.net>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
Message-ID: <d1921390-7fcb-a627-11ea-ce580214db63@grsecurity.net>
Date: Mon, 13 Dec 2021 08:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9ppTs-jmmV9uV+C0jbtQC5a5RWO5zJB5_-dRD3BMjDZZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi Jason,

Am 12.12.21 um 22:43 schrieb Jason A. Donenfeld:
> [snip]
>  
> Thanks for that! I've imported this into my staging tree here:
> https://w-g.pw/l/rmQK
> 
> I'll wait a few days -- and until the Vale PR has been merged -- to
> submit that to the linux-crypto mailing list, but there's a preview.
> Mathias - I wonder if you still need alternatives with the new codegen
> there.

yes, the alternative is still needed, as Aymeric's change doesn't lower
the number of required registers -- neither would a "rm" operand
constraint do, as gcc still insists in all constraints to be possible at
least, even if it would choose "m" instead of "r" in the end.

So, after importing Aymeric's changes into wireguard-linux-compat, the
alternatives change is still needed. I can help you create one, if you
want me to (we have that change in grsec anyway, just used named asm
operands here, as the %0/%1/%2/... was rather confusing and hard to follow).

Thanks,
Mathias


