Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919ADC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Dec 2021 08:02:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 74a8f084;
	Thu, 9 Dec 2021 07:59:43 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6a287547
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Dec 2021 07:59:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a18so8187305wrn.6
 for <wireguard@lists.zx2c4.com>; Wed, 08 Dec 2021 23:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eKu55z/OvThc8qjWUBYauTl7lJaZ5AtQbiOOJfaVvZo=;
 b=agqCwLdMi3pdSmvAcWG5wtKLn+5+mmceGjhqnaDZWWrqxKMmtBtTi0qavMvbCGLx9m
 +tDfo/lc5Av14iT/nZ+h1kKdiGm5jv+1dsDwiiY2cf5h6T7SQyv29GuQ3Lxof8NVxQRK
 rKgOssll80zB/MUR6vbd5GqT+ug7i7ZhCstYV05HkYiIoByY7t2omNSHV6eaZzclU60m
 PpZgg+o5HgC3e9UU4OP6As/ON/Z8lnfA1BrZ+BhuiIWpcFeau1gPZrIMBkvZPk+9G2De
 V5a1ZkH8jFf4JMX6I5M9OLgIA0+BUngbWGAXszNTNYQHSHlhtP2fPr3VQSurPW7dRAWq
 N3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eKu55z/OvThc8qjWUBYauTl7lJaZ5AtQbiOOJfaVvZo=;
 b=n15IczlmD8EdjdDxpcsB122Cgf7YZrpw1j7WSwam1S6M9y2POAFs3JqkPnsG/lm1FD
 CvaN9Mub++gq2reELPtkYVzh+nOcWryog9IxR28a7a23F1PW8y3/VcpdqzsnSxBKJ5BT
 kwdzMOjSYqZ2KhOlo83IOwjNxLsfoi+8xF7Ju6HLg279o/3J/pmRq33gE4XS+Dw37om/
 EJJgi9Aqewh4FOjtOfC59yVeSU9PQftxzcpVs+5q4l55nnon2IvXlWnIlly2ueQC+eq4
 k77WX2Zud+zZhsAL3lCIPhH8aIyCUSCUPcj8CWmRXAhJVeXHaTJZPbmKIrZucGD6SGZQ
 M+ZQ==
X-Gm-Message-State: AOAM5322JVLL1YdASJ7vGlI+bO+1qf1SvOxj6lsX2iixKvq3sv+Y4oUB
 DhicLFFAKnaIoudPDhq1xmeu31YY+gpbwQ==
X-Google-Smtp-Source: ABdhPJw6s9s7SRs1FuwvGF60sUHCf3q7aPqVNQHC+NSDYfaXBEFITlKlWA/gop5UnXWqBw3o4OMVHQ==
X-Received: by 2002:adf:eb52:: with SMTP id u18mr4721926wrn.90.1639036781167; 
 Wed, 08 Dec 2021 23:59:41 -0800 (PST)
Received: from ?IPv6:2003:f6:af08:8700:bc36:d16e:e0e5:ad07?
 (p200300f6af088700bc36d16ee0e5ad07.dip0.t-ipconnect.de.
 [2003:f6:af08:8700:bc36:d16e:e0e5:ad07])
 by smtp.gmail.com with ESMTPSA id 4sm6452105wrz.90.2021.12.08.23.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 23:59:40 -0800 (PST)
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
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
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
From: Mathias Krause <minipli@grsecurity.net>
Message-ID: <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
Date: Thu, 9 Dec 2021 08:59:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
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

Am 08.12.21 um 15:56 schrieb Jason A. Donenfeld:
> On Mon, Dec 6, 2021 at 10:00 PM Mathias Krause <minipli@grsecurity.net> wrote:
>> Yes, probably, but you're mixing up the two.
> 
> Oh, thanks, right.
> 
> I'll talk to EverCrypt upstream and see.

FWIW, 'out' is also wrongly flagged as output operand in fmul() and
fmul2(). But making it an input operand needs more surgery, as the
operand order changes and this requires some code churn.

Mathias
