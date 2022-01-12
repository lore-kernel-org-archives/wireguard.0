Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA93C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jan 2022 21:10:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8b7f0fe9;
	Sun, 16 Jan 2022 21:10:52 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0d6e390a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 10:58:03 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id x33so3899711uad.12
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 02:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sqfqmGnWErblTuhOUr48ULJ3GhOyu+Z25jTNW9S2YJk=;
 b=Fbm+ZcJo7kAMNkndN8R4mpApAAC6wgfMRRhAZjcUS3RuTHSK7DugAbnH04G57cSyHF
 v8/yNpluO9LZGpzJ6hS8dCYkw7LyMOWz66O1amtjwX2lGhDPiV6Df94FvR9curMltHMi
 FJt7dc9Ae6qgpsVsjlvsON4zDgmYU3kPi3f51ayDAEDZhpnmEwRqVG7aRXRYgrQJF2wi
 sIVtKPGUpjD+hpACHREvIYSGIMu5tdkbkorP51ivAqKu+Ywk+tOS2a4SmiSyrfIxfeM0
 OBtyNat1f3tQqnmmXDE8trgdXWpbGEekNxb4GkyByRfGbeLBf2XNbElRMKVRJDYn2uWw
 x3pQ==
X-Gm-Message-State: AOAM533eIZYX5V14/Z6R+RYVh3i9J0DaoMinbLokOIhSOVcDNGihgKCj
 aybkNEb28MKgo2WNxynuHm+odPiIDWEL60nx
X-Google-Smtp-Source: ABdhPJxkFsryac+UTx5rlWedwblLMvFpkbnaZq9/Qfyl5Nveaxua1tdETVYlvTnnvj/p50URWZ3uIA==
X-Received: by 2002:a9f:3802:: with SMTP id p2mr3992906uad.35.1641985081808;
 Wed, 12 Jan 2022 02:58:01 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id a29sm3516180vsl.25.2022.01.12.02.58.00
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 02:58:01 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id m15so3954302uap.6
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 02:58:00 -0800 (PST)
X-Received: by 2002:ab0:4d5a:: with SMTP id k26mr3942936uag.122.1641985080812; 
 Wed, 12 Jan 2022 02:58:00 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qbnYmhvsuarButi6s=58=FPiti0Z-QnGMJ=OsMzy1eOg@mail.gmail.com>
 <20220111134934.324663-1-Jason@zx2c4.com>
 <20220111134934.324663-2-Jason@zx2c4.com>
In-Reply-To: <20220111134934.324663-2-Jason@zx2c4.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 11:57:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOheM0WsHNTA2dS=wJA8kXEYx6G78bnZ51T1X8HWdzNg@mail.gmail.com>
Message-ID: <CAMuHMdWOheM0WsHNTA2dS=wJA8kXEYx6G78bnZ51T1X8HWdzNg@mail.gmail.com>
Subject: Re: [PATCH crypto 1/2] lib/crypto: blake2s-generic: reduce code size
 on small systems
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, wireguard@lists.zx2c4.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 Theodore Tso <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>, 
 jeanphilippe.aumasson@gmail.com, Ard Biesheuvel <ardb@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 16 Jan 2022 21:10:46 +0000
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

Hi Jason,

On Tue, Jan 11, 2022 at 2:49 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Re-wind the loops entirely on kernels optimized for code size. This is
> really not good at all performance-wise. But on m68k, it shaves off 4k
> of code size, which is apparently important.

On arm32:

add/remove: 1/0 grow/shrink: 0/1 up/down: 160/-4212 (-4052)
Function                                     old     new   delta
blake2s_sigma                                  -     160    +160
blake2s_compress_generic                    4872     660   -4212
Total: Before=9846148, After=9842096, chg -0.04%

On arm64:

add/remove: 1/2 grow/shrink: 0/1 up/down: 160/-4584 (-4424)
Function                                     old     new   delta
blake2s_sigma                                  -     160    +160
e843419@0710_00007634_e8a0                     8       -      -8
e843419@0441_0000423a_178c                     8       -      -8
blake2s_compress_generic                    5088     520   -4568
Total: Before=32800278, After=32795854, chg -0.01%

> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

For the size reduction:
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
