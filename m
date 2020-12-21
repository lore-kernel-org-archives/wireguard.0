Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C46C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 06:20:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771F82071C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 06:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 771F82071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c6f9cf8;
	Mon, 21 Dec 2020 06:11:21 +0000 (UTC)
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8880760d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 06:11:18 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 0BL6JbMF025729
 for <wireguard@lists.zx2c4.com>; Mon, 21 Dec 2020 15:19:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0BL6JbMF025729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1608531577;
 bh=BYlCTuhSzV6TRqa7tXYTcFDqgVKa7TxcGPT3foHwNXs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HvZVb3b3M1BRUDvYwttK5+phNj7QvHowvIrutNaLqc/5Fr/5mubZuIK53OKgWXViY
 pvWpssImj+KOwDzkyp4sPST3Z6pFty266rs61dSW6wRAWVQKxAJF4zTUlwbmf3j0sV
 iQ36ZA5yRujO5+Hyrh1Vz2xUCewFy3RZoZvp/2ksOWmK7IyH9txavqjwETrNQyfOEv
 FCKW2iAMYtrN4GVx0h28euROG8K9MESx5mgE//VccCKlv0QCCcT9M6y++QAuhx/YCr
 pJcKVsWfn9OmUjVqc3mDGNE/P+yVUhsR9kZsDEfxkbmp6FlWHoIfjQU+zTaBlKy885
 kmD8M6ys6x2aA==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id c12so5866428pfo.10
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 22:19:37 -0800 (PST)
X-Gm-Message-State: AOAM533+bYI+nSjILrJHZNbJmuWhjwOtdZfrIKS4/bW05UaKv86kD4Ja
 iOSiv/VAq8SDQ9JylRZFc3vE/fmD9est3wve4GQ=
X-Google-Smtp-Source: ABdhPJyTGmpFdbbWcUsN7vwbZtf5cf/Z4qlcgRfZbI9ZKyKFX7z9MBplWa/TWblbbnO2J/T7wiw0B8s5pwv5XMbvdJE=
X-Received: by 2002:a63:3205:: with SMTP id y5mr14082429pgy.47.1608531576913; 
 Sun, 20 Dec 2020 22:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20201128193335.219395-1-masahiroy@kernel.org>
 <20201212161831.GA28098@roeck-us.net>
 <CANiq72=e9Csgpcu3MdLGB77dL_QBn6PpqoG215YUHZLNCUGP0w@mail.gmail.com>
 <8f645b94-80e5-529c-7b6a-d9b8d8c9685e@roeck-us.net>
 <CANiq72kML=UmMLyKcorYwOhp2oqjfz7_+JN=EmPp05AapHbFSg@mail.gmail.com>
 <X9YwXZvjSWANm4wR@kroah.com>
 <CANiq72=UzRTkh6bcNSjE-kSgBJYX12+zQUYphZ1GcY-7kNxaLA@mail.gmail.com>
In-Reply-To: <CANiq72=UzRTkh6bcNSjE-kSgBJYX12+zQUYphZ1GcY-7kNxaLA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 21 Dec 2020 15:18:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARXa1CQSFJjcqN7Y_8dZ1CSGqjoeox3oGAS_3=4QrHs9g@mail.gmail.com>
Message-ID: <CAK7LNARXa1CQSFJjcqN7Y_8dZ1CSGqjoeox3oGAS_3=4QrHs9g@mail.gmail.com>
Subject: Re: [PATCH v3] Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Shuah Khan <shuah@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Dec 14, 2020 at 12:27 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Dec 13, 2020 at 4:16 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > Because if you get a report of something breaking for your change, you
> > need to work to resolve it, not argue about it.  Otherwise it needs to
> > be dropped/reverted.
>
> Nobody has argued that. In fact, I explicitly said the opposite: "So I
> think we can fix them as they come.".
>
> I am expecting Masahiro to follow up. It has been less than 24 hours
> since the report, on a weekend.
>
> Cheers,
> Miguel


Sorry for the delay.

Now I sent out the fix for lantiq_etop.c

https://lore.kernel.org/patchwork/patch/1355595/


The reason of the complication was
I was trying to merge the following patch in the same development cycle:
https://patchwork.kernel.org/project/linux-kbuild/patch/20201117104736.24997-1-olaf@aepfle.de/


-Werror=return-type gives a bigger impact
because any instance of __must_check violation
results in build breakage.
So, I just dropped it from my tree (and, I will aim for 5.12).

The removal of CONFIG_ENABLE_MUST_CHECK is less impactive,
because we are still able to build with some warnings.


Tomorrow's linux-next should be OK
and, you can send my patch in this merge window.

-- 
Best Regards
Masahiro Yamada
