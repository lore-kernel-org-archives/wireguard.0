Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6f65706
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Oct 2016 10:22:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38c184e4
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Oct 2016 10:22:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 68c14bd4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Oct 2016 10:22:03 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id f134so11240288lfg.2
 for <wireguard@lists.zx2c4.com>; Sun, 23 Oct 2016 03:23:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87wph0pm06.fsf@toke.dk>
References: <87mvi0jxsb.fsf@toke.dk>
 <58096029.23859.5C451AE@pageexec.gmail.com>
 <CAHmME9opbKv9c67uCk69K_J3=A0-8p0gkwmJos83wBiMJ9WmCw@mail.gmail.com>
 <5809CB98.15179.767FB18@pageexec.gmail.com>
 <CAHmME9oAnWiN8fx5dGP6+i+rTdxH4fMfxmbsr56Ey7viBwiL-Q@mail.gmail.com>
 <87bmyet4dx.fsf@toke.dk>
 <CAHmME9pF_jcwP6ZbnH1zLmA4vG6c6z+yZ_wO2cSB4W80u0TkEw@mail.gmail.com>
 <87wph0pm06.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Oct 2016 19:23:20 +0900
Message-ID: <CAHmME9ppmQourShXfNnyOEnH_LdVQHrrc8XCui9MYEVYnTLCiQ@mail.gmail.com>
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset=UTF-8
Cc: Emese Revfy <re.emese@gmail.com>, Pipacs <pageexec@gmail.com>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I've switched to using the same strategy of tun.c, and simply
resetting all the fields, even if this is semantically incorrect, as
the rest of the kernel seems to do this in fact:
https://git.zx2c4.com/WireGuard/commit/?id=95a869e45905766878cc4fee1a27a1c933786361

This should make WireGuard run fine on PaX. That, combined with the
previous PaX-motivated commit, should make WireGuard work with
Grsecurity kernels without any modification necessary. This work will
be part of the next snapshot I tag.

Jason
