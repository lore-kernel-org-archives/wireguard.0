Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ca8b11f
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 13:58:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a99dc6b9
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 13:58:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc3d4456
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 14:11:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id be707c55
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 14:11:57 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id k145so1156191oih.3
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jun 2017 07:13:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oOmacx7hhjr-5ER3mxHaACvsT7v0wuyfBPZuy5K7Bk2A@mail.gmail.com>
References: <CADdae-jBtz7zfMRPkS3c2n_zG+LCuN_0iUZHCSM=H8dWdDBUUw@mail.gmail.com>
 <CAHmME9pvAK=v32ck14AyKhAP-YFSgfzTi7f33nLBUPb7Sx1pYA@mail.gmail.com>
 <CADdae-i73rU0ot_OwvBSBdGD+mFwxQgTK0venNT6iy5QzwsDEA@mail.gmail.com>
 <CAHmME9rQk=wv=X+KqF-NXe1n=Pyj6L1JaZ-oBoLeCV+dxoK1kw@mail.gmail.com>
 <CADdae-h6BO4=tGU=QrYHWr4iW7MgMzk2ukw9jes33WEoxAF1Gw@mail.gmail.com>
 <CAHmME9oOmacx7hhjr-5ER3mxHaACvsT7v0wuyfBPZuy5K7Bk2A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Jun 2017 16:13:15 +0200
Message-ID: <CAHmME9rh4aHp2z0RLb8VVEJ=HQjT=vd5ib-D3d_tCSNjZ-7xzg@mail.gmail.com>
Subject: Re: multiple wireguard interface and kworker ressources
To: nicolas prochazka <prochazka.nicolas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jun 14, 2017 at 4:05 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Will keep a kworker at 100% CPU, even after that command completes?
> I'm unable to reproduce this here. Could you give me detailed
> environmental information so that I can reproduce this precisely?
> Something minimal and easily reproducable would be preferred.

Okay, I have a working reproducer now, and I've isolated the issue to
the xt_hashlimit garbage collector, an issue outside the WireGuard
code base. I might look for a work around within WireGuard, however.
I'll keep you posted.
