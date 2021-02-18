Return-Path: <SRS0=dlhK=HU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355F9C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 13:50:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E6B664E5F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 13:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E6B664E5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e9a3564;
	Thu, 18 Feb 2021 13:50:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 16ff294f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Feb 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C72A364E5F
 for <wireguard@lists.zx2c4.com>; Thu, 18 Feb 2021 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613656207;
 bh=g/3gnyEsCmeJqLrxo6CfJ0GXm/VtagZNJzYDKMtIGAM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ozGy5AvK/+sPISQi0NpLaVbpYI4UHu+M+dVFBz5JMX27Y04HvAYUHME039kCzhPfj
 mhxNHDWGpB6QEsEWTnPnmzDh8RdTeknpfiqew0lSgeFmfeAeHpXiRSxk5B7lrKz27e
 I2g/lhRUxnxjVvNwl4eQufH6qzye4wh3menn1BI8vtx+hpCVrozodwmLVkvRzdph8d
 EiBitArEzU7vutB2gxnXGMsbUpLUSBuFdFeUftbTZAMHr6Xua7knV1HQNpBDiLa7gA
 FYs3UkCI/nPwICLC//IRUc7TRjL28hZfD3mL6oM2fJDPa8o/mKMnO2PSppj+FFNc36
 DQtgi9K9QFdfw==
Received: by mail-wr1-f52.google.com with SMTP id u14so3070572wri.3
 for <wireguard@lists.zx2c4.com>; Thu, 18 Feb 2021 05:50:06 -0800 (PST)
X-Gm-Message-State: AOAM533DSQNkqTHI96d0o1djeo7b4cKfCI4hPhp0lQL4kft+7Awc0vtK
 sOVtrd39P6sEd3tLnmHIsj/xufX1Ve41hLH0YFI=
X-Google-Smtp-Source: ABdhPJx4ApxUeFGK47VDPOOb/8gXLFvYtI9zOY8PZBDCdPlL6Yfdo837omNMJFux3K7PexO/x8BkxfNUcM9N7vqM9bI=
X-Received: by 2002:adf:eac6:: with SMTP id o6mr4440895wrn.172.1613656205204; 
 Thu, 18 Feb 2021 05:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20210208133816.45333-1-Jason@zx2c4.com>
In-Reply-To: <20210208133816.45333-1-Jason@zx2c4.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Thu, 18 Feb 2021 14:49:52 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNjNBUg9rvFtiuvNDP3KKmjGg50O+23c6KJvtGfJ2Qf+bA@mail.gmail.com>
Message-ID: <CAJ+HfNjNBUg9rvFtiuvNDP3KKmjGg50O+23c6KJvtGfJ2Qf+bA@mail.gmail.com>
Subject: Re: [PATCH RFC v1] wireguard: queueing: get rid of per-peer ring
 buffers
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Dmitry Vyukov <dvyukov@google.com>
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

On Mon, 8 Feb 2021 at 14:47, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Having two ring buffers per-peer means that every peer results in two
> massive ring allocations. On an 8-core x86_64 machine, this commit
> reduces the per-peer allocation from 18,688 bytes to 1,856 bytes, which
> is an 90% reduction. Ninety percent! With some single-machine
> deployments approaching 400,000 peers, we're talking about a reduction
> from 7 gigs of memory down to 700 megs of memory.
>
> In order to get rid of these per-peer allocations, this commit switches
> to using a list-based queueing approach. Currently GSO fragments are
> chained together using the skb->next pointer, so we form the per-peer
> queue around the unused skb->prev pointer, which makes sense because the
> links are pointing backwards. Multiple cores can write into the queue at
> any given time, because its writes occur in the start_xmit path or in
> the udp_recv path. But reads happen in a single workqueue item per-peer,
> amounting to a multi-producer, single-consumer paradigm.
>
> The MPSC queue is implemented locklessly and never blocks. However, it
> is not linearizable (though it is serializable), with a very tight and
> unlikely race on writes, which, when hit (about 0.15% of the time on a
> fully loaded 16-core x86_64 system), causes the queue reader to
> terminate early. However, because every packet sent queues up the same
> workqueue item after it is fully added, the queue resumes again, and
> stopping early isn't actually a problem, since at that point the packet
> wouldn't have yet been added to the encryption queue. These properties
> allow us to avoid disabling interrupts or spinning.
>
> Performance-wise, ordinarily list-based queues aren't preferable to
> ringbuffers, because of cache misses when following pointers around.
> However, we *already* have to follow the adjacent pointers when working
> through fragments, so there shouldn't actually be any change there. A
> potential downside is that dequeueing is a bit more complicated, but the
> ptr_ring structure used prior had a spinlock when dequeueing, so all and
> all the difference appears to be a wash.
>
> Actually, from profiling, the biggest performance hit, by far, of this
> commit winds up being atomic_add_unless(count, 1, max) and atomic_
> dec(count), which account for the majority of CPU time, according to
> perf. In that sense, the previous ring buffer was superior in that it
> could check if it was full by head=3D=3Dtail, which the list-based approa=
ch
> cannot do.
>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Hoping to get some feedback here from people running massive deployments
> and running into ram issues, as well as Dmitry on the queueing semantics
> (the mpsc queue is his design), before I send this to Dave for merging.
> These changes are quite invasive, so I don't want to get anything wrong.
>

[...]

> diff --git a/drivers/net/wireguard/queueing.c b/drivers/net/wireguard/que=
ueing.c
> index 71b8e80b58e1..a72380ce97dd 100644
> --- a/drivers/net/wireguard/queueing.c
> +++ b/drivers/net/wireguard/queueing.c

[...]

> +
> +static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_=
buff *skb)
> +{
> +       WRITE_ONCE(NEXT(skb), NULL);
> +       smp_wmb();
> +       WRITE_ONCE(NEXT(xchg_relaxed(&queue->head, skb)), skb);
> +}
> +

I'll chime in with Toke; This MPSC and Dmitry's links really took me
to the "verify with pen/paper"-level! Thanks!

I'd replace the smp_wmb()/_relaxed above with a xchg_release(), which
might perform better on some platforms. Also, it'll be a nicer pair
with the ldacq below. :-P In general, it would be nice with some
wording how the fences pair. It would help the readers (like me!) a
lot.


Cheers,
Bj=C3=B6rn

[...]
