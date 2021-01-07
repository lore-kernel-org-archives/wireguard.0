Return-Path: <SRS0=PSWY=GK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B553BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 19:02:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9AB223437
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 19:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9AB223437
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 147b6436;
	Thu, 7 Jan 2021 19:00:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [167.71.246.149])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 205ee61f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jan 2021 19:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1610046027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/nMY+nGJxbbLiF9itA26CD91VguUJMBMX+I+he3/mHg=;
 b=oW615SxQlVHPbIiDOKTBOYNh+hgrYGnZDP5n1bNbZhRTmCW3uv4ppI5JPqSKwk1rL+UJ/9
 kXk/UPXVTka6B6wYZIDPXMz/vJU2uZxdquqtJeAPbxHiwSQHfI+2F7xBDQ5liD3NQvp+T3
 gsnMax8NCO/1GoVJret3VFakX+dIBTk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id adcded14
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jan 2021 19:00:27 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id v67so7110191ybi.1
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jan 2021 11:00:27 -0800 (PST)
X-Gm-Message-State: AOAM533IP4tXCYitgBBtTJhsj4u1DqtyIJKMUHDRLhy+tijUhJNO+DpL
 OaeDhZmTO7TciAvb/XNtOybBrFa7pPpmaKalDRA=
X-Google-Smtp-Source: ABdhPJxAw67Chjg2CudE6hD1Hk6//Y7lO2FdKcTtVapxkiHsg0pnMaKwPmlwr3bqsOZPg15jqfRUAHLYhoXHg6Kant0=
X-Received: by 2002:a25:d295:: with SMTP id j143mr387646ybg.20.1610046027149; 
 Thu, 07 Jan 2021 11:00:27 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
In-Reply-To: <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Jan 2021 20:00:16 +0100
X-Gmail-Original-Message-ID: <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
Message-ID: <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
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

On Thu, Jan 7, 2021 at 1:22 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Dec 21, 2020 at 12:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi Dmitry,
> >
> > On Mon, Dec 21, 2020 at 10:14 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > Hi Jason,
> > >
> > > Thanks for looking into this.
> > >
> > > Reading clang docs for ubsan:
> > >
> > > https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
> > > -fsanitize=object-size: An attempt to potentially use bytes which the
> > > optimizer can determine are not part of the object being accessed.
> > > This will also detect some types of undefined behavior that may not
> > > directly access memory, but are provably incorrect given the size of
> > > the objects involved, such as invalid downcasts and calling methods on
> > > invalid pointers. These checks are made in terms of
> > > __builtin_object_size, and consequently may be able to detect more
> > > problems at higher optimization levels.
> > >
> > > From skimming though your description this seems to fall into
> > > "provably incorrect given the size of the objects involved".
> > > I guess it's one of these cases which trigger undefined behavior and
> > > compiler can e.g. remove all of this code assuming it will be never
> > > called at runtime and any branches leading to it will always branch in
> > > other directions, or something.
> >
> > Right that sort of makes sense, and I can imagine that in more general
> > cases the struct casting could lead to UB. But what has me scratching
> > my head is that syzbot couldn't reproduce. The cast happens every
> > time. What about that one time was special? Did the address happen to
> > fall on the border of a mapping? Is UBSAN non-deterministic as an
> > optimization? Or is there actually some mysterious UaF happening with
> > my usage of skbs that I shouldn't overlook?
>
> These UBSAN checks were just enabled recently.
> It's indeed super easy to trigger: 133083 VMs were crashed on this already:
> https://syzkaller.appspot.com/bug?extid=8f90d005ab2d22342b6d
> So it's one of the top crashers by now.

Ahh, makes sense. So it is easily reproducible after all.

You're still of the opinion that it's a false positive, right? I
shouldn't spend more cycles on this?


Jason
