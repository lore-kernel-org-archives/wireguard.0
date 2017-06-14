Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abe609b1
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 13:50:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b93a0006
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 13:50:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de2c3259
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 14:04:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3dc1cc94
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 14:04:09 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id s7so1191030otb.3
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jun 2017 07:05:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-h6BO4=tGU=QrYHWr4iW7MgMzk2ukw9jes33WEoxAF1Gw@mail.gmail.com>
References: <CADdae-jBtz7zfMRPkS3c2n_zG+LCuN_0iUZHCSM=H8dWdDBUUw@mail.gmail.com>
 <CAHmME9pvAK=v32ck14AyKhAP-YFSgfzTi7f33nLBUPb7Sx1pYA@mail.gmail.com>
 <CADdae-i73rU0ot_OwvBSBdGD+mFwxQgTK0venNT6iy5QzwsDEA@mail.gmail.com>
 <CAHmME9rQk=wv=X+KqF-NXe1n=Pyj6L1JaZ-oBoLeCV+dxoK1kw@mail.gmail.com>
 <CADdae-h6BO4=tGU=QrYHWr4iW7MgMzk2ukw9jes33WEoxAF1Gw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Jun 2017 16:05:27 +0200
Message-ID: <CAHmME9oOmacx7hhjr-5ER3mxHaACvsT7v0wuyfBPZuy5K7Bk2A@mail.gmail.com>
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

On Wed, Jun 14, 2017 at 9:52 AM, nicolas prochazka
<prochazka.nicolas@gmail.com> wrote:
> after create of wg interface, kworker thread does not return to a
> normal state in my case,
> kernel thread continues to consume a lot of cpu .
> I must delete wireguard interface to kworker decrease.

So you're telling me that simply running:

for i in `seq 1 1000` ; do ip link add dev wg${i} type wireguard ; done

Will keep a kworker at 100% CPU, even after that command completes?
I'm unable to reproduce this here. Could you give me detailed
environmental information so that I can reproduce this precisely?
Something minimal and easily reproducable would be preferred.
