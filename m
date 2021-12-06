Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19B2C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Dec 2021 21:02:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1e8746dd;
	Mon, 6 Dec 2021 21:00:18 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 15dd5f81
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 21:00:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id o29so9162031wms.2
 for <wireguard@lists.zx2c4.com>; Mon, 06 Dec 2021 13:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EnJ5KzlpYRVQIaGr1g4IIcth4x0F3qa0q6CUmPt7UXM=;
 b=IR7lx7jICMMxp5xg0lgbP7LnN+6X5eftQxT7/zSPC0fwnprd81pXxEi8hmEfM9hMH8
 dLD11c3ZrtV4kzgTI0Er1Ky8/7lzDbAY3CLnzMrBcsWFHhtj9UCqkyjDemsBDWeCblO6
 QDI8knCNbEkTVgCOBmsxGGPOt4fB+IyhJL2DCIENfVC6HWqCxuJcz3tQg+RIHWG6VHyM
 yvGguLJJC3Vqkit54oHxY9Y5S/tp7NccnHU/ycVSILmxqOQEAaTxLYKwiRZhDFkzC5Ik
 tC2QuOLfHuNywVjYF5pEQQXlLl1uz3Xipmv7k3IQVQiBlR/WZix3ZgPdbtCWB4gPu8ze
 iBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EnJ5KzlpYRVQIaGr1g4IIcth4x0F3qa0q6CUmPt7UXM=;
 b=H/JDDq55mt9/tsskme59yezJmGAF63h/fOHIpfjiklQDewmFfGviiLP0fTH57z9bNH
 c+28eY3VI35KE3/UJO99pAsiKJnj3wdad0y/EBBKpzQSWdxA3xngTQfl+/pnURdY00ct
 htaoLS2ib8Y2OVUKc6nEXT0wVfKHhzoeT8O3JaOHRECdy5qCoxmaJyEgvsBvy76nawKt
 2+WBXIjG7XRY72LDdnMo4F4falLvqDI4U8kfHfT68TpPAawH8Ex8o+0Gbxo5+PCu+eEz
 VlN7vWEfG/umDgYdPx3MchkyZCF0qIRUbS9yCYpM0cu8vHjyYhqa+nOqyPlohguMhkLu
 QwBA==
X-Gm-Message-State: AOAM531SbSDAuKkQNXE6h9isMDA943TdAO1Hbxag01lNHUWrI/ZfFW+9
 XzvWQXAlZE1wflTZxgf8H0g1FOt5OPPVig==
X-Google-Smtp-Source: ABdhPJxKF3WZ5CcrkFEuP/fIX/nxZHZR0J9ilUWeYYdRrSydgxhiGcSwGr2YGOZotm89yeWVSP8JRA==
X-Received: by 2002:a05:600c:4f92:: with SMTP id
 n18mr1183622wmq.123.1638824416563; 
 Mon, 06 Dec 2021 13:00:16 -0800 (PST)
Received: from ?IPv6:2003:f6:af03:cb00:aa51:ac04:48b6:3372?
 (p200300f6af03cb00aa51ac0448b63372.dip0.t-ipconnect.de.
 [2003:f6:af03:cb00:aa51:ac04:48b6:3372])
 by smtp.gmail.com with ESMTPSA id l26sm505164wms.15.2021.12.06.13.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 13:00:16 -0800 (PST)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
 <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
 <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
 <3a2d41dc-effb-158c-4a52-d7eb282ecb7e@grsecurity.net>
 <CAHmME9r4gspVnZGhgHhB1nR6FvOaryLoZvAJwpRU=-=rrbdoqQ@mail.gmail.com>
 <5bcdecdb-fbc0-4714-895d-1b1e6a87287a@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
From: Mathias Krause <minipli@grsecurity.net>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
Message-ID: <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
Date: Mon, 6 Dec 2021 22:00:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
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

Am 06.12.21 um 19:55 schrieb Jason A. Donenfeld:
> Nice detective work! I just loaded this up on the CI, so we'll see if
> this does work across the board.

Thanks.

> It sounds like the original code also had this bug -- the "r"(out)
> should be in the output constraints, not in the input constraints,
> right? Sounds like something I should report to the EverCrypt authors
> and also fix upstream too then.

Yes, probably, but you're mixing up the two. "r"(out) should be an input
operand as it's only read in the inline asm. The other two ('tmp' and
'f') are read and written, so need to be output operands (as they
already are!) but also marked as earlyclobber ("&") as they're modified
before all input operands are read ('out', in this case). It's just a
hint to the compiler to not make the register allocation overlap with
any (other) input operand register.

Thanks,
Mathias
