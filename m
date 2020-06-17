Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74A8C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:55:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C6BE20786
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kF8zjCb2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C6BE20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e6e94b8;
	Thu, 18 Jun 2020 19:36:47 +0000 (UTC)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dd0f81ce
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 00:01:23 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id k15so3154611otp.8
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 17:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G94FcsS0WOn7M75ysLn9y+On7M3JekOpEmThXP28ZdY=;
 b=kF8zjCb2wBpmlfaifSfSW/aXObfQMB4FPptDYGdX0f8EGxInYp3cPzF7Vr2FEt9KhW
 /MY498VVxzR82ujBtjFR0F4fMY1MXsdd065FbDblIQ+GhCOREiVELZwpSekeO0u5Le/W
 V2AgAwmO1prYDtH57MqUXu/eSAAJ2R2TDCv7zkug0oV6SOM5tCOFqQtaHeR7Dmmy5YeB
 CuFicE44NwGxevqk2j0NHDlNWwHciFJwK1R6UtM5Vc/R0qleaK3yL8MZxAByalgsYrSP
 rwAy5ryABJDHppc9urXaIB7omRmemQAfzC+0ClWqdNdKTDxo52Z1rQVL1KvvClFDhWCv
 8UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G94FcsS0WOn7M75ysLn9y+On7M3JekOpEmThXP28ZdY=;
 b=W44HnhmQXbu2kjfFMgAs+yHRtZ3a9WLtGb2/fsCLA3Nn05PAU8PVJF+UjMdMA/H/4Q
 UALqwIHMz3akKd+2F3hNS080qLeFH3l9H7xDKFruokGfMB10ju3ftRkVgq7RqT8gVzIb
 UCnCNl0iJzBHcFCO19lx/MBwKftzDkh7UkSo7vrE6j0VrsNepV4cVS3lw+as2EW2Nq7t
 mxVU7i+nVZ1a7JwgJWJGGIzvRyVqR/qvJl3yUVHhXL00Ebg9iVnbTQLPeBTJAYm8Dxcw
 cqg7xmgI6QPmx4hRNT+oAqNDnCW98MIUY/Z9jLYn5fMMkEEkVN1oRfJW1lBi6W8ZGKt+
 mM1Q==
X-Gm-Message-State: AOAM533olaFFjLXbqlwBziVaADsACzrtWrtfHTJWyDEGneiHHzW4T1cg
 +f/b8jGIb7alBEy2pKnufjFa3Aj68LeEwIo72PHZmmZv/jXk
X-Google-Smtp-Source: ABdhPJyXVYfljJY3UtGziRurqfb7z7DrxRoIyuquBplbxz2EDO6DLlsocrMMgV27RBrw/rQExCrutqJilimY5LX/Fj0=
X-Received: by 2002:ab0:6f91:: with SMTP id f17mr968870uav.32.1592432298124;
 Wed, 17 Jun 2020 15:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvbpu1Lw0j9dtXZPmVS+i-OnopUo+zuqtoQLnABQGw-SqQ@mail.gmail.com>
 <CAHmME9r3nPwmUoYYrj0PnUStd1ACSmdFAO4Qv2cZtmiLspOW1g@mail.gmail.com>
 <CALjTZvbtjVwpyV+AMX4htssTbwTHV45mQeokUr952D_GbtFPvw@mail.gmail.com>
 <CALjTZvZRerzWqaqhY2U=m44n5taLEsY99uEt2=ZNCe27=LYbLA@mail.gmail.com>
 <CAHmME9otC1mOqR2tLB55BVQQpNPvCMUGa1E4jfMYYXNp6_31BA@mail.gmail.com>
 <CALjTZvZ4wqZZ7_Fk-YHaxT9uuWnS4n9dLm4ZXSy1UM3riv+NuQ@mail.gmail.com>
 <CAHmME9qWrBTCsBr7s6oLD0zuBMzZUD2OV3s-tgDwV0W7bb9Utw@mail.gmail.com>
 <CAHmME9p51XvLEZ7QbDreEXym34S4XZZaRotAv4aRiT5D4Pz3XA@mail.gmail.com>
 <20200617204510.GA396261@zx2c4.com> <20200617205443.GA403252@zx2c4.com>
 <CAHmME9qX2dVBf-23g1ASW1EFaX_4VLUH5QZBCM71NVfe6rtaxA@mail.gmail.com>
In-Reply-To: <CAHmME9qX2dVBf-23g1ASW1EFaX_4VLUH5QZBCM71NVfe6rtaxA@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Wed, 17 Jun 2020 23:18:07 +0100
Message-ID: <CALjTZvYnH_xQ45LLZ3Mp_oxatjWons4JFFpf3F_01F20s3SwVQ@mail.gmail.com>
Subject: Re: Any progress on R_ARM_THM_JUMP11 issues?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 18 Jun 2020 21:36:45 +0200
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

Hi again, Jason,

[Adding a bit of extra context for linux-arm-kernel.]

On Wed, 17 Jun 2020 at 22:02, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> But I am wondering: has anybody heard about toolchain progress toward
> fixing this? Couldn't the compiler reorder functions itself more
> intelligently? Or avoid emitting the B in the case that the jump will
> be too far? Or does nobody care much about 32-bit ARM these days so
> it's just fallen by the wayside and
> CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11=y is the best we've got? Or
> something else?

The thing is, CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11=y implies
-fno-optimize-sibling-calls, which seems like a big hammer to work
around a toolchain bug.
Now, this bug has been reported in Linaro binutils as early as
February 2011 [1] and the upstream bug has been deemed fixed in
binutils 2.22 [2], two months later. I usually don't build modular
kernels, but in OpenWrt we don't have a choice due to the compat
backports of wireless drivers. What strikes me as odd is the fact that
without CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11, all kernel modules load
and run just fine, except for WireGuard. Anyway, I completely agree
that if it's a toolchain bug, the toolchain must be fixed.

Out of curiosity, I also compared the vmlinux sizes in both modes
(OpenWrt kernel, Linux 5.4.46 with my Turris Omnia configuration, gcc
9.3.0 and binutils 2.34).

Pure ARM:
24243392 bytes

Thumb-2 (with CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11=y):
22102716 bytes

A 2 MiB smaller code footprint is nothing to sneeze at.

[1] https://bugs.launchpad.net/binutils-linaro/+bug/725126
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=12532

Cheers,
Rui
