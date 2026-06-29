Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8EBCA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 062f9fa8;
	Mon, 5 Oct 2026 06:56:24 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6c1789ce
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2026 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=/AfarInOXZoQttS9XdojiWOifGGDVIjOfnZjpbVuMLA=; b=CyjnYNT+ZnESbXQF1Svd7WQk8f
 uBfbEKyFXVd8qGyQUVAWVUauOKMpiUSWKR8JqGQGCVPlYAJ2fGTlieuDmb61VQsSsr4uaEvVHE9R6
 SyStUQKj1dUeUloX6PkK/z8ohPeKVC+Tg0y/12ctqnEVt2iRiOb0QD9/ZfYb2GCVqtts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1weDKu-009m0c-7X; Mon, 29 Jun 2026 16:51:48 +0200
Date: Mon, 29 Jun 2026 16:51:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rafael Passos <rafael@rcpassos.me>
Cc: andrew+netdev@lunn.ch, tytso@mit.edu, Jason@zx2c4.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 syzbot+9ca7674fa7521a3f1bc2@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Subject: Re: [PATCH v2] Wireguard: Fix data-race in rx/tx counter
Message-ID: <b8155b00-ce06-49de-a283-3db4dbc0c99c@lunn.ch>
References: <DJL786MPR9HO.BWHI3U37PDVM@rcpassos.me>
 <20260629125913.2354450-1-rafael@rcpassos.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629125913.2354450-1-rafael@rcpassos.me>
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

> When looking around drivers/net, I found a few u64_stats uses without
> per-cpu. I will do some digging to understand the reasoning behind it,
> compared to the original "bare u64 counters" in wireguard.

/*
 * Protect against 64-bit values tearing on 32-bit architectures. This is
 * typically used for statistics read/update in different subsystems.

The assumption is, updating a 64 bit value on a 64 bit machine is a
single operation. You either see the old value, or the new value. For
statistics counters, we general don't care about valid but slightly
outdated values.

On a 32 bit machine, updating a 64 bit value requires up to two reads
and two writes. So if a reader and a writer operate at the same time,
the reader might see one of the invalid intermediary states, also know
as tearing. We do care about a totally wrong value.

u64_stats_sync.h gives you a mechanism which is totally free on 64bit
systems, but gives the needed protection on 32 bit systems to avoid
seeing tears.

You only need mutual exclusion on the writer side, from other
writers. If you have per-cpu counters, you naturally get mutual
exclusion, the CPU cannot be a writer twice to its own per CPU
counters. However, without per-CPU counters, you need some form of
locking. I don't know the locking used in wireguard, it might already
be in place? If so, this would be a cheap solution.

	Andrew
