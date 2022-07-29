Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22623C00144
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jul 2022 17:12:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 96223238;
	Fri, 29 Jul 2022 17:12:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id df2119d5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jul 2022 17:12:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C8CA0B828C5;
 Fri, 29 Jul 2022 17:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA17C433C1;
 Fri, 29 Jul 2022 17:12:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UcdCTif9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659114741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8W1hfZRn15chVL5dmKiwzHKCpzfKbXHSxbxvCjch5Q=;
 b=UcdCTif9NJzRrVHRkfPneRnszbO5kUegmVwfm7EiEJwGUo2fGAL2GzIvEDsZFWleJDb7cf
 w2HyWVCj5nkotgH4Gk0pxYAAZAGMFvK6eC6LIg/QNiifSEPZ20+YmbPtHIQhXU0BLdA+c/
 b3vT9HW2LEEnUYV35FWqT8DCodt5L8Q=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52aa88db
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 29 Jul 2022 17:12:20 +0000 (UTC)
Date: Fri, 29 Jul 2022 19:12:16 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: wireguard@lists.zx2c4.com, arnd@arndb.de
Subject: Re: Random arrays on kernel stack..
Message-ID: <YuQU8H0UCGTt5C0I@zx2c4.com>
References: <CAHk-=wjJZGA6w_DxA+k7Ejbqsq+uGK==koPai3sqdsfJqemvag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wjJZGA6w_DxA+k7Ejbqsq+uGK==koPai3sqdsfJqemvag@mail.gmail.com>
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

Hey Linus,

On Thu, Jul 28, 2022 at 04:51:58PM -0700, Linus Torvalds wrote:
> So I finally have an arm64 laptop that I'm playing with, and as a

Some intrepid diving into Asahi world, eh? I admit that after playing
with the M1 and benching/optimizing some code on it, I wasn't man enough
to daily drive the thing, and I wound up selling the (already
second hand) Mac Mini shortly after acquiring it.

> result building the kernel the way I usually do - with warnings as
> errors.
> 
> And I get this:
> 
>   drivers/net/wireguard/allowedips.c: In function ‘root_remove_peer_lists’:
>   drivers/net/wireguard/allowedips.c:77:1: error: the frame size of
> 1040 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
>      77 | }
>         | ^
>   drivers/net/wireguard/allowedips.c: In function ‘root_free_rcu’:
>   drivers/net/wireguard/allowedips.c:64:1: error: the frame size of
> 1040 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
>      64 | }
>         | ^
> 
> and clearly it only happens for me because it turns out Asahi has for
> some odd reason picked that low CONFIG_FRAME_WARN of just 1kB.

Arnd (now CC'd) and I had a discussion about this a few years ago, and
IIRC the conclusion was that the kernel targets 1280 bytes on 64-bit
platforms and 1024 bytes on 32-bit platforms. There's been gradual work
done over the years to get gcc to generate code that matched this
expectation.

So root_remove_peer_lists and root_free_rcu are really nestling up
against the boundary. We'd looked into ways of avoid that, but decided
in the end it was fine, and probably the most okay way to implement
those algorithms, all things considered.

> But when I look at the code that generates that warning, it just
> worries me. It has that magical constant 128.
> 
> Sure, that same constant is also in push_rcu().

I could (should?) put it in a constant. But as context, note that it
doesn't look _so_ magical for anyone hacking on the code. It's a trie
for IPv4 and IPv6 addresses. If you're writing networking code, the
128-bitness of IPv6 addresses is nearly always at the top of your brain,
its general inconvenience an elephant not possible to ignore.

I guess `sizeof(struct in6_addr) * 8` would be a more accurate
reference.

>  (b) it should be documented some way as a #define

Alright, will do.

> And there it is randomly as a warning, and then it will happily
> overflow the stack frame.
> 
> That's not ok.
>
>  (c) push_rcu() should damn well not "warn and corrupt the stack". It
> should warn-and-not-corrupt the stack, even if that then means that
> the thing isn't pushed at all.

That's a good point. Though note that the current WARN_ON is also
dependent on DEBUG being set. The purpose is to catch errors when the
selftest in drivers/net/wireguard/selftest/allowedips.c runs. That file
has this snippet:

  /* These will hit the WARN_ON(len >= 128) in free_node if something
   * goes wrong.
   */
  for (i = 0; i < 128; ++i) {
    part = cpu_to_be64(~(1LLU << (i % 64)));
    memset(&ip, 0xff, 16);
    memcpy((u8 *)&ip + (i < 64) * 8, &part, 8);
    wg_allowedips_insert_v6(&t, &ip, 128, a, &mutex);
  }
  wg_allowedips_free(&t, &mutex);

Anyway, I'll conditionalize it so the stack isn't corrupted.

>  (a) that constant should be a bit lower, so that we *can* use a 1kB
> stack frame warning on 64-bit architectures

That's not so much possible. This needs to do a DFS traversal of the
trie, which means it can be 128 nodes deep since IPv6 addresses have
128 bits. I could just malloc, instead, but malloc'ing in order to free
something is kind of annoying. And it *does* fit after all. I could
suppress that option for just that file, but that might hide other bugs.
And there's the 1280 target I mentioned earlier, so maybe this is all
fine? Unless you have a different suggestion?

I think, anyhow, this is roughly where Arnd and I left off a few years
ago.

Jason
