Return-Path: gric@izri.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f1038f6
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 18:42:58 +0000 (UTC)
Received: from mfilter32-d.gandi.net (mfilter32-d.gandi.net [217.70.178.163])
 by relay4-d.mail.gandi.net (Postfix) with ESMTP id 8C36B1720B1
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 20:44:09 +0200 (CEST)
Received: from relay4-d.mail.gandi.net ([IPv6:::ffff:217.70.183.196])
 by mfilter32-d.gandi.net (mfilter32-d.gandi.net [::ffff:10.0.15.180])
 (amavisd-new, port 10024)
 with ESMTP id Mm2-cE-RqR4W for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 20:44:08 +0200 (CEST)
Received: from [192.168.93.134] (254.238.207.77.rev.sfr.net [77.207.238.254])
 (Authenticated sender: gric@izri.org)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0B6041720A1
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 20:44:07 +0200 (CEST)
To: wireguard@lists.zx2c4.com
References: <20160712231438.GF5136@gradx.cs.jhu.edu>
 <CAHmME9qvXU0GDfjT+4PrvPK3XTUU7LFz8S0b_n_XtJw3wrT7Dw@mail.gmail.com>
 <87inw9q5d1.fsf@alice.fifthhorseman.net>
 <CAHmME9qqZoyOqmPW=g_Lnp7R0-X_9q4+nXpUwoKKrS6UXxDDmQ@mail.gmail.com>
From: gric <gric@izri.org>
Message-ID: <57892EF7.7010204@izri.org>
Date: Fri, 15 Jul 2016 18:44:07 +0000
MIME-Version: 1.0
In-Reply-To: <CAHmME9qqZoyOqmPW=g_Lnp7R0-X_9q4+nXpUwoKKrS6UXxDDmQ@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Subject: Re: [WireGuard] WireGuard key lifetime / keys in smartcard?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> What's programming these things like?

They are Cortex-M3 ARM microcontrollers (STM32F103). So pretty standard.
No java involved. As said earlier, they have free toolchains.

> How much effort do you suppose it would take me to produce a very
> stripped-down firmware for one of these that has these simple USB
> operations:
>
> - load key from host input
> - multiply loaded key by host input
> - erase key
>
> What's the X25519 implementation in general like? Any architecture
> specific tricks required to avoid sidechannel attacks and such?

Keys should be generated on the card if possible.

I suppose this stripped down firmware will not conform to the OpenPGP
Card specification, especially considering that there is no need for
user-space to ever touch the keys.

The operations themselves are not harder than usual to implement,
however it should be noted that the MCU provides:

- No crypto facilities of any kind.
- No anti-tampering mecanisms.
- No side-channel and fault injection mitigation.
- No features designed for random-number generation. Gnuk/NeuG uses the
STM32 ADCs.
- No dedicated area to store the keys. They seem to be stored in NOR.
- No code signature verification.

The list goes on. It is not officially labeled as a HSM because it is
not one. It could possibly help to protect the keys a bit from a
compromise of the host, but it will not hold for more than a few minutes
if you loose physical control of the dongle. I wonder what kind of
non-invasive attacks have been attempted, especially against the EC modes.

For personal use when a host compromise is detected, key rotation is
often a small effort compared to decontamination. The main benefit is to
require the attacker to connect to the host in order to capture
temporary keys or directly inject traffic in the tunnel, and to deny him
the ability to do so when the dongle is removed.

For servers, the maximum number of connected peers will be limited by
the MCU performance. Unfortunately a very large number of peers with
difficulties to update the server public key would be the only case
where reusing a key after a host compromise looks excusable.

It might feel better than to store keys in ~, however the security
benefits in the case of the STM32 do not seem sufficient to justify a
lot of added complexity.
