Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60d6a62c
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 08:35:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6f7191a
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 08:35:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 085277ca
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 08:35:28 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id l69so22174585lfg.1
 for <wireguard@lists.zx2c4.com>; Wed, 27 Jul 2016 01:38:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Jul 2016 10:38:04 +0200
Message-ID: <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
To: jens <jens@viisauksena.de>, Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
	crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jens,

Youch! That's pretty horrible. Is 15mb/s worse than what you get with tincd?

A while ago Baptiste (attached) was working on a MIPS optimized
implementation of ChaPoly. Baptiste -- what ever happened with that?
Perhaps it's time we revive that project?

About the crash -- it appears that I need to optimize WireGuard for
low memory situations. I'll get started on this.

Thanks for the feedback. I'll see what I can do to fix things.

Jason
