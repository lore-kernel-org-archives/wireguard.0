Return-Path: ygh@mysterious.site
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94582301
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Feb 2017 06:06:41 +0000 (UTC)
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d759ea3
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Feb 2017 06:06:41 +0000 (UTC)
Date: Mon, 20 Feb 2017 20:07:25 -1000
From: sopium <sopium@mysterious.site>
To: <wireguard@lists.zx2c4.com>
Message-ID: <15a5f481984.f050e1c666041.7938484243662330654@mysterious.site>
In-Reply-To: 
Subject: Working on a Rust implementation, and request for test vectors
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello list and Jason,

I'd like to tell you that I have started working on a Rust
implementation of WireGuard (actually to make my TiTun[0] program
compatible with WireGuard).

I have already implemented the Noise part in noise-rust[1]. It is a
rewrite of screech, with hopefully better API, documentation, testing
and overall quality. Issues like [2] and [3] should have been
solved. I wish noise-rust would be helpful for those who want to
implement WireGuard (or other Noise based protocols) in Rust.

I plan to implement the rest of the WireGuard protocol in the
following weeks. (Well, no promises.) You are welcome to join the
effort, of course.

Jason, can you generate and provide some test vectors for WireGuard?
E.g. for the less widely used or less clearly defined primitives, like
HMAC-BLAKE2s and XChaCha20Poly1305. And for whole handshake and
transportation sessions. And for cookie reply packet generation. That
should greatly help ensure interoperability between different WireGuard
implementations.

0. https://github.com/sopium/titun

1. https://github.com/sopium/noise-rust

2. https://github.com/trevp/screech/issues/5

3. https://github.com/solidsnack/screech/commit/6d91d075ad2f98f03c807a471953495c720a5696

Regards,
Sopium
