Return-Path: <SRS0=fpOe=GM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F8AC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Jan 2021 09:46:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6A920756
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Jan 2021 09:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D6A920756
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a18bd9f;
	Sat, 9 Jan 2021 09:46:16 +0000 (UTC)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5656cb62
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 9 Jan 2021 09:46:15 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id c7so10772671qke.1
 for <wireguard@lists.zx2c4.com>; Sat, 09 Jan 2021 01:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BxfLyaoG8n7LgAfN80/JUTuYNe1YK0q3UlOVy+dKJs0=;
 b=cUgH7VMvAg4csiAdQlRI8XcGOswn2nEBD6OYXCql3bxoYEjRmOpkAxs2dqNzr4NVEV
 XybmJWcjt0FaVoJYEcphoT6eW74krZIZSJreUePoA1zKze2GZVvn5BKtXYHC8gVJNX9b
 vNWgnuT/O7GYLqTom+C7LIDPHNuXqkSL00UObi+TfYo4UGDKe7dNFwjLcuxxqTJZuzID
 E29h63GQV3IWSHBTROmOGJSM0/jRr7rSONaeet4gWOIcTAwm9ars33FLzgqrW+Ssx0rz
 JE4lZvDW9quMGy1JOJl/mmlNZWKoX1Qk+TDMfmYMFlz752/nHqbmRBSbeDsSDsefuyzA
 PVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BxfLyaoG8n7LgAfN80/JUTuYNe1YK0q3UlOVy+dKJs0=;
 b=WYiR3OAJ/7Ed/NTFHfaMrmkA8oFl9P7CUJDw4HiEVBgVSwsB1KyW+ux/UP7T79+wyr
 60tamvMG+qAaYiQaRVhWOsMZ4vpvrJs5S3HLk91UCS06pLDC54QgsDfAH4CRIt+rVAm+
 ZoYSu5+yMl0qCgWC97Ow16t83N95oKUtEbP0eBOkwTKvqoARohSqvENNW1l/ksv3luUR
 luO3ctrZtBExAktx4wZ/M2DehZDncD+zBJsy7OiUaKXwBsssYkp8cNlL+FoEEpQE85gZ
 M+ABOI37CxwPyCoz+0pLajSsfTtWk00DKLKiNhP7/O4vLpJNklCooNW+S8LE+rP8XwCT
 htkA==
X-Gm-Message-State: AOAM532gxxlYQNM9Qwb9UhCXWimInu0KQ0I6WfjhgMkP1ueSjjmsUw1i
 FZm2XM5fYbmey0hSVZRynHFHCjV3/Ifj7HcUP3ef4w==
X-Google-Smtp-Source: ABdhPJxWlhuHDx0ybxghLEdIT2ScqzVE7NANY6KKvM5s96VMrb0EneFU4B01o0uJZS5uM9BKHM5LRGIFyTKrRM4chOs=
X-Received: by 2002:a37:e10c:: with SMTP id c12mr8138565qkm.265.1610185573960; 
 Sat, 09 Jan 2021 01:46:13 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CACT4Y+Y9H4xB_4sS9Hu6e+u=tmYXcw6PFB0LY4FRuGQ6HCywrA@mail.gmail.com>
 <CAGXu5j+jzmkiU_AWoTVF6e263iYSSJYUHB=Kdqh-MCfEO-aNSg@mail.gmail.com>
In-Reply-To: <CAGXu5j+jzmkiU_AWoTVF6e263iYSSJYUHB=Kdqh-MCfEO-aNSg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sat, 9 Jan 2021 10:46:02 +0100
Message-ID: <CACT4Y+b1nmsQBx=dD=Q9_y_GZx1PpqTbzR6j=u5UecQ0JLyMFg@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: Kees Cook <keescook@chromium.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Netdev <netdev@vger.kernel.org>, 
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

