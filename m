Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C0BF9D0CA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2026 13:29:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d1f39581;
	Tue, 14 Apr 2026 13:28:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cb10718c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2026 13:28:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A9DB743F25
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2026 13:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51053C19425
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2026 13:28:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mPCTrtam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1776173330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oA89sTD5YxYL/+yk9WfECH2uN8yoVEYYQe2R4s4QMK0=;
 b=mPCTrtamuZ5SwkVUV9Br4MP7+TQAcFXXjg9fj2LDNrDDgqKnTQzY5xlOHj3N/xjYp7KNyC
 4+481eF+Ztm6zwyWhAzCNUMjV1bV5ZcQqeRMOHsXtgpUq62r3O/S6YOtNltoNmWnbsEDWl
 y2QdWbLjTOcR37whVF8ev1F/AXq/f4s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d5f7df62
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2026 13:28:49 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-47018d34159so4014739b6e.2
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2026 06:28:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ8C+iQY+vXGf5Wormso3U6Erriy7RCvjGD/3qrhKn6pRIvbfQSPBl+lvVa6wHF3EY6zgmwntRI4w5Y=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwhMJBFuZ2ehlDld/bUVOUfT1eoIIpF9yldrtBfEG3vcSTdOPHT
 XogUpZBaUXLQAPFgWLA7TMl7TtaxIQFJkBWIcaJckwHBYTWlfd19pYIi/lmy3kOscvb6Akr3HLC
 8l+TVSVKrsrP9Jj9Ip3fIYVneVLn8d2Y=
X-Received: by 2002:a05:6808:518e:b0:462:aa0f:4375 with SMTP id
 5614622812f47-4789f20b19fmr8732029b6e.39.1776173328337; Tue, 14 Apr 2026
 06:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260413151232.1004611-1-shardul.b@mpiricsoftware.com>
In-Reply-To: <20260413151232.1004611-1-shardul.b@mpiricsoftware.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 14 Apr 2026 15:28:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9oXoXykXq_emkA3v8nG2VR28CmRP2+WmhrvGJc0ZbPfpA@mail.gmail.com>
X-Gm-Features: AQROBzD8reYvNXiQg2DJuP8iLuSIf1CWlszs50_8P6eG8mLGfkZRXcPija3v4gQ
Message-ID: <CAHmME9oXoXykXq_emkA3v8nG2VR28CmRP2+WmhrvGJc0ZbPfpA@mail.gmail.com>
Subject: Re: [PATCH v2] wireguard: device: use exit_rtnl callback instead of
 manual rtnl_lock in pre_exit
To: Shardul Bankar <shardul.b@mpiricsoftware.com>
Cc: kuniyu@google.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, janak@mpiric.us, kalpan.jani@mpiricsoftware.com, 
 shardulsb08@gmail.com, syzbot+f2fbf7478a35a94c8b7c@syzkaller.appspotmail.com
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

Hi Shardul,

On Mon, Apr 13, 2026 at 5:13=E2=80=AFPM Shardul Bankar
<shardul.b@mpiricsoftware.com> wrote:
>
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
> Reported-by: syzbot+f2fbf7478a35a94c8b7c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?id=3Dcb64c22a492202ca929e18262f=
db8cb89e635c70
> Signed-off-by: Shardul Bankar <shardul.b@mpiricsoftware.com>

Thanks. Applied to the wireguard tree, and also added the missing
__net_exit and __read_mostly annotations in the process.

Jason
