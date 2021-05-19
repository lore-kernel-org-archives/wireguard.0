Return-Path: <SRS0=r1yQ=KO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7A0C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 20:09:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0DA6135C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 20:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC0DA6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47d546d8;
	Wed, 19 May 2021 20:09:50 +0000 (UTC)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5f4f4f13
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 May 2021 20:09:47 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id g4so1605088qtb.12
 for <wireguard@lists.zx2c4.com>; Wed, 19 May 2021 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfkhZmx3Ws5Ze8v02ddLCR92udVHDSQf4VgG9lhW0vw=;
 b=dNK4Qcjo1GJlJUy6Vug24BkmQ4i+xHpuhrLhPuAfEydaD/NY3hhi9V6o1eZKG/09Fn
 j8fThsIkCYaaA61B3gnM/ULVXED8eDl7ZnY5JqO1Roou2tHoSuhwkRugUNlGZqIBx7Ae
 QDzYKjmOqukyxoiG5FtCKJa8XmVhOMPY/p8HmTNm/eOIv3uC/eezL1rZ9XWvCU7EyED9
 vFyPmbjuH8u/HHbJcGwxK7wTCwc50rlC6QVdHpFeyr/IpHrYUlKJsqmn0jC8+eJBujfx
 SboOrCUge/TWUaQyytqdNlUB7Vn1ZZ06DXAAqUpUcXFRFeWA4Wv+RI2qugOVZH0FlSEh
 I9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfkhZmx3Ws5Ze8v02ddLCR92udVHDSQf4VgG9lhW0vw=;
 b=oHJjVmcedYimruBaolWD0vQ1gyxyxgPJ5E7fja4aYNmI0H+9NMdxIZvJ0gn+UBsaEG
 4FtHFs7v/WSzlI6pqLQiyBT9cj0CrBptsNP5pYLPk+AiYiM1oAS8DQwCu5jWhqvweXXb
 6nrY2r94QN15puLr6EjWY7PH4Y1Hw12M/4sUWca7TyDQbc8N944gjpFvizdkumRUehxR
 rdVkbI/EOv/y9VaVD7BEIoCaoULBt5vQzAXsIWRPVEI9owbJSh2rCpaKZ6zOKFu4dWVW
 M2l5scz2f5XNlxcM8q5fcPnPmLo0OP4r6cNpSk7ePdS+0cSDZL99KSUx4zscfspIvWRq
 +kgQ==
X-Gm-Message-State: AOAM532WbhRFTDHEkQ7s/2ZRX2MSVPzZQoan2D8pOgzUDYU5X179lhYh
 yzEp4zZfFkSMlTiqJiUFUSltsAg3pFx8X7kMG+7i4A==
X-Google-Smtp-Source: ABdhPJzSRnReeqqsbjlEhkp34XANq/j4yYeQgtNg3lCYkyDq7UDdpB98t1TcoHPQ4FK5FHJS1NbLR9a77X0dvlVirGk=
X-Received: by 2002:ac8:51d6:: with SMTP id d22mr1361146qtn.67.1621454986265; 
 Wed, 19 May 2021 13:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000003687bd05c2b2401d@google.com>
 <CACT4Y+YJDGFN4q-aTPritnjjHEXiFovOm9eO6Ay4xC1YOa5z3w@mail.gmail.com>
 <c545268c-fe62-883c-4c46-974b3bb3cea1@infradead.org>
In-Reply-To: <c545268c-fe62-883c-4c46-974b3bb3cea1@infradead.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 19 May 2021 22:09:35 +0200
Message-ID: <CACT4Y+aEtYPAdrU7KkE303yDw__QiG7m1tWVJewV8C_Mt9=1qg@mail.gmail.com>
Subject: Re: [syzbot] BUG: MAX_LOCKDEP_KEYS too low! (2)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: syzbot <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com>, 
 Peter Zijlstra <peterz@infradead.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Miller <davem@davemloft.net>,
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

On Wed, May 19, 2021 at 9:58 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 5/19/21 12:48 PM, Dmitry Vyukov wrote:
> > On Wed, May 19, 2021 at 7:35 PM syzbot
> > <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com> wrote:
> >>
> >> Hello,
> >>
> >> syzbot found the following issue on:
> >>
> >> HEAD commit:    b81ac784 net: cdc_eem: fix URL to CDC EEM 1.0 spec
> >> git tree:       net
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=15a257c3d00000
> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=5b86a12e0d1933b5
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=a70a6358abd2c3f9550f
> >>
> >> Unfortunately, I don't have any reproducer for this issue yet.
> >>
> >> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >> Reported-by: syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com
> >>
> >> BUG: MAX_LOCKDEP_KEYS too low!
> >
>
> include/linux/lockdep.h
>
> #define MAX_LOCKDEP_KEYS_BITS           13
> #define MAX_LOCKDEP_KEYS                (1UL << MAX_LOCKDEP_KEYS_BITS)

Ouch, so it's not configurable yet :(
Unless, of course, we identify the offender that produced thousands of
lock classes in the log and fix it.


> Documentation/locking/lockdep-design.rst:
>
> Troubleshooting:
> ----------------
>
> The validator tracks a maximum of MAX_LOCKDEP_KEYS number of lock classes.
> Exceeding this number will trigger the following lockdep warning::
>
>         (DEBUG_LOCKS_WARN_ON(id >= MAX_LOCKDEP_KEYS))
>
> By default, MAX_LOCKDEP_KEYS is currently set to 8191, and typical
> desktop systems have less than 1,000 lock classes, so this warning
> normally results from lock-class leakage or failure to properly
> initialize locks.  These two problems are illustrated below:
>
> >
> > What config controls this? I don't see "MAX_LOCKDEP_KEYS too low" in
> > any of the config descriptions...
> > Here is what syzbot used:
> >
> > CONFIG_LOCKDEP=y
> > CONFIG_LOCKDEP_BITS=16
> > CONFIG_LOCKDEP_CHAINS_BITS=17
> > CONFIG_LOCKDEP_STACK_TRACE_BITS=20
> > CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> > CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
> >
> > We already bumped most of these.
> > The log contains dump of the lockdep debug files, is there any offender?
> >
> > Also looking at the log I noticed a memory safety bug in lockdep implementation:
>
> ...
>
> --
> ~Randy
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/c545268c-fe62-883c-4c46-974b3bb3cea1%40infradead.org.
