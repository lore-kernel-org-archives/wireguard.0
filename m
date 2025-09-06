Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DF4CA1002
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Sep 2025 21:13:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae6bef92;
	Sat, 6 Sep 2025 21:12:08 +0000 (UTC)
Received: from mail.as397444.net (mail.as397444.net [2620:6e:a000:1::99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8902767
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 21:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bluematt.me
 ; s=1757191261;
 h=Subject:From:To:From:Subject:To:Cc:Cc:Reply-To:In-Reply-To:
 References; bh=EU3FFls8QY3IHgMDncU13AS5KkzDFnoZ30hssy6TtOU=; b=oqQxYBvvqAvTcq
 /zBqa/nchZlKJLdijcyVvzo6HCH8lwiGz9Rn43wW0kRgze1m1hEiA4ruWS7h+xROAybJ4SsaLbAjI
 pr8qPB6FRFdqvu7GuhlwffEp9oiDKHDLeBK8fPU9ASMNz3acfIsGl1wAhEnztl7KjzxFtxpYrd3Ua
 sI3VznLLhbhRQzYzT7qCJc27vOArxPNYQqD1QUX+Op8pyOrUCZm/SVLuPfR/r5liVf3O7XxnwFzz1
 8R53napbhzzMJLR+C/H6GDDfB3zPCGD9G3P5ifzRnGzFADqgGIG9aaDqP9RpthT5LHEG1ZLAQRBZq
 pU9/jJ/1+9JyLxOuaVeQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=clients.mail.as397444.net; s=1757191264; h=Subject:From:To:From:Subject:To:
 Cc:Cc:Reply-To:In-Reply-To:References;
 bh=EU3FFls8QY3IHgMDncU13AS5KkzDFnoZ30hssy6TtOU=; b=WJ6aoY3ys3kwfw8nnFignbhodp
 f73NuKJv5kG9a8v07IyThKq4YxwYTAKtsaAgGuxypfh+k14A8MjggFcmulmIr8RidvTyW9N7EdJLk
 mgvH8EBYD7OAb8OoEt0+y1Ng7gsVHEsUbOSm+AQmRByDgxnhRAODMNwmKZzIjOQUmmq11tCyMk20h
 FMH3SkfnqgVElfzsiY+bg41tqtbElaBssi+41qdUpgeSG8xDcSlg7j+VMd0kzYTCUUl2jnJDG58Az
 lEQtiQSTwO1D3docsxamVOJQ2rHYXggMp7NxD5QAjSUQ9rch47Ce5XjpZwZDv9ofKqdcMITOOKRNE
 L9ZzC4Yw==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/bluematt.me and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
 (envelope-from <wg-lists@bluematt.me>)
 id 1uv0CZ-00000001au4-0M2N for wireguard@lists.zx2c4.com;
 Sat, 06 Sep 2025 21:12:03 +0000
Message-ID: <043598bd-198a-4d79-8749-789e578e07fe@bluematt.me>
Date: Sat, 6 Sep 2025 17:12:02 -0400
MIME-Version: 1.0
Content-Language: en-US
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Matt Corallo <wg-lists@bluematt.me>
Subject: Leaving skb->priority alone when encapsulating?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Its (I presume) fairly common to have multiple wireguard links on a single machine which ultimately 
has its outbound interface shaped with some tc qdisc. While wg_reset_packet leaves the skb hash flag 
alone to allow that qdisc to have visibility into the header hash, it wipes all other skb headers 
with a `memset(&skb->headers...)`. This makes it (I believe) impossible to allow the primary qdisc 
to operate on the DSCP of the inner packet (which wireguard reasonably wipes, but could otherwise be 
copied into skb->priority, which is generally an appropriate place for it).

This appears to differ from every other tunneling protocol (the only instances of `memset.*headers` 
in the entire tree are in wireguard and the mellanox drivers) and other encapsulation protocols 
appear to rely on iptunnel_xmit's clearing of the relevant flags, rather than doing it themselves.

While most of the fields in a skb's headers are perfectly reasonable to clear, I do wonder why 
wireguard is special here, but in any case it would be very nice to allow at least priority to 
propagate past wg_reset_packet.
