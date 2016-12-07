Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f8e5547
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:05:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e87d31e
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:05:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a597b699
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:05:53 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f82so179996579wmf.1
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 10:11:19 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 7 Dec 2016 19:11:17 +0100
Message-ID: <CAHmME9q_HCBTx9K47LQxQcS8qCSfecudG=haMeuBAzJDvoOOEg@mail.gmail.com>
Subject: Odd length headers and alignment
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

Hey guys,

Wireguard data packets have a 1 byte type, a 4 byte index, an 8 byte
nonce, the ciphertext, and then a 16 byte auth tag. Having 13 bytes in
the beginning means that when we do in-place decryption, the plaintext
winds up starting at an odd-byte, transferring misalignment down to
the rest of the stack.

Now, in my testing on alignment-sensitive MIPS boxes, I've only had
alignment exceptions with this regarding the first byte, which is the
version number of the IP header. Since this is just a single byte, the
alignment doesn't actually matter. But in practice, the compiler
generates a 16-bit load instead of an 8-bit load, which sucks. I may
be able to work around this though. Beyond that, I haven't actually
observed exceptions from elsewhere in the stack regarding
misalignment.

So, how much of a problem do you suppose this is? Would it be
worthwhile to stick an _extra byte_ in the header, just to get even
alignment? Or an extra three bytes to get 16-byte alignment? Or do you
suppose this isn't really worth the bloat and MTU loss?

Just something to think about...

Jason
