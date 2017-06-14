Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d61fca68
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 07:37:24 +0000 (UTC)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
 [209.85.218.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4184d83
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 07:37:24 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id e11so43549568oia.2
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jun 2017 00:52:15 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <CAHmME9rQk=wv=X+KqF-NXe1n=Pyj6L1JaZ-oBoLeCV+dxoK1kw@mail.gmail.com>
References: <CADdae-jBtz7zfMRPkS3c2n_zG+LCuN_0iUZHCSM=H8dWdDBUUw@mail.gmail.com>
 <CAHmME9pvAK=v32ck14AyKhAP-YFSgfzTi7f33nLBUPb7Sx1pYA@mail.gmail.com>
 <CADdae-i73rU0ot_OwvBSBdGD+mFwxQgTK0venNT6iy5QzwsDEA@mail.gmail.com>
 <CAHmME9rQk=wv=X+KqF-NXe1n=Pyj6L1JaZ-oBoLeCV+dxoK1kw@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Wed, 14 Jun 2017 09:52:13 +0200
Message-ID: <CADdae-h6BO4=tGU=QrYHWr4iW7MgMzk2ukw9jes33WEoxAF1Gw@mail.gmail.com>
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
after create of wg interface, kworker thread does not return to a
normal state in my case,
kernel thread continues to consume a lot of cpu .
I must delete wireguard interface to kworker decrease.

Nicolas

2017-06-13 23:47 GMT+02:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Hi Nicolas,
>
> It looks to me like some resources are indeed expended in adding those
> interfaces. Not that much that would be problematic -- are you seeing
> a problematic case? -- but still a non-trivial amount.
>
> I tracked it down to WireGuard's instantiation of xt_hashlimit, which
> does some ugly vmalloc, and it's call into the power state
> notification system, which uses a naive O(n) algorithm for insertion.
> I might have a way of amortizing on module insertion, which would
> speed things up. But I wonder -- what is the practical detriment of
> spending a few extra cycles on `ip link add`? What's your use case
> where this would actually be a problem?
>
> Thanks,
> Jason
