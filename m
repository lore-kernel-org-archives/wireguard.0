Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c3a5137
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Jun 2017 13:38:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68faeae7
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Jun 2017 13:38:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88a37118
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Jun 2017 13:52:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f806622e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Jun 2017 13:52:13 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id s7so112508760otb.3
 for <wireguard@lists.zx2c4.com>; Wed, 21 Jun 2017 06:54:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-gdmjA+PArR+8G3Qy7DPakGqrRZv1E8pB9COhxuoSwhUg@mail.gmail.com>
References: <CADdae-jBtz7zfMRPkS3c2n_zG+LCuN_0iUZHCSM=H8dWdDBUUw@mail.gmail.com>
 <CAHmME9pvAK=v32ck14AyKhAP-YFSgfzTi7f33nLBUPb7Sx1pYA@mail.gmail.com>
 <CADdae-i73rU0ot_OwvBSBdGD+mFwxQgTK0venNT6iy5QzwsDEA@mail.gmail.com>
 <CAHmME9rQk=wv=X+KqF-NXe1n=Pyj6L1JaZ-oBoLeCV+dxoK1kw@mail.gmail.com>
 <CADdae-h6BO4=tGU=QrYHWr4iW7MgMzk2ukw9jes33WEoxAF1Gw@mail.gmail.com>
 <CADdae-jco2xALe1_OTtYQZA7EdRSih+fJge_+FLwNsGQWvRAjg@mail.gmail.com>
 <CAHmME9oZUT4BfGojkiEpX5+EXLGcyXNp7mz3mvHBVfPHiYospw@mail.gmail.com>
 <CADdae-gdmjA+PArR+8G3Qy7DPakGqrRZv1E8pB9COhxuoSwhUg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Jun 2017 15:54:22 +0200
Message-ID: <CAHmME9ocn2vePKi6OyrFO522aoFN2KZwgz0cW=q+nh6GAT9gGg@mail.gmail.com>
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

Hi Nicolas,

1000 interfaces with 500 peers each. That's a very impressive quantity
of 500001 wireguard deployments! Please do let me know how that goes.
I'd be interested to learn what the name of this project/company is.

With regards to your problem, I've fixed it by completely rewriting
ratelimiter.c to not use xt_hashtable, a piece of decaying Linux code
from the 1990s, and instead using my own token bucket implementation.
The result performs much better, is easier on RAM usage, and requires
far fewer lines of code. Most importantly for you, all interfaces will
now be able to share the same netns-keyed hashtable, so that the
cleanup routines are always fast, no matter how many interfaces you
have.

I'll likely sit on it for a bit longer while I verify it and make sure
it works, but if you'd like to try it now, it's sitting in the git
master. Please let me know how it goes.

Regards,
Jason
