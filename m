Return-Path: <SRS0=3yHi=GO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C04C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 18:17:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABEC3207B1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 18:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABEC3207B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f7be4c2;
	Mon, 11 Jan 2021 18:15:08 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [2607:f8b0:4864:20::d30])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc6adaa5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jan 2021 18:15:07 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id o6so519452iob.10
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jan 2021 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=34kB1Ns88SnXmJ4h4la9faIDJSSZWsUcWdihCyi4k/s=;
 b=L1BUyCb4m3lYieeyY2nJMNID0K0qbw20xDeriQPIqNZ7gqTmANyAN6Yey48jCZEmj6
 TwZDBZLyHmw5T6rDgQuYrx2gBquxJ9I3RJhU5rzqVi+APt2Yh+XaT1xgjgJMut4gc9L5
 nJElL0lrV5FVC0Ivj9tFsONDeCtV+NChtfFAu6uLs25IkfjLStp/aWPKuy/CFCXyEuM0
 ksyNFbx++FWX1Iaz+nN1ycjuGLxIznNFZAk8Dn/ym0CIhG4iLc8mXQ8EAEQsxbVT6FTE
 GgT5woeG0x1VkDd0E6r5w9jWkmr1FIvA9N811tsq0PtC6zcj5hJLv90Suat/xyofk9ES
 T4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=34kB1Ns88SnXmJ4h4la9faIDJSSZWsUcWdihCyi4k/s=;
 b=fyygiiIdOdtiDgQPwdlm0bZhnu3Ja5QgM+WHTnJYT9CWIEyY9DdqWpr/ZE5OVgI1+C
 PJvH8gb36mHqKsqCXp/xfzM8G2x+E8llW4w0JYKoG9WG8TOE2/3BNX5dZEtNQx6RoJez
 0EQ/PLfjR7lae4AmqTuFJ0TMo78vBN2weDBDY8rxGlVBydBKiIAlmU5KxeqzG5QIz6/e
 4FhvO6h83f79x3c5x9sabQmDj60srF4/C5OzwwX2FBIHm1S+J4SHktKfmmJNKeStW/D0
 Pz3cN2cwY4ckdvts3EX15aZdQ2SwQNL4B5IthU2QAv9f5Ojr5qSjIo+UquVX+Waq354B
 4sAw==
X-Gm-Message-State: AOAM5317zQ4dJdMT3k7WLIR9+CX4nkNMq1LIf2QKRNnhzYWeAHyonE0/
 1uS9SwRhWgPWd4VX+oELz5tG1+pMnYrgWzznj59gLmr41rI=
X-Google-Smtp-Source: ABdhPJz/pEBZgfUvTT6coxrYArCRq0ONH6BGEPyXeMeLDjJBAq5N38Nih5dic+xCcpm+8dlfn4D7xdi6t1RzD2yE6P8=
X-Received: by 2002:a5e:dd0d:: with SMTP id t13mr423871iop.132.1610388906271; 
 Mon, 11 Jan 2021 10:15:06 -0800 (PST)
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
In-Reply-To: <CACT4Y+abV4iDXf9y-_HyH5jQhmn5+=md+C4n+-77q=+cbN-OZA@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 11 Jan 2021 13:14:55 -0500
Message-ID: <CAH8yC8m_H_VLWaomSku62k4BhwjFCZTB0Td4s17Wtb7tAH5Lqw@mail.gmail.com>
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

On Mon, Jan 11, 2021 at 12:58 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Jan 11, 2021 at 6:35 PM Jeffrey Walton <noloader@gmail.com> wrote:
> >
> > On Mon, Jan 11, 2021 at 12:20 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > ...
> > > FTR, I've disabled the following UBSAN configs:
> > > UBSAN_MISC
> > > UBSAN_DIV_ZERO
> > > UBSAN_BOOL
> > > UBSAN_OBJECT_SIZE
> > > UBSAN_SIGNED_OVERFLOW
> > > UBSAN_UNSIGNED_OVERFLOW
> > > UBSAN_ENUM
> > > UBSAN_ALIGNMENT
> > > UBSAN_UNREACHABLE
> > >
> > > Only these are enabled now:
> > > UBSAN_BOUNDS
> > > UBSAN_SHIFT
> > >
> > > This is commit:
> > > https://github.com/google/syzkaller/commit/2c1f2513486f21d26b1942ce77ffc782677fbf4e
> >
> > I think the commit cut too deep.
> >
> > The overflows are important if folks are building with compilers other than GCC.
> >
> > The aligned data accesses are important on platforms like MIPS64 and Sparc64.
> >
> > Object size is important because it catches destination buffer overflows.
> >
> > I don't know what's in miscellaneous. There may be something useful in there.
>
> Hi Jeff,
>
> See the commit for reasons why each of these is disabled.
> E.g. object size, somebody first needs to fix bugs like this one.
> While things like skbuff have these UBs on trivial workloads, there is
> no point in involving fuzzing and making it crash on this trivial bug
> all the time and stopping doing any other kernel testing as the
> result.

Going off-topic a bit, what would you suggest for UBSAN_OBJECT_SIZE?

It seems to me object size checking is being conflated with object
type. It seems to me they need to be split: UBSAN_OBJECT_SIZE for
actual object sizes, and UBSAN_OBJECT_TYPE for the casts.

I still have a bitter taste in my mouth from
https://www.cvedetails.com/bugtraq-bid/57602/libupnp-Multiple-Buffer-Overflow-Vulnerabilities.html.
I hate to see buffer checks go away. (And I realize the kernel folks
are more skilled than the guy who wrote libupnp).

Jeff
