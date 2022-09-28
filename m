Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D037EC04A95
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 18:23:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a0c59a74;
	Wed, 28 Sep 2022 18:21:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0dec1eba
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Sep 2022 18:20:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6676861F78
 for <wireguard@lists.zx2c4.com>; Wed, 28 Sep 2022 18:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8505BC433D6
 for <wireguard@lists.zx2c4.com>; Wed, 28 Sep 2022 18:20:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=gmail.com
 header.i=@gmail.com header.b="Nt4x52pe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210105; 
 t=1664389222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=85SNKOp6j8+70NBkbPRHTqGOkr7K9nxyGQJFc61H4J8=;
 b=Nt4x52pexDd0aWQA7zxS8hIBe0k8qIXlgTUMSWC5DMlbM0bjaG9BoWJ0LywQjA+tWvr2C5
 mffTZvL6fPGsK3llEF0/HhBsfBWXJdTF9hUqVKeQZgdQsCpt9BkDwniD72r6cqcDSmm32R
 mWd0JRvkopoBc3AYJ1LvZ8xvaFYPOz4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3924e389
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Sep 2022 18:20:21 +0000 (UTC)
MIME-Version: 1.0
References: <183272e3203.12ada1173180167.8469340361616836666@zoho.com>
 <YzR3vcZhSjU2eRqB@zx2c4.com>
In-Reply-To: <YzR3vcZhSjU2eRqB@zx2c4.com>
From: Jean-Philippe Aumasson <jeanphilippe.aumasson@gmail.com>
Date: Wed, 28 Sep 2022 20:17:00 +0200
Message-ID: <CAGiyFdfYohSxNjXUyht88qNCfNtmy_MAm0NYn9Y-fj4RiJ9nyw@mail.gmail.com>
Subject: Re: Iptables WireGuard obfuscation extension
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Wei Chen <weichen302@zoho.com>, wireguard <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 28 Sep 2022 18:21:35 +0000
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

ChaCha6 is probably enough crypto-wise here.

On Wed 28 Sep 2022 at 18:35 Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hey Wei,
>
> On Sat, Sep 10, 2022 at 06:34:42AM -0500, Wei Chen wrote:
> > Hi,
> >
> > Jason once suggested use a netfilter module for obfuscation[1]. Here is
> one.
> >
> > https://github.com/infinet/xt_wgobfs
> >
> > It uses SipHash 1-2 to generate pseudo-random numbers in a reproducible
> way.
> > Sender and receiver share a siphash secret key. Sender creates and
> receiver
> > re-creates identical siphash output, if input is same. These siphash
> outputs
> > are used for obfuscation.
> >
> > - The first 16 bytes of WG message is obfuscated.
> > - The mac2 field is also obfuscated if it is all zeros.
> > - Padding WG message with random bytes, which also has random length.
> They are
> >   from kernel get_random_bytes_wait() though.
> > - Drop 80% of keepalive message at random. Again randomness is from
> kernel.
> > - Change the Diffserv field to zero.
> >
> > Tested working on Alpine linux kernel 5.15 and CentOS 7 kernel 3.10.
> >
> > Performance test in two Alpine VMs running on same host. Each VM has 1
> CPU and
> > 256 MB RAM. Iperf3 results 1.1Gbits/s without,vs 860Mbits/s with
> obfuscation.
>
> This is super cool! I'm very glad to see that you've made this.
>
> A couple considerations for improvement (take them or leave them):
>
> - Instead of using siphash, if you can make use of 64 bytes of
>   randomness at a time, you might be able to get away with chacha8 (or
>   even lower). The input to chacha20 is typically a 256 bit key and a
>   nonce, but because we don't care about the cryptographic security here
>   -- wireguard handles that part -- we can play fast and lose, and make
>   our threat model, "would be too computationally complex to detect in
>   real time". Things become quite fun when you don't need real crypto.
>   To that end, we could perhaps get away with using chacha8 instead of
>   chacha20, and doing so with a 128-bit key. This then provides lots of
>   input to chacha:
>
>   * 16 bytes, where the second half of that key was
>   * 16 bytes nonce (since it doesn't look like you need more than one
> block)
>   * If you really want to play fast and loose: 32-byte constant...
>
>   Again, this is awful cryptographic advice, but from a traffic analysis
>   point of view, I doubt it makes a difference.
>
>   On the other hand, if all you need is 16 bytes output, then I guess
>   siphash gets the job done.
>
> - get_random_bytes() is slow if all you need is a byte at a time. That
>   computes 96 bytes and then throws away 88 bytes of it. Instead, you
>   can use get_random_u32(), which batches, and throw away 3 bytes. Or, I
>   think I'll add to kernel 6.1 get_random_u8(), which will waste
>   nothing.
>
>   But actually, do you really need to do that? Can't you just run chacha
>   or siphash or whatever super fast non-cryptographic thing you have,
>   and just have an incrementing nonce? Or, better, since those keepalive
>   messages already have a suitably random poly1305 tag, just run siphash
>   on that, and discard if the resultant first byte is high/low/whatever.
>
> - If this is to ever go upstream, you might want to add a `--obfs-type
>   N` parameter to the XT userspace library and the IPC struct, and make
>   it mandatory. To begin, everybody would use `--obfs-type 1`, since
>   that's all there is. But maybe overtime, you'll add a fake TCP mode or
>   a fake QUIC mode or a fake HTML mode, and then the types will grow.
>   This way, maintenance wise, you only have to send updates to the
>   netfilter module in the kernel, and don't need to update the libxt
>   part.
>
> Jason
>
