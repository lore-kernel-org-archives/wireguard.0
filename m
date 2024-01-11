Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09581C47077
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jan 2024 16:26:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae67a52d;
	Thu, 11 Jan 2024 16:26:30 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8262e6dd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2024 16:26:28 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55818b7053eso12832a12.0
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jan 2024 08:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704990388; x=1705595188; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K30QLyCbHCL75IsyofqnBHA8mjC9PVkRkBbAX6BkpK0=;
 b=sDcN4Ibwnqi2H7d66k+cdx700avZ/dsV8xaoNfcd8vsNNc01/xOEhPfBXzWjLqArKg
 xsC9K5l1GBKfYkxa3Q8+fcv5JTmhh9gLFaqaE4AAkUF1GUxGz1fLTtroItSOzGxTw2+U
 viXWhe9FLlyeg5nAIqQx5Lm3+pNfusPr1cT5fZDRsUh1Wr0IFmaAA4pAA5zpEJPOz5fo
 dhTlC/oL7UCUYVQH0dewkrarOJhvtj646476a5VigTdp7WHp2itdFv58Wq3pRkkmHDlc
 hCQqcGCZ8uqaZk7XL40WI0lv5M5eJpBwTiZ1EQJ+xvhkVNgSuilH5+s41aSgdyRPJ2bJ
 Ny2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704990388; x=1705595188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K30QLyCbHCL75IsyofqnBHA8mjC9PVkRkBbAX6BkpK0=;
 b=Ti1+SMmex/V4GI2IZ2KSeD9D+foscoHvJ4EaaAhUjcWZee0Tfnf4fEN65aj3z0TikO
 frPPcryzqj5mY+CIg5RSfZh5pesSGW+dHTrBDEBZvcDLByocQ9et73UWjiA2N21RUgt5
 Mg1fpoisxRlU8GGDjED/Z62Oe2AxtObl/QcY3bvDFqfzHtX29bFRx/S9znnnzNWqgHhs
 xaNKgT6E0o6tEIDglZI9YJiRE0DTV/oHwOyH6q/Kj289Jc9LyKVTSQw3PcQ6SbUig25J
 WZHf8VTFi8P920wQRPbvg/hS8VOYNMVr1mHZrJaW/zUlUlBouUE3vBiatxIrwFF8PMIl
 a0dA==
X-Gm-Message-State: AOJu0YyhB2IC3WnHg+f75GP0qoH7UXlstA4qUFnyEH0J2qk4o4BWd0Ca
 C8k1CcbTpbGwIU2TLkJYaiYHZZ4v00WF9IVRm7ahXi5DMGQH
X-Google-Smtp-Source: AGHT+IGG/epSnevZ3tibTtsyj6ljbUTjIpunG+bc1R+QOl/x0GDHrqpNq3C6hvaHo8gUIsrVp/EukS3BSyyLaI9hNG4=
X-Received: by 2002:aa7:c411:0:b0:558:b501:1d2a with SMTP id
 j17-20020aa7c411000000b00558b5011d2amr49800edq.6.1704990388229; Thu, 11 Jan
 2024 08:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20240111154138.7605-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240111154138.7605-1-n.zhandarovich@fintech.ru>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 11 Jan 2024 17:26:17 +0100
Message-ID: <CANn89iJaxTFGNFqmCJSQfr9nwHUPK6DBnK1oZ1sJ2Gm6eqebag@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: receive: annotate data-race around
 receiving_counter.counter
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot <syzkaller@googlegroups.com>, 
 syzbot+d1de830e4ecdaac83d89@syzkaller.appspotmail.com
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

