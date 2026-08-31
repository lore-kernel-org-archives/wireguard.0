Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D3C61DD3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Aug 2026 03:25:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 458ac8b8;
	Mon, 31 Aug 2026 03:25:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8bb33f38
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 03:25:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 38DC760120;
 Mon, 31 Aug 2026 03:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92581F000E9;
 Mon, 31 Aug 2026 03:25:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; dkim=pass (1024-bit key,
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256
 header.s=20210105 header.b=lQjT3/OM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1788146728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zKdZAmn445qhRZS0uBj1MCk1GVoADURg/5nlTEd0BLA=;
 b=lQjT3/OMWfWDv8gCGmA/N+ykEVDspz9O/ynOIboDnKKeyxfvtj+3xMeA9vntKgcdiGqF2Z
 FFTxC0+aqs/QKcYEyYloI1EcfTsgfpu5RIG2k2tUROfWL68bY/u5VXLQBt9+xIP9vNT0/6
 uoW+58rDkA+0IngiguWFA3CaOsSrD6A=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 3f46e57b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 31 Aug 2026 03:25:27 +0000 (UTC)
Date: Sun, 30 Aug 2026 21:25:19 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: ramses@well-founded.dev
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Martin KaFai Lau <kafai@fb.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] wireguard: queueing: preserve tstamp_type in
 wg_reset_packet()
Message-ID: <apT0H7qIwFW-JCLn@zx2c4.com>
References: <20260827-wg-tstamp-v1-1-4acfebb855ef@well-founded.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827-wg-tstamp-v1-1-4acfebb855ef@well-founded.dev>
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

Hi Ramses,

On Thu, Aug 27, 2026 at 01:52:56PM +0200, Ramses de Norre via B4 Relay wrote:
> From: Ramses de Norre <ramses@well-founded.dev>
> 
> Sending traffic through a wireguard tunnel on a host using the fq
> qdisc fills the log with:
> 
>   fq: likely mono tstamp with tstamp_type 0
> 
> An skb carries a timestamp in skb->tstamp and, separately, a
> skb->tstamp_type field recording which clock that timestamp came from.
> The two have to agree.
> 
> When wireguard encapsulates a packet it calls wg_reset_packet(), which
> clears the fields that must not leak from the inner packet into the
> tunnel packet. It does so in two steps:
> 
>   skb_scrub_packet(skb, true);
>   memset(&skb->headers, 0, sizeof(skb->headers));
> 
> skb_scrub_packet() deliberately keeps skb->tstamp when it holds a
> monotonic timestamp: that value is the time the packet is scheduled to
> be sent, and the qdisc still needs it. The memset then zeroes
> skb->tstamp_type, because that field sits inside the headers group
> while skb->tstamp does not. The packet therefore leaves wireguard
> carrying a monotonic timestamp labelled as a realtime one.
> 
> Nothing noticed until commit c4f796c4f16b ("net_sched: sch_fq: convert
> skb->tstamp if not monotonic"): fq used to assume every timestamp was
> monotonic. It now consults tstamp_type, spots the mismatch, warns, and
> falls back to treating the value as monotonic. Pacing still ends up
> correct, so the log spam is the actual problem.
> 
> Save tstamp_type before the memset and restore it when encapsulating,
> next to the hash fields that are already carried over this way. When
> decapsulating it stays zeroed, which is right: an incoming packet's
> timestamp is a realtime receive timestamp.
> 
> Fixes: de799101519a ("net: Add skb_clear_tstamp() to keep the mono delivery_time")
> Signed-off-by: Ramses de Norre <ramses@well-founded.dev>
 
Thanks for this. I've queued this up in the wireguard tree.

One thing I'm wondering is whether your Fixes: line is correct. Would
c4f796c4f16b be a better candidate than de799101519a? Or maybe even
4d25ca2d6801 is best?

Jason
