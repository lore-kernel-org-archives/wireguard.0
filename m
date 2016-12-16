Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97203fd8
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 04:41:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27655ba0
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 04:41:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1aa1e2c0
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 04:41:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ce01a48
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 04:41:04 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id v84so67214092oie.3
 for <wireguard@lists.zx2c4.com>; Thu, 15 Dec 2016 20:47:34 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Dec 2016 05:47:33 +0100
Message-ID: <CAHmME9pWnPunbQdPTKwbmvTSR8Yq4LhRBjEfR0xa7AdXDH669g@mail.gmail.com>
Subject: Headers gain 3 bytes of reserved zeros
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I did it. White paper updated. Protocol webpage updated.

Benefits:
- Natural 4 byte alignment of ciphertext, which confers significant
speedups on many platforms
- Natural 4 byte alignment of resultant plaintext IP packet; similar speedups.
- Natural integer alignment of index and nonce; similar speedups for
packet lookups.
- Easier to implement in hardware.
- Protocol is more extendable.

Detriments:
- 3 bytes less in the MTU.

This will be part of the next snapshot.