On Thu, Jan 11, 2024 at 4:41=E2=80=AFPM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> Syzkaller with KCSAN identified a data-race issue [1] when accessing
> keypair->receiving_counter.counter.
>
> This patch uses READ_ONCE() and WRITE_ONCE() annotations to fix the
> problem.
>
> [1]
> BUG: KCSAN: data-race in wg_packet_decrypt_worker / wg_packet_rx_poll
>
> write to 0xffff888107765888 of 8 bytes by interrupt on cpu 0:
>  counter_validate drivers/net/wireguard/receive.c:321 [inline]
>  wg_packet_rx_poll+0x3ac/0xf00 drivers/net/wireguard/receive.c:461
>  __napi_poll+0x60/0x3b0 net/core/dev.c:6536
>  napi_poll net/core/dev.c:6605 [inline]
>  net_rx_action+0x32b/0x750 net/core/dev.c:6738
>  __do_softirq+0xc4/0x279 kernel/softirq.c:553
>  do_softirq+0x5e/0x90 kernel/softirq.c:454
>  __local_bh_enable_ip+0x64/0x70 kernel/softirq.c:381
>  __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:167 [inline]
>  _raw_spin_unlock_bh+0x36/0x40 kernel/locking/spinlock.c:210
>  spin_unlock_bh include/linux/spinlock.h:396 [inline]
>  ptr_ring_consume_bh include/linux/ptr_ring.h:367 [inline]
>  wg_packet_decrypt_worker+0x6c5/0x700 drivers/net/wireguard/receive.c:499
>  process_one_work kernel/workqueue.c:2633 [inline]
>  ...
>
> read to 0xffff888107765888 of 8 bytes by task 3196 on cpu 1:
>  decrypt_packet drivers/net/wireguard/receive.c:252 [inline]
>  wg_packet_decrypt_worker+0x220/0x700 drivers/net/wireguard/receive.c:501
>  process_one_work kernel/workqueue.c:2633 [inline]
>  process_scheduled_works+0x5b8/0xa30 kernel/workqueue.c:2706
>  worker_thread+0x525/0x730 kernel/workqueue.c:2787
>  ...
>
> Fixes: a9e90d9931f3 ("wireguard: noise: separate receive counter from sen=
d counter")
> Reported-by: syzbot+d1de830e4ecdaac83d89@syzkaller.appspotmail.com
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/net/wireguard/receive.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/rece=
ive.c
> index a176653c8861..d91383afb6e2 100644
> --- a/drivers/net/wireguard/receive.c
> +++ b/drivers/net/wireguard/receive.c
> @@ -251,7 +251,7 @@ static bool decrypt_packet(struct sk_buff *skb, struc=
t noise_keypair *keypair)
>
>         if (unlikely(!READ_ONCE(keypair->receiving.is_valid) ||
>                   wg_birthdate_has_expired(keypair->receiving.birthdate, =
REJECT_AFTER_TIME) ||
> -                 keypair->receiving_counter.counter >=3D REJECT_AFTER_ME=
SSAGES)) {
> +                 READ_ONCE(keypair->receiving_counter.counter) >=3D REJE=
CT_AFTER_MESSAGES)) {
>                 WRITE_ONCE(keypair->receiving.is_valid, false);
>                 return false;
>         }
> @@ -318,7 +318,7 @@ static bool counter_validate(struct noise_replay_coun=
ter *counter, u64 their_cou
>                 for (i =3D 1; i <=3D top; ++i)
>                         counter->backtrack[(i + index_current) &
>                                 ((COUNTER_BITS_TOTAL / BITS_PER_LONG) - 1=
)] =3D 0;
> -               counter->counter =3D their_counter;
> +               WRITE_ONCE(counter->counter, their_counter);
>         }
>
>         index &=3D (COUNTER_BITS_TOTAL / BITS_PER_LONG) - 1;

It seems you forgot to add this as well ?

diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receiv=
e.c
index a176653c88616b1bc871fe52fcea778b5e189f69..a1493c94cea042165f8523a4dac=
573800a6d03c4
100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -463,7 +463,7 @@ int wg_packet_rx_poll(struct napi_struct *napi, int bud=
get)
                        net_dbg_ratelimited("%s: Packet has invalid
nonce %llu (max %llu)\n",
                                            peer->device->dev->name,
                                            PACKET_CB(skb)->nonce,
-                                           keypair->receiving_counter.coun=
ter);
+
READ_ONCE(keypair->receiving_counter.counter));
                        goto next;
                }

Thanks.
