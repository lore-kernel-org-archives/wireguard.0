Return-Path: <SRS0=3yHi=GO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66BCC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 17:58:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D7E2250E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 17:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08D7E2250E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f956208b;
	Mon, 11 Jan 2021 17:58:51 +0000 (UTC)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d0791498
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jan 2021 17:58:48 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id s6so43851qvn.6
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jan 2021 09:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ATuJmOFy0KcqE13PnrVbyttP4a9Jz5qFuwsOuBQL/Vw=;
 b=MUBr7e2G3c7SlRYU3UN1lvqA22wCQ7x/PE67AqxvzqThT9VDZGyj4drBnWjQcFbxZR
 4q0+ZL3hedviQI365712Z8+iKsMA4PhKlEEOFM4xNR1vu7HQXQSai1DhgEb58dIN7Xnz
 zH6as85malg1f0W2X7I0ysmae2F8IyQqZKrJ2Mnps9JohV2X4st/Hcpkh0lCRTXkJFyl
 7JdBwvkM94r2QYFxx/FU70f3HdD6/KplNFfNXqGu+YbZUT7hCO3NesqD/KM0bIjbl7CH
 iPfSq42BjQ5h+xZ/00siYLkIYJEIrpS+HUZ2tsSwvw11ZA4xtTpKf8eBwnfJwebInH12
 aZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATuJmOFy0KcqE13PnrVbyttP4a9Jz5qFuwsOuBQL/Vw=;
 b=ZAbJ02aHQmsZGrgy7TMMEAHX65P2P5SZD8B+bpQCghJm5e1jZDSbSbYkhefA2WWIIr
 S8wzEJzhh4xh6qWgD+HEcgg4MGrUj95Es+pCE5wjSYbI3xCeKnUkNFxyqCkcEDnkLlSJ
 20Qf9QxRg7mEjVkonlCSPB2t6/PqcjLYXwBpuXOn/5eBnaPTajb/yaqfYN9birFr/Xm4
 9lg//FwbkjK/HzxC/OiTAvzkHMW3d5NH34F3Y3cMcNujmZeb8oBI8r3k6UeaZ16Gj47C
 4i2nSqbAzvW5kcnoEy52Z/TljZxp5+KhEWHKq+679gHbCUUTdXQAmOzby1eclgubideM
 ZrQQ==
X-Gm-Message-State: AOAM532LVj8aDM9y5g5rBEjKbX15dlyLDwWiz/in2bsUnmS/7zRgUqtr
 VHBuWtWJDqFKMx79NwtwBx0yVeCak/7jxS0JgHCT/g==
X-Google-Smtp-Source: ABdhPJxEVFwSKbAyhvqeMm56EZyjm/kLEVGSg+G6Kyh2y5K5/c/Iw1c+MJR5a8pqvLSWTlakYZbwTxpf2bdnCa+zSFE=
X-Received: by 2002:a0c:8304:: with SMTP id j4mr833661qva.18.1610387926447;
 Mon, 11 Jan 2021 09:58:46 -0800 (PST)
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
In-Reply-To: <CAH8yC8ncN7YZT804Ram3aCzoRGjCGKXEEUKFaNsq1MxtW0Uw3g@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 11 Jan 2021 18:58:34 +0100
Message-ID: <CACT4Y+abV4iDXf9y-_HyH5jQhmn5+=md+C4n+-77q=+cbN-OZA@mail.gmail.com>
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

On Mon, Jan 11, 2021 at 6:35 PM Jeffrey Walton <noloader@gmail.com> wrote:
>
> On Mon, Jan 11, 2021 at 12:20 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > ...
> > FTR, I've disabled the following UBSAN configs:
> > UBSAN_MISC
> > UBSAN_DIV_ZERO
> > UBSAN_BOOL
> > UBSAN_OBJECT_SIZE
> > UBSAN_SIGNED_OVERFLOW
> > UBSAN_UNSIGNED_OVERFLOW
> > UBSAN_ENUM
> > UBSAN_ALIGNMENT
> > UBSAN_UNREACHABLE
> >
> > Only these are enabled now:
> > UBSAN_BOUNDS
> > UBSAN_SHIFT
> >
> > This is commit:
> > https://github.com/google/syzkaller/commit/2c1f2513486f21d26b1942ce77ffc782677fbf4e
>
> I think the commit cut too deep.
>
> The overflows are important if folks are building with compilers other than GCC.
>
> The aligned data accesses are important on platforms like MIPS64 and Sparc64.
>
> Object size is important because it catches destination buffer overflows.
>
> I don't know what's in miscellaneous. There may be something useful in there.

Hi Jeff,

See the commit for reasons why each of these is disabled.
E.g. object size, somebody first needs to fix bugs like this one.
While things like skbuff have these UBs on trivial workloads, there is
no point in involving fuzzing and making it crash on this trivial bug
all the time and stopping doing any other kernel testing as the
result.
