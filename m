Return-Path: <SRS0=PSWY=GK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AABC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 12:23:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1D922248
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 12:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1D922248
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4415007;
	Thu, 7 Jan 2021 12:22:41 +0000 (UTC)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 32c1d9bb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jan 2021 12:22:40 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id l14so2654228qvh.2
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jan 2021 04:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VdNXcZN7MbGtSRJVA62Glhr7KIdj4Wp2fgKjinrNPrw=;
 b=jm4J5bf0DQ6WhBilsZPO2rABFj2B8U74PrfGHDS951rlkRBK3RmTmCs+R//8YhBFXK
 s+6SvYeOOjwXtTClgd0IHcuXTIPKCtyF0JUF2B0QhrAkmBh6MZ7h+4tVC7v53471RzBM
 fxx86lwFFNebk42NlIWoV5+y7i9QZIclOGI5GgY2SYh+ZXiR1yfHUppwKv3HUlxGRQXV
 FUFh+qzFGiiOFKxu/+PscZuhGWIaCYaYL+7qg52cpPlAZQ6jkywG7ud+DjmBCe1amSir
 8d9ErsMSrNCnOqyeI1T6fmqU+YfjymdENt02WKr36r/PsvmOe5xiB9NoVYzAFcs1ih/O
 OY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VdNXcZN7MbGtSRJVA62Glhr7KIdj4Wp2fgKjinrNPrw=;
 b=Rkj8Gp+jqb7VYvpuBjrttNbZ7+uCEyIzjG1Wn2bczlU4gIHEguTEAc71weUqBg9Vjm
 mcTusdvvqiSq+a9DQz1kKH2xGjPgPJKWTtJ6ma+Rvc7ZH6binVGzJSNZz3i/mAoahXSv
 y+StBRLJprYkQdTp9iBUh4VCZPRPPiaefP1Lx3I2klcIB+qMWxBBDV9VRjRjgvYg7nG/
 Os3pdnuI0aE6MjRtI5LcSd86TXYDdrSBmlKoAI2SsM4PyXxwa/YgjmRY0CNbF/K20a/m
 Dn8ltr7ACoFj35B9P0IlHn/s1UVvU5zEuyHLM9t1IA256lB0autvtEmwIFcXDRcR63+a
 e5WQ==
X-Gm-Message-State: AOAM533VlKVyPSPBPkUXoirzGlJ1WhQQBOqUDNDuuknEoRXtI/qmg/2w
 SecR1HJA57J4mMCl7G/xPJkl1QVR58K4NstPmd2pBw==
X-Google-Smtp-Source: ABdhPJzCJoJW5wPCb3Yz6y1rcW7AEKqEzyDZyoWAXfM1lzVFnxoav54OHxx4TwopnGNBe2Vi96hpx+gSyMtI75D8Qzw=
X-Received: by 2002:a05:6214:487:: with SMTP id
 ay7mr1615002qvb.37.1610022159411; 
 Thu, 07 Jan 2021 04:22:39 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
In-Reply-To: <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 7 Jan 2021 13:22:27 +0100
Message-ID: <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
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

On Mon, Dec 21, 2020 at 12:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
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

These UBSAN checks were just enabled recently.
It's indeed super easy to trigger: 133083 VMs were crashed on this already:
https://syzkaller.appspot.com/bug?extid=8f90d005ab2d22342b6d
So it's one of the top crashers by now.
