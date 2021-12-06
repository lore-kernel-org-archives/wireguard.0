Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2866C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Dec 2021 14:04:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c0bfe59d;
	Mon, 6 Dec 2021 14:04:39 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d9cd778a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 14:04:37 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso10497346wml.1
 for <wireguard@lists.zx2c4.com>; Mon, 06 Dec 2021 06:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RjOJVOZ8MIrGHrSbSN751eWne2bexQluK3ZWlFIbN9g=;
 b=m59tf2/1PkkA4M0reefjhk9T6KmdSKJ0olHAxLdftSdikbF7T/4rO8BQcBACRYYmgL
 gtpoONYgWgX7uu4mV6lz49x/t7C8u4sZsnxHb8ZpKGANYo8RxJ7xZ4LH0qJ1Dm5EsjoS
 hYPOE0JZ74ysjYcledrlf8leFKR67DPfmszfncNwd1t1f6Oqf53OicdR1z7D5HH5DwUN
 AfKk11b4ElGKE3MOfTnEjvh5AMD18glyg2ohBNFlyKIy95Ub8141VgoweNKECjNQlg4B
 XjjGIagCrnZOTklcevZU8Fo2O9XnAQR78IA+EVtrtBE3JcCDcp1p7Vhgt0bT4eTeBs9w
 pVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RjOJVOZ8MIrGHrSbSN751eWne2bexQluK3ZWlFIbN9g=;
 b=M9KgZag905oDpOH8J9J5GTmdpMI98fG+UKTgAqxdJk1sV++7/prU1QTsqv+QnjoH+V
 wOuIqJ3wtkSahB4XZ2aRgQX6yabFC6ycmqVtCWJL9RIe5uVTniQcwReIjkF2AlcN7rTU
 G1yA0WRnrfMUEFMJ54f3UOgcL/+aqhO/gfNQOTy5R1a0UTVyDve2MBMOrKDUGaSlNz/j
 xc4xrWHgIHfDhSxBBC2/AJ3FPSLyj5Liw6SlZMvw51uiXe0JXwjq7+RZKZwbXG+KO56s
 y7N7zlaAvqa6E7z/Mw6CnnK+pwvwx9pxnON1Mml7q9VdyIAha51hbKNMHQg8lKir0pw1
 9zNw==
X-Gm-Message-State: AOAM5339QqnTEjLcKJPeE8vSweONDvFgndprft/2TeVPpaakiZ+MCQIL
 13bydSe+ZxpiPhCiOiG2ksLSKhPsaFSJrQ==
X-Google-Smtp-Source: ABdhPJyAmcj26TBybzEBeiln++K52wMiKoE9r8YEZk94F+6Jw8Wb7EnGbLQ+4Hw40puuEMFakMQF/w==
X-Received: by 2002:a7b:c08a:: with SMTP id r10mr38307885wmh.184.1638799476884; 
 Mon, 06 Dec 2021 06:04:36 -0800 (PST)
Received: from [192.168.24.132] (pd9fe9a68.dip0.t-ipconnect.de.
 [217.254.154.104])
 by smtp.gmail.com with ESMTPSA id o3sm14666916wms.10.2021.12.06.06.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 06:04:36 -0800 (PST)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
 <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
 <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
From: Mathias Krause <minipli@grsecurity.net>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
Message-ID: <3a2d41dc-effb-158c-4a52-d7eb282ecb7e@grsecurity.net>
Date: Mon, 6 Dec 2021 15:04:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
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

Am 03.12.21 um 23:20 schrieb Jason A. Donenfeld:
> This resulted in kind of an interesting regression with old compilers
> on old kernel versions when I backported this to
> wireguard-linux-compat:
> https://git.zx2c4.com/wireguard-linux-compat/commit/?id=8118c247a75ae95169f0a9a539dfc661ffda8bc5
> 
> The 25519 tests fail for 4.8.17, 4.7.10, 4.6.7, 4.5.7 with gcc 6:
> 
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.8.17-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.7.10-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.6.7-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.5.7-x86_64.log
> 
> But then they crash for 4.0.9, 3.19.8, 3.17.8 with gcc 5:
> 
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.0.9-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.19.8-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.17.8-x86_64.log
> 
> And also crash with 3.16.85, 3.15.10, 3.14.79, 3.12.74, 3.11.10 with gcc 4:
> 
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.16.85-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.15.10-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.14.79-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.13.11-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.12.74-x86_64.log
> https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.11.10-x86_64.log
> 
> Any intuition about what might have happened?

Sorry to hear that. I didn't ran into such issues when doing the
backport and, in fact, trying to reproduce the selftest errors / crashes
failed so far on v4.8.17 with gcc 6.3 and 4.6.3:

[    0.137871] wireguard: chacha20 self-tests: pass
[    0.141106] wireguard: poly1305 self-tests: pass
[    0.141604] wireguard: chacha20poly1305 self-tests: pass
[    0.142309] wireguard: blake2s self-tests: pass
[    0.157012] wireguard: curve25519 self-tests: pass
[    0.157430] wireguard: allowedips self-tests: pass
[    0.158354] wireguard: nonce counter self-tests: pass
[    0.388426] wireguard: ratelimiter self-tests: pass
[    0.389045] wireguard: WireGuard 1.0.20210606 loaded. See
www.wireguard.com for information.
[    0.389874] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.

I'll try older kernels and see if they trigger. In case not, can you
send me the object files of a failing kernel?

Thanks,
Mathias
