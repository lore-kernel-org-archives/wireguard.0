Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 635cb330
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Apr 2017 22:14:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec1d8ca8
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Apr 2017 22:14:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24b7d7d9
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Apr 2017 22:14:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 48248203
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Apr 2017 22:14:05 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id y11so98533993oie.0
 for <wireguard@lists.zx2c4.com>; Sat, 22 Apr 2017 15:22:25 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Apr 2017 00:22:22 +0200
Message-ID: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
Subject: potential preshared-key changes
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: Kevin Milner <kamilner@kamilner.ca>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

Trevor and I have been discussing for some time changing the semantics of
preshared keys. I thought about this 18 months ago, but erred on the side
of keeping things as is. After a recent conversation in SF, I'm beginning
to reconsider. I wanted to open this up for discussion, as there are
several pros and cons.

Summary: Currently the handshake mixes in the preshared-key *first*. This
means that the initiator's identity is not revealed until after the
receiver has decrypted using the preshared-key. This in turn means that
preshared-keys must be _per-interface_ instead of _per-peer_. This has
some advantages and some disadvantages. The proposal is to change the
crypto so that the preshared-key is mixed in *last*, so that
preshared-keys become shared _per-peer_.

Pros of per-interface preshared-keys (current method):

  * Simplicity.
  * That's how things work now.
  * The preshared-key protects the identity hiding in a post-quantum
    setting.
  * The preshared-key contributes to the DoS MACs and the cookie
    encryption.

Cons of per-interface preshared-keys (current method):

  * When using WireGuard with multiple peers, the peers must all share the
    same key, which increases the potential for compromise of the
    preshared-key (though the session is of course stil protected with the
    ordinary public key crypto).

Pros of per-peer preshared-keys (proposed method):

  * Compromise of the preshared-key is less likely, since it does not need
    to be shared by all peers.

Cons of per-peer preshared-keys (proposed method):

  * The identity hiding is no longer protected in a post-quantum setting.
  * The DoS MACs and cookie encryption no longer benefit from using the
    preshared-key.
  * It requires changing things.
  * Kevin and I have slightly more Tamarin work to do.

Thoughts? Opinions?

Regards,
Jason
