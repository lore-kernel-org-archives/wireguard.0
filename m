Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7c753b0
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 08:20:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8751d865
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 08:20:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 17df9728
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 08:20:52 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id b199so32882206lfe.0
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jul 2016 01:21:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160712231438.GF5136@gradx.cs.jhu.edu>
References: <20160712231438.GF5136@gradx.cs.jhu.edu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jul 2016 10:21:43 +0200
Message-ID: <CAHmME9qvXU0GDfjT+4PrvPK3XTUU7LFz8S0b_n_XtJw3wrT7Dw@mail.gmail.com>
To: Nathaniel W Filardo <nwf@cs.jhu.edu>
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

Hey!

What a pleasure it is to see you on this list. Incredible blast from the past.

On Wed, Jul 13, 2016 at 1:14 AM, Nathaniel W Filardo <nwf@cs.jhu.edu> wrote:
> I am sure this is a completely ignorant question, but: I'd love to have a
> wireguard host without direct access to its long-term identity keys to raise
> the difficulty of silently spoofing/cloning a tunnel endpoint after host
> compromise.  I can see two possible ways forward, though I'm sure there are
> others!

Not an ignorant question at all. This would indeed be very interesting.

>
> 1. Long-lived identity keys giving rise to shorter-lived keys.  Wireguard
>    would, as part of the handshake, include the signature that attested the
>    short-term key as a legitimate product of the long-term key.

This is something for which Noise is well suited. There wouldn't be
signatures, but rather a temporary key would be derived from the long
term one.

What kind of lifetime would be appropriate here, though? Presumably
the main wireguard instance would have to continually fetch new
ephemerals from the box with the longterm keys. If the main wireguard
instance is compromised, it'd then be possible to imitate the main
wireguard instance to the longterm key server, which presents again
the same issue. Or did you have in mind a kind of manual intervention?


>
> 2. Long-lived keys not in host memory (e.g. in a smartcard).  I don't know
>    if the kernel has an existing mechanism for upcalling to userland to
>    request a cryptographic transform, but it seems like a plausible thing to
>    want.  (I'm aware of the request-key mechanism, but that doesn't seem
>    like what'd be wanted here.)  Handshakes would be slow (limited by crypto
>    processor and upcall overhead) but otherwise the WireGuard protocol would
>    not change.

The kernel's crypto API has all sorts of async methods of getting
things done, and I'm pretty sure this was built with smartcards and
HSMs in mind. In our case, we wouldn't be asking for a signature but
rather an X25519 multiplication from the device. I assume there's some
ugly code out there for javacard, but I'm not sure if there's any real
HSM for 25519. Something to look into... Using hardware to prevent key
heists strikes me as generally the most robust solution.


A third option is to hide private keys between network namespaces. For
example, a particular container might receive a wg0 interface as its
sole link to the network, but would be unable to read out key material
from it. This is an easy sort of thing to support. Unfortunately, the
Linux kernel is a disaster from a security perspective and container
escapes are a dime a dozen...

Jason
