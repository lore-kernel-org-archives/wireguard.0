Return-Path: manuel.schoelling@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0b9ac1d
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 15:03:15 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed13bf8d
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 15:03:15 +0000 (UTC)
Message-ID: <1506353464.15832.1.camel@gmx.de>
Subject: Re: WireGuard-p2p: A tool for NAT traversal
From: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 25 Sep 2017 17:31:04 +0200
In-Reply-To: <CAHmME9qcEe4jKZbJ4qspULxk3VDmrPe4_B=mT-76pzz6j+m0FQ@mail.gmail.com>
References: <1493548907.5730.1.camel@gmx.de>
 <CAHmME9ot1K8ze0i9520e7-mAtESUDcGKtgcCj9b0Rg=WZJjX_g@mail.gmail.com>
 <CAHmME9qcEe4jKZbJ4qspULxk3VDmrPe4_B=mT-76pzz6j+m0FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

On Fri, 2017-09-22 at 03:11 +0200, Jason A. Donenfeld wrote:
> Looks like you rewrote this project from python into rust. Cool!
Yes, it was about time. It took quite a while but I think it was worth
while.

> I'd be interested to learn what's new, what's changed, and what's up
> in general. I always thought this was a pretty neat idea.
>From the functional point of view there is not a lot of change.
You can
 A) exchange your public keys using wireguard-p2p (publish & search
modes)
 B) setup a wireguard peer-to-peer connection


A) Exchange public keys
-----------------------
You can simply choose a name for your computer (e.g. alice_laptop) and
then bob can search for it:

   on Alice's computer: $ cargo run publish wg0 alice_laptop
   on Bob's computer: $ cargo run search alice_laptop
                      => lists Alice's public key on Bob's console


B) peer-to-peer connection
--------------------------
Just setup your wireguard connections (/etc/wireguard/*.conf files) as
usual but you can leave out the Endpoint.
Add the device and the public keys of the corresponding peers to
/etc/wireguard-p2p.conf like this:

[wg0]
Peer1=<bobs_public_key>

Now start wireguard-p2p using
$ cargo run daemon

wireguard-p2p will try to determine your IP/port using STUN, publish it
in a distributed-hash-table (bulletinboard-dht) and will try to lookup
Bob's IP/port in the distributed-hash-table, too.
If it finds Bob's IP/port, it will proxy data between Alice and Bob.


It's not perfect, yet, but if you guys find some issues, let me know!

Bye,

Manuel
