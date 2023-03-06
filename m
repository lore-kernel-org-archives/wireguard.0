Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC08C64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 16:45:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe7f8fa6;
	Mon, 6 Mar 2023 16:45:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3f32002d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 16:45:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61F11B80FC9
 for <wireguard@lists.zx2c4.com>; Mon,  6 Mar 2023 16:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD575C433A4
 for <wireguard@lists.zx2c4.com>; Mon,  6 Mar 2023 16:45:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="b0w1TNIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1678121095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0IN1VirqLiMA24UJjnZzI6umrNwjSsL7ENm7zhRfEY=;
 b=b0w1TNIoPxRb/tqmpTMDkJV/IIjtMlC60HNjPPB7h8foPuYnyLmyxd7C2pa9vZNTpjUbiS
 Isw6vNwX93UAeJ/eHpghfRROCnUGn/o+U+l+SYnJXPaCe9/WoipnfzL4qnrv/RI/9HylVK
 oC3KxzsgMZNSN9ww4dNrCmQvx4hdWh4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 18693d75
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 16:44:55 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 82so8784697ybn.6
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 08:44:54 -0800 (PST)
X-Gm-Message-State: AO0yUKUWBnpGlUbxxyVhuOpkMImF1F2Qnjk2E8SGiz6tfnxHXS+4urcb
 SIjRzLU1UnT9mZ6qEWf/mlRnZSI8LbkLn+EoZVk=
X-Google-Smtp-Source: AK7set9CK46/v8qFmWbdZ/4F4SRDr5QbKoIrAv/Wae6SuQP8a65V94c1vPHoCPtLR3gHjN4UILUiQdF7vxmAXeMOPdQ=
X-Received: by 2002:a25:7808:0:b0:a4a:a708:2411 with SMTP id
 t8-20020a257808000000b00a4aa7082411mr6622201ybc.10.1678121092709; Mon, 06 Mar
 2023 08:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
 <ZAYXJ2E+JHcp2kD/@yury-laptop>
In-Reply-To: <ZAYXJ2E+JHcp2kD/@yury-laptop>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 6 Mar 2023 17:44:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9r_JXNCVVCNxZRQkafA=eOOu5k0+AweRDor3tNu283bdg@mail.gmail.com>
Message-ID: <CAHmME9r_JXNCVVCNxZRQkafA=eOOu5k0+AweRDor3tNu283bdg@mail.gmail.com>
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

On Mon, Mar 6, 2023 at 5:39=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> On Tue, Mar 07, 2023 at 12:06:51AM +0800, Vernon Yang wrote:
> > After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumas=
k
> > optimizations"), the cpumask size is divided into three different case,
> > so fix comment of cpumask_xxx correctly.
> >
> > Signed-off-by: Vernon Yang <vernon2gm@gmail.com>
> > ---
> >  include/linux/cpumask.h | 46 ++++++++++++++++++++---------------------
> >  1 file changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> > index 8fbe76607965..248bdb1c50dc 100644
> > --- a/include/linux/cpumask.h
> > +++ b/include/linux/cpumask.h
> > @@ -155,7 +155,7 @@ static __always_inline unsigned int cpumask_check(u=
nsigned int cpu)
> >   * cpumask_first - get the first cpu in a cpumask
> >   * @srcp: the cpumask pointer
> >   *
> > - * Returns >=3D nr_cpu_ids if no cpus set.
> > + * Returns >=3D small_cpumask_bits if no cpus set.
>
> There's no such thing like small_cpumask_bits. Here and everywhere,
> nr_cpu_ids must be used.
>
> Actually, before 596ff4a09b89 nr_cpumask_bits was deprecated, and it
> must be like that for all users even now.
>
> nr_cpumask_bits must be considered as internal cpumask parameter and
> never referenced outside of cpumask code.

What's the right thing I should do, then, for wireguard's usage and
for random.c's usage? It sounds like you object to this patchset, but
if the problem is real, it sounds like I should at least fix the two
cases I maintain. What's the right check?

Jason
