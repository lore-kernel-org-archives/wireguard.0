Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29CDCA5FFC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 07:32:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 58e40ba0;
	Mon, 5 Oct 2026 06:56:20 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6952ae38
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 28 Jun 2026 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=UdPVrGBsfiuqpekwBYy0Es3XVPiPzRaFs+oHp2F9b7E=; b=DP3DyreI+7yUlA/LxYAXw/5+Ka
 U/DI5iIEnr2wYYd20XmdK/lgC8rSXxhEgY03rTeHC5TA1b9aq/9akJGhiXCzS86TEA6pnXsq3zyLW
 BY9RusdBe82e1w+9VdFFh5fQRQV45zTF/TraxXInApku/4SMj9JYQtb19Hz2CZBKhY/Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1wdwdh-009eJ8-6m; Sun, 28 Jun 2026 23:02:05 +0200
Date: Sun, 28 Jun 2026 23:02:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rafael Passos <rafael@rcpassos.me>
Cc: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com,
 syzbot+9ca7674fa7521a3f1bc2@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Subject: Re: [PATCH] Wireguard: Fix data-race in rx/tx counter
Message-ID: <aa423184-7465-4bc9-aff4-d3d671beb3c6@lunn.ch>
References: <DJFTVX3FE7OD.2O8GTO84798T@rcpassos.me>
 <20260628203823.144789-1-rafael@rcpassos.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628203823.144789-1-rafael@rcpassos.me>
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

On Sun, Jun 28, 2026 at 05:38:23PM -0300, Rafael Passos wrote:
> fixes data-race in {rx/tx}_bytes counter for wireguard connection.
> these values were incremented inside a read_lock_bh block, but write
> protections were missing. making them atomic was the simplest way out.
> This was found by syzbot with kcsan.
> 
> Reported-by: syzbot+9ca7674fa7521a3f1bc2@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=9ca7674fa7521a3f1bc2
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
> ---
> 
> Hi,
> 
> I am posting this patch to better ilustrate the discussion.
> If this is a non-issue, its fine.
> As I mentioned in the previous email, this issue was reported by syzbot,
> but I was not able to reproduce it.
> I am also aware atomic calls may introduce extra cost on older arm cpus.

Atomics are expensive in general, especially on high CPU count
systems. 

Statistic counters tend to be very asymmetric in usage. They are
incremented frequently, maybe per packet, but reported very
infrequently, maybe every minute when an SNMP agent reads them. So the
solution to statistic counters should reflect this. Increment should
be very cheap, reporting them can be expensive.

There are a few different solutions. Per CPU counters is
one. u64_stats_sync.h may help.

Please take a look at other drivers doing statistics. This is a solved
problem, you just need to copy bits of code from somewhere else.

      Andrew
