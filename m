Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C89BC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 19:49:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 203c134c;
	Thu, 30 Jun 2022 19:49:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1de5566c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 19:49:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23170622DA;
 Thu, 30 Jun 2022 19:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EB3C34115;
 Thu, 30 Jun 2022 19:49:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="EG4WL/Zm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656618568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GRQOgseJsjlGCjwiVUpaQ9qdmIJEy/G5oWcB1T2bRMs=;
 b=EG4WL/ZmP1tBUTCf3y4mcpiroKBGDQFCS77y1nx7Ow4M2TM3JCJVjBNlbLjuT3e9sUgOMA
 TEF5V2e1t6j/+uAoR8AaSEEfI1WlehbtAlzu3mBKuHjaT5jYTp+kpmGv8yOalL2HxBVDWr
 m8Xh5oGX8B4AGcAXTpFG+ctazSMxshA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e7d677a8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 30 Jun 2022 19:49:27 +0000 (UTC)
Date: Thu, 30 Jun 2022 21:49:24 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: jstultz@google.com, paulmck@kernel.org, rostedt@goodmis.org,
 rafael@kernel.org, hch@infradead.org, saravanak@google.com,
 tjmercier@google.com, surenb@google.com, kernel-team@android.com,
 Theodore Ts'o <tytso@mit.edu>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] pm/sleep: Add PM_USERSPACE_AUTOSLEEP Kconfig
Message-ID: <Yr3+RLhpp3g9A7vb@zx2c4.com>
References: <20220630191230.235306-1-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220630191230.235306-1-kaleshsingh@google.com>
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

Hi Kalesh,

On Thu, Jun 30, 2022 at 07:12:29PM +0000, Kalesh Singh wrote:
> Systems that initiate frequent suspend/resume from userspace
> can make the kernel aware by enabling PM_USERSPACE_AUTOSLEEP
> config.
> 
> This allows for certain sleep-sensitive code (wireguard/rng) to
> decide on what preparatory work should be performed (or not) in
> their pm_notification callbacks.
> 
> This patch was prompted by the discussion at [1] which attempts
> to remove CONFIG_ANDROID that currently guards these code paths.
> 
> [1] https://lore.kernel.org/r/20220629150102.1582425-1-hch@lst.de/
> 
> Suggested-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>

Thanks, looks good to me. Do you have a corresponding Gerrit link to the
change adding this to the base Android kernel config? If so, have my
Ack:

    Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Jason
