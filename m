Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B830C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jan 2022 18:51:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bed8dc8d;
	Wed, 12 Jan 2022 18:51:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fece717b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 18:51:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D33FD616D1
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 18:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F602C36AEB
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 18:51:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SVlUKGNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642013471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xreHySqXLyhKUk0VW0GwsU6XUHgnG+4/Jk0kao9Oifc=;
 b=SVlUKGNcrSDoPZWC+klO14Zqk7l7Uf8MtIAFKt+cC6HwyJsLy+SLzVJX2qkW5yifFG74U1
 jkNoAR9iWafix2H1JjlgdtWawKfLApWQRctYnBS5dtnsQG3gAwp6/5nfj5vg0rGFBqRHvP
 Qe+YhFBRbUX0+Y9zskJZr0tLh1hhtZk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6defb0c0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 18:51:11 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id c10so8306744ybb.2
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 10:51:10 -0800 (PST)
X-Gm-Message-State: AOAM533Hd/8lvybpLyLYDQhOdzyP+C/b1GYj73iBj0YlBL4i34rKqVpa
 dGDTvzsEwgkIJyYbQ2z3fDBeiMcA84Je+b93a7c=
X-Google-Smtp-Source: ABdhPJyNAIEcTXisld7XC7bhz4PalaSX6tHDm9+bpvRZLfdVf/6oPJbATFqmhRaXycqh4DhrWUXcosqQSbDYw9Ipoz0=
X-Received: by 2002:a25:854f:: with SMTP id f15mr1311046ybn.121.1642013469238; 
 Wed, 12 Jan 2022 10:51:09 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qbnYmhvsuarButi6s=58=FPiti0Z-QnGMJ=OsMzy1eOg@mail.gmail.com>
 <20220111134934.324663-1-Jason@zx2c4.com>
 <20220111134934.324663-2-Jason@zx2c4.com>
 <Yd8enQTocuCSQVkT@gmail.com>
In-Reply-To: <Yd8enQTocuCSQVkT@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 12 Jan 2022 19:50:58 +0100
X-Gmail-Original-Message-ID: <CAHmME9qGs8yfYy0GVcV8XaUt9cjCqQF2D79RvrsQE+CNLCeojA@mail.gmail.com>
Message-ID: <CAHmME9qGs8yfYy0GVcV8XaUt9cjCqQF2D79RvrsQE+CNLCeojA@mail.gmail.com>
Subject: Re: [PATCH crypto 1/2] lib/crypto: blake2s-generic: reduce code size
 on small systems
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>, 
 bpf <bpf@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 "Theodore Ts'o" <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jean-Philippe Aumasson <jeanphilippe.aumasson@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
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

On Wed, Jan 12, 2022 at 7:32 PM Eric Biggers <ebiggers@kernel.org> wrote:
> How about unrolling the inner loop but not the outer one?  Wouldn't that give
> most of the benefit, without hurting performance as much?
>
> If you stay with this approach and don't unroll either loop, can you use 'r' and
> 'i' instead of 'i' and 'j', to match the naming in G()?

All this might work, sure. But as mentioned earlier, I've abandoned
this entirely, as I don't think this patch is necessary. See the v3
patchset instead:

https://lore.kernel.org/linux-crypto/20220111220506.742067-1-Jason@zx2c4.com/
