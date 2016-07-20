Return-Path: gniibe@fsij.org
Received: from akagi.fsij.org (akagi.fsij.org [217.70.189.144])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9232dfe4
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jul 2016 08:36:50 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>
References: <20160712231438.GF5136@gradx.cs.jhu.edu>
 <CAHmME9qvXU0GDfjT+4PrvPK3XTUU7LFz8S0b_n_XtJw3wrT7Dw@mail.gmail.com>
 <87inw9q5d1.fsf@alice.fifthhorseman.net>
 <CAHmME9qqZoyOqmPW=g_Lnp7R0-X_9q4+nXpUwoKKrS6UXxDDmQ@mail.gmail.com>
From: NIIBE Yutaka <gniibe@fsij.org>
Message-ID: <9bc05e89-d64a-0aa8-aebf-0e45b8d5f54a@fsij.org>
Date: Wed, 20 Jul 2016 17:38:24 +0900
MIME-Version: 1.0
In-Reply-To: <CAHmME9qqZoyOqmPW=g_Lnp7R0-X_9q4+nXpUwoKKrS6UXxDDmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: Nathaniel W Filardo <nwf@cs.jhu.edu>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard key lifetime / keys in smartcard?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I'm not in the WireGuard mailing list.  So, my message will
be possibly bounced.  Please forward it if needed.

On 07/15/2016 09:12 PM, Jason A. Donenfeld wrote:
> Gniibe -- pleased to meet you. What's programming these things like?

Nice to meet you, too.

For Gnuk, it's a C programming with no useful library.  I only use
limited functions from C library (like memcpy), but avoid to use
complex one like malloc.  For Gnuk 1.0, I use ChibiOS/RT for threads.
For Gnuk 1.2, I switched to my own thread library, named Chopstx
(because I only need threads).

I use my own USB routine to implement USB functionality.

RSA is based on PolarSSL 1.2.10 (now, mbedSSL), heavily modified,
without blinding.

EdDSA and X25519 are my own implementation.

While I don't have an attitude of "not invented here" in general,
however, for the particular purpose of controlling our own crypto
computation by minimizing features, Gnuk has such a shape, currently.

> How much effort do you suppose it would take me to produce a very
> stripped-down firmware for one of these that has these simple USB
> operations:
> 
> - load key from host input
> - multiply loaded key by host input
> - erase key

Well, it highly depends on the methodology and the goal.  I show two
approaches below.

(1) Bigger is easier.  Please consider to get some SDK with full of
features from a vendor, which may include some feature-ful RTOS.  If
the SDK allows programming interface like POSIX, the barrier is lower.
Even you can use crypto library written for POSIX.  If you can use
vendor supplied USB stack and you can use template and generator for
USB device, it is easier.  Once you will get the functionality, please
consider improving by removing dependencies.

While I didn't started a big one with SDK, I also took an approach
like this, started by using ChibiOS/RT, and stripped down to Chipstx.
In other words, for Gnuk 1.2, I did my best to stripped down things,
so that I can control/see/explain how computation is done.


(2) You can start from Chopstx 1.1.  For a Cortex-M0plus 48MHz board,
which I designed (and I plan to manufacture now), I wrote an example
application where I can connect to /dev/ttyACM0:


http://git.gniibe.org/gitweb/?p=chopstx/chopstx.git;a=tree;f=example-fs-bb48

I am going to add EdDSA and X25519 to this application to see how it's
fast/slow enough.

Once you will get things working in this approach, you can change USB
device implementation to your own vendor specific protocol (or any
others).


> What's the X25519 implementation in general like? Any architecture
> specific tricks required to avoid sidechannel attacks and such?

In general, we use Montgomery ladder (against timing attacks).  I also
use Montgomery ladder in Gnuk.  Choice of radix would be architecture
specific.

Implementations for PC have to care about cache and/or branch target
prediction, because of sidechannel attacks.  I don't care about these
because my target architecture doesn't have cache and branch prediction.

Cortex-M3 architecture has a multiplier with an optimization.  So,
it's timing differs.  32-bit x 32-bit -> 64-bit multiplication takes
less clocks when higher 32-bit will be zero.  I believe that this is
OK for Gnuk (attacker cannot mount this for some timing attack, in
practice).  But, since it is true that timing differs, I am going to
use Cortex-M0plus because of constant time for multiplication (and
it's slower).  Slowness is important to mitigate brute force attack
in the worse case where a control is stolen.
-- 
