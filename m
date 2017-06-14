Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 795a6090
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 14:00:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae9bcaf7
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 14:00:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75e256a3
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 14:14:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6ddd2dad
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 14:14:14 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id b6so1227683oia.1
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jun 2017 07:15:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-jco2xALe1_OTtYQZA7EdRSih+fJge_+FLwNsGQWvRAjg@mail.gmail.com>
References: <CADdae-jBtz7zfMRPkS3c2n_zG+LCuN_0iUZHCSM=H8dWdDBUUw@mail.gmail.com>
 <CAHmME9pvAK=v32ck14AyKhAP-YFSgfzTi7f33nLBUPb7Sx1pYA@mail.gmail.com>
 <CADdae-i73rU0ot_OwvBSBdGD+mFwxQgTK0venNT6iy5QzwsDEA@mail.gmail.com>
 <CAHmME9rQk=wv=X+KqF-NXe1n=Pyj6L1JaZ-oBoLeCV+dxoK1kw@mail.gmail.com>
 <CADdae-h6BO4=tGU=QrYHWr4iW7MgMzk2ukw9jes33WEoxAF1Gw@mail.gmail.com>
 <CADdae-jco2xALe1_OTtYQZA7EdRSih+fJge_+FLwNsGQWvRAjg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Jun 2017 16:15:32 +0200
Message-ID: <CAHmME9oZUT4BfGojkiEpX5+EXLGcyXNp7mz3mvHBVfPHiYospw@mail.gmail.com>
Subject: Re: multiple wireguard interface and kworker ressources
To: nicolas prochazka <prochazka.nicolas@gmail.com>
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

On Wed, Jun 14, 2017 at 3:50 PM, nicolas prochazka
<prochazka.nicolas@gmail.com> wrote:
> At this moment, we are using  3000 wg tunnel on a single wireguard
> interface, but now
> we want divide the tunnels by interface and by group of our client, to
> manage qos by wireguard interface, and some other tasks.
> So on in a single interface, it's working well, but test with 3000
> interface causes some trouble about cpu / load average , performance
> of vm.

This seems like a bad idea. Everything will be much better if you
continue to use one tunnel. If you want to do QoS or any other type of
management, you can safely do this per-IP, since the allowed IPs
concept gives strong binding between public key and IP address.
