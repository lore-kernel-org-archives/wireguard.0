Return-Path: <SRS0=7uyE=GL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C78C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 09:31:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3DC22BE8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 09:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3DC22BE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2db1c93;
	Fri, 8 Jan 2021 09:31:15 +0000 (UTC)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7e888ca8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jan 2021 09:31:12 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id z11so7926615qkj.7
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jan 2021 01:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p7CNbpBSPccH1hb+rOXFyKre6l57s8q4kN69whC0CUA=;
 b=PON5AO4eW+/ghJflh3LQZgs+WZ1EHC8Nd8E5KV6f7ayftxXjHqEHs6PKdb1TI0TOK5
 kfunV287GgnbbyLZvvIS01QjckF31wMDtwwuzCp75UWrks3NetMTeQ/wKM8BLfRlvGOE
 dFbgjgMMVYvTwRi3pMmTwJtptWfgygzKs5L1ucjdzBUaQJd1n2xMx8cDXMAtTQBqDupb
 e09zd1igFfl0RvpZd8AMA/PN3tB4s5QtfRiZh32JbdmM0/zhJLDQo7csEpAjFIotKHn1
 hgk74uKVpjtM69HDGSPgt21JiuKPrd1jF0GBKCftPSm66QCmNDIr7ahta/yWtPrYoKPW
 KgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p7CNbpBSPccH1hb+rOXFyKre6l57s8q4kN69whC0CUA=;
 b=QURMgvo5co2QJOiIwD1fH+vmGMhPvYUhQLAT2OB0omDzxfs0rhOo2faZjDxlt3MgIT
 nIeBXe7xrDBGrTuO49JSwoV9gPlIJCbYtgxKwzLuN+HOtd/C0ePTusbqCAgLUS3NKyfp
 tuxj4gcUhGaMSlrAxMxQb8Bn4cBYG0FOB62biQT/3LN6rhXW4mt3Asua5NlOE76Sq/Eo
 YE/rhTWTgdvsX15DTWCXeI95KYyuF+jveSYQMF/YaGORF6efOV28E2X/HKXiL2yjHEEQ
 A0fqkwGito6aBcRqSOqfFwkPHhAmX9k0cnc0Nr2rVqYOKJpqkRhXd+ftVSZ3pMysOkjL
 g9GA==
X-Gm-Message-State: AOAM532+tCoIbcoC2TZ0yRzyWWxRe+Klnvkd9tpUpH+Kvqn+V7mF5v94
 kfouRizMF9EyZ8CMhQDRqEHzkDJXB5nnKuaTBZ1UIA==
X-Google-Smtp-Source: ABdhPJzJO/zSnwxBxdr6K/8eZS9L3nj3Q2d85+ingXlR4tERBrTXG+6G2mop1D0cvjTAZ0IPyaaqZ+6JpZeI5+Dd2rI=
X-Received: by 2002:a05:620a:983:: with SMTP id
 x3mr3065038qkx.231.1610098271104; 
 Fri, 08 Jan 2021 01:31:11 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
In-Reply-To: <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 8 Jan 2021 10:30:59 +0100
Message-ID: <CACT4Y+Y9H4xB_4sS9Hu6e+u=tmYXcw6PFB0LY4FRuGQ6HCywrA@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Thu, Jan 7, 2021 at 8:00 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > On Mon, Dec 21, 2020 at 10:14 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > > Hi Jason,
> > > >
> > > > Thanks for looking into this.
> > > >
> > > > Reading clang docs for ubsan:
> > > >
> > > > https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
> > > > -fsanitize=object-size: An attempt to potentially use bytes which the
> > > > optimizer can determine are not part of the object being accessed.
> > > > This will also detect some types of undefined behavior that may not
> > > > directly access memory, but are provably incorrect given the size of
> > > > the objects involved, such as invalid downcasts and calling methods on
> > > > invalid pointers. These checks are made in terms of
> > > > __builtin_object_size, and consequently may be able to detect more
> > > > problems at higher optimization levels.
> > > >
> > > > From skimming though your description this seems to fall into
> > > > "provably incorrect given the size of the objects involved".
> > > > I guess it's one of these cases which trigger undefined behavior and
> > > > compiler can e.g. remove all of this code assuming it will be never
> > > > called at runtime and any branches leading to it will always branch in
> > > > other directions, or something.
> > >
> > > Right that sort of makes sense, and I can imagine that in more general
> > > cases the struct casting could lead to UB. But what has me scratching
> > > my head is that syzbot couldn't reproduce. The cast happens every
> > > time. What about that one time was special? Did the address happen to
> > > fall on the border of a mapping? Is UBSAN non-deterministic as an
> > > optimization? Or is there actually some mysterious UaF happening with
> > > my usage of skbs that I shouldn't overlook?
> >
> > These UBSAN checks were just enabled recently.
> > It's indeed super easy to trigger: 133083 VMs were crashed on this already:
> > https://syzkaller.appspot.com/bug?extid=8f90d005ab2d22342b6d
> > So it's one of the top crashers by now.
>
> Ahh, makes sense. So it is easily reproducible after all.
>
> You're still of the opinion that it's a false positive, right? I
> shouldn't spend more cycles on this?

No, I am not saying this is a false positive. I think it's an
undefined behavior.
Either way, we need to resolve this one way or another to unblock
testing the rest of the kernel, if not with a fix to wg, then with a
fix to ubsan, or disable this check for kernel if kernel community
decides we want to use and keep this type of C undefined behavior in
the code base intentionally.
So far I see only 2 "UBSAN: object-size-mismatch" reports on the dashboard:
https://syzkaller.appspot.com/upstream
So cleaning them up looks doable. Is there a way to restructure the
code to not invoke undefined behavior?
Kees, do you have any suggestions on how to proceed? This seems to
stop testing of the whole kernel at the moment.
