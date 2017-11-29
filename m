Return-Path: mytril42@posteo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f71f905
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:30:36 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c259e1a8
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:30:36 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id 0FE7D21000
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 14:36:35 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 3yn1ll2X7rz9rxC
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 14:36:35 +0100 (CET)
Subject: Re: Dynamic Adresses
To: wireguard@lists.zx2c4.com
References: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
 <CAHmME9re6nRwz3C245Fo=2z2sbGLRJJwp+pKg9sJ8DQvT8Lmjg@mail.gmail.com>
From: Mytril <mytril42@posteo.de>
Message-ID: <d6719a62-29d2-9994-5b29-48f820bf54b7@posteo.de>
Date: Wed, 29 Nov 2017 14:35:57 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9re6nRwz3C245Fo=2z2sbGLRJJwp+pKg9sJ8DQvT8Lmjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> Hello Mytril,
> 
> This isn't a bug. DNS is resolved at configuration time. If you'd like
> to continually reresolve the DNS, you can do this with a script in any
> way you wish. WireGuard is a building block, meant to be used with a
> variety of other things like this.
> 
> The contrib/examples directory has one such script that can be used:
> https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns
> 
> I'm sure you can come up with one well suited for your uses.
> 
> Regards,
> Jason
> 

Yes i have written a similar script for the german ubuntuusers.de wiki.
And this works fine. But i think (I'm not a professional), it could be
maybe a security issue. Let me try to explain:

If Bob and Alice are two Clients which have an whireguard vpn to each
other. Eve could steal the private key of bob and the public key of
alice and wait till bob has a disconnect and get a new ip. Than eve
could register this ip and have 30 seconds or so access to the private
network of alice.

Is this not possible? I could be a problem for people, which want to
communicate with the network of the company. So if this case works, it
could be a problem.
