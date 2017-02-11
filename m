Return-Path: crasm@wireguard.1.email.vczf.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7d48faf
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 00:12:12 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c3e2547
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 00:12:12 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CEDD820969
 for <wireguard@lists.zx2c4.com>; Fri, 10 Feb 2017 19:25:57 -0500 (EST)
Message-Id: <1486772757.2823803.877388296.4A3928CE@webmail.messagingengine.com>
From: crasm@wireguard.1.email.vczf.io
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Fri, 10 Feb 2017 19:25:57 -0500
Subject: HKDF for a Java userspace implementation?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I've started tinkering with a Java implementation of wireguard. I'm in
the early stages: the current goal is to be able to build the first
message using hardcoded parameters. I'm new to crypto and doing this
mainly for fun, curiosity, and to have wireguard on my phone.

I'm stuck on calculating the HMAC-BLAKE2s. Specifically,

    Hmac(key, input):
        Hmac-Blake2s(key, input), the ordinary BLAKE2s hash function
        used in an HMAC construction, returning 32 bytes of output.

Is there an existing library that does HKDF with BLAKE2s? Am I supposed
to write the HMAC construction myself using RFC5869 and the cited HKDF
paper [1]?

noise-java [2] can do regular BLAKE2s hashes (and I'm using that part),
but it doesn't include HMAC. Is there anything in libsodium [3] that can
help? Can someone with Java crypto experience point me in the right
direction?

Lastly, has someone already done this so I can get started on the
Android app instead? ;)

--
Christian Demsar

[1]: https://eprint.iacr.org/2010/264.pdf
[2]: https://rweather.github.io/noise-java/index.html
[3]: https://download.libsodium.org/doc/key_derivation/
