Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e5f4104
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 15:51:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5704e37e
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 15:51:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20098894
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 16:02:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0f747354
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 16:02:46 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id w10so117256464oif.0
 for <wireguard@lists.zx2c4.com>; Tue, 30 May 2017 09:04:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6002289F-7871-482D-A0DE-C2DB3B0A4C5D@gmail.com>
References: <61E1F38E-66AB-4AD1-B3B0-79FB42A3B4C8@gmail.com>
 <CAHmME9rtEXCHG6LE+JP7jaDnM7cR+faJOAKJLW0bMBKawoZZ0Q@mail.gmail.com>
 <987716C2-3ABE-4705-A7AA-98511627C777@gmail.com>
 <CAHmME9ou95Lq=Dc86iCC7H1_N+oLckyM7Ngrv1hwOp=TarOkRQ@mail.gmail.com>
 <CAHmME9o1tngXJWLOrKMbtwZizb=0gt+njaC9NphJ_yhNfEqk_A@mail.gmail.com>
 <6002289F-7871-482D-A0DE-C2DB3B0A4C5D@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 May 2017 18:04:20 +0200
Message-ID: <CAHmME9rKAXC2AXKkLKK3k5Nw11n1nAF3gro1ynEGXnqMuaxEYg@mail.gmail.com>
Subject: Re: Kernel panic on ARM
To: Alexandre Karlov <bassbeat@gmail.com>
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

Hi Alexandre,

As 2 hours have gone by, I assume things are working somewhat decently. Great!

If that patch is stable for you, you might be interested in trying out
the latest `master` branch in the git repo:

$ git clone https://git.zx2c4.com/WireGuard
$ cd WireGuard/src
$ make debug -j$(nproc) && make install

I'll probably make a new snapshot in a few days, but if you'd like to
try things out in advance, that'd be welcome. The master branch
contains some NEON accelerations for the hardware you're using, so if
all goes well, you should see an increase in performance.

Regards,
Jason
