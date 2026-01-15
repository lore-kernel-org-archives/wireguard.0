Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22578EF06E3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 17:21:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f167e1b5;
	Sun, 8 Feb 2026 17:10:40 +0000 (UTC)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [2001:41d0:1004:224b::ab])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 442a13e8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Jan 2026 05:12:39 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1768453959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uqs9U/83nmbmyG5rORjd6RhV9BLTO6XkyhyTLqEtIPI=;
 b=ft7+OiKmZSln0rUGSulTMpwBOK0SEf2j8L/gFLCN5kTbvOEqrZVeVvGpZLhhSpeaj8ldvC
 cOvs605VONB1EjnuLgaUdPvIp6RQe/sDpkx+HcIt6quKykO3peqZBkGBwAAH+3jYX8h8Bp
 tNWz9xMhlwdxBVVimlWxgDg85uoLZbc=
From: Fushuai Wang <fushuai.wang@linux.dev>
To: kuba@kernel.org
Cc: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, fushuai.wang@linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, vadim.fedorenko@linux.dev,
 wangfushuai@baidu.com, wireguard@lists.zx2c4.com
Subject: Re: [PATCH net-next v3] wireguard: allowedips: Use kfree_rcu()
 instead of call_rcu()
Date: Thu, 15 Jan 2026 13:12:21 +0800
Message-Id: <20260115051221.68054-1-fushuai.wang@linux.dev>
In-Reply-To: <20260115033237.1545400-1-kuba@kernel.org>
References: <20260115033237.1545400-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:10:11 +0000
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

>> @@ -271,13 +266,13 @@ static void remove_node(struct allowedips_node *node, struct mutex *lock)
>>  	if (free_parent)
>>  		child = rcu_dereference_protected(parent->bit[!(node->parent_bit_packed & 1)],
>>  						  lockdep_is_held(lock));
>> -	call_rcu(&node->rcu, node_free_rcu);
>> +	kfree_rcu(node, rcu);
> 
> Does wg_allowedips_slab_uninit() need to be updated to use
> kvfree_rcu_barrier() instead of rcu_barrier()?
> 
> When CONFIG_KVFREE_RCU_BATCHED is enabled (the default), kfree_rcu()
> uses a batched mechanism that queues work via queue_rcu_work(). The
> rcu_barrier() call waits for RCU callbacks to complete, but these
> callbacks only queue the actual free to a workqueue via rcu_work_rcufn().
> The workqueue work that calls kvfree() may still be pending after
> rcu_barrier() returns.
> 
> The existing cleanup path is:
>   wg_allowedips_slab_uninit() -> rcu_barrier() -> kmem_cache_destroy()
> 
> With kfree_rcu(), this sequence could destroy the slab cache while
> kfree_rcu_work() still has pending frees queued. The proper barrier for
> kfree_rcu() is kvfree_rcu_barrier() which also calls flush_rcu_work()
> on all pending batches.

We do not need to add an explict kvfree_rcu_barrier(), becasue the commit
6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()")
already does it.

---
Regards,
WANG
