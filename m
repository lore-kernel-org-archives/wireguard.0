Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b19bca3
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 20:21:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a452cb5a
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 20:21:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ee95026
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 20:21:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 93565324
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 20:21:43 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id w10so44404090oif.0
 for <wireguard@lists.zx2c4.com>; Thu, 11 May 2017 13:32:24 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 11 May 2017 22:32:23 +0200
Message-ID: <CAHmME9r1XFZsvMskbBD8N-_+9NU7GJn+weDLwCsNrpsGPcMqDA@mail.gmail.com>
Subject: Preshared Key Rework Coming Soon
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Kevin Milner <kamilner@kamilner.ca>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey lazylist,

Since the last discussion of preshared key mode in WireGuard, we've
made some substantial progress. Trevor and I have been working out the
cryptodetails [1], and Kevin and I have been tweaking our formal
verification model. Everything is coming together quite nicely on that
front.

For those who are just catching up on this discussion, the gist is
that the PresharedKey attribute is moving from being part of the
Interface to part of the Peer. This will enable PSKs to be a pair-wise
value, rather than having an Interface use one PSK for all its peers,
a significant security improvement.

I've written up the changes in the whitepaper [2] and the protocol doc
[3]. I've implemented it in the latest git master, though probably you
should wait for the next snapshot to try it out. I'm now in the
progress of writing [4] patches [5] for various [6] WireGuard
integrations, so that when I release the next snapshot, things can
transition over smoothly, in addition to various Noise libraries [7].

If all goes well, the Noise changes will be out on Tuesday, and the
snapshot should happen minutes after that.

Let me know if there are any questions.

Regards,
Jason

[1] https://moderncrypto.org/mail-archive/noise/2017/001006.html
[2] https://www.wireguard.io/papers/wireguard.pdf
[3] https://www.wireguard.io/protocol/
[4] https://github.com/openwrt/packages/pull/4341/files#diff-4fe54b567672346a15da55f1c6af8c9a
[5] https://github.com/openwrt/luci/pull/1160/files
[6] https://github.com/NixOS/nixpkgs/pull/25646/files#diff-110379e7db2311e8bef5a02392ac1495
[7] https://github.com/flynn/noise/pull/11/files
