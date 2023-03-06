Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C091DC6FA99
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 17:09:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c1ec9ae;
	Mon, 6 Mar 2023 17:05:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b04ab682
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 17:05:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D477360DD0
 for <wireguard@lists.zx2c4.com>; Mon,  6 Mar 2023 17:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F239CC433D2
 for <wireguard@lists.zx2c4.com>; Mon,  6 Mar 2023 17:05:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hUWq6aZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1678122298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rebf2oGX/Y7xKpUOJU11DVlUHCYfqwTY7506K3ZpIEY=;
 b=hUWq6aZA5z5fsKfpzYLpqIbjvz4Rw/BLq+F0+MXJaNwPYdzPZ1ZL8p1c0eAgEnFrt8X4PV
 gDc5dltPdHjg9qtuDQexpj1bjXMwCgar7wjD1yMNP8swgStikSZ3DI2SIxMykNuLlYvJhe
 9OeabsWU96CHanKsX/rOUBdjmnC6qy4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50c9badc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 17:04:58 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id e194so8885835ybf.1
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 09:04:58 -0800 (PST)
X-Gm-Message-State: AO0yUKUkXfQY7eJ3pRBx2yuyENVq6QRePj+BXAID+5GJL4+dvU8fc1P5
 lzmLtMml50eaORRIBs3jq2j1/2Gb6rvLjwRMrqI=
X-Google-Smtp-Source: AK7set/C+4H5t/AjhOaoRmPlKirlZGinsSeOk1osYZEYcZ7sUkw4WisDsCHHRxbmhkQleYYACwSNmtn05qG4XIfMC+0=
X-Received: by 2002:a25:9b48:0:b0:a8a:a652:2a69 with SMTP id
 u8-20020a259b48000000b00a8aa6522a69mr5258478ybo.10.1678122295337; Mon, 06 Mar
 2023 09:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
 <ZAYXJ2E+JHcp2kD/@yury-laptop>
 <CAHmME9r_JXNCVVCNxZRQkafA=eOOu5k0+AweRDor3tNu283bdg@mail.gmail.com>
 <ZAYartD+NsF1JxlH@yury-laptop>
In-Reply-To: <ZAYartD+NsF1JxlH@yury-laptop>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 6 Mar 2023 18:04:44 +0100
X-Gmail-Original-Message-ID: <CAHmME9qRicEe7zCFWSfV+aQ4j6sZ3FAJu3fgMUMJJkfBV4AMMw@mail.gmail.com>
Message-ID: <CAHmME9qRicEe7zCFWSfV+aQ4j6sZ3FAJu3fgMUMJJkfBV4AMMw@mail.gmail.com>
Subject: Re: [PATCH 5/5] cpumask: fix comment of cpumask_xxx
To: Yury Norov <yury.norov@gmail.com>
Cc: Vernon Yang <vernon2gm@gmail.com>, torvalds@linux-foundation.org,
 tytso@mit.edu, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 jejb@linux.ibm.com, martin.petersen@oracle.com, 
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk, 
 james.smart@broadcom.com, dick.kennedy@broadcom.com, 
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org
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

On Mon, Mar 6, 2023 at 5:54=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> On Mon, Mar 06, 2023 at 05:44:41PM +0100, Jason A. Donenfeld wrote:
> > On Mon, Mar 6, 2023 at 5:39=E2=80=AFPM Yury Norov <yury.norov@gmail.com=
> wrote:
> > >
> > > On Tue, Mar 07, 2023 at 12:06:51AM +0800, Vernon Yang wrote:
> > > > After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cp=
umask
> > > > optimizations"), the cpumask size is divided into three different c=
ase,
> > > > so fix comment of cpumask_xxx correctly.
> > > >
> > > > Signed-off-by: Vernon Yang <vernon2gm@gmail.com>
> > > > ---
> > > >  include/linux/cpumask.h | 46 ++++++++++++++++++++-----------------=
----
> > > >  1 file changed, 23 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> > > > index 8fbe76607965..248bdb1c50dc 100644
> > > > --- a/include/linux/cpumask.h
> > > > +++ b/include/linux/cpumask.h
> > > > @@ -155,7 +155,7 @@ static __always_inline unsigned int cpumask_che=
ck(unsigned int cpu)
> > > >   * cpumask_first - get the first cpu in a cpumask
> > > >   * @srcp: the cpumask pointer
> > > >   *
> > > > - * Returns >=3D nr_cpu_ids if no cpus set.
> > > > + * Returns >=3D small_cpumask_bits if no cpus set.
> > >
> > > There's no such thing like small_cpumask_bits. Here and everywhere,
> > > nr_cpu_ids must be used.
> > >
> > > Actually, before 596ff4a09b89 nr_cpumask_bits was deprecated, and it
> > > must be like that for all users even now.
> > >
> > > nr_cpumask_bits must be considered as internal cpumask parameter and
> > > never referenced outside of cpumask code.
> >
> > What's the right thing I should do, then, for wireguard's usage and
> > for random.c's usage? It sounds like you object to this patchset, but
> > if the problem is real, it sounds like I should at least fix the two
> > cases I maintain. What's the right check?
>
> Everywhere outside of cpumasks internals use (cpu < nr_cpu_ids) to
> check if the cpu is in a valid range, like:
>
> cpu =3D cpumask_first(cpus);
> if (cpu >=3D nr_cpu_ids)
>         pr_err("There's no cpus");

Oh, okay, so the ones for wireguard and random.c in this series are
correct then? If so, could you give a Reviewed-by:, and then I'll
queue those up in my respective trees.

Jason
