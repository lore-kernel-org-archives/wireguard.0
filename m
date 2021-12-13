Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B3C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 07:44:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 233be86e;
	Mon, 13 Dec 2021 07:44:51 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5503d7a8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 07:44:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a18so25432240wrn.6
 for <wireguard@lists.zx2c4.com>; Sun, 12 Dec 2021 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f0qtQeVsrnZPSJpmpBBzGBUYEGIL1yZTQMpx/zQ2+AM=;
 b=bqHMD8vcVAz1bPHV8nK+yU2QrAFtXcGPoZAogYd2WnAwPJyo18e3+P+oxVWLSZ/VcY
 Fq8+kSdDdOlNa0O+utVWkBfEIdlqimj4cZBekCNtnejFH19Qup4R2LSDQsODbyYfM/R3
 QIFWZ2VZIMPqmteyviFlGKoHPunAQvfG+09cfaIVVOGRpAW3MPHBTPyrwrxclu/zKV/n
 fLDDVpyNKyQHUW5ebFuB7G7mwFdr9qf/l5OUejlY6OSGjfuEK7kAUuiL+LZXudui2MuC
 JOyx2xrKu+Z263IhGOAyPeN+mK05VI4EMzoCbdw1ZvMLhb9ZdC6FTzL/fHPpSr389xKz
 Hb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f0qtQeVsrnZPSJpmpBBzGBUYEGIL1yZTQMpx/zQ2+AM=;
 b=exH8KKa+78lzMQmzCVAvRCrfDvFnWFGOdP6Ybs1qbDT1T2EfUIfmNAwIeYqOCEzvQv
 ttDMT929VuGMXHfJ+Mt1/Vi4NLNodQ8rp1B3dhVSlSK0ul0/QCuM0/wfSIuqrwTpK1Id
 VFM6/SrXdulg6eDHmlpF+NTRuNihQDF+QMGRcIQOww4RSPYTn2EOnO8l3rJlhXxV7W86
 Vsr+gGvoTw5IvVfl4S9k8ix8WIaA8gQruzpxTiHWsZUFwsVfBxswi+YW0s/JAb+xNaju
 LJjdeMo73ukafml6PeMF6UDDg+klB55LZTb+6BghtEEg3v36UGAUKYnKM571zDockatn
 PA+A==
X-Gm-Message-State: AOAM5307uJ47vMLqGw717FMFuRBs/Y3uLNnvQ+amep6dM7elDbqg3Sk8
 k59ly2zCdj74e9nB8AQ8zq/aLWy1XjRqkg==
X-Google-Smtp-Source: ABdhPJzHCLbLKdGlgz+iGu39GzPxPhWa7o70+Mn3iGRyWABopOV5ilLY1R/2todUAbNu86DTQDkDNA==
X-Received: by 2002:a05:6000:1568:: with SMTP id
 8mr8654719wrz.643.1639381489058; 
 Sun, 12 Dec 2021 23:44:49 -0800 (PST)
Received: from ?IPv6:2003:f6:af02:e900:e406:554b:c2af:e2f9?
 (p200300f6af02e900e406554bc2afe2f9.dip0.t-ipconnect.de.
 [2003:f6:af02:e900:e406:554b:c2af:e2f9])
 by smtp.gmail.com with ESMTPSA id n2sm6311085wmi.36.2021.12.12.23.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 23:44:48 -0800 (PST)
To: Aymeric Fromherz <aymeric.fromherz@inria.fr>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
From: Mathias Krause <minipli@grsecurity.net>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
Message-ID: <3a1be638-4ddd-44c0-87aa-56cd26f4f396@grsecurity.net>
Date: Mon, 13 Dec 2021 08:44:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
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

Hi Aymeric,

the changes look good to me -- quite what we already had in grsec. Just
one more nit. The constraints for the 'out' parameter in fmul(),
fmul2(), fsqr() and fsqr2() can be further lifted to "rm" as 'out' is
only referenced once. This allows gcc to choose either a register or a
memory operand, as it sees fit. In our experiments the latter lead to
much better code gen.

Thanks,
Mathias

Am 11.12.21 um 17:35 schrieb Aymeric Fromherz:
> Thanks for the heads-up. We were being overly conservative during verification of inline assembly code in Vale, and marked several registers as possibly modified while they were only read.
> 
> This is now fixed for fmul, fmul2, fsqr and fsqr2, and will be merged into the master branch of EverCrypt shortly.
> In the meantime, the diff for the resulting inline assembly after Vale codegen is available here: https://github.com/project-everest/hacl-star/pull/501/commits/1a71adb40c3f78da16e16975dbb1d4de5adeab8c#diff-5aabe9f6aa87508c9d81d4c9e89eff0b06b1e2aeaf5b04eba51da71c5bea6940
> 
> Cheers,
> Aymeric
> 
> ----- Mail original -----
>> De: "Jason A. Donenfeld" <Jason@zx2c4.com>
>> À: "Mathias Krause" <minipli@grsecurity.net>, "aymeric fromherz" <aymeric.fromherz@inria.fr>
>> Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
>> Envoyé: Vendredi 10 Décembre 2021 23:58:01
>> Objet: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
> 
>> CC'ing in Aymeric, who's working on Vale's codegen.
>>
>> On Thu, Dec 9, 2021 at 8:59 AM Mathias Krause <minipli@grsecurity.net> wrote:
>>>
>>> Am 08.12.21 um 15:56 schrieb Jason A. Donenfeld:
>>>> On Mon, Dec 6, 2021 at 10:00 PM Mathias Krause <minipli@grsecurity.net> wrote:
>>>>> Yes, probably, but you're mixing up the two.
>>>>
>>>> Oh, thanks, right.
>>>>
>>>> I'll talk to EverCrypt upstream and see.
>>>
>>> FWIW, 'out' is also wrongly flagged as output operand in fmul() and
>>> fmul2(). But making it an input operand needs more surgery, as the
>>> operand order changes and this requires some code churn.
>>>
>>> Mathias
