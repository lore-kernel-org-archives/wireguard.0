Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54D3C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 16:34:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0f393ef3;
	Mon, 13 Dec 2021 16:32:12 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 71da9be6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 16:32:10 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a9so28015307wrr.8
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 08:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7PNVkitAO3zwumdxAO1Fct/97vTMu7MLYSb5+yW/29U=;
 b=atcDqHgskwhsFJn5HhtNyc0kZ1wAzs6a26h3wlnpqW2Vmj0rt33lMHFQhsUOOaPb67
 eCI+9yW/BWlzpJbp7/VPtqC7mTBodkHRyCh0QHxxgBfelteb3S6V9pyXLZdrCF4rjGPg
 CDy+z1etgngzbZC/BZuz3hT1gK8v2COvhosXITVFqphID2dyClT2aF7TRgtSuTL3p/qA
 4BG1N57xOH+xba/i9xjV8dSoaVtoiTTrR8Lvq6eMEQvjRKfjipfJJi1S02eT+d5EcNPj
 dUAv1VLy15nZx6Or8addcGPt8l6goAs1pp1wgC1+fAYn+JXaILIM+VtI7p4pVEJYdCI5
 OzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7PNVkitAO3zwumdxAO1Fct/97vTMu7MLYSb5+yW/29U=;
 b=FxKNI6wOTSW6Y0g51cqa1qT/6sTNwInimiO032KaeOwaDKyetrcZp2UFoymd56V8Z/
 79ybeyBBZi7YAjyEFSasNosAZxgN+ujwDHiMi5uQYjwtQy+0CF6d0f3e3o464+LDHjgu
 jVqwbMD8yfUWw7g0qdt0wsSsDDoJI6Crm3wOFX7M2cVgVqXlYNd9Dourul4gZqCPCP9F
 B3CBN7cB7btqrCZDYGHi7E1kU+75UoWWds3vBnTHKT774WYMqw7Hr0zlpV69wbn4ItGK
 9667ZAgyBi67PCYqGDFKMTLiBL8AC3aps57468VG7Q/OHQg33ZutSnhItHtk9zUq3KCJ
 otTA==
X-Gm-Message-State: AOAM532lqkKdKgHEITgVR2BVxt2dmUoyFeCjX2QQBjnKWZ3Wk62VRmCz
 H5TuRtkjV+itbpuPV/dk4fKGsGtre8oGKg==
X-Google-Smtp-Source: ABdhPJzh7OtE+gWYtAxa8tBofmvjubsne2zDJ9bkDIa1W/X6snmsw9wbTGIX2dEgXNC68tVc/dQjFg==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr33369710wru.123.1639413130019; 
 Mon, 13 Dec 2021 08:32:10 -0800 (PST)
Received: from ?IPv6:2003:f6:af02:e900:e406:554b:c2af:e2f9?
 (p200300f6af02e900e406554bc2afe2f9.dip0.t-ipconnect.de.
 [2003:f6:af02:e900:e406:554b:c2af:e2f9])
 by smtp.gmail.com with ESMTPSA id e18sm11384283wrs.48.2021.12.13.08.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 08:32:09 -0800 (PST)
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Aymeric Fromherz <aymeric.fromherz@inria.fr>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <3a1be638-4ddd-44c0-87aa-56cd26f4f396@grsecurity.net>
 <2026222873.1815432.1639405220767.JavaMail.zimbra@inria.fr>
 <fa249625-2698-3890-7e39-9273072810b9@grsecurity.net>
 <CAHmME9pC=eVFq-4eiU6iFVGOqZfr7RgniAP7H5YGBXDqc7W9jg@mail.gmail.com>
From: Mathias Krause <minipli@grsecurity.net>
Message-ID: <ffb81284-53e4-dc94-75ec-d31b6a79f269@grsecurity.net>
Date: Mon, 13 Dec 2021 17:32:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pC=eVFq-4eiU6iFVGOqZfr7RgniAP7H5YGBXDqc7W9jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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

Am 13.12.21 um 15:37 schrieb Jason A. Donenfeld:
> On Mon, Dec 13, 2021 at 3:33 PM Mathias Krause <minipli@grsecurity.net> wrote:
>> yeah, don't worry. We can keep this change downstream in grsec. Dunno if
>> Jason wants to take it as well, his call. It was just a side observation
>> which came out of our need to read and understand the code to provide a
>> workaround for the gcc bug we were hitting.
> 
> I suppose I can load it up in kbench9000 to see if it makes a
> difference. If it doesn't matter much, I'd prefer sticking with the
> formally verified stuff. But if there is a nice speedup, then I guess
> we can revisit more handwavy "obviously this is the same thing"
> arguments.

Had to hack main.c and run.sh a little, but here are some numbers:

root@box:~# ./run.sh
[+] Setting no-turbo to status 1
[+] Setting non-boot CPUs to status 0
[+] Inserting module to run tests
insmod: ERROR: could not insert module kbench9000.ko: Unknown symbol in
module
[+] Gathering results
                 ever64: 115100 cycles per call
           ever64_out_r: 115080 cycles per call
          ever64_out_rm: 113957 cycles per call
[+] Setting non-boot CPUs to status 1
[+] Setting no-turbo to status 0

Slightly faster.

Mathias
