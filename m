Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ea2f2f9
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 14:28:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc01f751
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 14:28:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b5893150
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 14:28:00 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id f6so155777762lfg.0
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2016 07:28:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <577cfed2.c1bd370a.78cba.ffff9b3eSMTPIN_ADDED_BROKEN@mx.google.com>
References: <577cfed2.c1bd370a.78cba.ffff9b3eSMTPIN_ADDED_BROKEN@mx.google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 Jul 2016 16:28:02 +0200
Message-ID: <CAHmME9rqC2gbixm6DT7mdW4sYPHSPJv8P1fF6M+x8Z-9HvdF3A@mail.gmail.com>
To: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Gloannec?= <frederic.gloannec@thegreenbow.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Which protocol to get network configuration from
 gateway to clients.
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Fr=C3=A9d=C3=A9ric,

The beauty is: you can use whatever protocol you want. Use
TLS/HTTP/REST/JSON if that's your style. Use SSH if it suits your
fancy. Hand code preshared substitution tables onto carrier pigeon
parchment, if you're feeling ancient. Slip Senator Vandenberg your
public key and desired IP on microfilm during a secret senate floor
handshake too subtle for early film cameras to catch. You can do a
million different things to integrate it directly into your
infrastructure and how you like doing things.

After WireGuard gets stabilized, I have some plans of my own for
making upper layer tools for that. But I sort of suspect others will
make things like that before I get to it, and you shouldn't hesitate
to integrate it into your infrastructure how you like.

There's also the out-of-band extension idea from this thread [1], that
could at some point grow into something interesting.

Of course, if you can, it's probably superior to use more static
configuration, leaving distribution of that to your ordinary
configuration management system. For example, while you're at it
having puppet/ansiable/chef/whatever push the ordinary networking
config and pre-verified SSH host keys, have it push your wireguard
configuration too. Or maybe this isn't your cup of tea.

By leaving these concerns out of wireguard directly, we aim to make
the core of the project a lot more usable and integratable. I manage
quite a few systems myself, so I'm happy to put on my
sysadmin/devops/sre hat and help you come up with something that fits
your environment. And I'm sure others on this list have their set of
opinions and advice too.

So, what's your environment like? What do you want to do? Let's
theorize potential solutions for you. And maybe in the exercise of
doing that, we'll figure out new ways to both use WireGuard and
improve it to be more robust and fitting for your environment.

Jason

[1] https://lists.zx2c4.com/pipermail/wireguard/2016-June/000038.html
