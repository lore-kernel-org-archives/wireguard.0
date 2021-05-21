Return-Path: <SRS0=izSP=KQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145A7C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 May 2021 07:04:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C27F61006
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 May 2021 07:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C27F61006
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 705bfbd4;
	Fri, 21 May 2021 07:04:54 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ec8cff0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 May 2021 07:04:52 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id f8so14657074qth.6
 for <wireguard@lists.zx2c4.com>; Fri, 21 May 2021 00:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AEw/2V7/xpmVmNpjjOkVlxPAcJgRBwQ9KZP9S0+LhGs=;
 b=vgb3uAFmlPGVXAd91EJa6J4LHy8LHu+U29axDVp5UZhMh+fe91loAj1CTq+Gdm3t9H
 HDxcGhiah+7YPM/Hk6PLL4W0/2u1/z0X5YNxOVspAv2Ku8vnZPWkQti+J9JjowrHG7bI
 z46AGqk0o6qyNmV3pBM2jC81hIDUfUkrkQXCDBc/ci7c8Fqt3LcLGF/q25GEFtJVbDQg
 3TDJUYCgV+ROCX6L2zmMWVjPqOGLgLDwjeMTsS2XWhjM5OwAL2QoEzl17X1Kk5AzWcYs
 8wXTqDa+d6CARDy0yZ8IJ7ZvbYrcC9aYEzH9LO7cWosbxY/dBTZeQz1MxNs7qKVEc5J7
 TAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AEw/2V7/xpmVmNpjjOkVlxPAcJgRBwQ9KZP9S0+LhGs=;
 b=eIrG/PUh6JWaD73cVdiRHfb19rqGR0LzZXOWdVv3hQN6WwimBr6m/SCWWPEFGpDTYw
 b2O4aEnqVLG1u5GOTQS9SpeW3qsVhZpj0C81EBek53n1oQ0S8OTOHXcxkNM7DoponB0n
 IfF7Sj2r0E9bPPvkQAbZhJKkv9MkFsDOekwR7Tq35EYqwmvqN5oYsiyWJF9aXijftgMz
 wcCFnVTnzjf8mLFSseSkrTPz2sFdygItGZU2Gq4wP0guxIIdddSwQSPItzyKf/kDUdXJ
 iTV1pZd9PWzXReJ5uZoWL4gLMFuUaALgO68j4wjUy2DdAtIxShwOC53UsHufzduxmOi8
 AQwA==
X-Gm-Message-State: AOAM531IbaBT5DBtl2P1xDNFX9qoyKdy1O6quaMOu/jHuBetsZhTVHCX
 pQHkF/wYayA7nPfgpOCl+LrA038xQYZ5XlvUUALO4A==
X-Google-Smtp-Source: ABdhPJxBl69YJ2DivfUpEV1speNJDfx8ufFZ4oirpKc3gjTnIcoQhKPkIj8PsdvtwiF9BnwCBN/zC96sHLv1rhA0bxc=
X-Received: by 2002:ac8:4e21:: with SMTP id d1mr9657232qtw.290.1621580691240; 
 Fri, 21 May 2021 00:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000003687bd05c2b2401d@google.com>
 <CACT4Y+YJDGFN4q-aTPritnjjHEXiFovOm9eO6Ay4xC1YOa5z3w@mail.gmail.com>
 <c545268c-fe62-883c-4c46-974b3bb3cea1@infradead.org>
 <CACT4Y+aEtYPAdrU7KkE303yDw__QiG7m1tWVJewV8C_Mt9=1qg@mail.gmail.com>
 <208cd812-214f-ef2f-26ec-cc7a73953885@i-love.sakura.ne.jp>
In-Reply-To: <208cd812-214f-ef2f-26ec-cc7a73953885@i-love.sakura.ne.jp>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 21 May 2021 09:04:39 +0200
Message-ID: <CACT4Y+Y8KmaoEj0L8g=wX4owS38mjNLVMMLsjyoN8DU9n=FrrQ@mail.gmail.com>
Subject: Re: [syzbot] BUG: MAX_LOCKDEP_KEYS too low! (2)
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Randy Dunlap <rdunlap@infradead.org>, David Miller <davem@davemloft.net>, 
 syzbot <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com>, 
 Peter Zijlstra <peterz@infradead.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
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

On Thu, May 20, 2021 at 7:02 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2021/05/20 5:09, Dmitry Vyukov wrote:
> > On Wed, May 19, 2021 at 9:58 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> On 5/19/21 12:48 PM, Dmitry Vyukov wrote:
> >>> On Wed, May 19, 2021 at 7:35 PM syzbot
> >>> <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> syzbot found the following issue on:
> >>>>
> >>>> HEAD commit:    b81ac784 net: cdc_eem: fix URL to CDC EEM 1.0 spec
> >>>> git tree:       net
> >>>> console output: https://syzkaller.appspot.com/x/log.txt?x=15a257c3d00000
> >>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=5b86a12e0d1933b5
> >>>> dashboard link: https://syzkaller.appspot.com/bug?extid=a70a6358abd2c3f9550f
> >>>>
> >>>> Unfortunately, I don't have any reproducer for this issue yet.
> >>>>
> >>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >>>> Reported-by: syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com
> >>>>
> >>>> BUG: MAX_LOCKDEP_KEYS too low!
> >>>
> >>
> >> include/linux/lockdep.h
> >>
> >> #define MAX_LOCKDEP_KEYS_BITS           13
> >> #define MAX_LOCKDEP_KEYS                (1UL << MAX_LOCKDEP_KEYS_BITS)
> >
> > Ouch, so it's not configurable yet :(
>
> I didn't try to make this value configurable, for
>
> > Unless, of course, we identify the offender that produced thousands of
> > lock classes in the log and fix it.
>
> number of currently active locks should decrease over time.
> If this message is printed, increasing this value unlikely helps.
>
> We have https://lkml.kernel.org/r/c099ad52-0c2c-b886-bae2-c64bd8626452@ozlabs.ru
> which seems to be unresolved.
>
> Regarding this report, cleanup of bonding device is too slow to catch up to
> creation of bonding device?
>
> We might need to throttle creation of BPF, bonding etc. which involve WQ operation for clean up?

I see, thanks for digging into it.

Unbounded asynchronous queueing is always a recipe for disaster... I
assume such issues can affect production as well, if some program
creates namespaces/devices in a loop. So I think ideally such things
are throttled/restricted in the kernel, e.g. new namespaces/devices
are not created if some threshold is reached.

Potentially syzkaller could throttle creation of new
namespaces/devices if we find a good and reliable way to monitor
backlog. Something like the length of a particular workqueue. It may
also help with OOMs. But so far I haven't found it.
