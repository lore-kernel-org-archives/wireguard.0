Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB001CA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:39:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 253c888f;
	Mon, 5 Oct 2026 07:00:42 +0000 (UTC)
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8d0daa62
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 10:24:16 +0000 (UTC)
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
 by mail.w14.tutanota.de (Postfix) with ESMTP id 99C1417B03FF9
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 12:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788171855; 
 s=s1; d=well-founded.dev;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
 bh=3a/1tLM258+XX6sFATstRDA/BXsqthctD9Jmbcf7QLk=;
 b=OW6XnJ73rMHhix5m/I8qylskUIhn+n7eSE+Ef+6jHLS9yNU7JFjmZ2yGTlvJHoKj
 smfnlH1jlkwXeE8bnVuAQagSCarq9EcmKGvk3lmXDELY4MXnTOFLufZiqCOh7lPjmQC
 npY1alQOXViJavLNAqaN8+3kQoXBbM7RcCAkpl3OgKeLyIshWudNGnmXFoU3IKvWkZQ
 4URHP1QhmECB1/yTI0JLGYiD9ALvLARlRBrLtL6lW+KKR0SzC/yPujH+WWA59g5sBLE
 BAcVgVx91ll8px6Gfn4B7KvQ06RXNeAvumld+rMB6kNJoUKh6oEaGL+61lXxMXIb8+D
 MSSEXJbNYA==
Date: Mon, 31 Aug 2026 12:24:15 +0200 (CEST)
From: Ramses <ramses@well-founded.dev>
To: "Jason A. Donenfeld" <jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Martin KaFai Lau <kafai@fb.com>,
 Wireguard <wireguard@lists.zx2c4.com>, Netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <P0MLDmd--F-9@well-founded.dev>
In-Reply-To: <apT0H7qIwFW-JCLn@zx2c4.com>
References: <20260827-wg-tstamp-v1-1-4acfebb855ef@well-founded.dev>
 <apT0H7qIwFW-JCLn@zx2c4.com>
Subject: Re: [PATCH net] wireguard: queueing: preserve tstamp_type in
 wg_reset_packet()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: 0163e381fa67fa966160938ffa017803050e57578bb1735d37cd25d20463a96a9bb3a550250bbc5eaa94bfdfd8cf3defcf1aa43859ae980630826bb8230f264e7f:TurnOnPrivacy!:tutamail
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

Aug 31, 2026, 05:25 by Jason@zx2c4.com:

> Hi Ramses,
>
> On Thu, Aug 27, 2026 at 01:52:56PM +0200, Ramses de Norre via B4 Relay wrote:
>
>> From: Ramses de Norre <ramses@well-founded.dev>
>>
>> Sending traffic through a wireguard tunnel on a host using the fq
>> qdisc fills the log with:
>>
>>  fq: likely mono tstamp with tstamp_type 0
>>
>> An skb carries a timestamp in skb->tstamp and, separately, a
>> skb->tstamp_type field recording which clock that timestamp came from.
>> The two have to agree.
>>
>> When wireguard encapsulates a packet it calls wg_reset_packet(), which
>> clears the fields that must not leak from the inner packet into the
>> tunnel packet. It does so in two steps:
>>
>>  skb_scrub_packet(skb, true);
>>  memset(&skb->headers, 0, sizeof(skb->headers));
>>
>> skb_scrub_packet() deliberately keeps skb->tstamp when it holds a
>> monotonic timestamp: that value is the time the packet is scheduled to
>> be sent, and the qdisc still needs it. The memset then zeroes
>> skb->tstamp_type, because that field sits inside the headers group
>> while skb->tstamp does not. The packet therefore leaves wireguard
>> carrying a monotonic timestamp labelled as a realtime one.
>>
>> Nothing noticed until commit c4f796c4f16b ("net_sched: sch_fq: convert
>> skb->tstamp if not monotonic"): fq used to assume every timestamp was
>> monotonic. It now consults tstamp_type, spots the mismatch, warns, and
>> falls back to treating the value as monotonic. Pacing still ends up
>> correct, so the log spam is the actual problem.
>>
>> Save tstamp_type before the memset and restore it when encapsulating,
>> next to the hash fields that are already carried over this way. When
>> decapsulating it stays zeroed, which is right: an incoming packet's
>> timestamp is a realtime receive timestamp.
>>
>> Fixes: de799101519a ("net: Add skb_clear_tstamp() to keep the mono delivery_time")
>> Signed-off-by: Ramses de Norre <ramses@well-founded.dev>
>>
>
> Thanks for this. I've queued this up in the wireguard tree.
>
> One thing I'm wondering is whether your Fixes: line is correct. Would
> c4f796c4f16b be a better candidate than de799101519a? Or maybe even
> 4d25ca2d6801 is best?
>
> Jason
>
Hi Jason

I think you are right, but I think d98d58a00261 is actually the commit that introduced the issue then (but no warnings were logged yet at that point).
The patch doesn't apply cleanly to that version though, I think it only applies starting from 6.11 because of a rename, so we can't backport all the way back. It's probably fine though, since the warnings weren't being logged yet at that point.
Do you want me to send an updated patch, or will you just fix this up in your tree?

Thanks,
Ramses

