Return-Path: <SRS0=49e1=GP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01081C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Jan 2021 09:54:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED468225AC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Jan 2021 09:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED468225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1008951c;
	Tue, 12 Jan 2021 09:54:36 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d3d4b16a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jan 2021 09:54:33 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id w79so1344166qkb.5
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jan 2021 01:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10CJIM2rM2mJ9aVWIA2I7jcHcXtQB84Bk80ptrJq0V8=;
 b=Vo9Ojrd4yLCL5/SVDA2N51lnS5iTpF9rC3dXZePrI6iGCG66iPpnKaJD0R8sqm4ohY
 7WqKebFPP6p3R9bglrPDdWVmX4fI6ppNlN0L/taGQLHV8mWDu516SfmT+t8MRTFc2hJH
 2wAQelImSLmFX1QuTy/gjBcUbLLBaLTTmKmiC3kzh9okRlVXrOSVjIRqU1lDKI3tkWfR
 3aslyQO/0P/GjbH5kzNjc+f2idvvVgeUfWSqKo4UqD+UW1Yl9a32K3i7Q6hnc5/qpKXs
 apEKehHxuwi8VUOe4TJ5NDQtjViAD7s2vYYAbVjUBRRgZk8vj0gu+drnv3DxRRLKVPB5
 C2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10CJIM2rM2mJ9aVWIA2I7jcHcXtQB84Bk80ptrJq0V8=;
 b=hLD80Tumu673Kvxjk/Zx0EsvXnTozYyHHHMKVRWBkCG+Bv7YbY6SOZmzxrLZ5j2lXS
 +b951WUV5m74HZyQflzTsyhoYiXJ59awl/8fGEyXycZYRZ8l4KamYgqGwVOB9rH81cne
 4ZMH2wW1z4Nj1lNaE7N1y3q8vzAMwvtAqd7/aXG+7kXehNoAcbI5qDHce83Jndn8Ad9o
 ZYPeRe9eoEAe2pxS+ZquRvwChGL+U9sYa6nI9NOw80wPD5Lh82BOILqCuctvdWvZhRA2
 r8yyOSzHGxqJfbsgxq/7S7rc8dQDruEuyKajHkXfLdNFAFxPzS1i6rMxb/BBwzA0IB2n
 Sqwg==
X-Gm-Message-State: AOAM533PIAvWzb6hGDS0ej91XFzlwaRrnifH1d6yUdFvPGmZ/uAeEbHT
 Wa2XCMWKnyUCrtMeef0aV9dVgL7yk2q18Kevemygqw==
X-Google-Smtp-Source: ABdhPJyLNvDiCNdvrUNpG2lfSIuOc6C2ndaajcQ0FwKuGJE7bHbVY1ILCpFE04xAGwUsIxxQRSrdl293Nyb6JrYlzfE=
X-Received: by 2002:a37:9a97:: with SMTP id c145mr3648529qke.350.1610445272320; 
 Tue, 12 Jan 2021 01:54:32 -0800 (PST)
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
 <CAH8yC8ncN7YZT804Ram3aCzoRGjCGKXEEUKFaNsq1MxtW0Uw3g@mail.gmail.com>
 <CACT4Y+abV4iDXf9y-_HyH5jQhmn5+=md+C4n+-77q=+cbN-OZA@mail.gmail.com>
 <CAH8yC8m_H_VLWaomSku62k4BhwjFCZTB0Td4s17Wtb7tAH5Lqw@mail.gmail.com>
In-Reply-To: <CAH8yC8m_H_VLWaomSku62k4BhwjFCZTB0Td4s17Wtb7tAH5Lqw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 12 Jan 2021 10:54:20 +0100
Message-ID: <CACT4Y+bt8p=e9czrEDVu2+HiFOxQe4pxr8AOdz_fP8tvvWh1FA@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: noloader@gmail.com
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Jan 11, 2021 at 7:15 PM Jeffrey Walton <noloader@gmail.com> wrote:
> > > > ...
> > > > FTR, I've disabled the following UBSAN configs:
> > > > UBSAN_MISC
> > > > UBSAN_DIV_ZERO
> > > > UBSAN_BOOL
> > > > UBSAN_OBJECT_SIZE
> > > > UBSAN_SIGNED_OVERFLOW
> > > > UBSAN_UNSIGNED_OVERFLOW
> > > > UBSAN_ENUM
> > > > UBSAN_ALIGNMENT
> > > > UBSAN_UNREACHABLE
> > > >
> > > > Only these are enabled now:
> > > > UBSAN_BOUNDS
> > > > UBSAN_SHIFT
> > > >
> > > > This is commit:
> > > > https://github.com/google/syzkaller/commit/2c1f2513486f21d26b1942ce77ffc782677fbf4e
> > >
> > > I think the commit cut too deep.
> > >
> > > The overflows are important if folks are building with compilers other than GCC.
> > >
> > > The aligned data accesses are important on platforms like MIPS64 and Sparc64.
> > >
> > > Object size is important because it catches destination buffer overflows.
> > >
> > > I don't know what's in miscellaneous. There may be something useful in there.
> >
> > Hi Jeff,
> >
> > See the commit for reasons why each of these is disabled.
> > E.g. object size, somebody first needs to fix bugs like this one.
> > While things like skbuff have these UBs on trivial workloads, there is
> > no point in involving fuzzing and making it crash on this trivial bug
> > all the time and stopping doing any other kernel testing as the
> > result.
>
> Going off-topic a bit, what would you suggest for UBSAN_OBJECT_SIZE?
>
> It seems to me object size checking is being conflated with object
> type. It seems to me they need to be split: UBSAN_OBJECT_SIZE for
> actual object sizes, and UBSAN_OBJECT_TYPE for the casts.
>
> I still have a bitter taste in my mouth from
> https://www.cvedetails.com/bugtraq-bid/57602/libupnp-Multiple-Buffer-Overflow-Vulnerabilities.html.
> I hate to see buffer checks go away. (And I realize the kernel folks
> are more skilled than the guy who wrote libupnp).
>
> Jeff

I've filed https://bugs.llvm.org/show_bug.cgi?id=48726 for this. Does
it capture what you are asking? Let's move the discussion re ubsan
there.

However, in the first place I am suggesting fixing the code. E.g. for
sk_buff I would assume it's relatively easily fixable. A
formally legal fix I think should put sk_buff_head into sk_buff and
use it, no downsides and will eliminate the confusing "should go
first" comments.
Or as an workaround maybe we could make __skb_queue_before accept
sk_buff_head and cast the other way around.
