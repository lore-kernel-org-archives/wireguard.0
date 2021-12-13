Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774C1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 14:33:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6f075a2c;
	Mon, 13 Dec 2021 14:33:32 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 334253c4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 14:33:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u17so27400354wrt.3
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 06:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wOijku0DwzJq400/T74eEi7dePRlHj8GQAQJKCmM2D4=;
 b=AhIZftary4VYzxa2A0IhXxs3mH9mmOZmVR5yW4VNBax6z9+Y0M4B1MV+lLnuvqBGHT
 jsMAXzJ51IXH01WMmd5RGgowIH8sqfveUNuhdU9k5GqQjUITrOTD1Rq0cUZjzBZGf9vA
 eebzKtl/q3Cx8Kiy2fCh9Y0JvcLOWjl2RLzKhlIBRMXl9K7aQKL0yODXML+69kvR4eke
 VEHP3zn53vB+XSKYr93gQpiBH815AfJiW8Qr9fD1zSHtjZOEe2vDsoYDNWSJvpYEMH9E
 gw4l3l6HRWBS9qKwJWXH+d3DqZTRlFMfAAUlq6KuOdg92+yJ6vD8uswJLLe5sIZfbS4R
 PoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wOijku0DwzJq400/T74eEi7dePRlHj8GQAQJKCmM2D4=;
 b=gfbt/n49LcCcUvJdtTkXrGjY584an8l3g7JGTIAyPnUHz7RctUdI1Tip6z3o4kVvP6
 iti4zp4pXqyXd8AOmbgTiZ4Vi4f0fUUREO/0ZtVjEDJREuLZa7lxynVct0hqoqxxMLaS
 ITVFYM3UVAzbiAODn8TzeZf5JQa0dAVYWwMPkCZz3AyrlZTSkVNaZgUNmBdYFgvDATkn
 Ru4v6+XYXiDA7W5N7bKPNol/F6zYSwoVR3g4gTDdyLd0MIatgR0EP3oHmQPY+M6YSfHA
 m8mX4kHwB5Qkm5r2vshA4ifoi3ZC42t/OLsmGPM/qt1SZ8O5FBsqrgiQajGW76fg8l98
 cFwQ==
X-Gm-Message-State: AOAM532NjGgTLZJuHayQA/eriZ9yLo3uuv4O7NqScM8B/joM0VmZ8t6d
 eLXJ0mTHAsvjz25ZkyWIrUkban0C9jIhwg==
X-Google-Smtp-Source: ABdhPJxzGGZb111rc/iud7VsTcY8ci7IH4wHoVow8TmSnOAqC8gxwsqMAFZbvxxwzSvHX9dxnwf5aw==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr32375249wrd.369.1639406010453; 
 Mon, 13 Dec 2021 06:33:30 -0800 (PST)
Received: from ?IPv6:2003:f6:af02:e900:e406:554b:c2af:e2f9?
 (p200300f6af02e900e406554bc2afe2f9.dip0.t-ipconnect.de.
 [2003:f6:af02:e900:e406:554b:c2af:e2f9])
 by smtp.gmail.com with ESMTPSA id az15sm7682728wmb.0.2021.12.13.06.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 06:33:29 -0800 (PST)
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Aymeric Fromherz <aymeric.fromherz@inria.fr>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <3a1be638-4ddd-44c0-87aa-56cd26f4f396@grsecurity.net>
 <2026222873.1815432.1639405220767.JavaMail.zimbra@inria.fr>
From: Mathias Krause <minipli@grsecurity.net>
Message-ID: <fa249625-2698-3890-7e39-9273072810b9@grsecurity.net>
Date: Mon, 13 Dec 2021 15:33:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2026222873.1815432.1639405220767.JavaMail.zimbra@inria.fr>
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

yeah, don't worry. We can keep this change downstream in grsec. Dunno if
Jason wants to take it as well, his call. It was just a side observation
which came out of our need to read and understand the code to provide a
workaround for the gcc bug we were hitting.

Thanks,
Mathias

Am 13.12.21 um 15:20 schrieb Aymeric Fromherz:
> Hi Mathias,
> 
> Thanks for the comments. Unfortunately, changing "r" to "rm" for the out parameter in a systematic way is quite trick.
> Allowing arguments to be passed independently in a register or in memory is currently out of scope of the Vale model we use for verification.
> We must decide early on in the verification pipeline if the argument is passed in a register, or if it stored in memory.
> Doing this in a sound way would require a significant change to our (trusted) model.
> 
> Cheers,
> Aymeric
> 
> ----- Mail original -----
>> De: "Mathias Krause" <minipli@grsecurity.net>
>> À: "Aymeric Fromherz" <aymeric.fromherz@inria.fr>, "Jason A. Donenfeld" <Jason@zx2c4.com>
>> Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
>> Envoyé: Lundi 13 Décembre 2021 08:44:51
>> Objet: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
> 
>> Hi Aymeric,
>>
>> the changes look good to me -- quite what we already had in grsec. Just
>> one more nit. The constraints for the 'out' parameter in fmul(),
>> fmul2(), fsqr() and fsqr2() can be further lifted to "rm" as 'out' is
>> only referenced once. This allows gcc to choose either a register or a
>> memory operand, as it sees fit. In our experiments the latter lead to
>> much better code gen.
>>
>> Thanks,
>> Mathias
>>
>> Am 11.12.21 um 17:35 schrieb Aymeric Fromherz:
>>> Thanks for the heads-up. We were being overly conservative during verification
>>> of inline assembly code in Vale, and marked several registers as possibly
>>> modified while they were only read.
>>>
>>> This is now fixed for fmul, fmul2, fsqr and fsqr2, and will be merged into the
>>> master branch of EverCrypt shortly.
>>> In the meantime, the diff for the resulting inline assembly after Vale codegen
>>> is available here:
>>> https://github.com/project-everest/hacl-star/pull/501/commits/1a71adb40c3f78da16e16975dbb1d4de5adeab8c#diff-5aabe9f6aa87508c9d81d4c9e89eff0b06b1e2aeaf5b04eba51da71c5bea6940
>>>
>>> Cheers,
>>> Aymeric
>>>
>>> ----- Mail original -----
>>>> De: "Jason A. Donenfeld" <Jason@zx2c4.com>
>>>> À: "Mathias Krause" <minipli@grsecurity.net>, "aymeric fromherz"
>>>> <aymeric.fromherz@inria.fr>
>>>> Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
>>>> Envoyé: Vendredi 10 Décembre 2021 23:58:01
>>>> Objet: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
>>>
>>>> CC'ing in Aymeric, who's working on Vale's codegen.
>>>>
>>>> On Thu, Dec 9, 2021 at 8:59 AM Mathias Krause <minipli@grsecurity.net> wrote:
>>>>>
>>>>> Am 08.12.21 um 15:56 schrieb Jason A. Donenfeld:
>>>>>> On Mon, Dec 6, 2021 at 10:00 PM Mathias Krause <minipli@grsecurity.net> wrote:
>>>>>>> Yes, probably, but you're mixing up the two.
>>>>>>
>>>>>> Oh, thanks, right.
>>>>>>
>>>>>> I'll talk to EverCrypt upstream and see.
>>>>>
>>>>> FWIW, 'out' is also wrongly flagged as output operand in fmul() and
>>>>> fmul2(). But making it an input operand needs more surgery, as the
>>>>> operand order changes and this requires some code churn.
>>>>>
>>>>> Mathias
