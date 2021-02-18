Return-Path: <SRS0=dlhK=HU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4458C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 14:07:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E0A760C41
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 14:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E0A760C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b89ef0ca;
	Thu, 18 Feb 2021 14:04:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 221d1113
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Feb 2021 14:04:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0334364E85
 for <wireguard@lists.zx2c4.com>; Thu, 18 Feb 2021 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613657083;
 bh=FRfLcKTjVrdWM7vqAyoSVsOm3B8zsFuuLM7H+M7WcPc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=flbPOdDxx5dco6tqoM+kDa+48MdmDZ6h6h4wHGO0hFRXmfIIi67jryCLDc86DE3/f
 u37n14cFj0XGwjKULFDOV8mj5OR2w1Pp5pyprWZ8taDUUk75MJGiJE6cn0yO6/uytc
 DnotTdZaUu1FPz90egfb6LdgYVwtQKaX8DOvuQGLHbOF19C0AmcazwEyGN/RdepvKh
 uys+oW+tlcSk41v4VsqZ81ttehr1fY4OcVkNpmHgGh//6xXwxRvETMGD55Xepgdl//
 y6fMOa6KUKHPszrvoEZnJXGS7fNJCAcx+2cJEvMQ6f6fQzkP+f+fFSt9VsBYoDJoQz
 vhNJRSb8tiz6w==
Received: by mail-wr1-f45.google.com with SMTP id b3so3121092wrj.5
 for <wireguard@lists.zx2c4.com>; Thu, 18 Feb 2021 06:04:42 -0800 (PST)
X-Gm-Message-State: AOAM531wqW8bb4JLcxjFCw627GLKxzOKyyKQwvATjEucHEnYK/fsGMz9
 ESzwA9aemzfy5xKv9tXpBDckYBxeNBVhMc4GE9E=
X-Google-Smtp-Source: ABdhPJz4+4I/RvpA4jHEvsTV9EOyOcLxV+Wb+n2ueflhF2nGIU5YwKEA5YCO+/7acgtSh2hPF5dAMfKz2+pScI4EAg4=
X-Received: by 2002:a5d:684b:: with SMTP id o11mr4499862wrw.52.1613657081524; 
 Thu, 18 Feb 2021 06:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20210208133816.45333-1-Jason@zx2c4.com>
 <CAJ+HfNjNBUg9rvFtiuvNDP3KKmjGg50O+23c6KJvtGfJ2Qf+bA@mail.gmail.com>
 <CAHmME9r+c+e-ibBOwnFoz6Bnis4tBoeht63fqVdkKF-oTcEtMg@mail.gmail.com>
In-Reply-To: <CAHmME9r+c+e-ibBOwnFoz6Bnis4tBoeht63fqVdkKF-oTcEtMg@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Thu, 18 Feb 2021 15:04:29 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNi9kaU1JN36gavVX7mh6tbuoFgUiXM03U7C5gLw_eiprQ@mail.gmail.com>
Message-ID: <CAJ+HfNi9kaU1JN36gavVX7mh6tbuoFgUiXM03U7C5gLw_eiprQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1] wireguard: queueing: get rid of per-peer ring
 buffers
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Dmitry Vyukov <dvyukov@google.com>
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

On Thu, 18 Feb 2021 at 14:53, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey Bjorn,
>
> On Thu, Feb 18, 2021 at 2:50 PM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> =
wrote:
> > > +
> > > +static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct=
 sk_buff *skb)
> > > +{
> > > +       WRITE_ONCE(NEXT(skb), NULL);
> > > +       smp_wmb();
> > > +       WRITE_ONCE(NEXT(xchg_relaxed(&queue->head, skb)), skb);
> > > +}
> > > +
> >
> > I'll chime in with Toke; This MPSC and Dmitry's links really took me
> > to the "verify with pen/paper"-level! Thanks!
> >
> > I'd replace the smp_wmb()/_relaxed above with a xchg_release(), which
> > might perform better on some platforms. Also, it'll be a nicer pair
> > with the ldacq below. :-P In general, it would be nice with some
> > wording how the fences pair. It would help the readers (like me!) a
> > lot.
>
> Exactly. This is what's been in my dev tree for the last week or so:
>

Ah, nice!

> +static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct
> sk_buff *skb)
> +{
> +       WRITE_ONCE(NEXT(skb), NULL);
> +       WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
> +}
>
> Look good?
>

Yes, exactly like that!


Cheers,
Bj=C3=B6rn
