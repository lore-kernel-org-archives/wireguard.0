Return-Path: em12345@web.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8a6fa61
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 20:04:25 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93498b05
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 20:04:24 +0000 (UTC)
Received: from [10.44.44.64] ([178.21.50.57]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LpQjF-1gQIOP0mJx-00fF9t for
 <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 22:15:48 +0200
Subject: Re: Reflections on WireGuard Design Goals
To: wireguard@lists.zx2c4.com
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
From: em12345 <em12345@web.de>
Message-ID: <1635651d-7119-8ffb-a829-617dc9b9bb0d@web.de>
Date: Fri, 10 Aug 2018 22:15:44 +0200
MIME-Version: 1.0
In-Reply-To: <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

> From my point of view, the only thing which makes me uncomfortable about
> wireguard is the lack of any second authentication factor. Your private
> key is embedded in a plaintext file in your device (e.g. laptop), not
> even protected with a passphrase.

Most VPN authentications are just authorizing the machine and not the
user sitting in front of that machine.

> Anyone who gains access to that
> laptop is able to establish wireguard connections.
>
> Of course, it can be argued that the laptop holds other information
> which is more valuable that the wireguard key, therefore you should
> concentrate on properly securing the laptop itself (*). Furthermore,

No matter how much keys, passwords or tokens have to be entered by the
user sitting in front of that machine, any other user already on that
machine, will gain sooner or later access to the tunnel. This user or
attacker doesn't even need to see/know wireguard's private key nor does
the attacker need root access. Think of a second user logged in on that
machine.

It is definitely a bad idea to assume that the tunnel traffic of one
"client" (in terms of wg's client key pair) comes from a specific user.
Which also means that even multi factor VPN authentication still require
all services inside the tunnel to ask for user authentication.


Emmanuel
