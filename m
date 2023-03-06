Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69296C678D4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:35:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5eee131c;
	Mon, 6 Mar 2023 23:06:58 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3915e4e2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 18:13:33 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so13989489pjb.3
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 10:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678126412;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nVDRLydRone1J93o9oyayT1ixn2USWzwJPhyrHw1GAs=;
 b=K0ohwVvtpaqIM1ff7KNQ9iqtOS8LvwFVSwAlfsHNWS+XjLRUXy+7LqEMHc6UcjJooC
 FXfafhU/B3oMyaN3xDuDn75iDeDIkapf8UmM5Ftc2Nlx2D+6wSo/5OKDbsQyvGp3xaaj
 /lFsvPnIJSQu3+SzJMD6Svu5gzZvneVauDck+s0/+HezZ6a3r8VUUtZoxrz4bey7u6Jq
 KjC5m8XXbsrDJD7zTOh0IXffYxdKDgw+0gSOuHO5Hpl0PK/XIUSd6iVQ8JHdD9Q2O+e6
 cYJs0DaF4TwIsYLLVBx5k16xkzyxKmRl3WziS2Q+dqrKfFNMB8zdfO8XP5/SByNcBQ+S
 Jtfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678126412;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nVDRLydRone1J93o9oyayT1ixn2USWzwJPhyrHw1GAs=;
 b=PuZ3UevJahlvVFvus7pX6mqx7fdwUOGgr1CmdjuW1QobHMzFodDeKPyEodxWbdw9a/
 zLKjEWTEzoKlohdni2F2AwYFUxo83FMfk1GkvFWSyqfb/1ncPi9JmCQm0E0NLyOQvWUD
 TVgGe6pQwtGgXQT9+Oo+foOLWMrsod66bXXO8/sKqDlH9XIxZIXCmnvIINQbxPPl/2Lh
 FLDGVn/mOXUpLdsn2Rtjux93C1CZKC6WUkVXLi+U3jZ6mHoTtpUYetF0guD1Rgsnrquy
 tcq8aC8gfNvXyrGMyOJUcXIt9/koXESllVOjeB7PAPje3cXYoJEcsUJ1rx/+WbZpM1OT
 CL+Q==
X-Gm-Message-State: AO0yUKXMzohiFHnvuFBZRufzR+ft4srRgaqInvAOLTisYOh29g71Ekoc
 zdY+S0BN2pBVrJGgWb62Gtw=
X-Google-Smtp-Source: AK7set8JSu5HH2SYYBQFO2nNfsP5nq/yMAXfZHaMuGcyFct+Bv6s3IpIB0hslTUQT9wBsrFGbwUhWg==
X-Received: by 2002:a17:90b:3812:b0:237:b702:49ac with SMTP id
 mq18-20020a17090b381200b00237b70249acmr12565429pjb.17.1678126412292; 
 Mon, 06 Mar 2023 10:13:32 -0800 (PST)
Received: from vernon-pc ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 p26-20020a634f5a000000b00502e6c22c42sm6628207pgl.59.2023.03.06.10.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 10:13:32 -0800 (PST)
Date: Tue, 7 Mar 2023 02:13:25 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: tytso@mit.edu, Jason@zx2c4.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, james.smart@broadcom.com,
 dick.kennedy@broadcom.com, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org
Subject: Re: [PATCH 5/5] cpumask: fix comment of cpumask_xxx
Message-ID: <ZAYtRcbMeRUQFUw/@vernon-pc>
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
 <CAHk-=whVnaTBt2Xm-A+8SMc5-q5CuZBDU6rUZ8yC8GoAnbTBvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=whVnaTBt2Xm-A+8SMc5-q5CuZBDU6rUZ8yC8GoAnbTBvw@mail.gmail.com>
X-Mailman-Approved-At: Mon, 06 Mar 2023 23:06:36 +0000
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

On Mon, Mar 06, 2023 at 09:29:10AM -0800, Linus Torvalds wrote:
> On Mon, Mar 6, 2023 at 8:07 AM Vernon Yang <vernon2gm@gmail.com> wrote:
> >
> > After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
> > optimizations"), the cpumask size is divided into three different case,
> > so fix comment of cpumask_xxx correctly.
>
> No no.
>
> Those three cases are meant to be entirely internal optimizations.
> They are literally just "preferred sizes".
>
> The correct thing to do is always that
>
>    * Returns >= nr_cpu_ids if no cpus set.
>
> because nr_cpu_ids is always the *smallest* of the access sizes.
>
> That's exactly why it's a ">=". The CPU mask stuff has always
> historically potentially used a different size than the actual
> nr_cpu_ids, in that it could do word-sized scans even when the machine
> might only have a smaller set of CPUs.
>
> So the whole "small" vs "large" should be seen entirely internal to
> cpumask.h. We should not expose it outside (sadly, that already
> happened with "nr_cpumask_size", which also was that kind of thing.

I also just see nr_cpumask_size exposed to outside, so... Sorry.

>
> So no, this patch is wrong. If anything, the comments should be strengthened.
>
> Of course, right now Guenter seems to be reporting a problem with that
> optimization, so unless I figure out what is going on I'll just need
> to revert it anyway.

Yes, cause is the cpumask_next() calls find_next_bit(..., size, ...), and
find_next_bit(..., size, ...) if no bits are set, returns @size.

@size was a nr_cpumask_bits variable before, now it is small_cpumask_bits, and
when NR_CPUS < = BITS_PER_LONG, small_cpumask_bits is a macro, which is
replaced with NR_CPUS at compile, so only the NR_CPUS is returned when it no
further cpus set.

But before nr_cpumask_bits variable, it was read while running, and it was
mutable.

The random.c try_to_generate_entropy() to get first cpu by
`if (cpu == nr_cpumask_bits)`, but cpumask_next() alway return NR_CPUS,
nr_cpumask_bits is nr_cpu_ids, so pass NR_CPUS to add_timer_on(),

>
>                 Linus
>
>                 Linus
