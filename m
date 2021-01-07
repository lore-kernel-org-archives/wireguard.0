Return-Path: <SRS0=PSWY=GK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E82C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 12:56:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B6A2336D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 12:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7B6A2336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9a2448a;
	Thu, 7 Jan 2021 12:53:52 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [2607:f8b0:4864:20::136])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0d359bc4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jan 2021 12:53:50 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id q1so6578046ilt.6
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jan 2021 04:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=1/RN0dIj6UwrLp4o82371V2FBBF9THsqRyw4ZO91biI=;
 b=qsw0JRgyrEIbI3NDJLegZ9Lr37egmGGgOyrzO2ThuYgY1tfSkShnfy0Iy2TI4PsVwC
 THqXKfMBiuQDucecQ3q3WnZ4Kmn3hnUcBI1prYsHdRrLJSMR5omPBtPPs8Pqvmwfwdrm
 AfXndGpXe4lZiEWwZBVjVUN4dwVmhlI/8IQBOwOwUyokRnqXoyLJwVbTNSs+ot/26o6I
 GF7Bo+BuzcryeAQ2/xbnweWUKBqMH2lsf5sFmcu0BExJfRPx6Ge9V8xdAvWs4ZQTm4n1
 /SiISxVrHepKEKx4u+Z00Y28Jge5di15BOsjXBArIvtMNlctRt/bWM925gr3hCEIykw3
 Cb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=1/RN0dIj6UwrLp4o82371V2FBBF9THsqRyw4ZO91biI=;
 b=fzQQG0QlhvEm5NMw6udcPu3KgThY0jDVbIzw6K9dB0ScyXoVX0TFFRBwZbq0zgWhFe
 iP22n8DrfoUu8UvUfkHv246sMJrw/wA7zcYznE0NAlMjhj62OSTxwn9AAMxAxnosChxu
 rgHdFaldKpDXIH8xT2QQJyvPvSTkQhXk+Lpx2Xr7holhvEGwm6rVCKmkIuUcxJ8lPa4+
 kX4aMGy6OzZbUgF3iuo24TrBI1GMbG5zRoa0z2acN/qgA/kbVCMERF2i7/jYaIPwbDBC
 OIispqx2li2XxV8Jekdo8jzAHFMbtE5jBvcRqZyv2VECKqfWoDqIn6ghPDjY4fzKS/l8
 gI5A==
X-Gm-Message-State: AOAM531IbpM8a/s5jDH7Z/V1XeDqnZyIdvYtQeDEVAQxO131s+P23BpB
 E777uK7y8TD8n6JHVS3mWJci7slU47Qz7viCIfo=
X-Google-Smtp-Source: ABdhPJw7XeGnXclXr2yRl1oWB66Mo8FUAW73bqIkvvB5quevXXOa29+onWErkn43UXWti7D/JKfJcy7WJx4ini18OwY=
X-Received: by 2002:a92:9881:: with SMTP id a1mr8863830ill.238.1610024028821; 
 Thu, 07 Jan 2021 04:53:48 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
In-Reply-To: <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Thu, 7 Jan 2021 07:53:34 -0500
Message-ID: <CAH8yC8=mWE=cVdmJU2t8ibDV_O817VT-+BKEGqAZCeabNi0gGw@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eric Dumazet <edumazet@google.com>
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

On Mon, Dec 21, 2020 at 6:24 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Dec 21, 2020 at 10:14 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > Hi Jason,
> >
> > Thanks for looking into this.
> >
> > Reading clang docs for ubsan:
> >
> > https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
> > -fsanitize=object-size: An attempt to potentially use bytes which the
> > optimizer can determine are not part of the object being accessed.
> > This will also detect some types of undefined behavior that may not
> > directly access memory, but are provably incorrect given the size of
> > the objects involved, such as invalid downcasts and calling methods on
> > invalid pointers. These checks are made in terms of
> > __builtin_object_size, and consequently may be able to detect more
> > problems at higher optimization levels.
> >
> > From skimming though your description this seems to fall into
> > "provably incorrect given the size of the objects involved".
> > I guess it's one of these cases which trigger undefined behavior and
> > compiler can e.g. remove all of this code assuming it will be never
> > called at runtime and any branches leading to it will always branch in
> > other directions, or something.
>
> Right that sort of makes sense, and I can imagine that in more general
> cases the struct casting could lead to UB. But what has me scratching
> my head is that syzbot couldn't reproduce. The cast happens every
> time. What about that one time was special? Did the address happen to
> fall on the border of a mapping? Is UBSAN non-deterministic as an
> optimization? Or is there actually some mysterious UaF happening with
> my usage of skbs that I shouldn't overlook?

The object size checker depends upon compiler analysis. If the
compiler can determine the destination buffer size, then the compiler
can insert a call to a safer function, like a safer memcpy.

If the compiler cannot determine the destination buffer size, then the
compiler will not insert a call to a safer function. (And Wireguard
won't see the crash).

Note... The object size checker and use of safer functions when the
compiler can determine destination buffer sizes is quasi-automatic use
of the safer memory functions from TR 24731-1. They are the ones the
Glibc folks refuse to provide to developers.

Jeff
