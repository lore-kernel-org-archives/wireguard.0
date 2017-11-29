Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08c27e40
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:06:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 569d1029
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:06:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11d57c62
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:06:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6add7a3e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:06:22 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id b54so2934383otd.8
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 05:12:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
References: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Nov 2017 14:12:21 +0100
Message-ID: <CAHmME9re6nRwz3C245Fo=2z2sbGLRJJwp+pKg9sJ8DQvT8Lmjg@mail.gmail.com>
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

Hello Mytril,

This isn't a bug. DNS is resolved at configuration time. If you'd like
to continually reresolve the DNS, you can do this with a script in any
way you wish. WireGuard is a building block, meant to be used with a
variety of other things like this.

The contrib/examples directory has one such script that can be used:
https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns

I'm sure you can come up with one well suited for your uses.

Regards,
Jason
