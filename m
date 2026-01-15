Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BA5D41149
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Jan 2026 09:15:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10560af9;
	Thu, 15 Jan 2026 09:15:51 +0000 (UTC)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id edc0f74a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Jan 2026 09:15:49 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-5014453a0faso6763371cf.1
 for <wireguard@lists.zx2c4.com>; Thu, 15 Jan 2026 01:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768468548; x=1769073348; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LJoalJ/bPq/SwT2K8wCn2gybGfkpq32wbnQ3LM3Vlc=;
 b=kcZwnRpIs5A4CimlY7XKW7biPJcgjWXRi7zAihLP1ltzYwOiwXY+NadkETZ55+jJeu
 lMAQpH8QuC9y6871+Z0SlK4cRLD4S4XTVRasyrgldahrPtQerJ9fIFPivbybrP+LOnq4
 n1aWQTImRiklGT1uzclpH3GBZpuOJepcu4TDrJkRjSJrnAxAGIN2UcQZM/t/El2rHu/G
 /Af1NMXquv8HHRXTdhwJH8VS9pYrcJWTXhTxvmljpZNkSgz0wSobqulPRxytgMnWCBaY
 leTw5WIEM9R1lvihxYMnVMthEWy6y86387aa1MJTyfGi6gY81r/NbLQPhJqW7MHLjiQz
 YsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768468548; x=1769073348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1LJoalJ/bPq/SwT2K8wCn2gybGfkpq32wbnQ3LM3Vlc=;
 b=xEvmpqftegShpCIxfMZJ6SbST0XeQ86H4hVSDFkvsSCTP/Unp7YHC2tkHm5f2v0w/O
 u51+ifHP4MOHWK9793BGpwIO04FpIwliXzPADliGRFP+kubVuBWgr08Qd9yPp8MTqKjb
 kmnND01XSr0Iq4/t2F2Sk+Ar+dSXrEs+zvIjwEJ2ubC1IoTqralO1y9Ga13+EIwLOaer
 tFRV3nny65keraWspq2f/VDe3kQfH34laIKZ9YAf4yFVYc7y5sImn+YuGIMZJ6W3Ee3x
 F+T0pfOiZ/1V6215AOSIgAWjLUArJrMTLKOT2Mk9ouQze9sPgqca7vDxzRcHFqTuszVU
 LyZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB3BHVF4G36JkIBM21QMyFVF+ygEZi5zrNJFdudHufrkuJAw3nNL+UNZWvinBWYm9RkcK1UW4VF5k=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz7jPrCfAckJK67ikuL/8yXXIe48zCkwLUv49nmCJhB8aPDfGCJ
 ELMLYgT+x3nrwnQJT3/5x0b5tHhLcrcJN2ul7cFBLlEzRdQkKBNHLnY84oBkHfA8FMG5Rxmf2xE
 3xsXbcXixZZiK9NT+h+GeAgij6GplLo7j1s7v2dRH
X-Gm-Gg: AY/fxX7Jk8OuqtL1QH58bnZXJZQoGAl/igzvdo20BagH3PI1ObzPkbg7sfILbe4WTKZ
 aKEb0O8F6DTI0jV+j1qcXZbLHFYVGodz063URBk2bcB+GUpp2uhB1z6AQB3YaLQxsSgur2AxcMb
 +q65cGtllhSefIqvqcRFwZeWXYAKG5BHNfZl8cUzpzxNksuPYjt9Ly1CWGbd8egTYixYPFwwMvN
 3LlSVxQkBTkXhaArHQIMCgbm9T6rSP8MuF/erbS1jVQvElZr/ITk6omweDcU6xlC5GvTg==
X-Received: by 2002:a05:622a:199b:b0:502:9bdc:57e1 with SMTP id
 d75a77b69052e-5029bdc598cmr6774851cf.2.1768468548067; Thu, 15 Jan 2026
 01:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20260115033237.1545400-1-kuba@kernel.org>
 <20260115051221.68054-1-fushuai.wang@linux.dev>
In-Reply-To: <20260115051221.68054-1-fushuai.wang@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 15 Jan 2026 10:15:36 +0100
X-Gm-Features: AZwV_QhTCMDKh5q0J0qjsf9QjxWK4VZqifJza4JSZzX25aIAu0asXhhTMuuhlKY
Message-ID: <CANn89iKfuXjqKsn+xB6bpGOaqM7pN4ZcRJ=2KJg4WY76ArYXhQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3] wireguard: allowedips: Use kfree_rcu()
 instead of call_rcu()
To: Fushuai Wang <fushuai.wang@linux.dev>
Cc: kuba@kernel.org, Jason@zx2c4.com, andrew+netdev@lunn.ch, 
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

On Thu, Jan 15, 2026 at 6:12=E2=80=AFAM Fushuai Wang <fushuai.wang@linux.de=
v> wrote:
>
> >> @@ -271,13 +266,13 @@ static void remove_node(struct allowedips_node *=
node, struct mutex *lock)
> >>      if (free_parent)
> >>              child =3D rcu_dereference_protected(parent->bit[!(node->p=
arent_bit_packed & 1)],
> >>                                                lockdep_is_held(lock));
> >> -    call_rcu(&node->rcu, node_free_rcu);
> >> +    kfree_rcu(node, rcu);
> >
> > Does wg_allowedips_slab_uninit() need to be updated to use
> > kvfree_rcu_barrier() instead of rcu_barrier()?
> >
> > When CONFIG_KVFREE_RCU_BATCHED is enabled (the default), kfree_rcu()
> > uses a batched mechanism that queues work via queue_rcu_work(). The
> > rcu_barrier() call waits for RCU callbacks to complete, but these
> > callbacks only queue the actual free to a workqueue via rcu_work_rcufn(=
).
> > The workqueue work that calls kvfree() may still be pending after
> > rcu_barrier() returns.
> >
> > The existing cleanup path is:
> >   wg_allowedips_slab_uninit() -> rcu_barrier() -> kmem_cache_destroy()
> >
> > With kfree_rcu(), this sequence could destroy the slab cache while
> > kfree_rcu_work() still has pending frees queued. The proper barrier for
> > kfree_rcu() is kvfree_rcu_barrier() which also calls flush_rcu_work()
> > on all pending batches.
>
> We do not need to add an explict kvfree_rcu_barrier(), becasue the commit
> 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destro=
y()")
> already does it.

It was doing it, but got replaced recently with a plain rcu_barrier()

commit 0f35040de59371ad542b915d7b91176c9910dadc
Author: Harry Yoo <harry.yoo@oracle.com>
Date:   Mon Dec 8 00:41:47 2025 +0900

    mm/slab: introduce kvfree_rcu_barrier_on_cache() for cache destruction

We would like explicit +2 from mm _and_ rcu experts on this wireguard patch=
.

Thank you.
