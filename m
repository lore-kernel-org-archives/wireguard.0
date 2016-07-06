Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cef5395
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:16:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 245ab581
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:16:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c3c9bf99
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:16:39 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id f6so156771659lfg.0
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2016 08:16:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9of2XeH-7mJF-Avq_n1SPQwesH-zkk-0Nx8ff1ef3f5jA@mail.gmail.com>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160704074837.GA24805@lud.polynome.dn42>
 <20160705220336.GA18854@lud.polynome.dn42>
 <CAHmME9rOUu4CBAgaSg684F45VT2Od9QHExNT=ftqn46EdpTxeQ@mail.gmail.com>
 <CAHmME9paKdCr_-W5_PJ1nxnNqCLdbuJ04T+PUp2NaMZZV+K2Tg@mail.gmail.com>
 <CAHmME9of2XeH-7mJF-Avq_n1SPQwesH-zkk-0Nx8ff1ef3f5jA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 Jul 2016 17:16:42 +0200
Message-ID: <CAHmME9rCa3L2eBdrVgZhhhmHQbdswX0BUDXo=YD-AYzoE-Wq8Q@mail.gmail.com>
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

There's also a lot to be done with -flto. I was working on getting
this working last year but ran into some snags. I'll give it another
try.

There's also the more bootleg version of running with -fwhole-program
and then using the __visible attribute on the module init/cleanup
functions. I don't know if this would actually work properly though.
