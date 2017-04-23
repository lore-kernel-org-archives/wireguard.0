Return-Path: crasm@wireguard.1.email.vczf.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30134405
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 06:57:13 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df75db3b
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 06:57:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id AFB9920DC6
 for <wireguard@lists.zx2c4.com>; Sun, 23 Apr 2017 03:05:36 -0400 (EDT)
Message-Id: <1492931136.3430679.953148112.4F826684@webmail.messagingengine.com>
From: crasm@wireguard.1.email.vczf.io
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
References: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
Date: Sun, 23 Apr 2017 03:05:36 -0400
Subject: Re: potential preshared-key changes
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Forgive me in advance if this is a horrible or misinformed idea, but why
not blake2s the preshared-key with each peer's public key and distribute
that as a per-peer "preshared" key, mixing it in last? That would reduce
the risk of key compromise, since each peer would have a unique key and
the real key is not copied to each peer.

I do like identity hiding, but I can't tell if there's a way for the
above to work without exposing public keys (at least considering roaming
IPs).
