Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24290C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Dec 2021 17:31:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e32ca0f1;
	Mon, 20 Dec 2021 17:30:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8fc5d1c2
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Dec 2021 17:30:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF7A361269
 for <wireguard@lists.zx2c4.com>; Mon, 20 Dec 2021 17:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34495C36AEC
 for <wireguard@lists.zx2c4.com>; Mon, 20 Dec 2021 17:30:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fcKAqCWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1640021401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQ5wki9NSFz2DpBh2GvNG6IMNVTU0HsTQD0ndUheZLc=;
 b=fcKAqCWR+EZEp2aSy2BlFVynvDj2MtqASw80dJ79gCG7AP+VIFIyqaOzPJm9y7OV/7c+KN
 LPFhSjV3yjjOw25MZsHrVKRskJnvs00wqdr87PSQpr9g1qlxQ4JTMe60lXFjVRs90Hmpz8
 SVrxyGghDGO7G9SMFOcewUcpE2fQlXI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6370c100
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Dec 2021 17:30:01 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id q74so30832685ybq.11
 for <wireguard@lists.zx2c4.com>; Mon, 20 Dec 2021 09:30:00 -0800 (PST)
X-Gm-Message-State: AOAM532Ja/BAVLBqftOBILd0/SlqOh3ajWh6fgtOJxamdOS8yfsWPu4y
 WjKJaoId7i9bE6WxpuJTiQfGGhbKBYA4mKiPkPY=
X-Google-Smtp-Source: ABdhPJzkyeDZgRyEC0yCam6TO1TdvDfCfRTZaVXXylNELqtxND9fGfN9jT+4DKjrODQxBLeqsgczMKTluKvP0vLdR/8=
X-Received: by 2002:a25:2450:: with SMTP id k77mr24173867ybk.121.1640021400175; 
 Mon, 20 Dec 2021 09:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20211208173205.zajfvg6zvi4g5kln@linutronix.de>
In-Reply-To: <20211208173205.zajfvg6zvi4g5kln@linutronix.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Dec 2021 18:29:49 +0100
X-Gmail-Original-Message-ID: <CAHmME9rzEjKg41eq5jBtsLXF+vZSEnvdomZJ-rTzx8Q=ac1ayg@mail.gmail.com>
Message-ID: <CAHmME9rzEjKg41eq5jBtsLXF+vZSEnvdomZJ-rTzx8Q=ac1ayg@mail.gmail.com>
Subject: Re: [RFC] wiregard RX packet processing.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
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

Hi Sebastian,

Seems like you've identified two things, the use of need_resched, and
potentially surrounding napi_schedule in local_bh_{disable,enable}.

Regarding need_resched, I pulled that out of other code that seemed to
have the "same requirements", as vaguely conceived. It indeed might
not be right. The intent is to have that worker running at maximum
throughput for extended periods of time, but not preventing other
threads from running elsewhere, so that, e.g., a user's machine
doesn't have a jenky mouse when downloading a file.

What are the effects of unconditionally calling cond_resched() without
checking for if (need_resched())? Sounds like you're saying none at
all?

Regarding napi_schedule, I actually wasn't aware that it's requirement
to _only_ ever run from softirq was a strict one. When I switched to
using napi_schedule in this way, throughput really jumped up
significantly. Part of this indeed is from the batching, so that the
napi callback can then handle more packets in one go later. But I
assumed it was something inside of NAPI that was batching and
scheduling it, rather than a mistake on my part to call this from a wq
and not from a softirq.

What, then, are the effects of surrounding that in
local_bh_{disable,enable} as you've done in the patch? You mentioned
one aspect is that it will "invoke wg_packet_rx_poll() where you see
only one skb." It sounds like that'd be bad for performance, though,
given that the design of napi is really geared toward batching.

Jason
