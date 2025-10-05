Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F26CAC5BB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Oct 2025 13:07:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61219a50;
	Sun, 5 Oct 2025 13:04:48 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cf4d66fa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Oct 2025 13:04:46 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4da3019b6b6so37792791cf.3
 for <wireguard@lists.zx2c4.com>; Sun, 05 Oct 2025 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759669485; x=1760274285; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+RJQKjQrFkOXYT+itRREJcbwRQ3We70gB/GA7XkcNY=;
 b=qWYlTvqnjk9E2c5T1MkrUYKYuu3fobnVoaKMoKzKVPm6i6Xqpr8oURLuMXCEoPDr1e
 AHx39kuIY4+lDpVYcrwhwEJB3aashbpFFidvPPy7aIEKDcxs2hh/f2vbfMfvJ4RUox7M
 DYwsqtCzihRd4dqVZrLPWhiWqbxG4xpwax/w+vO/siSoQBXu2xKrByLCHHULTLZaH/7y
 pQwvpieJbG1ebLeymG+gInYR0yvxKtPhAShSUwEnPgJ8Vtdi8GjznFrroRTO94SUuYme
 clMHsfPkTfampalq0pHsXn0qGzucYvZLaO6sf8+hZJtNKRkAF2plxQGF46fP0r4EU/N8
 Yqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759669485; x=1760274285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+RJQKjQrFkOXYT+itRREJcbwRQ3We70gB/GA7XkcNY=;
 b=xSI6T2LvVyrgMHdvBPK5kqnNaxjscELaNTu/QoAwxj3jG0dmoukPUEj5JFuGRbR5En
 HAkqcUfCzmUl/sIyhsoH5eqy72eBqoKarkk+SRT+3w3fgu+sm9JOHYx7tZxja1Ou8Poz
 DSl9y9eFW5IikvWvyXReFq6MEYTWUwafJkd0okBXsmPcZCQVD7lSDsGRVwSdRcTa/icj
 lRUH2ewiFwDgtBkAVjzH84UE5Cnv6plaO4pfs9JDVtf6iEX1o6A3+ADMsPz+mj4M4pvF
 Gnyo8LTXap9QJJOq0i19tgsixE2nqLfrgle3hO+j+Nj5tAgMQnyVG4zMrQmMeirrI6X5
 0ZVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPATuBKZ1axblMJLDtalI5fPwV6ljnierhvpRXnPFI+EU8zvs3VbriT/5z6Za46nznFN7h5bkuORw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzq5lhbOTn0hFpGW6lOvzk97lFmD1ty9+GNZp+NnWKy9DM0+Xtp
 Zm4BwcEixPAJfclCGwoIk706f8gtcVABy4JU3IyPY4nytRaSqu9bJa4ltmt6g/GobN/G/zj4bDN
 OIHJ8MpbP3xdfHXJLMsFHmrwb+HiQE0dyIHB8G6Hi
X-Gm-Gg: ASbGncuDKHHpjXzByTkZ0xB4zvmFVIrLM+S0n+3pRZQMOTMyQiTUk2UMaDHGpUQTJND
 wIiHkPL9S80fFEw3LcfCgh38Hj8aCqonIFqk/lV6ZGLvw67clHgBZ7xchA62OqIqwHst9blssBk
 DPoGg01qjDCFokyPXxV0rXAwCW801rWZynv2azK+0hGVJdVk/GmGVWmsWqJO8MhyarXuJpoI1KH
 oNvN8AHgSZSjHQkZ65XCmmXzgsnpGP04RIy+HGsUWPguMyV
X-Google-Smtp-Source: AGHT+IGPsbMcZU+vFeo9ZAmXgvwpBCCrndDdbMORhec+3i6dz7273LfwEIxnyR+I3xhjhE1r1jbPhGJsmb1RmGw5LpA=
X-Received: by 2002:a05:622a:1885:b0:4b7:90e2:40df with SMTP id
 d75a77b69052e-4e576a44e99mr114292601cf.1.1759669484326; Sun, 05 Oct 2025
 06:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251005122626.26988-1-wangfushuai@baidu.com>
In-Reply-To: <20251005122626.26988-1-wangfushuai@baidu.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 5 Oct 2025 06:04:31 -0700
X-Gm-Features: AS18NWAzrupW0HYnpOxSwBwRSmRYD-ffu1xxO0-ekzBqui4Dt-9D_s306e6ZH0E
Message-ID: <CANn89iJs+Y7Ge2sbAOQSsuE6O1GbxuHbNrFxBO0fq1C3HOfxPA@mail.gmail.com>
Subject: Re: [PATCH] wireguard: allowedips: Use kfree_rcu() instead of
 call_rcu()
To: Fushuai Wang <wangfushuai@baidu.com>
Cc: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 kuba@kernel.org, pabeni@redhat.com, wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sun, Oct 5, 2025 at 5:26=E2=80=AFAM Fushuai Wang <wangfushuai@baidu.com>=
 wrote:
>
> Replace call_rcu() + kmem_cache_free() with kfree_rcu() to simplify
> the code and reduce function size.
>
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>

Hmm... have you compiled this patch ?

I think  all compilers would complain loudly.

> ---
>  drivers/net/wireguard/allowedips.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/a=
llowedips.c
> index 09f7fcd7da78..506f7cf0d7cf 100644
> --- a/drivers/net/wireguard/allowedips.c
> +++ b/drivers/net/wireguard/allowedips.c
> @@ -48,11 +48,6 @@ static void push_rcu(struct allowedips_node **stack,
>         }
>  }
>
> -static void node_free_rcu(struct rcu_head *rcu)
> -{
> -       kmem_cache_free(node_cache, container_of(rcu, struct allowedips_n=
ode, rcu));
> -}
> -
>  static void root_free_rcu(struct rcu_head *rcu)
>  {
>         struct allowedips_node *node, *stack[MAX_ALLOWEDIPS_DEPTH] =3D {
> @@ -271,13 +266,13 @@ static void remove_node(struct allowedips_node *nod=
e, struct mutex *lock)
>         if (free_parent)
>                 child =3D rcu_dereference_protected(parent->bit[!(node->p=
arent_bit_packed & 1)],
>                                                   lockdep_is_held(lock));
> -       call_rcu(&node->rcu, node_free_rcu);
> +       kfree_rcu(&node, rcu);

kfree_rcu(node, rcu);

>         if (!free_parent)
>                 return;
>         if (child)
>                 child->parent_bit_packed =3D parent->parent_bit_packed;
>         *(struct allowedips_node **)(parent->parent_bit_packed & ~3UL) =
=3D child;
> -       call_rcu(&parent->rcu, node_free_rcu);
> +       kfree_rcu(&parent, rcu);

kfree_rcu(parent, rcu);

>  }
>
>  static int remove(struct allowedips_node __rcu **trie, u8 bits, const u8=
 *key,
> --
> 2.36.1
>
