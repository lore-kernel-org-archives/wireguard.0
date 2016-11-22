Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1934b58
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Nov 2016 16:28:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3bc47435
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Nov 2016 16:28:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b9610192
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Nov 2016 16:28:07 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f82so34110580wmf.1
 for <wireguard@lists.zx2c4.com>; Tue, 22 Nov 2016 08:31:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161122130805.GG20343@tuxmachine.polynome.dn42>
References: <20161122130805.GG20343@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 22 Nov 2016 17:31:41 +0100
Message-ID: <CAHmME9pMMpmS5BNEeAeRNDLF6ZdDOVkbLVTaUTBM3Yk=u1mGAw@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Pull-based peer configuration
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey,

I've thought about the same sort of thing, too. Indeed this would be
different from an IKE daemon, because it would just be a datastructure
provider, rather than a crypto protocol situation.

I envision two uses of a pull model: "please compute this ECDH
multiplication using some daemon-controlled private key" and "do you
recognize this public key? if so, please tell me the allowed-ips for
it." The former would allow easy integration into userspace smartcard
daemons. The latter would allow easy integration into database
systems.

All and all, this isn't that hard to do. All things that have to do
with public key crypto are already strictly ratelimited and running in
a relatively friendly and safe kthread, which can do things like sleep
and yield to userspace processes. It's just a matter of adding the
machinery and exposing the APIs. I can do this.

But it does add _just a tiny little bit_ of extra complexity, which
can quickly snowball into something dreadful. My general plan for
these more enterprise-centric features is to wait until after the
initial codebase is merged into mainline. I'd like to do the best job
we can do on the core principles and components, and once we have a
solid foundation, consider the best ways of building up. (IPsec did
the opposite -- a massive set of committees designed the whole thing,
and oy gevalt...)

What do you think of this approach to that?

Jason
