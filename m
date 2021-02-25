Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6384C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 20:15:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEBF564F29
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 20:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEBF564F29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84151618;
	Thu, 25 Feb 2021 20:15:03 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb299b1f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 20:15:01 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id z190so6929306qka.9
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 12:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Rf3RsKo0VCOksWnSDK/K5xFpaBgKyHYWp8NOcYiD8Rk=;
 b=uNIQ8480Gh74zoxaOTVXMe3ZHnKyL2fth+Nxeb7896xwT0QXr3EX5sp8Zk4cWBqaij
 lKmwjdryblP0xQI1c/tKuRiAEttNCwmoHoB6JpEVTDIy18JbP3leYTN1CTPEhEln/4as
 qjMBqZgLp/dG6XyREKNAeOMamkf3A/YHchukiO73zKFIqUU5WQT3HzqCKHlCtwvYZlZb
 UqgvW7BiZ2RLhaATGVXcrPwuVVC87aaRDfrClIxRhkOgh3+nQ52aWZSFF0zWEYVRCdzf
 D/qrJNPLdVNhrINmALrxS17okl1W33OuHev1xBZEv8fp/aJooKI1cdpKhfu4qJ3ExI4L
 nqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Rf3RsKo0VCOksWnSDK/K5xFpaBgKyHYWp8NOcYiD8Rk=;
 b=aiOPAS6EoVzPQuyAdPTX+Qrgz59YW/k4EQFKmXLvuHbN7eJY8JJ0uDMbxC7DtBgOP2
 d70ozrOhks7cKjazv5Glm2pIxjk8uM4llz8hlbxE95T6Uk4F2M+WwuoFhetc7NFN5PkS
 3C15Xw+tAQsckJrVkZ4UDpFWDl2qXwG8kTzUajLkSBlTHP7YkMQgrjEkjPlPLbfaNESK
 YFl+J0duP2O8D3M5F99HGRfRjIoNMadGGfQXwqmSwAqnhbLj8yDnvgNA8hDjpreJW3sG
 6Flaxjyq8BOZdkRhD4Kli0fzGStx0/0oBmT6XA94jcORiU0BQJFGoHjXExvuveoa+tFc
 g3fg==
X-Gm-Message-State: AOAM531RhV4eznbGw0/zf3S7q9oeI6Z8VI3di8a9Oh9IdCnT5LpIhUgi
 a+LEFWGGP59wKaPV/IfTgu0wDi8FlJwKLEJJ
X-Google-Smtp-Source: ABdhPJwV2gJXhIVKNV+VEC6W6GwysyAGlfXBsSQ0nygjehIYQ8L7DWTkEzsm7vHtBvzhNj+YOVRopA==
X-Received: by 2002:a37:4d86:: with SMTP id a128mr4369175qkb.115.1614284099963; 
 Thu, 25 Feb 2021 12:14:59 -0800 (PST)
Received: from ?IPv6:2600:6c4a:787f:596e:6abf:e4de:16fe:d106?
 ([2600:6c4a:787f:596e:6abf:e4de:16fe:d106])
 by smtp.gmail.com with ESMTPSA id o30sm4625480qkl.17.2021.02.25.12.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 12:14:59 -0800 (PST)
Subject: Re: wireguard-go on windows
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Devanath S <s.devanath@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CADjMg7Vp+p7n_JLMfFU4GwtNu_X3ARFJOuhxLasonuD-fvB5Hg@mail.gmail.com>
 <CAHmME9o9YNUKawN8bYArdfbDF9cZF+1nSTZuMef5RRVeaPTrXQ@mail.gmail.com>
 <CADjMg7VHCX04+UgCY4AwLub5=otDJ9dTHMLdX16OVDZoDG88xQ@mail.gmail.com>
 <CADjMg7WuZ-W0bRPM9oCXT6CnVSdYK=fMRANna7XimtEkerOerw@mail.gmail.com>
 <CAHmME9qNVFuf170GEObu1_d=F=snG94qE1Y+KWZJ5DEeL_14Vg@mail.gmail.com>
From: Matt Layher <mdlayher@gmail.com>
Message-ID: <f9d3c90b-57d7-a0fb-2c28-9a5ba8b8e103@gmail.com>
Date: Thu, 25 Feb 2021 15:14:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9qNVFuf170GEObu1_d=F=snG94qE1Y+KWZJ5DEeL_14Vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

A glance at 
https://github.com/WireGuard/wgctrl-go/blob/master/internal/wguser/parse.go#L48 
seems to indicate that we treat the first "blank" line produced by 
bufio.Scanner (which strips \n) as a sentinel to stop parsing, which 
would mean something like "errno=0\n\n" would parse the errno and be 
done once it interprets the final line "\n".

The tests seem to indicate this works as expected, but I don't regularly 
develop on Windows and welcome PRs if something has changed.
- Matt

On 2/25/21 12:54 PM, Jason A. Donenfeld wrote:
> + Matt Layher
>
> Hi Davanath,
>
>> We are trying to use wgctrl way of configuring the wireguard devices
>> and facing issues while creating/configuring the wireguard device on
>> windows.
>>
>> 1) First problem was while creating the wintun device using wintun.dll
>> and using wgctrl for configuring it.  It hangs in
>> wgclient.ConfigureDevice api()
> wgctrl works with wireguard. wireguard uses wintun, but wireguard is not wintun.
>
>> 2) So tried to first create the device through wireguard.exe. And then
>> used wgctrl way to configure it, but wgClient.Devices() is not able to
>> get the devices on our test windows boxes (even though it works on my
>> development machine)
> This sounds like a potential bug in wgctrl.
>
> Matt -- I wonder if there's a bug in the parser, recently unearthed by
> a change in wireguard-go. Specifically, uapi stipulates that requests
> and responses end with \n\n. Is it possible that you're relying on the
> socket to EOF, instead of looking for the \n\n? Recent wireguard-go
> keeps the socket open, in case you want to send one request after
> another.
>
> Jason
