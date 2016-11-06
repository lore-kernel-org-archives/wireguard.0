Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97f50c70
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 11:19:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 699d4ac4
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 11:19:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 59a04aba
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 11:19:00 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id t196so94103544lff.3
 for <wireguard@lists.zx2c4.com>; Sun, 06 Nov 2016 03:20:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9odjXbgoTFfPzu-1rtTxrT-kEucYeevHgHHzJnd-NTCyQ@mail.gmail.com>
References: <25241985.20161106100258@vodka.home.kg>
 <1289478110.20161106110707@vodka.home.kg>
 <CAHmME9pytc2aVj5gDXwX0zBbQt5nqNsaeXFxz9XCXMwzgiFauw@mail.gmail.com>
 <CAHmME9odjXbgoTFfPzu-1rtTxrT-kEucYeevHgHHzJnd-NTCyQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 Nov 2016 12:20:34 +0100
Message-ID: <CAHmME9oc=_cX3XPo0VBYx70HF-9D85TLivFWU4jdadKcfzTgmA@mail.gmail.com>
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

> <7>[13905.531148] wireguard: Sending handshake initiation to peer 1 (x.x.x.x:16)
> <4>[13905.629622] ------------[ cut here ]------------

So you said the crash 100% occurs 100ms after sending handshake
initiation. If related this could be because:

a) The scheduler ticks come in 100ms intervals. In this case, the
crash would be caused by something in sending the initiation.
or
b) The ping latency is 100ms. In this case, the crash would be caused
by something in receiving the response.
or
c) Something else.

I'm curious: when the crash happens, does the ARM box receive the
handshake initiation message?
