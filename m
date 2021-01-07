Return-Path: <SRS0=PSWY=GK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4388BC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 19:09:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 271DC23432
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 19:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 271DC23432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c34c64a;
	Thu, 7 Jan 2021 19:07:00 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [2607:f8b0:4864:20::d2a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8ba784f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jan 2021 19:06:59 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id w18so7228823iot.0
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jan 2021 11:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=corjf3KyOH0H4DhYt4w4crTghb0GmphbSRrLqyirvV0=;
 b=IBpo3R63XB37DuR2koRK8HAIlEx7Ghma/mHckO6c4DOgvBi+cFTLPPYt64nl6XaCgz
 6JWF1JZYEM+SqnDbIcuIozquxakbETZmGfStwnpVyFHQWW+2P5NRm+oY636ctU81JPJk
 oPUDYPPCM14aLmd1P4iJiGl9rOaXajO4XgixdXU0yw61lpn0Wo9G5qgDXCqArxbqGAxv
 b+iPV53RtkPqGv+ReP6b+Tu9CnL9qfsWpHSlA/eEaH3VerIOFEXnT6dR4S85GinV3E1Z
 hQffPvnojZtxyoSxSTnVxW/2pFNrsESNGpZTyomyOpM4TmAOrUOaU/s0R9tdKiEqr2N0
 cHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=corjf3KyOH0H4DhYt4w4crTghb0GmphbSRrLqyirvV0=;
 b=P/7MsLUt0cZXP9T0y0j5SdHwEijDGRvOFPMovPXd/YzuAZnZhb52neT/X+XAd7sEj2
 nWJVDDi3/NCfdXBg0tyceuzFvC8ZmWQG7N2vMoSgaTXwVyhuzvTMeY+qgc9eIPeqVMF3
 S55Nv2OrGSqw+93yDHt+Pu3pfwWsAbIo8wbv92KQhr9xMAcbxmm5lvBzxcVX4GFkDV17
 T9OcCHUh6wmwnDEfzoyasQ9AFFQQOtprVcf5XB7+b5iu0O1jS5heu7hUlU0aBC7fzEqe
 ogIJCQWdKoStcdZc1htjwFyuO7LQNhConIs3OMRhwoYt7OyKD/WFe3ONviBjGkOtnd3I
 BMmw==
X-Gm-Message-State: AOAM531uirjf+RlLitK3Lw0KKzP4SwW44cxoMjbj2Xy+o0WhSTEKwf7L
 Mb14jS9Y2QU/o6r7LipEU1poOgLX3wPvKpi/9BSTxbNejDM=
X-Google-Smtp-Source: ABdhPJzaLi3Zpw+BSKeksQ4L7oOZoLWSgaZJMuSMy9fPzZdZ9nP+8yHHGhbonuVWlDKJgEwefb2n1iMVFYG26mz7Oq8=
X-Received: by 2002:a05:6638:c8:: with SMTP id w8mr9222254jao.75.1610046417764; 
 Thu, 07 Jan 2021 11:06:57 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
In-Reply-To: <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Thu, 7 Jan 2021 14:06:42 -0500
Message-ID: <CAH8yC8na1pNcGPBrfuBwyNbfC4JjOOo_xHODAkbjs1j-1h0+2A@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Thu, Jan 7, 2021 at 2:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Jan 7, 2021 at 1:22 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > On Mon, Dec 21, 2020 at 12:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > ...
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

You might consider making a test build with -fno-lto in case LTO is
mucking things up.

Google Posts Patches So The Linux Kernel Can Be LTO-Optimized By
Clang, https://www.phoronix.com/scan.php?page=news_item&px=Linux-Kernel-Clang-LTO-Patches

Jeff
