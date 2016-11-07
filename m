Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48620f5b
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:28:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1800009d
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:28:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3cb995d8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:28:31 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id o141so37458134lff.1
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 02:30:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1522436030.20161107130256@vodka.home.kg>
References: <25241985.20161106100258@vodka.home.kg>
 <1289478110.20161106110707@vodka.home.kg>
 <CAHmME9rjEeuodHMM4Quo1NVXT2A2DYUj=3FPgep-f4hNXeCh5g@mail.gmail.com>
 <1522436030.20161107130256@vodka.home.kg>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Nov 2016 11:30:11 +0100
Message-ID: <CAHmME9r4PirMW2ASZSdxrHkJu2bMbbNGbR7ba+DpA1_JeN+Dug@mail.gmail.com>
To: k@vodka.home.kg
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] mips32 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey k,

> So , guys, I found where shit lies !
> Crash happens only when l2tp is involved.
> I reproduced crash in the following scenario :
>
> Windows ETH -> ETH Dlink ETH L2TP WG -> WG L2TP ETH Ubuntu

Brilliant!

Are you able to trigger this with ordinary iperf? Or just CIFS?

Are you able to trigger this with just host-host l2tp, or do you need
to be forwarding packets?

Can you reproduce this on an x86 kernel running KASAN and the various
debug options in:
https://git.zx2c4.com/WireGuard/tree/src/tests/qemu/debug.config

Thanks for triaging this so far. It's coming along well...

Talk soon,
Jason
