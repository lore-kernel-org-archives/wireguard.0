Return-Path: <SRS0=O1+2=M3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFE1C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 15:54:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0E3260F94
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 15:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0E3260F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c828fccd;
	Wed, 4 Aug 2021 15:54:09 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4574c107
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 15:54:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id x17so1486900wmc.5
 for <wireguard@lists.zx2c4.com>; Wed, 04 Aug 2021 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4/mM1DQ0sZ54ZAjYE8vlJ9AYakh0kD0Ecu2K5Q1zU2U=;
 b=nKjXVHfmHqYsD8PbIcM6n/YK3TUDChysERKIRHIzeY8rnn7syqd17J08WQg285ScBh
 vzQmf88bkDu+PcCd5epPOwpVe4r0xslNnn44zLh/OdI1g34zx4Uf0ksw1X/jqOO+dtQw
 Gx8hzZjmy4g5PJ7ubtddMYoEzeuPby5eFa6soeuB3wL49ld5ulCrdn6vWc0gv0rN3riE
 TtVl0qKppZC21dDww8kYQHIiIHIe3pPB/HQ8tSsU4dyYi5f+cVkER48tgtAAJn1cU/Ms
 b22YRdd/zujO+9pDh3+2yw/rUJoDYaquW/CTu7ObqNVXhBTuVsgHaE1QHFceMMlw7UTJ
 U2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4/mM1DQ0sZ54ZAjYE8vlJ9AYakh0kD0Ecu2K5Q1zU2U=;
 b=cq9OGD+Bl7hpf/N2gHCJE6qDkV3zEEu6P3tXbJZzChF7cArJnwx8klQE/8QJL4YzLj
 NTm8xOBKkOOXHhLcrP+y+L15hXQVAi3jRO9LTiUfwjqLUxa9uzsgUw1AS323nHahmpDU
 31MLZUIp6zxf5J4iZg3lp0XhKtvvYojfxeC4f3F9zsMVHktOa4RmygRKCPusibOugeej
 FP6lj3S2v9F3J3OC6T6ex5pVqE6InmM+8jP8+bwUQxGrnyV9HFbOWKxWccSSCAtqExhm
 Di8amnbMoJlYmETj+IVBSxbsBxkh6JYRugT4viC6jo6ByPvec3iMam0TmLbuPaucJylN
 e6/A==
X-Gm-Message-State: AOAM533o3p5hO6U3MRTQesw7YcK11BKYZ4Gt9FSrltr0MurcIUXo3pkj
 vLk7RY9KvOqww+OE9KS7zogdukRinNo=
X-Google-Smtp-Source: ABdhPJxCh4y217EPnoGrIvgU8pW0ErFe+bLN+0O53mA2NtaNycH9CIiEjncIp5m4vYaFHJmz5DcpOg==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr10567781wmp.68.1628092445239; 
 Wed, 04 Aug 2021 08:54:05 -0700 (PDT)
Received: from [192.168.25.202] ([31.127.152.180])
 by smtp.gmail.com with ESMTPSA id f7sm3954521wrr.54.2021.08.04.08.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 08:54:04 -0700 (PDT)
Subject: Re: WireGuardNT BSOD Windows 10 21H1 Mullvad
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAB5RCdEyyeGdeBrviTTjF3EyrfNWrCsUXqFbW+RUgqjKeDUrNQ@mail.gmail.com>
 <8282408d-8910-3e8d-2274-ac438380d90b@gmail.com>
 <CAHmME9p5gyCssAvxPjvheJGQokgQ_uUHCnt-NVnTnCH7PRGeXg@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <e6bf48bb-4158-8b98-7720-0844347155a7@gmail.com>
Date: Wed, 4 Aug 2021 16:54:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9p5gyCssAvxPjvheJGQokgQ_uUHCnt-NVnTnCH7PRGeXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

The original 0.4

On 04/08/2021 12:17, Jason A. Donenfeld wrote:
> On Wed, Aug 4, 2021 at 12:05 PM Peter Whisker <peter.whisker@gmail.com> wrote:
>> Yes, I saw similar BSOD on a workstation I run yesterday but as it is
>> remote it's a nuisance if I have to go and restart it in safe mode to
>> disable the kernel flag. I may get to re-try it later in the week.
> Can you confirm that the BSOD was on 0.4 and not on 0.4.1? It's
> important for me to know whether this is a new bug or just a
> non-contributing "me too" for the old one. If this is a crash on
> 0.4.1, can you send me C:\windows\memory.dmp or
> C:\windows\minidump\*.dmp ?
>
> Thanks,
> Jason