On Fri, Jan 8, 2021 at 9:26 PM Kees Cook <keescook@chromium.org> wrote:
>> On Thu, Jan 7, 2021 at 8:00 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> > > >
>> > > > Hi Dmitry,
>> > > >
>> > > > On Mon, Dec 21, 2020 at 10:14 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>> > > > > Hi Jason,
>> > > > >
>> > > > > Thanks for looking into this.
>> > > > >
>> > > > > Reading clang docs for ubsan:
>> > > > >
>> > > > > https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
>> > > > > -fsanitize=object-size: An attempt to potentially use bytes which the
>> > > > > optimizer can determine are not part of the object being accessed.
>> > > > > This will also detect some types of undefined behavior that may not
>> > > > > directly access memory, but are provably incorrect given the size of
>> > > > > the objects involved, such as invalid downcasts and calling methods on
>> > > > > invalid pointers. These checks are made in terms of
>> > > > > __builtin_object_size, and consequently may be able to detect more
>> > > > > problems at higher optimization levels.
>> > > > >
>> > > > > From skimming though your description this seems to fall into
>> > > > > "provably incorrect given the size of the objects involved".
>> > > > > I guess it's one of these cases which trigger undefined behavior and
>> > > > > compiler can e.g. remove all of this code assuming it will be never
>> > > > > called at runtime and any branches leading to it will always branch in
>> > > > > other directions, or something.
>> > > >
>> > > > Right that sort of makes sense, and I can imagine that in more general
>> > > > cases the struct casting could lead to UB. But what has me scratching
>> > > > my head is that syzbot couldn't reproduce. The cast happens every
>> > > > time. What about that one time was special? Did the address happen to
>> > > > fall on the border of a mapping? Is UBSAN non-deterministic as an
>> > > > optimization? Or is there actually some mysterious UaF happening with
>> > > > my usage of skbs that I shouldn't overlook?
>> > >
>> > > These UBSAN checks were just enabled recently.
>> > > It's indeed super easy to trigger: 133083 VMs were crashed on this already:
>> > > https://syzkaller.appspot.com/bug?extid=8f90d005ab2d22342b6d
>> > > So it's one of the top crashers by now.
>> >
>> > Ahh, makes sense. So it is easily reproducible after all.
>> >
>> > You're still of the opinion that it's a false positive, right? I
>> > shouldn't spend more cycles on this?
>>
>> No, I am not saying this is a false positive. I think it's an
>> undefined behavior.
>>
>> Either way, we need to resolve this one way or another to unblock
>> testing the rest of the kernel, if not with a fix to wg, then with a
>> fix to ubsan, or disable this check for kernel if kernel community
>> decides we want to use and keep this type of C undefined behavior in
>> the code base intentionally.
>> So far I see only 2 "UBSAN: object-size-mismatch" reports on the dashboard:
>> https://syzkaller.appspot.com/upstream
>> So cleaning them up looks doable. Is there a way to restructure the
>> code to not invoke undefined behavior?
>
>
> Right; that's my question as well.
>
>>
>> Kees, do you have any suggestions on how to proceed? This seems to
>> stop testing of the whole kernel at the moment.
>
>
> If it's blocking other stuff and there isn't a path to fixing it soon, then I think we'll need to disable this check (and open an issue to track it).

Oh, I see, the code is actually in skbuff.h:

static inline void __skb_queue_tail(struct sk_buff_head *list, struct
sk_buff *newsk)
{
    __skb_queue_before(list, (struct sk_buff *)list, newsk);
}

It casts sk_buff_head to sk_buff relying on equal layout of some
prefix of these structs.
Is it really UB in C? UBSAN docs say:
"An attempt to potentially use bytes which the optimizer can determine
are not part of the object being accessed".
But C has POD layout for structs, right? These next/prev fields are
within sk_buff_head (otherwise things would explode).
I can imagine this may be not valid in C++, can this UBSAN check be
C++-specific? Or at least some subset of this check, I can imagine it
can detect bad bugs in C as well where things go really wrong.

If there is no quick solution proposed, I tend to disable this check
in syzbot for now. We need to clean at least common things like
sk_buff first.
