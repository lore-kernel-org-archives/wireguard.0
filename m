Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30262c4f
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 09:45:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a2db492
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 09:45:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 42233ec8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 09:45:10 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l188so150944472lfe.2
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2016 02:45:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87poqru2jp.fsf@alice.fifthhorseman.net>
References: <8760snzxk6.fsf@alice.fifthhorseman.net>
 <CAHmME9of+yaYna73cd+H-Mr+6q8c6QT_+mg==M4VGHX6ESckwQ@mail.gmail.com>
 <87poqru2jp.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 Jul 2016 11:45:12 +0200
Message-ID: <CAHmME9rej00Nx9oWd1f3pmHsnN31FO0x=w+28wE+2=N_H4oKgw@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] stricter inputs for wg genkey, genpsk, and pubkey
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> it makes it slightly
> less likely to blindly accept some non-randomly-generated base64-encoded
> 256-bit string.

X25519 libraries are standardizing on doing the normalization
themselves, so actually it's fine to have your private key be a random
256-bit string, since it'll be normalized anyway before
multiplication.
