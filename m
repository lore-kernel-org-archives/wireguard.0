Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dfe3ed7
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jul 2016 23:39:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bba6c07
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jul 2016 23:39:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5d1f24c8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jul 2016 23:39:15 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id l69so15752833lfg.1
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jul 2016 16:41:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <62f0dc7c-4eb4-523a-c548-ee2b2a6ec038@viisauksena.de>
References: <62f0dc7c-4eb4-523a-c548-ee2b2a6ec038@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Jul 2016 01:41:48 +0200
Message-ID: <CAHmME9owfe25ER4kS_jEOgMZO+eD5CZJnUqx1dz73k_z8VYYDg@mail.gmail.com>
To: jens <jens@viisauksena.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Header / MTU sizes for Wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jens,

I assume it was you asking in the IRC channel about this same thing
before signing out? Sorry I wasn't there when you were; I only just
now arrived home.

There actually is some optimization potential for you with regards to
the MTU. The overhead of WireGuard breaks down as follows:

- 20 byte IPv4 header or 40 byte IPv6 header
- 8 byte UDP header
- 1 byte type
- 4 byte key index
- 8 byte nonce
- N byte encrypted data
- 16 byte poly1305 authentication tag

So, if you assume 1500 byte ethernet frames, the worst case (IPv6)
winds up being 1500-(40+8+1+4+8+16), leaving N=1423 bytes. However, if
you know ahead of time that you're going to be using IPv4 exclusively,
then you could get away with 1443 bytes.

Hope that helps,
Jason
