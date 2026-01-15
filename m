Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BF1D3CCA8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Jan 2026 03:33:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb616990;
	Thu, 15 Jan 2026 03:33:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d3e29c47
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Jan 2026 03:33:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0004A4326E;
 Thu, 15 Jan 2026 03:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506A3C4CEF7;
 Thu, 15 Jan 2026 03:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768448007;
 bh=8Ymc27CFNVZ9pjs4dlypKvNfcqUnbSbMf8iST/L3RDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NP072mEyDTP0cKPX4iQ/zWTo3ZK02QGLeffLuBEclBtAUkssE7NRMPgmepfgrMpiu
 gQMQeqvNsp0jivjf2O/hFQWYjcEOINzpjfhxsT3zsE1xtC1cdq3qXb1iFmIugexGa0
 OmrJCxIxw66q8ha/WR7RFFECub/G92MGylWBj4ccZHr3FtUR8Z+cXZS7UUXf1+N1Yg
 MU//GxOW8E4W9g/DvQpwOroZI2fIC87Tgt9Lk6RWGkAD4pkjOS+rHqy5+oyd3IBTid
 sIZC5gF2UQ3JmVMhDGDVFadYCZ0/3MCzSlZMK/wuMx/a/VECNe6RYtXRVYKbVz0o/I
 BRdcSiHbivpiA==
From: Jakub Kicinski <kuba@kernel.org>
To: fushuai.wang@linux.dev
Cc: Jakub Kicinski <kuba@kernel.org>, andrew+netdev@lunn.ch,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 vadim.fedorenko@linux.dev, Jason@zx2c4.com, wireguard@lists.zx2c4.com,
 wangfushuai@baidu.com
Subject: Re: [net-next,
 v3] wireguard: allowedips: Use kfree_rcu() instead of call_rcu()
Date: Wed, 14 Jan 2026 19:32:37 -0800
Message-ID: <20260115033237.1545400-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112130633.25563-1-fushuai.wang@linux.dev>
References: <20260112130633.25563-1-fushuai.wang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least pausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
wireguard: allowedips: Use kfree_rcu() instead of call_rcu()

This commit replaces call_rcu() with a custom kmem_cache_free() callback
with kfree_rcu() to simplify the code. The change affects how nodes are
freed in the remove_node() function.

> diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> index 09f7fcd7da78..5ece9acad64d 100644
> --- a/drivers/net/wireguard/allowedips.c
> +++ b/drivers/net/wireguard/allowedips.c
> @@ -48,11 +48,6 @@ static void push_rcu(struct allowedips_node **stack,
>  	}
>  }
>
> -static void node_free_rcu(struct rcu_head *rcu)
> -{
> -	kmem_cache_free(node_cache, container_of(rcu, struct allowedips_node, rcu));
> -}
> -

[ ... ]

> @@ -271,13 +266,13 @@ static void remove_node(struct allowedips_node *node, struct mutex *lock)
>  	if (free_parent)
>  		child = rcu_dereference_protected(parent->bit[!(node->parent_bit_packed & 1)],
>  						  lockdep_is_held(lock));
> -	call_rcu(&node->rcu, node_free_rcu);
> +	kfree_rcu(node, rcu);

Does wg_allowedips_slab_uninit() need to be updated to use
kvfree_rcu_barrier() instead of rcu_barrier()?

When CONFIG_KVFREE_RCU_BATCHED is enabled (the default), kfree_rcu()
uses a batched mechanism that queues work via queue_rcu_work(). The
rcu_barrier() call waits for RCU callbacks to complete, but these
callbacks only queue the actual free to a workqueue via rcu_work_rcufn().
The workqueue work that calls kvfree() may still be pending after
rcu_barrier() returns.

The existing cleanup path is:
  wg_allowedips_slab_uninit() -> rcu_barrier() -> kmem_cache_destroy()

With kfree_rcu(), this sequence could destroy the slab cache while
kfree_rcu_work() still has pending frees queued. The proper barrier for
kfree_rcu() is kvfree_rcu_barrier() which also calls flush_rcu_work()
on all pending batches.

>  	if (!free_parent)
>  		return;
>  	if (child)
>  		child->parent_bit_packed = parent->parent_bit_packed;
>  	*(struct allowedips_node **)(parent->parent_bit_packed & ~3UL) = child;
> -	call_rcu(&parent->rcu, node_free_rcu);
> +	kfree_rcu(parent, rcu);
>  }
-- 
pw-bot: cr
