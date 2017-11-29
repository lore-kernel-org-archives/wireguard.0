Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bde692f1
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:34:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19a11f37
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:34:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19272627
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:34:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5bde4519
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:34:25 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id f69so2375186oig.10
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 05:40:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d6719a62-29d2-9994-5b29-48f820bf54b7@posteo.de>
References: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
 <CAHmME9re6nRwz3C245Fo=2z2sbGLRJJwp+pKg9sJ8DQvT8Lmjg@mail.gmail.com>
 <d6719a62-29d2-9994-5b29-48f820bf54b7@posteo.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Nov 2017 14:40:25 +0100
Message-ID: <CAHmME9qkGpOocxg149rTCsdY5grD3Uq6fxScqH+Q8uDFv9vzLA@mail.gmail.com>
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

On Wed, Nov 29, 2017 at 2:35 PM, Mytril <mytril42@posteo.de> wrote:
> Yes i have written a similar script for the german ubuntuusers.de wiki.

Care to share?

> If Bob and Alice are two Clients which have an whireguard vpn to each
> other. Eve could steal the private key of bob and the public key of
> alice and wait till bob has a disconnect and get a new ip. Than eve
> could register this ip and have 30 seconds or so access to the private
> network of alice.

If Eve has Bob's private key, he will always be able to impersonate
Bob to anybody. This is by design and not a security vulnerability.
Your private key is your identity. Just like SSH and a variety of
other well known protocols.
