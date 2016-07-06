Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e39461c
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 14:54:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a281007e
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 14:54:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2e475145
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 14:54:43 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id q132so156320689lfe.3
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2016 07:54:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9paKdCr_-W5_PJ1nxnNqCLdbuJ04T+PUp2NaMZZV+K2Tg@mail.gmail.com>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160704074837.GA24805@lud.polynome.dn42>
 <20160705220336.GA18854@lud.polynome.dn42>
 <CAHmME9rOUu4CBAgaSg684F45VT2Od9QHExNT=ftqn46EdpTxeQ@mail.gmail.com>
 <CAHmME9paKdCr_-W5_PJ1nxnNqCLdbuJ04T+PUp2NaMZZV+K2Tg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 Jul 2016 16:54:46 +0200
Message-ID: <CAHmME9of2XeH-7mJF-Avq_n1SPQwesH-zkk-0Nx8ff1ef3f5jA@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] OpenWRT package for wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I don't have a MIPS toolchain on this computer to test this at the
moment, but maybe this will shave off a little bit from the .ko...

strip $(nm --defined-only wireguard.ko | grep -Ev '(^0+ | __)' | cut
-d ' ' -f 3 | xargs -n 1 echo -N) wireguard.ko
