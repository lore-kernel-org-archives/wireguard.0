Return-Path: <SRS0=dlhK=HU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737E1C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 15:13:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E54364D92
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 15:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E54364D92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dbc3345;
	Thu, 18 Feb 2021 15:13:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6509dbee
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Feb 2021 15:13:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C64564E85
 for <wireguard@lists.zx2c4.com>; Thu, 18 Feb 2021 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613661183;
 bh=ZTI2hijfLdbw/24TgT6J8n4NgXnwfgAHpvPU/jyKQsk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r8ZLKBJFn6LcU0a44Br2DOYuxJYyqS9quWizNEGQmHA9DF0z4/9HvYYx2cXZMr61K
 1n3b1uX9zwPh3uqAive2QrK6Bv6E1t9IPlAS/qDmD4hiWoXJZbS3M83aN4x4A1cNC+
 DNOW5eavKtzSU2GO43nYD4eVggEPP+4lxIQ29SSQ2S7OmoBVwfU7g75Dh28RFjEMAj
 oceO1JYkXN1IRtIIUQUmtfNNTMRdolucPu7LSm32RlBq5Q1Qr9z7ffS3XmrnAmTlTz
 CrH66+PBQaJhSh7koSQA73ccJgNdAT+vNYNmBAPDZAARR1R36NalmGMQG+PC7IV+/7
 G41W6a0HHIZrQ==
Received: by mail-wr1-f50.google.com with SMTP id t15so3303886wrx.13
 for <wireguard@lists.zx2c4.com>; Thu, 18 Feb 2021 07:13:03 -0800 (PST)
X-Gm-Message-State: AOAM531c0ZpfmkQ+ee+atlBX1m9OCya5Rdnp4tPD0ZPfA5/W52bnpBA2
 OlZTVtkq4D6+bDjOdmZ1IxkxxrJe58/VrgSfH50=
X-Google-Smtp-Source: ABdhPJy7lVBZjGQWUbC3y5THMNEkhuMXc9EhAL+CQ1MY9Zeaj7KohA99GKYobFYdV731eqcFBk8B10XLoFttMKCLJuM=
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr4689621wrs.176.1613661181671; 
 Thu, 18 Feb 2021 07:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20210208133816.45333-1-Jason@zx2c4.com>
 <CAJ+HfNjNBUg9rvFtiuvNDP3KKmjGg50O+23c6KJvtGfJ2Qf+bA@mail.gmail.com>
 <CAHmME9r+c+e-ibBOwnFoz6Bnis4tBoeht63fqVdkKF-oTcEtMg@mail.gmail.com>
 <CAJ+HfNi9kaU1JN36gavVX7mh6tbuoFgUiXM03U7C5gLw_eiprQ@mail.gmail.com>
 <CAHmME9qf_EY8xTi81VPr9O9_95HpdjxobLtd1=C7fK2kRUxWiw@mail.gmail.com>
In-Reply-To: <CAHmME9qf_EY8xTi81VPr9O9_95HpdjxobLtd1=C7fK2kRUxWiw@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Thu, 18 Feb 2021 16:12:49 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNi2Bdi-xa+rsgxWkxFdykM1CKznGMdj=FoazEbNh1m4Dw@mail.gmail.com>
Message-ID: <CAJ+HfNi2Bdi-xa+rsgxWkxFdykM1CKznGMdj=FoazEbNh1m4Dw@mail.gmail.com>
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

On Thu, 18 Feb 2021 at 15:15, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>

[...]

> >
> > > +static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct
> > > sk_buff *skb)
> > > +{
> > > +       WRITE_ONCE(NEXT(skb), NULL);
> > > +       WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
> > > +}
> > >
> > > Look good?
> > >
> >
> > Yes, exactly like that!
>
> The downside is that on armv7, this becomes a dmb(ish) instead of a
> dmb(ishst). But I was unable to measure any actual difference anyway,
> and the atomic bounded increment is already more expensive, so I think
> it's okay.
>

Who cares about armv7!? The world is moving to Armv8/LSE, where we'll
end up with one fine "swpl" in this case, w/o any explicit (well...)
fence. ;-P

On a more serious note, it does make sense to base the decision on
benchmarks. OTOH I'd guess that the systems that mostly benefit from
this memory saving patch are x86_64, where the
smp_wmb()/xchg_relaxed() and xchg_release() are identical.


Bj=C3=B6rn
