Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC4FC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 09:14:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3311322CA1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 09:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3311322CA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 038bfd91;
	Mon, 21 Dec 2020 09:05:49 +0000 (UTC)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5a103d4e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 09:05:47 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id u21so6122107qtw.11
 for <wireguard@lists.zx2c4.com>; Mon, 21 Dec 2020 01:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fR3Wt3zQ62XwMiqt3UF5i2efJDr9l60XpKqQf448mFA=;
 b=Bvgqy6/ZkHKDo3JYYF6DXAQyflgOB9BjEZW52JpeQYdidkPGXHcWzmkUL00VG61cHN
 t7Eg06MBek5yY84lI96GBWUEFwQBa/oH2d1rpsjf8a6u7ApJAXk90w8IopcyTVjIsyI0
 ey95+8+ZPU+9lTrblAYkH33+RVLY9BwJFMGkWqonBm36A6tdVmu40ZSQvbODJF1SmEqE
 CY5luzA3SqMFGLG+DlePLMaRQCEAkrI8jNxBgSAdH4tGTGXIy5z3nZmlYkCwmiXk9B1z
 fNiobUSz9kIjs/XLq11ZwBJS/RwkXnHSSMeFdFVG4bkGjpHB4dO236wcCp5opuf2kSat
 hamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fR3Wt3zQ62XwMiqt3UF5i2efJDr9l60XpKqQf448mFA=;
 b=nepBKQV73WTht7bdCk0XuZCdLZGGa7tskXfKyzrv9djJLmMMsKgT3jtL02jg6SFT/c
 KHmRm+JR1hFollCN173d9Vc/P1fnl5fDMNBub8mfSJMons5Xfu/6ohHNIn9B7SWjfc+u
 gDbR6gURig+by3sk07Nj3N6GpcoWTIQ1Lg7UuVH+Et2lXKnQdUu4pB0ylVlvcZvH6lZA
 AKryt3+XPvCCff1lMlw1MyVBKWiKevxilaR2nCBpoiLGniTnqLGMvs/82Ih5XSujmKQA
 52vmBnxgvp/ITCL5al8/84YzePKDRD4AuwLaTOUI/j8+fvYgknTMQTA9vubJeotQUTyo
 +PIQ==
X-Gm-Message-State: AOAM5330ffoC2sTYL5TATVoQt76iWaMhoHQ9PqtRMf9SkfS8nh6kys7Q
 Tytw4cVvzGfOBix+3lpDzKdNvVZYrzle+5M5lHeNNQ==
X-Google-Smtp-Source: ABdhPJw1b/9zgZLNBsp4OrvZk0aD2DbdUOacdbfnS7R4J3TQoKsfZpBO5kf3FG3v32IZHijPxyhzJBxVc6NXvfwTYQM=
X-Received: by 2002:ac8:4986:: with SMTP id f6mr15298599qtq.43.1608542087119; 
 Mon, 21 Dec 2020 01:14:47 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
In-Reply-To: <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 21 Dec 2020 10:14:36 +0100
Message-ID: <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Kees Cook <keescook@google.com>
Cc: Netdev <netdev@vger.kernel.org>, 
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

On Sun, Dec 20, 2020 at 10:11 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hmm, on first glance, I'm not sure I'm seeing the bug:
>
> On Sun, Dec 20, 2020 at 5:54 PM syzbot
> <syzbot+8f90d005ab2d22342b6d@syzkaller.appspotmail.com> wrote:
> > UBSAN: object-size-mismatch in ./include/linux/skbuff.h:2021:28
> > member access within address 0000000085889cc2 with insufficient space
> > for an object of type 'struct sk_buff'
> >  __skb_queue_before include/linux/skbuff.h:2021 [inline]
> >  __skb_queue_tail include/linux/skbuff.h:2054 [inline]
> >  wg_xmit+0x45d/0xdf0 drivers/net/wireguard/device.c:182
>
> The code in question is:
>
>         struct sk_buff_head packets;
>         __skb_queue_head_init(&packets);
> ...
>         skb_list_walk_safe(skb, skb, next) {
>                skb_mark_not_on_list(skb);
>
>                skb = skb_share_check(skb, GFP_ATOMIC);
>                if (unlikely(!skb))
>                        continue;
> ...
>                __skb_queue_tail(&packets, skb);
>        }
>
> We're in a netdev's xmit function, so nothing else should have skb at
> that point. Given the warning is about "member access", I assume it's
> the next->prev dereference here:
>
> static inline void __skb_queue_before(struct sk_buff_head *list,
>                                      struct sk_buff *next,
>                                      struct sk_buff *newsk)
> {
>        __skb_insert(newsk, next->prev, next, list);
> }
>
> So where is "next" coming from that UBSAN would complain about
> object-size-mismatch?
>
> static inline void __skb_queue_tail(struct sk_buff_head *list,
>                                   struct sk_buff *newsk)
> {
>        __skb_queue_before(list, (struct sk_buff *)list, newsk);
> }
>
> It comes from casting "list" into an sk_buff. While this might be some
> CFI-violating polymorphism, I can't see why this cast would actually
> be a problem in practice. The top of sk_buff is intentionally the same
> as sk_buff_head:
>
> struct sk_buff_head {
>        struct sk_buff  *next;
>        struct sk_buff  *prev;
> ...
> struct sk_buff {
>        union {
>                struct {
>                        struct sk_buff          *next;
>                        struct sk_buff          *prev;
> ...
>
> I'd suspect, "oh maybe it's just a clang 11 bug", but syzbot says it
> can't reproduce. So that makes me a little more nervous.
>
> Does anybody see something I've missed?

+Kees for UBSAN report questions

Hi Jason,

Thanks for looking into this.

Reading clang docs for ubsan:

https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
-fsanitize=object-size: An attempt to potentially use bytes which the
optimizer can determine are not part of the object being accessed.
This will also detect some types of undefined behavior that may not
directly access memory, but are provably incorrect given the size of
the objects involved, such as invalid downcasts and calling methods on
invalid pointers. These checks are made in terms of
__builtin_object_size, and consequently may be able to detect more
problems at higher optimization levels.

From skimming though your description this seems to fall into
"provably incorrect given the size of the objects involved".
I guess it's one of these cases which trigger undefined behavior and
compiler can e.g. remove all of this code assuming it will be never
called at runtime and any branches leading to it will always branch in
other directions, or something.
