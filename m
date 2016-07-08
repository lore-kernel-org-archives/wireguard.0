Return-Path: jonathan@titanous.com
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55f6dc3c
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 12:03:22 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jonathan Rudenberg <jonathan@titanous.com>
In-Reply-To: <CAHmME9pc0JgTgCTQ6FT5ChvB+0mv8nDLA57iis9c2FA7MPSV-g@mail.gmail.com>
Date: Fri, 8 Jul 2016 08:03:39 -0400
Message-Id: <1A593EA3-2F88-45E9-859B-33D4C7EC905D@titanous.com>
References: <CAHQn_MAD4WvhueAEVR255SarPnJtfvYjREA7MFdsaJrz97EEBw@mail.gmail.com>
 <CAHmME9pc0JgTgCTQ6FT5ChvB+0mv8nDLA57iis9c2FA7MPSV-g@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Options to obfuscate WireGuard traffic?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On Jul 8, 2016, at 06:26, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> The hardest one, (d), is not a problem, I don't think, because
> these public keys are still uniformly distributed. The amount of
> public keys that would have to be collected in order to not rule out
> false positives is way too big, I suspect. So, not a problem in the
> end.

My understanding is that it is possible to detect even Curve25519 public =
keys on the wire, given enough examples of traffic. The Elligator paper =
provides some examples of algorithms for doing so and provides a system =
that makes them completely indistinguishable from random strings: =
https://elligator.cr.yp.to/

Here is some documentation of applying it to Curve25519: =
https://www.imperialviolet.org/2013/12/25/elligator.html=
