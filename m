Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4aa08b53
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Dec 2016 22:48:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aff75360
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Dec 2016 22:48:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d514300f
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Dec 2016 22:48:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ca3078a4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Dec 2016 22:48:02 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id v84so313176635oie.3
 for <wireguard@lists.zx2c4.com>; Sun, 25 Dec 2016 14:55:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161225224225.GA5081@lud.home>
References: <ffffffffac503169@frisell.zx2c4.com>
 <20161225224225.GA5081@lud.home>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Dec 2016 23:55:46 +0100
Message-ID: <CAHmME9rpN9vRT7gv7tiGkBHB0DwKjSxz_N_y+YDYzU66xU87rQ@mail.gmail.com>
Subject: Re: Introduction of XChaCha20Poly1305 (Was: [ANNOUNCE] Snapshot
 `0.0.20161223` Available)
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Dec 25, 2016 at 11:42 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> - Is this backwards compatible?

No, but I'm 99% sure you've never hit the code path for which this is
actually used.

> - Could you provide references describing XChaCha20Poly1305 and the
>   differences with ChaCha20Poly1305?

Mentioned in the references of
https://www.wireguard.io/papers/wireguard.pdf, it's got a security
proof:
https://cr.yp.to/snuffle/xsalsa-20110204.pdf

The basic issue is that with chapoly's aead construction, you never
want to reuse the same key with the same nonce. Before, I used to do
this:

salt = random(32bytes)
derived_key = blake2s(key=real_key, salt)
chacha20poly1305(key=derived_key, nonce=0, payload)

This works fine and is secure, since blake2 is a PRF, but it's not as
optimal as it could be. The new construction is instead:

nonce = random(24bytes)
xchacha20poly1305(key=real_key, nonce=nonce, payload)

Which is a lot more similar. Under the hood, xchacha20poly1305 expands
to basically the same thing:

derived_key = hchacha20(key=key, nonce=nonce[0:16])
chacha20poly1305(key=derived_key, nonce=none[16:24], payload)

Where in this case, hchacha20 is basically:

key_material = chacha20(key=key, nonce=nonce[0:16)
return key_material[0:16] + key_material[48:64]

In other words, we trade a computation of blake2s for a single
chacha20 core function.

The advantage is not only speed and simplicity, but also the existence
of the xchacha20pol1305 aead in libraries:
https://github.com/jedisct1/libsodium/blob/master/src/libsodium/crypto_aead/xchacha20poly1305/sodium/aead_xchacha20poly1305.c

> - What part of the protocol does this change?  Is it just the initial key
>   exchange?

It's for cookie encryption, part 5.4.7 of the paper.
