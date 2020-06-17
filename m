Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCA1C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 23:49:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4CE207E8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 23:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="M9wdNA4X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4CE207E8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0aef2634;
	Wed, 17 Jun 2020 23:31:05 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a715c7b8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 23:31:02 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f5ad6cf
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 20:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=aicm+hcEimZg
 0nzDmYXZdX6kJoI=; b=M9wdNA4Xfpd5zlRA3/7qkW9fZQiP4PbGPn2zoymHvent
 1bUdNjjmi6wmtJOETmZ5Zj/Ep1+uZwMRIbYynrDLHaXsWRM/fJyOlBYK+g1C5Xoy
 H9I7FzTtuYb20lYBWPSQL3zJ36GJkuPhdw91VXhJncKAGnSxysu5Er2sU8NKvIFp
 CJzlu0ZZ2lzYpg6usNwzTl6RQa+Ry/teGsVe34u8veQFpogTzAFXVSmSZ9Dy0vT8
 EmbU6iiVxAfbzC29+Q+R3PmWzYPCTeXiEGgNPw/4kyDaJfLCpFHCmAykUiS6Q0hP
 KOtdSNfrjrHhke0dR6Ec7bTSvoew85PrQ04mPq/1OQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cdb45605
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 20:44:20 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id r77so4623927ior.3
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 14:02:28 -0700 (PDT)
X-Gm-Message-State: AOAM530RtK2JSW5YVokmT34MEXMxnOrxSqQMQoOX0ri9T57zHORVJJ2V
 gSA3t+9daMAoe0GeBm6XKKITa8xtp1bYoPDa1G0=
X-Google-Smtp-Source: ABdhPJxmt2zdRkvCe4UaIzxW8+0y12CMuqGK0BMVn5yknBQ+VXDYRGf073Yy08u92ieahjc4/nWx/EefS5cz3VCJhyw=
X-Received: by 2002:a05:6602:809:: with SMTP id
 z9mr1398403iow.79.1592427747718; 
 Wed, 17 Jun 2020 14:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvbpu1Lw0j9dtXZPmVS+i-OnopUo+zuqtoQLnABQGw-SqQ@mail.gmail.com>
 <CAHmME9r3nPwmUoYYrj0PnUStd1ACSmdFAO4Qv2cZtmiLspOW1g@mail.gmail.com>
 <CALjTZvbtjVwpyV+AMX4htssTbwTHV45mQeokUr952D_GbtFPvw@mail.gmail.com>
 <CALjTZvZRerzWqaqhY2U=m44n5taLEsY99uEt2=ZNCe27=LYbLA@mail.gmail.com>
 <CAHmME9otC1mOqR2tLB55BVQQpNPvCMUGa1E4jfMYYXNp6_31BA@mail.gmail.com>
 <CALjTZvZ4wqZZ7_Fk-YHaxT9uuWnS4n9dLm4ZXSy1UM3riv+NuQ@mail.gmail.com>
 <CAHmME9qWrBTCsBr7s6oLD0zuBMzZUD2OV3s-tgDwV0W7bb9Utw@mail.gmail.com>
 <CAHmME9p51XvLEZ7QbDreEXym34S4XZZaRotAv4aRiT5D4Pz3XA@mail.gmail.com>
 <20200617204510.GA396261@zx2c4.com> <20200617205443.GA403252@zx2c4.com>
In-Reply-To: <20200617205443.GA403252@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 15:02:16 -0600
X-Gmail-Original-Message-ID: <CAHmME9qX2dVBf-23g1ASW1EFaX_4VLUH5QZBCM71NVfe6rtaxA@mail.gmail.com>
Message-ID: <CAHmME9qX2dVBf-23g1ASW1EFaX_4VLUH5QZBCM71NVfe6rtaxA@mail.gmail.com>
Subject: Any progress on R_ARM_THM_JUMP11 issues?
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Rui Salvaterra <rsalvaterra@gmail.com>
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

Hi ARM folks,

Rui emailed the OpenWRT list and me about an issue he found when
compiling WireGuard. He was compiling kernels with
CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11=3Dn -- which I'm well aware the
Kconfig advices people not to do -- and got the dreaded "unknown
relocation 102" error when trying to load the module. I figured out
that I could "fix" it in the WireGuard code by either doing some extra
stuff after the tail call, so that the B becomes a BL, or by moving
the destination of the tail call a bit closer to the callsite, so that
THUMB2's jump distance is shorter and fits within the B's limitations,
thereby not needing the "JUMP11" relocation.

Obviously reordering code for this reason isn't going to fly with
upstream patches, nor would adding dummy code to avoid a tail call.
And there's already CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11=3Dy which seems
like the right global solution for this.

But I am wondering: has anybody heard about toolchain progress toward
fixing this? Couldn't the compiler reorder functions itself more
intelligently? Or avoid emitting the B in the case that the jump will
be too far? Or does nobody care much about 32-bit ARM these days so
it's just fallen by the wayside and
CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11=3Dy is the best we've got? Or
something else?

