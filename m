Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994E1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Dec 2021 18:19:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4a49ba11;
	Mon, 6 Dec 2021 18:18:39 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0282c481
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 18:18:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v11so24223143wrw.10
 for <wireguard@lists.zx2c4.com>; Mon, 06 Dec 2021 10:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Be9NJ+QTNf8Tm8rZPwKsdt/EEymHPIGEQEUmFd0BdW0=;
 b=lDn9CqQGnzniLB3V3ua9kueSN3mGmLaRP/jNsNVz/neg75q9C4CDpg8oubImVN/X5C
 6++bcQgz0tiyBR0ybHcrrlPfCvt0cyi2/eXk057tCUKlphEoeaANHY/RdTaaiwmv3BJE
 +XAmSn0eqCfJvFCFEsNoQW/OsKIHlrFIpYxBx3cph1Y/24W8NOhfhbrJTpWe6IHItbe5
 WhRmwpnpXfXe8T2DYFjE1rsmoLSPaW6DbgcJpNemnUntgqLlDkTWsSkmG730eVmZSIUR
 MtcLXjL74tJ39z3yKZx6uvmLk9BnmOH1DOUw6MRBK0fmPVPSxeuigT70OtT9ic0hqhFW
 3c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Be9NJ+QTNf8Tm8rZPwKsdt/EEymHPIGEQEUmFd0BdW0=;
 b=o61PMWf7BNG0KHHK10Bjj7m/neU7MqvTU1eRQ9rBJw/vgJ0Ouabes+HLQQ9AKb19hO
 e55RaaTcD3t1TDSz9T/jFg3MsWrWZBEL6WCGQoMvyS/g2aEJTwMJnV/x4liUeDb5Zs2N
 QZfZK6RYX2dshlpYecQtA6Wqm5adpyEscp6PMwYEWOk1sw1PL0ZE2nQNrzyTm8UKDDTX
 dJADHy09XMt8gB1FNQBaC0KuIu5ag7TsQIfgmLBPvZTswdUwtC6Qks8zn+Zms2t4OlBE
 e5ntkTyur6T5ApqV1+W+YCBW/a3eoUBvS32AGCWqDrStFWSHhd4zgYF0FYI++ZEeNJwp
 zw4A==
X-Gm-Message-State: AOAM530WMYsb1TT0JCm86KUd/epBEnhu6lXJkQY/KDVOxEZOSWSasTjI
 OIn1jxeST3Z41iEdy5MTQRaGEPtaHk51TA==
X-Google-Smtp-Source: ABdhPJyc51G398tDMHg0SoAvTH7OPm5dUaAIfBSK0jdXaO0xeO6vxu7C2riLfcRb0by3Ma76Ru1e2g==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr47087948wrn.247.1638814716475; 
 Mon, 06 Dec 2021 10:18:36 -0800 (PST)
Received: from ?IPv6:2003:f6:af03:cb00:aa51:ac04:48b6:3372?
 (p200300f6af03cb00aa51ac0448b63372.dip0.t-ipconnect.de.
 [2003:f6:af03:cb00:aa51:ac04:48b6:3372])
 by smtp.gmail.com with ESMTPSA id r15sm115067wmh.13.2021.12.06.10.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 10:18:35 -0800 (PST)
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
From: Mathias Krause <minipli@grsecurity.net>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
Message-ID: <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
Date: Mon, 6 Dec 2021 19:18:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
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

Am 06.12.21 um 17:27 schrieb Jason A. Donenfeld:
> Oh, you're right about recent gcc. That actually _is_ intended, yet
> they still fail. It would seem, then, that the problem is not so much
> gcc version as it is some kernel patch that never made it to these
> ancient kernels.

actually, it's the i/o constraints, they're wrong. 'out' is an input
operand but we specify it as an output one. Now this works when gcc
respects the "+" constraint, as in marking this operand as being read
and written, thereby implicitly requiring it to be initialized. But
looks like older gcc ignore that (at least when using alternatives) and
make the asm work on a stale 'out' operand, resulting in the selftest
failures and crashes you've seen.

The following change fixes it by putting 'out' to the input operand
list, where it really belongs to:

diff --git a/src/crypto/zinc/curve25519/curve25519-x86_64.c
b/src/crypto/zinc/curve25519/curve25519-x86_64.c
index 67f55affcf88..f26ed5d897ac 100644
--- a/src/crypto/zinc/curve25519/curve25519-x86_64.c
+++ b/src/crypto/zinc/curve25519/curve25519-x86_64.c
@@ -581,8 +581,8 @@ static inline void fsqr(u64 *out, const u64 *f, u64
*tmp)
                "  cmovc %%rdx, %%rax;"
                "  add %%rax, %%r8;"
                "  movq %%r8, 0(%0);"
-       : "+&r,&r" (tmp), "+&r,&r" (f), "+&r,m" (out)
-       :
+       : "+&r,&r" (tmp), "+&r,&r" (f)
+       : "r,m" (out)
        : "%rax", "%rcx", "%rdx", "%r8", "%r9", "%r10", "%r11", "%rbx",
"%r13", "%r14", "%r15", "memory", "cc"
        );
 }
@@ -743,8 +743,8 @@ static inline void fsqr2(u64 *out, const u64 *f, u64
*tmp)
                "  cmovc %%rdx, %%rax;"
                "  add %%rax, %%r8;"
                "  movq %%r8, 32(%0);"
-       : "+&r,&r" (tmp), "+&r,&r" (f), "+&r,m" (out)
-       :
+       : "+&r,&r" (tmp), "+&r,&r" (f)
+       : "r,m" (out)
        : "%rax", "%rcx", "%rdx", "%r8", "%r9", "%r10", "%r11", "%rbx",
"%r13", "%r14", "%r15", "memory", "cc"
        );
 }

We still need the early clobber constraint ("&") for 'tmp' and 'f' as
they are, in fact, written to early. But 'out' is only ever read, so can
be a normal input operand.

I'll create a proper patch and send it out tomorrow, if you don't beat
me to.


Thanks,
Mathias
