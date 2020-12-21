Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FB6C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 11:23:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAD4227BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 11:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAD4227BF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e477e71f;
	Mon, 21 Dec 2020 11:14:16 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 65c95286
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 11:14:14 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e303a01
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=vLtA2Gd7PORSyFHTFfRhJp635lg=; b=CZ00WV
 vHbJDSOdPiIu78xqWKqcqXZOt5i4zVpa1AGEjoryHgkrWgmqWKN0B7wW57Fcvsnx
 0rbMblN5iBlrloBdrtURbp06NhOXjwpKx2XW/8ihj8w2AcLUBZM5vnUQnO9INGR8
 fG5JANIeZimfsv/ggZYE9KZSQuR4ZmbixgI/B6WxS5zmKdK/QyPf8Dbg3Gz69FL/
 gABLEzGPErC4ATnkzzXPKgNFUU6I1A662T470cs9YqMv6iXeNmqzpWO5HihC8DCY
 edPb44+lpUskAfZuYMAAVxPezyeOy9gpU4QQ1q05oMfd6e7iYgfS3DG+lzCsuixy
 D8SWE27a+WdLMg4g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 864cd636
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 11:15:00 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id y128so8492252ybf.10
 for <wireguard@lists.zx2c4.com>; Mon, 21 Dec 2020 03:23:15 -0800 (PST)
X-Gm-Message-State: AOAM5311yr2B7wfZIPsl2Lh9seUYV3TVQu5AbFZLN76L8UYbdC6nbbqq
 WqFb0+quvlfupsoxdQNS32iQweHd3xqKL+b7MIU=
X-Google-Smtp-Source: ABdhPJw7QxDqH0FnueYorz9qIvRY9lNzFtlxIxVU0vKxQp3hSwPVzLIyvFhvZOnHHrQTXfgmk8U8ANWa+viklgn62/U=
X-Received: by 2002:a25:bb81:: with SMTP id y1mr22197534ybg.456.1608549795129; 
 Mon, 21 Dec 2020 03:23:15 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
In-Reply-To: <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 21 Dec 2020 12:23:04 +0100
X-Gmail-Original-Message-ID: <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
Message-ID: <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Kees Cook <keescook@google.com>, Netdev <netdev@vger.kernel.org>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Dmitry,

On Mon, Dec 21, 2020 at 10:14 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> Hi Jason,
>
> Thanks for looking into this.
>
> Reading clang docs for ubsan:
>
> https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
> -fsanitize=object-size: An attempt to potentially use bytes which the
> optimizer can determine are not part of the object being accessed.
> This will also detect some types of undefined behavior that may not
> directly access memory, but are provably incorrect given the size of
> the objects involved, such as invalid downcasts and calling methods on
> invalid pointers. These checks are made in terms of
> __builtin_object_size, and consequently may be able to detect more
> problems at higher optimization levels.
>
> From skimming though your description this seems to fall into
> "provably incorrect given the size of the objects involved".
> I guess it's one of these cases which trigger undefined behavior and
> compiler can e.g. remove all of this code assuming it will be never
> called at runtime and any branches leading to it will always branch in
> other directions, or something.

Right that sort of makes sense, and I can imagine that in more general
cases the struct casting could lead to UB. But what has me scratching
my head is that syzbot couldn't reproduce. The cast happens every
time. What about that one time was special? Did the address happen to
fall on the border of a mapping? Is UBSAN non-deterministic as an
optimization? Or is there actually some mysterious UaF happening with
my usage of skbs that I shouldn't overlook?

Jason