Jason

On Wed, Jun 17, 2020 at 2:54 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Wed, Jun 17, 2020 at 02:45:12PM -0600, Jason A. Donenfeld wrote:
> > Looks like my explanation there wasn't 100% accurate, but it does seem
> > like the issue occurs when gcc sees a clear tail call that it can
> > optimize into a B instruction instead of a BL instruction.
> >
> > The below patch avoids that, and thus fixes your issue, using a pretty
> > bad trick that's not really suitable for being committed anywhere, but
> > it is perhaps leading us in the right direction:
> >
> > diff --git a/src/send.c b/src/send.c
> > index 828b086a..4bb6911f 100644
> > --- a/src/send.c
> > +++ b/src/send.c
> > @@ -221,6 +221,8 @@ static bool encrypt_packet(struct sk_buff *skb, str=
uct noise_keypair *keypair,
> >      simd_context);
> >  }
> >
> > +volatile char dummy;
> > +
> >  void wg_packet_send_keepalive(struct wg_peer *peer)
> >  {
> >   struct sk_buff *skb;
> > @@ -240,6 +242,7 @@ void wg_packet_send_keepalive(struct wg_peer *peer)
> >   }
> >
> >   wg_packet_send_staged_packets(peer);
> > + dummy =3D -1;
> >  }
> >
> >  static void wg_packet_create_data_done(struct sk_buff *first,
>
> A better fix with more explanation: it looks like the issue doesn't have
> to do with the multifile thing I pointed out before, but just that gcc
> sees it can optimize the tail call into a B instruction, which seems to
> have a =C2=B12KB range, whereas BL has a =C2=B14MB range. The solution is=
 to just
> move the location of the function in that file to be closer to the
> destination of the tail call. I'm not a big fan of that and I'm slightly
> worried davem will nack it because it makes backporting harder for a
> fairly speculative gain (at least, I haven't yet taken measurements,
> though I suppose I could). There's also the question of - why are we
> doing goofy reordering things to the code to work around a toolchain
> bug? Shouldn't we fix the toolchain? So, I'll keep thinking...
>
> diff --git a/src/send.c b/src/send.c
> index 828b086a..f44aff8d 100644
> --- a/src/send.c
> +++ b/src/send.c
> @@ -221,27 +221,6 @@ static bool encrypt_packet(struct sk_buff *skb, stru=
ct noise_keypair *keypair,
>                                                    simd_context);
>  }
>
> -void wg_packet_send_keepalive(struct wg_peer *peer)
> -{
> -       struct sk_buff *skb;
> -
> -       if (skb_queue_empty(&peer->staged_packet_queue)) {
> -               skb =3D alloc_skb(DATA_PACKET_HEAD_ROOM + MESSAGE_MINIMUM=
_LENGTH,
> -                               GFP_ATOMIC);
> -               if (unlikely(!skb))
> -                       return;
> -               skb_reserve(skb, DATA_PACKET_HEAD_ROOM);
> -               skb->dev =3D peer->device->dev;
> -               PACKET_CB(skb)->mtu =3D skb->dev->mtu;
> -               skb_queue_tail(&peer->staged_packet_queue, skb);
> -               net_dbg_ratelimited("%s: Sending keepalive packet to peer=
 %llu (%pISpfsc)\n",
> -                                   peer->device->dev->name, peer->intern=
al_id,
> -                                   &peer->endpoint.addr);
> -       }
> -
> -       wg_packet_send_staged_packets(peer);
> -}
> -
>  static void wg_packet_create_data_done(struct sk_buff *first,
>                                        struct wg_peer *peer)
>  {
> @@ -346,6 +325,27 @@ err:
>         kfree_skb_list(first);
>  }
>
> +void wg_packet_send_keepalive(struct wg_peer *peer)
> +{
> +       struct sk_buff *skb;
> +
> +       if (skb_queue_empty(&peer->staged_packet_queue)) {
> +               skb =3D alloc_skb(DATA_PACKET_HEAD_ROOM + MESSAGE_MINIMUM=
_LENGTH,
> +                               GFP_ATOMIC);
> +               if (unlikely(!skb))
> +                       return;
> +               skb_reserve(skb, DATA_PACKET_HEAD_ROOM);
> +               skb->dev =3D peer->device->dev;
> +               PACKET_CB(skb)->mtu =3D skb->dev->mtu;
> +               skb_queue_tail(&peer->staged_packet_queue, skb);
> +               net_dbg_ratelimited("%s: Sending keepalive packet to peer=
 %llu (%pISpfsc)\n",
> +                                   peer->device->dev->name, peer->intern=
al_id,
> +                                   &peer->endpoint.addr);
> +       }
> +
> +       wg_packet_send_staged_packets(peer);
> +}
> +
>  void wg_packet_purge_staged_packets(struct wg_peer *peer)
>  {
>         spin_lock_bh(&peer->staged_packet_queue.lock);
>
