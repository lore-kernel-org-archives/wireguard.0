Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61a1c6bc
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jun 2017 14:41:00 +0000 (UTC)
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
 [74.125.82.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 082419b9
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jun 2017 14:41:00 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id t31so89776568ota.1
 for <wireguard@lists.zx2c4.com>; Tue, 13 Jun 2017 07:55:45 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <CAHmME9pvAK=v32ck14AyKhAP-YFSgfzTi7f33nLBUPb7Sx1pYA@mail.gmail.com>
References: <CADdae-jBtz7zfMRPkS3c2n_zG+LCuN_0iUZHCSM=H8dWdDBUUw@mail.gmail.com>
 <CAHmME9pvAK=v32ck14AyKhAP-YFSgfzTi7f33nLBUPb7Sx1pYA@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Tue, 13 Jun 2017 16:55:44 +0200
Message-ID: <CADdae-i73rU0ot_OwvBSBdGD+mFwxQgTK0venNT6iy5QzwsDEA@mail.gmail.com>
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

Hello again,
with 0.0.20170613  , i can reproduce a big kworker cpu time consumption
Regards,
nicolas

2017-06-13 14:48 GMT+02:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Hi Nicolas,
>
> I'll look into this. However, you need to update WireGuard to the
> latest version, which is 0.0.20170613. I can't provide help for
> outdated versions.
>
> Jason
