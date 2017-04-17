Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3b8e970
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 21:23:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87543f26
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 21:23:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb964f31
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 21:23:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ffd52e75
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 21:23:12 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id b187so156441280oif.0
 for <wireguard@lists.zx2c4.com>; Mon, 17 Apr 2017 14:30:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPNEFAZZziFPm7mDxBA8WDYROBaBP-fv8RsYjGtTLDDd46+0Xw@mail.gmail.com>
References: <CAPNEFAaG3cQQJSyAuGxdHQHMm6+RzrQVt9ZrzTxrVNKm01z2dA@mail.gmail.com>
 <CAHmME9qQmaQXBJ+pR6MHx90fUb0_EmwriBo6=rRupEDFF6d=Yg@mail.gmail.com>
 <CAPNEFAZZziFPm7mDxBA8WDYROBaBP-fv8RsYjGtTLDDd46+0Xw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 Apr 2017 23:30:53 +0200
Message-ID: <CAHmME9rTkyj-K0xi4Kt2Jf9sp2ibF1byXkCN+rZ-CMk7RNHCvg@mail.gmail.com>
Subject: Re: nat traversal / userspace impl
To: "Jason E. Aten" <j.e.aten@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Apr 17, 2017 at 11:28 PM, Jason E. Aten <j.e.aten@gmail.com> wrote:
> The "number of security problems" with the approach mentioned in passing in
> the 2016-August message would need enumeration and addressing. Is anybody
> thinking about those? Is this on the roadmap for future plans?

If you're referring to the proof of concept example code for hole
punching... it's just PoC/example code. If you'd like to develop it
into something production worthy, you're more than welcome. It's
licensed under the GPLv2.

Jason
