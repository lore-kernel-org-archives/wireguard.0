Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df0a15a1
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2017 12:46:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e58d1733
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2017 12:46:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d1c6f1b
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2017 12:58:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e9eb3f76
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2017 12:58:15 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id b204so199837725oii.1
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2017 05:58:58 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 23 May 2017 14:58:57 +0200
Message-ID: <CAHmME9rJESr31FE2-njs+Yy7ijQdMRYOX04mF0b14pOvKtXp+Q@mail.gmail.com>
Subject: Noise_IKpsk2_25519_ChaChaPoly_BLAKE2s first message benchmarks
To: noise <noise@moderncrypto.org>
Content-Type: text/plain; charset="UTF-8"
Cc: curves <curves@moderncrypto.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

[Noise-related, but CCing curves@, since this essentially amounts to a
benchmark of 25519.]

I added multi-core handshake processing to WireGuard this afternoon.
With that in place, I decided to run some tests on how many real life
network packets could be handled. To do this, I simply replayed the
same valid initiation packet over and over, from localhost, which
means the processing of the packet went all the way through up to the
timestamp/counter in the payload, when it then saw it was a replay and
discarded. This means that pretty much all the Noise calculations were
being executed. Measurements below are in kilo-packets per second;
each packet requires 2 ECDH() calls and a bunch of hashing.

Intel(R) Xeon(R) CPU E3-1505M v5 @ 2.80GHz

AVX-accelerated ChaCha20Poly1305, Blake2s, Curve25519 (sandy2x):
multi-core: 48k/second
single-core: 10k/second

AVX-accelerated ChaCha20Poly1305, Blake2s | Curve25519-donna 64-bit:
multi-core: 42k/second
single-core: 8.8k/second

Reference C ChaCha20Poly1305, Blake2s | Curve25519-donna 64-bit:
multi-core: 41k/second
single-core: 8.6k/second

Having accelerated hashing and encryption helps only a _little_,
whereas having accelerated ECDH helps _a bit more than a little_ but
still not _tons and tons_.

I found that on this hardware, with an incoming packet queue length of
4096, and a "do not process unless a mac2 is present, thereby
requiring a cookie reply message" max queue depth of 512, I was able
to fend of a localhost-based (read: infinite bandwidth) DoS attack.

Given that IK computes two ECDH() in the first message, are these
measurements =C2=B1  how you'd expect 25519 to perform? Is it "expected"
that the difference between donna and sandy2x isn't that massive?

Jason
