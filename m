Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1AED44C51
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Jan 2026 14:35:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab2f666a;
	Thu, 15 Jan 2026 14:33:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6ad934c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Jan 2026 14:33:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D92B160128
 for <wireguard@lists.zx2c4.com>; Thu, 15 Jan 2026 14:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5076DC19423
 for <wireguard@lists.zx2c4.com>; Thu, 15 Jan 2026 14:33:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hB+Tg+9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1768487630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puVYZ6ntPN6hFvEqttknJOK7T6Kh44cVv1NhFCJjVaw=;
 b=hB+Tg+9f6rUXMn2ykTVGX21ss7Qr2zMZ1+WP2YhUFNWwhxEWShlgPgBLvIZwYLKt1wTaaA
 NZCcbcBPipIHJkpIyyYfCmX2rMaAWnDxn0qRNRmhvgcNwji6fA7rQs4CeqnHk19T+riTG1
 0eLkV+gW6/BrIrMNQ5Sq/i8e/j/JUqo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 540f9b04
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Jan 2026 14:33:49 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7cfd6e0173cso443864a34.3
 for <wireguard@lists.zx2c4.com>; Thu, 15 Jan 2026 06:33:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXXemV5fTYNjMiQ7Ux0FeHU8oziVz+7VOgVucr8kVyek5CeDmAQ+QErD+QPEcxZWY0LsfT3Hjp2Nos=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwFghzvtNXOHURaTRYxt/2dYK4khrYvdCxhqK0ECcXT593HnEWZ
 oq6ITYnaEkeqiE0HBBeyou4KnizMUoKAaqHpSrggWCCs7Rd+SaE9V+r0QtLC+ZAcQg05CVqDnlf
 kJzVSLZ862lPwpdYWVkyJre6eFKZUgBU=
X-Received: by 2002:a05:6830:4408:b0:7bc:6cc3:a624 with SMTP id
 46e09a7af769-7cfc8b69bd1mr4946386a34.32.1768487628292; Thu, 15 Jan 2026
 06:33:48 -0800 (PST)
MIME-Version: 1.0
References: <20260115033237.1545400-1-kuba@kernel.org>
 <20260115051221.68054-1-fushuai.wang@linux.dev>
 <CANn89iKfuXjqKsn+xB6bpGOaqM7pN4ZcRJ=2KJg4WY76ArYXhQ@mail.gmail.com>
In-Reply-To: <CANn89iKfuXjqKsn+xB6bpGOaqM7pN4ZcRJ=2KJg4WY76ArYXhQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 15 Jan 2026 15:33:42 +0100
X-Gmail-Original-Message-ID: <CAHmME9quqMVzD5zSEKvOFOYj3QLANAo2iYeqWQ1toV0C7gJXTg@mail.gmail.com>
X-Gm-Features: AZwV_Qgs49WZRh6E-yqe5lqzG8HY34Jy6O9o1SJKl4M8EfIBEY_spLptdahY4Ps
Message-ID: <CAHmME9quqMVzD5zSEKvOFOYj3QLANAo2iYeqWQ1toV0C7gJXTg@mail.gmail.com>
Subject: Re: [PATCH net-next v3] wireguard: allowedips: Use kfree_rcu()
 instead of call_rcu()
To: Eric Dumazet <edumazet@google.com>
Cc: Fushuai Wang <fushuai.wang@linux.dev>, kuba@kernel.org,
 andrew+netdev@lunn.ch, 
 davem@davemloft.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 pabeni@redhat.com, vadim.fedorenko@linux.dev, wangfushuai@baidu.com, 
 wireguard@lists.zx2c4.com
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

Hi Eric,

On Thu, Jan 15, 2026 at 10:15=E2=80=AFAM Eric Dumazet <edumazet@google.com>=
 wrote:
> > > The existing cleanup path is:
> > >   wg_allowedips_slab_uninit() -> rcu_barrier() -> kmem_cache_destroy(=
)
> > >
> > > With kfree_rcu(), this sequence could destroy the slab cache while
> > > kfree_rcu_work() still has pending frees queued. The proper barrier f=
or
> > > kfree_rcu() is kvfree_rcu_barrier() which also calls flush_rcu_work()
> > > on all pending batches.
> >
> > We do not need to add an explict kvfree_rcu_barrier(), becasue the comm=
it
> > 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_dest=
roy()")
> > already does it.
>
> It was doing it, but got replaced recently with a plain rcu_barrier()
>
> commit 0f35040de59371ad542b915d7b91176c9910dadc
> Author: Harry Yoo <harry.yoo@oracle.com>
> Date:   Mon Dec 8 00:41:47 2025 +0900
>
>     mm/slab: introduce kvfree_rcu_barrier_on_cache() for cache destructio=
n
>
> We would like explicit +2 from mm _and_ rcu experts on this wireguard pat=
ch.

I'll take this through the wireguard tree.

But just a question on your comment, "It was doing it, but got
replaced recently with a plain rcu_barrier()". Are you suggesting I
need a kvfree_rcu_barrier() instead? The latest net-next has a
kvfree_rcu_barrier_on_cache() called from kmem_cache_destroy()
still... But are you suggesting I add this anyway?

diff --git a/drivers/net/wireguard/allowedips.c
b/drivers/net/wireguard/allowedips.c
index 5ece9acad64d..aee39a0303b0 100644
--- a/drivers/net/wireguard/allowedips.c
+++ b/drivers/net/wireguard/allowedips.c
@@ -417,7 +417,7 @@ int __init wg_allowedips_slab_init(void)

 void wg_allowedips_slab_uninit(void)
 {
- rcu_barrier();
+ kvfree_rcu_barrier();
  kmem_cache_destroy(node_cache);
 }

Let me know.

Thanks,
Jason
