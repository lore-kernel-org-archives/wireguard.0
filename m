Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 795157ec
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 17:53:23 +0000 (UTC)
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
 [74.125.82.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72654451
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 17:53:23 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id k4so6402196otd.0
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jun 2017 11:08:17 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <CAHmME9oZUT4BfGojkiEpX5+EXLGcyXNp7mz3mvHBVfPHiYospw@mail.gmail.com>
References: <CADdae-jBtz7zfMRPkS3c2n_zG+LCuN_0iUZHCSM=H8dWdDBUUw@mail.gmail.com>
 <CAHmME9pvAK=v32ck14AyKhAP-YFSgfzTi7f33nLBUPb7Sx1pYA@mail.gmail.com>
 <CADdae-i73rU0ot_OwvBSBdGD+mFwxQgTK0venNT6iy5QzwsDEA@mail.gmail.com>
 <CAHmME9rQk=wv=X+KqF-NXe1n=Pyj6L1JaZ-oBoLeCV+dxoK1kw@mail.gmail.com>
 <CADdae-h6BO4=tGU=QrYHWr4iW7MgMzk2ukw9jes33WEoxAF1Gw@mail.gmail.com>
 <CADdae-jco2xALe1_OTtYQZA7EdRSih+fJge_+FLwNsGQWvRAjg@mail.gmail.com>
 <CAHmME9oZUT4BfGojkiEpX5+EXLGcyXNp7mz3mvHBVfPHiYospw@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Wed, 14 Jun 2017 20:08:16 +0200
Message-ID: <CADdae-gdmjA+PArR+8G3Qy7DPakGqrRZv1E8pB9COhxuoSwhUg@mail.gmail.com>
Subject: Re: multiple wireguard interface and kworker ressources
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

hello,
one interface = one public key
with multiples interfaces we can manage mutliples ip without aliasing,
it's more confortable to bind some specific service .
statisitiques informations ( bp, error) is more easily to manage with
differents interfaces

we are talking about ~ 1000 wireguard interfaces with 500 tunnels
(peer) for each .

Nicolas

2017-06-14 16:15 GMT+02:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> On Wed, Jun 14, 2017 at 3:50 PM, nicolas prochazka
> <prochazka.nicolas@gmail.com> wrote:
>> At this moment, we are using  3000 wg tunnel on a single wireguard
>> interface, but now
>> we want divide the tunnels by interface and by group of our client, to
>> manage qos by wireguard interface, and some other tasks.
>> So on in a single interface, it's working well, but test with 3000
>> interface causes some trouble about cpu / load average , performance
>> of vm.
>
> This seems like a bad idea. Everything will be much better if you
> continue to use one tunnel. If you want to do QoS or any other type of
> management, you can safely do this per-IP, since the allowed IPs
> concept gives strong binding between public key and IP address.
