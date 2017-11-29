Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3a67e80
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:48:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e999477
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:48:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a629beb
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:48:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f7a8e498
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:48:31 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id o23so3064348otd.1
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 05:54:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3952fa1c-80e1-dd42-7eaf-5e7fceff3daa@posteo.de>
References: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
 <CAHmME9re6nRwz3C245Fo=2z2sbGLRJJwp+pKg9sJ8DQvT8Lmjg@mail.gmail.com>
 <d6719a62-29d2-9994-5b29-48f820bf54b7@posteo.de>
 <CAHmME9qkGpOocxg149rTCsdY5grD3Uq6fxScqH+Q8uDFv9vzLA@mail.gmail.com>
 <3952fa1c-80e1-dd42-7eaf-5e7fceff3daa@posteo.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Nov 2017 14:54:30 +0100
Message-ID: <CAHmME9qgsBbXxGumQ+N6-8nfc1tysrdOff71rFrYGFac=bohnw@mail.gmail.com>
Subject: Re: Dynamic Adresses
To: Mytril <mytril42@posteo.de>
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

On Wed, Nov 29, 2017 at 2:47 PM, Mytril <mytril42@posteo.de> wrote:
> Yes if you want:
> https://wiki.ubuntuusers.de/Baustelle/WireGuard/#Probleme-mit-der-dynamischen-IP
>
> This artikel is work in progress, later it will be accessable under:
> https://wiki.ubuntuusers.de/WireGuard/#Probleme-mit-der-dynamischen-IP

As I mentioned to Georg, this really should link to
https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns
instead of using ifup&&ifdown, which is a pretty ugly solution. I'd
edit it myself, except I don't [yet?] read German.

Jason
