Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11283F34C5E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Apr 2026 15:01:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f883731c;
	Mon, 13 Apr 2026 15:01:18 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2a298b5c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Apr 2026 15:01:14 +0000 (UTC)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-354c44bf176so4376521a91.0
 for <wireguard@lists.zx2c4.com>; Mon, 13 Apr 2026 08:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776092473; x=1776697273;
 h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AlSroUvQLnPQy/vliop0r/9IQklxRKU38FSvvT0IkJU=;
 b=UlEv+/dKQreXgLg2WzdhP8i6pj2rW0Yi6y4qB1GD70v9NfQWDzcEcIbe0E3hk5aT3h
 PP/hm8EujXejr3dwcSaWtg4P8vpZEfWoWOapmKtCo2zKRF1IHdoX4L4/BvLPoOjWd9y2
 lJi9YRIQxXiatK69AYk/Y28EG/LW2btNJwxTpBIRsKVy2Z3ZY4fir3K/iWu1sp+w7MOS
 8k5ApHlWjTRWd7/bpy41MYf4+bH45LsCPrm/PxHKqGuZzR7eSJjM+YMgw45GNcWNDTbP
 WuCs6I5LwWr7zKjO3rmJwBivDe9kz3JGvWxDMsVtv+U9nhmTpgncmRTahbEpWUp0XEMZ
 AwjQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HuDceVKIwqywjIxMGyou2b/DzL4QqJoVjEBnzEKQXOlMtn/FPNetR0kH4ztz4yv7vlj2CZXmnTQM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwT/cudZH+bfL41Vpb5U66Pp33KCCyeveA0wk0Hf7MMGI//iJtK
 QPqdoZQmgtBdnH2tQg5VxAnZ8lFlonumkZ7mKxagKeVgDwo6y+8WQMgFGzU/Ujm1Jj9bvFdWB8b
 3kl2XYB+fsPK1OxSyUMf0XueX9rQfXstwod/yonRfzTTDccv7uPahe4wj3W8=
MIME-Version: 1.0
X-Received: by 2002:a17:90b:28c4:b0:35f:b69d:7292 with SMTP id
 98e67ed59e1d1-35fb69d7632mr3809862a91.15.1776092472566; Mon, 13 Apr 2026
 08:01:12 -0700 (PDT)
Date: Mon, 13 Apr 2026 08:01:12 -0700
In-Reply-To: <20260413150024.1003490-1-shardul.b@mpiricsoftware.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69dd0538.a00a0220.468cb.0049.GAE@google.com>
Subject: Re: [PATCH] wireguard: device: use exit_rtnl callback instead of
 manual rtnl_lock in pre_exit
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: shardul.b@mpiricsoftware.com
Cc: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, janak@mpiric.us, 
 jason@zx2c4.com, kalpan.jani@mpiricsoftware.com, kuba@kernel.org, 
 kuniyu@google.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 pabeni@redhat.com, shardul.b@mpiricsoftware.com, shardulsb08@gmail.com, 
 wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

> wg_netns_pre_exit() manually acquires rtnl_lock() inside the
> pernet .pre_exit callback.  This causes a hung task when another
> thread holds rtnl_mutex - the cleanup_net workqueue (or the
> setup_net failure rollback path) blocks indefinitely in
> wg_netns_pre_exit() waiting to acquire the lock.
>
> Convert to .exit_rtnl, introduced in commit 7a60d91c690b ("net:
> Add ->exit_rtnl() hook to struct pernet_operations."), where the
> framework already holds RTNL and batches all callbacks under a
> single rtnl_lock()/rtnl_unlock() pair, eliminating the contention
> window.
>
> The rcu_assign_pointer(wg->creating_net, NULL) is safe to move
> from .pre_exit to .exit_rtnl (which runs after synchronize_rcu())
> because all RCU readers of creating_net either use maybe_get_net()
> - which returns NULL for a dying namespace with zero refcount - or
> access net->user_ns which remains valid throughout the entire
> ops_undo_list sequence.
>
> Reported-by: syzbot+pFBD3bslSSshiJCd3rxy@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?id=cb64c22a492202ca929e18262fdb8cb89e635c70
> Signed-off-by: Shardul Bankar <shardul.b@mpiricsoftware.com>
> ---
>  drivers/net/wireguard/device.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
> index 46a71ec36af8..eb854c5294a3 100644
> --- a/drivers/net/wireguard/device.c
> +++ b/drivers/net/wireguard/device.c
> @@ -411,12 +411,11 @@ static struct rtnl_link_ops link_ops __read_mostly = {
>  	.newlink		= wg_newlink,
>  };
>  
> -static void wg_netns_pre_exit(struct net *net)
> +static void wg_netns_exit_rtnl(struct net *net, struct list_head *dev_kill_list)
>  {
>  	struct wg_device *wg;
>  	struct wg_peer *peer;
>  
> -	rtnl_lock();
>  	list_for_each_entry(wg, &device_list, device_list) {
>  		if (rcu_access_pointer(wg->creating_net) == net) {
>  			pr_debug("%s: Creating namespace exiting\n", wg->dev->name);
> @@ -429,11 +428,10 @@ static void wg_netns_pre_exit(struct net *net)
>  			mutex_unlock(&wg->device_update_lock);
>  		}
>  	}
> -	rtnl_unlock();
>  }
>  
>  static struct pernet_operations pernet_ops = {
> -	.pre_exit = wg_netns_pre_exit
> +	.exit_rtnl = wg_netns_exit_rtnl
>  };
>  
>  int __init wg_device_init(void)
> -- 
> 2.34.1
>

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.

