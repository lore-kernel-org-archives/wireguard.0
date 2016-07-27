Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a33ea17
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 11:02:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fde95fe8
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 11:02:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 79571862
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 11:02:41 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id g62so24600900lfe.3
 for <wireguard@lists.zx2c4.com>; Wed, 27 Jul 2016 04:05:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Jul 2016 13:05:18 +0200
Message-ID: <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
To: Jens Viisauksena <jens@viisauksena.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
	crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jul 27, 2016 at 12:26 PM, Jens Viisauksena <jens@viisauksena.de> wrote:
> It should however not lead to netifd outofmemory, load of 2.6 and the
> oomkiller berserking around at all... even if its not directly wg fault.

One thing to try would be removing these lines from src/socket.c:

socket.c
386:    sk_clear_memalloc(sock);
394:    sk_set_memalloc(sock->sk);

I'd be interested to learn if that fixes things.
