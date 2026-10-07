Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64628CA5FFF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Oct 2026 10:21:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 10e8c645;
	Wed, 7 Oct 2026 10:21:50 +0000 (UTC)
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 306bcc3d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Oct 2026 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
 s=mail; t=1791368505;
 bh=mnquiU0nh1N+nAlOZCiLVvTbgJdJXeG9VPjLqlB5qi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=FyBQ2WVshf8W8SEogz58zJ8teMQ3G5GZD8LQrgGAmZ0JJhdBYtXOS9R9XehfFqbYl
 WFgl58gRKqY1y0P31/Rp37bD5cWEi0k/kapCRqbFcbNrDP6ehJL30MRlY+3skZUYrg
 inecCglYKS2rr1PU2bOO7/SE+FtSt9d1MEOQjHkE=
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
 (Authenticated sender: d@ilvokhin.com)
 by mail.ilvokhin.com (Postfix) with ESMTPSA id A015AF2249;
 Wed, 07 Oct 2026 10:21:45 +0000 (UTC)
Date: Wed, 7 Oct 2026 10:21:42 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: darwin: fix set_dns() and del_dns() race
Message-ID: <asYdNuvLW2FG_3BK@shell.ilvokhin.com>
References: <20260930103041.102065-1-d@ilvokhin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930103041.102065-1-d@ilvokhin.com>
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

On Wed, Sep 30, 2026 at 10:30:41AM +0000, Dmitry Ilvokhin wrote:
> The monitor deamon restores the DNS servers by running del_dns() from
> its INT, TERM and EXIT trap. Every route event also schedules an ALRM 2
> seconds later, and the ALRM trap runs set_dns().
> 
> If ALRM arrives during cleanup, set_dns() can run in the middle of
> del_dns(), and the DNS servers may not be restored after the WireGuard
> interface is removed.
> 
> Ignore ALRM in cleanup signal handler to avoid this race.
> 
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
> ---
> Resending the patch, since mailing list didn't accept it first time,
> because I was not a member of the list.

Hello Jason,

Any thoughts on the patch?

I applied this patch locally, tested it for a few weeks and never hit
the race again. I'd love to get the fix upstream.
