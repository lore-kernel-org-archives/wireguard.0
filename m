Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E152C77B75
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 May 2023 16:44:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37982ff3;
	Tue, 23 May 2023 16:43:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e191e17d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 16:43:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0206262516
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 16:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1393DC433EF
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 16:43:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Zk+R9Y2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1684860187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asrvrrrgFQMawFCZ+bsqpGNa7mr0dgHaC2R+m4mleeY=;
 b=Zk+R9Y2zp4106YIm4E5M/0cx6JWZyiMFv9faPLgpm6XD3yb53GJnRsnTmWHho1T5WQoqsE
 fLIs+j63yq4YCFaGKFIuYffNqeFKcc0nBn0eObES/tzdvnGakyHTD303IGmC1j6guKqEKF
 Z7E7tu1145W5xKak+LiZTpAHD/tEnvU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id edfe9662
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 16:43:06 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-437e2e0a5c7so1850400137.0
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 09:43:06 -0700 (PDT)
X-Gm-Message-State: AC+VfDzdjGVUGmadMnUQEMcf1jZ1/pfNiF8CobMIRja0T1NdjocjP/iV
 h9SUct3u91RWFqQeNJ6robJjIzoJm9uqa57+Qoc=
X-Google-Smtp-Source: ACHHUZ4oT9L31pW9wsbwLlrLmTAWZHoDjP2zg8TDuWsDgQ+d7LMofjUYh2Ra0Y77YPhB/pH9oRXCXjHHeVjhQeuI8zg=
X-Received: by 2002:a67:e912:0:b0:439:3f93:dabe with SMTP id
 c18-20020a67e912000000b004393f93dabemr2903351vso.22.1684860185045; Tue, 23
 May 2023 09:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c0b11d05fa917fe3@google.com>
 <ZGzfzEs-vJcZAySI@zx2c4.com> <20230523090512.19ca60b6@kernel.org>
 <CANn89iLVSiO1o1C-P30_3i19Ci8W1jQk9mr-_OMsQ4tS8Nq2dg@mail.gmail.com>
 <20230523094108.0c624d47@kernel.org>
In-Reply-To: <20230523094108.0c624d47@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 23 May 2023 18:42:53 +0200
X-Gmail-Original-Message-ID: <CAHmME9obRJPrjiJE95JZug0r6NUwrwwWib+=LO4jiQf-y2m+Vg@mail.gmail.com>
Message-ID: <CAHmME9obRJPrjiJE95JZug0r6NUwrwwWib+=LO4jiQf-y2m+Vg@mail.gmail.com>
Subject: Re: [syzbot] [wireguard?] KASAN: slab-use-after-free Write in
 enqueue_timer
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, 
 syzbot <syzbot+c2775460db0e1c70018e@syzkaller.appspotmail.com>, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, davem@davemloft.net, 
 linux-kernel@vger.kernel.org, pabeni@redhat.com, wireguard@lists.zx2c4.com, 
 jann@thejh.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, May 23, 2023 at 6:41=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 23 May 2023 18:12:32 +0200 Eric Dumazet wrote:
> > > Your timer had the pleasure of getting queued _after_ a dead watchdog
> > > timer, no? IOW it tries to update the ->next pointer of a queued
> > > watchdog timer. We should probably do:
> > >
> > > diff --git a/net/core/dev.c b/net/core/dev.c
> > > index 374d38fb8b9d..f3ed20ebcf5a 100644
> > > --- a/net/core/dev.c
> > > +++ b/net/core/dev.c
> > > @@ -10389,6 +10389,8 @@ void netdev_run_todo(void)
> > >                 WARN_ON(rcu_access_pointer(dev->ip_ptr));
> > >                 WARN_ON(rcu_access_pointer(dev->ip6_ptr));
> > >
> > > +               WARN_ON(timer_shutdown_sync(&dev->watchdog_timer));
> > > +
> > >                 if (dev->priv_destructor)
> > >                         dev->priv_destructor(dev);
> > >                 if (dev->needs_free_netdev)
> > >
> > > to catch how that watchdog_timer is getting queued. Would that make
> > > sense, Eric?
> >
> > Would this case be catched at the time the device is freed ?
> >
> > (CONFIG_DEBUG_OBJECTS_FREE=3Dy or something)
>
> It should, no idea why it isn't. Looking thru the code now I don't see
> any obvious gaps where timer object is on a list but not active :S
> There's no way to get a vmcore from syzbot, right? :)
>
> Also I thought the shutdown leads to a warning when someone tries to
> schedule the dead timer but in fact add_timer() just exits cleanly.
> So the shutdown won't help us find the culprit :(

Worth noting that it could also be caused by adding to a dead timer
anywhere in priv_data of another netdev, not just the sole timer_list
in net_device.
