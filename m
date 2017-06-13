Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd5a9ea8
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jun 2017 21:32:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 591a4785
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jun 2017 21:32:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c771e7e2
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jun 2017 21:46:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 43ba9774
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jun 2017 21:46:08 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id e11so38153272oia.2
 for <wireguard@lists.zx2c4.com>; Tue, 13 Jun 2017 14:47:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-i73rU0ot_OwvBSBdGD+mFwxQgTK0venNT6iy5QzwsDEA@mail.gmail.com>
References: <CADdae-jBtz7zfMRPkS3c2n_zG+LCuN_0iUZHCSM=H8dWdDBUUw@mail.gmail.com>
 <CAHmME9pvAK=v32ck14AyKhAP-YFSgfzTi7f33nLBUPb7Sx1pYA@mail.gmail.com>
 <CADdae-i73rU0ot_OwvBSBdGD+mFwxQgTK0venNT6iy5QzwsDEA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 13 Jun 2017 23:47:20 +0200
Message-ID: <CAHmME9rQk=wv=X+KqF-NXe1n=Pyj6L1JaZ-oBoLeCV+dxoK1kw@mail.gmail.com>
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

It looks to me like some resources are indeed expended in adding those
interfaces. Not that much that would be problematic -- are you seeing
a problematic case? -- but still a non-trivial amount.

I tracked it down to WireGuard's instantiation of xt_hashlimit, which
does some ugly vmalloc, and it's call into the power state
notification system, which uses a naive O(n) algorithm for insertion.
I might have a way of amortizing on module insertion, which would
speed things up. But I wonder -- what is the practical detriment of
spending a few extra cycles on `ip link add`? What's your use case
where this would actually be a problem?

Thanks,
Jason
