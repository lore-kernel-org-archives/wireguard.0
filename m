Return-Path: <SRS0=dlhK=HU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5A6C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 13:55:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38C6764E33
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Feb 2021 13:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38C6764E33
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f59916b;
	Thu, 18 Feb 2021 13:53:37 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a3b5eb7b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Feb 2021 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1613656411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8gKeR5R7eEx1U6j0qSBOxa8Q1dfyhaVX5tkgG3TkRU=;
 b=qEXm+vmax4q6VV+DPXw4frKnfMkBnVan/oDiLA+bpVxoEd5z+huKzgTwwJ2pBoLPVS6blH
 Aax/KfZeIu+L9A1fSaUDZdD7ETca7t0yurZH2xCRfx0olqejgHVnkCaaR2QCEhziFmEn9g
 Msr4cHt3hokU6eUhxHiDIALEd6TGF+s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f3969b86
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Feb 2021 13:53:31 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id u3so2204298ybk.6
 for <wireguard@lists.zx2c4.com>; Thu, 18 Feb 2021 05:53:31 -0800 (PST)
X-Gm-Message-State: AOAM531wr/4CBJSBsofYzmMEfvWIoVsnYciPSIOo8mDUEcuq0czhHqTI
 +qN93PawaFOUoCrD3SYyw7BNP6ssp1WDqi5wiMI=
X-Google-Smtp-Source: ABdhPJzyvYt2agn/+ThQJ81rAS8N9sq+6r/hmM1iLcM2KxZpjWK9dVQVLzskkG2UGraSnjYcCkf+D3aLVgbrzQOSB00=
X-Received: by 2002:a25:3387:: with SMTP id z129mr7000210ybz.239.1613656411057; 
 Thu, 18 Feb 2021 05:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20210208133816.45333-1-Jason@zx2c4.com>
 <CAJ+HfNjNBUg9rvFtiuvNDP3KKmjGg50O+23c6KJvtGfJ2Qf+bA@mail.gmail.com>
In-Reply-To: <CAJ+HfNjNBUg9rvFtiuvNDP3KKmjGg50O+23c6KJvtGfJ2Qf+bA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Feb 2021 14:53:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9r+c+e-ibBOwnFoz6Bnis4tBoeht63fqVdkKF-oTcEtMg@mail.gmail.com>
Message-ID: <CAHmME9r+c+e-ibBOwnFoz6Bnis4tBoeht63fqVdkKF-oTcEtMg@mail.gmail.com>
Subject: Re: [PATCH RFC v1] wireguard: queueing: get rid of per-peer ring
 buffers
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
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

Hey Bjorn,

On Thu, Feb 18, 2021 at 2:50 PM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wr=
ote:
> > +
> > +static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct s=
k_buff *skb)
> > +{
> > +       WRITE_ONCE(NEXT(skb), NULL);
> > +       smp_wmb();
> > +       WRITE_ONCE(NEXT(xchg_relaxed(&queue->head, skb)), skb);
> > +}
> > +
>
> I'll chime in with Toke; This MPSC and Dmitry's links really took me
> to the "verify with pen/paper"-level! Thanks!
>
> I'd replace the smp_wmb()/_relaxed above with a xchg_release(), which
> might perform better on some platforms. Also, it'll be a nicer pair
> with the ldacq below. :-P In general, it would be nice with some
> wording how the fences pair. It would help the readers (like me!) a
> lot.

Exactly. This is what's been in my dev tree for the last week or so:

+static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct
sk_buff *skb)
+{
+       WRITE_ONCE(NEXT(skb), NULL);
+       WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
+}

Look good?

Jason
