Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffc976a1
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 04:16:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1257c2bf
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 04:16:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffed7c33
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 04:16:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a16278aa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 04:16:39 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id w125so10777237oie.7
 for <wireguard@lists.zx2c4.com>; Sun, 10 Dec 2017 20:24:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1512909832.1336.19.camel@gmx.de>
References: <1512909832.1336.19.camel@gmx.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Dec 2017 05:24:07 +0100
Message-ID: <CAHmME9oozPm64FhRtTmohsTsghxYgeattRixbKo_bm9Ru9kNDg@mail.gmail.com>
Subject: Re: Reading configuration from stdin
To: =?UTF-8?Q?Manuel_Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Manuel,

Thanks for the patch. A few comments on the general idea below:

On Sun, Dec 10, 2017 at 1:43 PM, Manuel Sch=C3=B6lling
<manuel.schoelling@gmx.de> wrote:
> I am currently working on a NetworkManager plugin for WireGuard in Rust
> [1/2].
> The plugin has to pass the configuration to the wg tool and I am
> wondering if this could be done using interprocess communication.
> Btw, this NetworkManager plugin should not only work for the regular
> WireGuard but also for my wireguard peer-to-peer tool [3] whose
> development is currently stalled by a rust bug [4].

I'd suggest the following for a WireGuard NetworkManager plugin:

1. If you want to do stuff for wireguard-p2p, can you make it a
separate "extra" plugin, so that the generic WireGuard one is globally
useful? And then people who use the p2p stuff can use a separate
plugin that piggybacks upon the first?

2. Write it in a language that will be accepted by upstream. I have no
clue their thoughts on Rust.

3. Rather than calling wg(8), maybe it's best to speak the Netlink API
directly? I can give you a hand with this, if you want. The API is
documented in this header:
https://git.zx2c4.com/WireGuard/tree/src/uapi/wireguard.h


> Would it make sense (aka be secure) if we make it possible to call 'wg
> setconf wg0 -' so the wg tool does not read the configuration from a
> file but from stdin? Same for 'wg set wg0 private-key -' and 'wg set
> wg0 psk -'?

wg-quick(8) does this precise thing, and generally this is a fine way
of passing config information. However, usually you can get away with
using the more explicit /dev/stdin or /proc/self/fd/0, as Aaron
suggested. Are there reasons to prefer - over /dev/stdin?

Jason
