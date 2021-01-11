Return-Path: <SRS0=3yHi=GO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDB1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 17:35:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EAB22BED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 17:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35EAB22BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3367dbf;
	Mon, 11 Jan 2021 17:35:49 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [2607:f8b0:4864:20::12a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 25b3faca
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jan 2021 17:35:48 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id v3so347174ilo.5
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jan 2021 09:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=LzViG+6M8a4vzSOV8ooN/619eTwTPtJS9YsOMkrafo4=;
 b=FDrrknj7kNV/QrfpRwB6R6xqsKJWmj2qzNa0V0VygomjPj54UKDbL4w2Grt8p9qe6Z
 pP09mi/1TLnSR+5lNgi5Rf0YV8GO2H4kuH3FHfjPYtxo79ux7IISu12v/9OHJmuBaoOP
 sRwMl1DZ7bVgSGiGovXOk636jif2iP3DDcmZ4T2whGuwIKeMJFJNHRvAsM4GCLC8xjVm
 vnmiwC5hWLkuv3PnvjBsLxXmzACxZ2JrDPHFVxWv+aIbjWKliKPOjX0ymR6FoxLTkpIO
 Evy3/5OT39hvUzxaVIKafjABrYT70qzQXeRcIcOQ2NVdr1WHlONW2gNr9bEaS8mDoeGv
 UP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=LzViG+6M8a4vzSOV8ooN/619eTwTPtJS9YsOMkrafo4=;
 b=NqqTr7g5bgDYqZHhfOU9dkZj4H9/OEogJnxYHUMVcYzZrzWhfBe59avltW11Y7Xu5h
 pE6kIcYQRoKCNnKIzKCT79HzjErEzMWYOhZA5sPIMa7OpmXa4GxR/d1vJalw9MoDD51+
 b4lFcuIwkUb0ajuE63IyiFubd1AItb2HY4tVKpIIiLxSLmuc46QzHMu9IK0/WrkwnrjC
 9HyCPIHB0A91AEOpz37k3bxWjaz7CWjE9N9QUFapqsa/5o+Dr1W/aqrycT29t5GoXEG7
 TBknoyGPPgjOV0xAdYBaDwBgJk+b5s1BKmDhFuQDYLBtd8LO1BKMO0KOn6Mp0rmO7/O2
 8fYg==
X-Gm-Message-State: AOAM533w4HJDNb/JOC0Nb8Mbq6snGAuAZznFg2yu0rRvVzGU+rxa8sMF
 lVp/s8LzpXCB4Y7Fl8v1Par1rDf9GFIIXUTG4ws=
X-Google-Smtp-Source: ABdhPJxOc/ADjRCF61vsnDHmpkcvuPUerMZtDscg25vqMGpQWUCmaq77u6H/4q8EUlUEGg2Jk6p5gfPjDiAUUMgc3Ic=
X-Received: by 2002:a92:cb52:: with SMTP id f18mr215994ilq.41.1610386546763;
 Mon, 11 Jan 2021 09:35:46 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CACT4Y+Y9H4xB_4sS9Hu6e+u=tmYXcw6PFB0LY4FRuGQ6HCywrA@mail.gmail.com>
 <CAGXu5j+jzmkiU_AWoTVF6e263iYSSJYUHB=Kdqh-MCfEO-aNSg@mail.gmail.com>
 <CACT4Y+b1nmsQBx=dD=Q9_y_GZx1PpqTbzR6j=u5UecQ0JLyMFg@mail.gmail.com>
 <CACT4Y+YYU6P1joGcNe9+E97-VACqs=5rcmOQerh2ju90R5Nfkg@mail.gmail.com>
In-Reply-To: <CACT4Y+YYU6P1joGcNe9+E97-VACqs=5rcmOQerh2ju90R5Nfkg@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 11 Jan 2021 12:35:19 -0500
Message-ID: <CAH8yC8ncN7YZT804Ram3aCzoRGjCGKXEEUKFaNsq1MxtW0Uw3g@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Netdev <netdev@vger.kernel.org>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Jan 11, 2021 at 12:20 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> ...
> FTR, I've disabled the following UBSAN configs:
> UBSAN_MISC
> UBSAN_DIV_ZERO
> UBSAN_BOOL
> UBSAN_OBJECT_SIZE
> UBSAN_SIGNED_OVERFLOW
> UBSAN_UNSIGNED_OVERFLOW
> UBSAN_ENUM
> UBSAN_ALIGNMENT
> UBSAN_UNREACHABLE
>
> Only these are enabled now:
> UBSAN_BOUNDS
> UBSAN_SHIFT
>
> This is commit:
> https://github.com/google/syzkaller/commit/2c1f2513486f21d26b1942ce77ffc782677fbf4e

I think the commit cut too deep.

The overflows are important if folks are building with compilers other than GCC.

The aligned data accesses are important on platforms like MIPS64 and Sparc64.

Object size is important because it catches destination buffer overflows.

I don't know what's in miscellaneous. There may be something useful in there.

Jeff
