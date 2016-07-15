Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ee03aa2
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 20:54:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db837a79
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 20:54:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 312253fe
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 20:54:16 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id y184so6676966lfd.3
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 13:55:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57892EF7.7010204@izri.org>
References: <20160712231438.GF5136@gradx.cs.jhu.edu>
 <CAHmME9qvXU0GDfjT+4PrvPK3XTUU7LFz8S0b_n_XtJw3wrT7Dw@mail.gmail.com>
 <87inw9q5d1.fsf@alice.fifthhorseman.net>
 <CAHmME9qqZoyOqmPW=g_Lnp7R0-X_9q4+nXpUwoKKrS6UXxDDmQ@mail.gmail.com>
 <57892EF7.7010204@izri.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 15 Jul 2016 22:55:27 +0200
Message-ID: <CAHmME9q5=Yr6PVfaH73C6NrJFe8w=0mjYpOqwMi1a4wOwy8cLg@mail.gmail.com>
To: gric <gric@izri.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard key lifetime / keys in smartcard?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 15, 2016 at 8:44 PM, gric <gric@izri.org> wrote:
> They are Cortex-M3 ARM microcontrollers (STM32F103).

Cool, so shouldn't be too hard.

>
> Keys should be generated on the card if possible.

Right, of course.

>
> I suppose this stripped down firmware will not conform to the OpenPGP
> Card specification, especially considering that there is no need for
> user-space to ever touch the keys.

Right. Generate key. Multiply. Erase. Anything more complex risks
leaking the key due to implementation flaws, especially considering
the key is just stored in NOR as you explained below.

>
> The operations themselves are not harder than usual to implement,
> however it should be noted that the MCU provides:
>
> - No crypto facilities of any kind.
> - No anti-tampering mecanisms.
> - No side-channel and fault injection mitigation.
> - No features designed for random-number generation. Gnuk/NeuG uses the
> STM32 ADCs.
> - No dedicated area to store the keys. They seem to be stored in NOR.
> - No code signature verification.
>
> The list goes on. It is not officially labeled as a HSM because it is
> not one. It could possibly help to protect the keys a bit from a
> compromise of the host, but it will not hold for more than a few minutes
> if you loose physical control of the dongle. I wonder what kind of
> non-invasive attacks have been attempted, especially against the EC modes.

Not good. The poor RNG is especially worrying. So this isn't very
interesting in fact...

Do you know any dedicated chips that do X25519 that have a safe place
for storing them and a good RNG?

>
> For personal use when a host compromise is detected, key rotation is
> often a small effort compared to decontamination. The main benefit is to
> require the attacker to connect to the host in order to capture
> temporary keys or directly inject traffic in the tunnel, and to deny him
> the ability to do so when the dongle is removed.

Right. The idea is when inevitably the Linux box gets popped.
Preventing software-side cloning seems somewhat worthwhile.

> For servers, the maximum number of connected peers will be limited by
> the MCU performance. Unfortunately a very large number of peers with
> difficulties to update the server public key would be the only case
> where reusing a key after a host compromise looks excusable.

Curve25519 is pretty fast, but you're right -- maybe an M.3 would wind
up being intolerably slow.

>
> It might feel better than to store keys in ~, however the security
> benefits in the case of the STM32 do not seem sufficient to justify a
> lot of added complexity.

:(
