Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEA3C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:44:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 22ed2a8e;
	Thu, 21 Apr 2022 23:49:57 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8d153c5a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 12:12:41 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id v4so6081245edl.7
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 05:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackwall-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rhRwaWht/J6fvPbw/1zwrOPPkEZ7TQU79YfUwkCsdwM=;
 b=2qTh20UMAp/GP2n+qZcbQWlYkPs1azsU6UR5GYW6VdsAjSxmrQ75uUH7H2Lw9QbrN1
 Lwr3IvYBW7za1efKzTQvINSSddtVlY0r1GTFVpJdXVi+i5zZtiKyWFGxBn+/Qm2LR0P2
 AmTpDMMu5ivj6qpEgDmkjzqMklIIImpzeh6a3U5Mjg3gzAKR2rAE4tS8jdgXD91oLb41
 lF1RlUhUMqZ478oQ3/K/cdSUagRx2cFF0aftkGEYNYIJnqvxu8Djbrq7EUjnUDGN2pFw
 133rmeMs0dYFDqkJsZ5SAycFFwiJA8UouRP3M7IKCYufbJfdbCGFU5XgBA86HYk0vhXj
 S13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rhRwaWht/J6fvPbw/1zwrOPPkEZ7TQU79YfUwkCsdwM=;
 b=nyAtsTsa33D0ZV7sQkYxlL9VlsE+xSTeTPMx/mRk/21TwFAnlk3LfZcUW/JqtR1WJx
 DtaJnozZNTVfIHQEfUyNRrRp+cnNdQ/FJgSnfOmswcVT3gyPwsCqe7yhF0Hyc/Kf+7iR
 O+o07yb8zleiKzFXiz0Cm6Wl9nNtXXkK6Rhb1iPjJp91RK4i+LS2F/t2UUdqhpy1UoNL
 PFkeuVdsEDRQZ9n2Gj1YMNSkuAd2Ni2Ytq8p41A1ki+3AcaaRZ31EGvdrD5/JBtopmR2
 bzqFfpSDPcFULR8z2u1V0Yty5xINH91Ls0rTlhc/o6w38hEoMsvzPr7Yl9yA1DhjI59P
 C+ow==
X-Gm-Message-State: AOAM5317doorMHMpXfrLAHupfmDTSTpFF8HpBhKCmU9AOxb4A7pZptxT
 RkLdWzEqVWBuZuZuXOil7KZLXw==
X-Google-Smtp-Source: ABdhPJzF41g9n4BhcFyZM2BPEmqtGuuWJKd9rk9+VVAeWFIhL/Lm0cfv8vDLahOPrEt1FcCnaexnwQ==
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr2694016edv.94.1649938361247; 
 Thu, 14 Apr 2022 05:12:41 -0700 (PDT)
Received: from [192.168.0.111] (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a1709067e1a00b006e8cb5c173bsm585527ejr.13.2022.04.14.05.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 05:12:40 -0700 (PDT)
Message-ID: <2607574b-6726-6772-7921-84156393df95@blackwall.org>
Date: Thu, 14 Apr 2022 15:12:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH net 2/2] wireguard: selftests: add metadata_dst xmit
 selftest
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Netdev <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Martynas Pumputis <m@lambda.lt>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>
References: <20220414104458.3097244-1-razor@blackwall.org>
 <20220414104458.3097244-3-razor@blackwall.org>
 <CAHmME9ouN0O-mfi4d_xVon_SxzE4hbzdD0Zm8hRLS4k5C3dPFw@mail.gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <CAHmME9ouN0O-mfi4d_xVon_SxzE4hbzdD0Zm8hRLS4k5C3dPFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:49:50 +0000
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

On 14/04/2022 15:06, Jason A. Donenfeld wrote:
> Hi Nikolay,
> 
> These tests need to run in the minimal fast-to-compile test harness
> inside of tools/testing/selftests/wireguard/qemu, which you can try
> out with:
> 
> $ make -C tools/testing/selftests/wireguard/qemu -j$(nproc)
> 
> Currently iproute2 is built, but only ip(8) is used in the image, so
> you'll need to add tc(8) to there. Clang, however, seems a bit
> heavyweight. I suspect it'd make more sense to just base64 up that
> object file and include it as a string in the file? Or, alternatively,
> we could just not move ahead with this rather niche test, and revisit
> the issue if we wind up wanting to test for lots of bpf things.
> Thoughts on that?
> 
> Jason

Hi Jason,
My bad, I completely missed the qemu part. I'll look into including the
ready object file. If it works out, looks compact and well
I'll post v2.

Thanks,
 Nik
