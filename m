Return-Path: mytril42@posteo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 099d7775
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:42:51 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b39b659
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:42:51 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id C1F5620F43
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 14:48:51 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 3yn21f1r8Wz9rxD
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 14:48:38 +0100 (CET)
Subject: Re: Dynamic Adresses
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
 <CAHmME9re6nRwz3C245Fo=2z2sbGLRJJwp+pKg9sJ8DQvT8Lmjg@mail.gmail.com>
 <d6719a62-29d2-9994-5b29-48f820bf54b7@posteo.de>
 <CAHmME9qkGpOocxg149rTCsdY5grD3Uq6fxScqH+Q8uDFv9vzLA@mail.gmail.com>
From: Mytril <mytril42@posteo.de>
Message-ID: <3952fa1c-80e1-dd42-7eaf-5e7fceff3daa@posteo.de>
Date: Wed, 29 Nov 2017 14:47:57 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9qkGpOocxg149rTCsdY5grD3Uq6fxScqH+Q8uDFv9vzLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> On Wed, Nov 29, 2017 at 2:35 PM, Mytril <mytril42@posteo.de> wrote:
>> Yes i have written a similar script for the german ubuntuusers.de wiki.
> 
> Care to share?
> 

Yes if you want:
https://wiki.ubuntuusers.de/Baustelle/WireGuard/#Probleme-mit-der-dynamischen-IP

This artikel is work in progress, later it will be accessable under:
https://wiki.ubuntuusers.de/WireGuard/#Probleme-mit-der-dynamischen-IP

>> If Bob and Alice are two Clients which have an whireguard vpn to each
>> other. Eve could steal the private key of bob and the public key of
>> alice and wait till bob has a disconnect and get a new ip. Than eve
>> could register this ip and have 30 seconds or so access to the private
>> network of alice.
> 
> If Eve has Bob's private key, he will always be able to impersonate
> Bob to anybody. This is by design and not a security vulnerability.
> Your private key is your identity. Just like SSH and a variety of
> other well known protocols.
