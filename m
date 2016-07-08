Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd9e3fe1
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 10:28:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40798227
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 10:28:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9cda82d7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 10:28:54 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id q132so26784672lfe.3
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 03:29:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pc0JgTgCTQ6FT5ChvB+0mv8nDLA57iis9c2FA7MPSV-g@mail.gmail.com>
References: <CAHQn_MAD4WvhueAEVR255SarPnJtfvYjREA7MFdsaJrz97EEBw@mail.gmail.com>
 <CAHmME9pc0JgTgCTQ6FT5ChvB+0mv8nDLA57iis9c2FA7MPSV-g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 12:29:10 +0200
Message-ID: <CAHmME9p+dXdDfHDZeyZqudzT3aYgOv7-kVPJdrZLFo-q+qaZPg@mail.gmail.com>
To: Bin Jin <bjin@ctrl-d.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Options to obfuscate WireGuard traffic?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 8, 2016 at 12:26 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> a) The first byte, which is a fixed `type` value.
> b) The fact that `mac2` is most often all zeros.
> c) The fixed length of handshake messages.
> d) The unencrypted ephemeral public key.

How could I forget?

e) Incremental nonce.

This system would clearly need to be replaced by random IVs -- using
something like xchacha20. Inside then would be an encrypted sequence
number to prevent replay attack.
