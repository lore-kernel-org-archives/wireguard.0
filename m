Return-Path: <SRS0=30W4=AA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1A3C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Jun 2020 08:27:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89D7D20890
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Jun 2020 08:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyuUfRUG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89D7D20890
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a2672fc;
	Fri, 19 Jun 2020 08:08:13 +0000 (UTC)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [2607:f8b0:4864:20::e44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 95cab903
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jun 2020 08:08:11 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id o15so5114524vsp.12
 for <wireguard@lists.zx2c4.com>; Fri, 19 Jun 2020 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=krkjP5ceTK4tq/ekK/QDve2uHRiZF7SBtWPyOwOOlos=;
 b=iyuUfRUGU+z2c578Ds6xxcV1DcXBa4BHSYMBYXaz19/z4zczH6WWUtEQShWxBGLVLS
 jEKYs1ZAq2ot+nE0b6epcdUsAbvV1KTOwhmMx5lK3kPN1F1BzX8se/8q/kC8k1VFz0dV
 fQ5gJ8NEqXENqiQHzK/s8PjEJl6k250CXx0ZE1uEIxIlLMilX9x/cO1BU8Aibt6jf1mM
 U6/WyWiAKhE6aPUVQwGp8iuTljzn4tt/QBxtI3cZ6whCMEKNPi8IyVZNACuk9O6xSxhL
 EwGIZp4vNIQhEeLTB/qNpcwQWYX/f7wd+AOk3b5H8yRamE13pLmlghjeZpoDZ2dK/yw7
 Pqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=krkjP5ceTK4tq/ekK/QDve2uHRiZF7SBtWPyOwOOlos=;
 b=bsfFS8ywL7/a6p/4UKOunOzVPG9U36G//BNVsVEQCfCXi57SYVy7Cx5+Ddj1/UzPsO
 sIqwGpg+e75fr5YnnhcfpiKFindKfW7Xcz9uqhIKxqJnFKL79q2NLm5dcAOKAHPFPL5V
 ot87E3KzjA3CB0NzFwygoEliLLRCK7nqlFH6l8BmtRm2S/RlVQFc+X5QMzBEpWZgKT/W
 y5u9O2/vNIiIn0CeK0y71fXyhCp0zgLlGBNp6A/DEF5PfXr2vloVFmzYoM2JuE/CIvyw
 DgVVBUKocmQWYrrIqOA5xqbRe434SEi42viVctJdE8W6QBm2d7TUsW1CQDXutdWZMRlZ
 ckQw==
X-Gm-Message-State: AOAM530BkQgKGpfRodG/JVGcKh0xZysteGaPme7/CEQ2BoXvJcQZis1e
 u89+KhfqzebPD7lt8BN5PKpR48v+OMXCigIXNram0u8v8Q==
X-Google-Smtp-Source: ABdhPJzK9RpYPN7fYER+75RwsPEJ5bw1dT15kLu76ms7/hKslnbSF4Yw14QJhsertbi+joia3AMyMrXjAGqSH4ojx3o=
X-Received: by 2002:a67:d201:: with SMTP id y1mr6401487vsi.75.1592555190715;
 Fri, 19 Jun 2020 01:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvbpu1Lw0j9dtXZPmVS+i-OnopUo+zuqtoQLnABQGw-SqQ@mail.gmail.com>
 <CAHmME9r3nPwmUoYYrj0PnUStd1ACSmdFAO4Qv2cZtmiLspOW1g@mail.gmail.com>
 <CALjTZvbtjVwpyV+AMX4htssTbwTHV45mQeokUr952D_GbtFPvw@mail.gmail.com>
 <CALjTZvZRerzWqaqhY2U=m44n5taLEsY99uEt2=ZNCe27=LYbLA@mail.gmail.com>
 <CAHmME9otC1mOqR2tLB55BVQQpNPvCMUGa1E4jfMYYXNp6_31BA@mail.gmail.com>
 <CALjTZvZ4wqZZ7_Fk-YHaxT9uuWnS4n9dLm4ZXSy1UM3riv+NuQ@mail.gmail.com>
 <CAHmME9qWrBTCsBr7s6oLD0zuBMzZUD2OV3s-tgDwV0W7bb9Utw@mail.gmail.com>
 <CAHmME9ozm7KiT3rkDpAF=1p_g7QU6-6fxncZB1S4tfm5v2DGqQ@mail.gmail.com>
In-Reply-To: <CAHmME9ozm7KiT3rkDpAF=1p_g7QU6-6fxncZB1S4tfm5v2DGqQ@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Fri, 19 Jun 2020 09:26:19 +0100
Message-ID: <CALjTZvZj=wH1w_zpF05dqi5Lnzfxwz9GpvCfix6w7GFh9Os9VQ@mail.gmail.com>
Subject: Re: wireguard: unknown relocation: 102 [ARMv7 Thumb-2]
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Good morning, Jason!

On Fri, 19 Jun 2020 at 00:50, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey Rui,
>
> I fixed it! It turned out to be caused by -fvisibility=hidden undoing
> the effect of the binutils fix from a while back. Here's the patch
> that makes the problem go away:
>
> https://git.zx2c4.com/wireguard-linux-compat/commit/?id=178cdfffb99f2fd6fb4a5bfd2f9319461d93f53b
>
> This will be in the next compat release.
>
> Jason

Great detective work there too! :) I do have to wonder if this is
really a binutils/gas bug, though. From what I could gather, it's only
the kernel module loader which can't (and won't, I remember reading
somewhere they don't make sense for the kernel) resolve
R_ARM_THM_JUMP11 relocations, and using -fvisibility=hidden in a
kernel module seems to send the linker a conflicting message. Anyway,
I'd still open that bug, at least to get a definitive answer. ;)

Thanks a lot,
Rui
