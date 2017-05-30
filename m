Return-Path: bassbeat@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6482bf5d
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 18:41:38 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
 [209.85.128.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1be87740
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 18:41:38 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id j27so5789700wre.3
 for <wireguard@lists.zx2c4.com>; Tue, 30 May 2017 11:54:40 -0700 (PDT)
Return-Path: <bassbeat@gmail.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: Kernel panic on ARM
From: Alexandre Karlov <bassbeat@gmail.com>
In-Reply-To: <CAHmME9rKAXC2AXKkLKK3k5Nw11n1nAF3gro1ynEGXnqMuaxEYg@mail.gmail.com>
Date: Tue, 30 May 2017 20:54:38 +0200
Message-Id: <267E2F68-320A-4D1F-BDC7-7B5A240B75C8@gmail.com>
References: <61E1F38E-66AB-4AD1-B3B0-79FB42A3B4C8@gmail.com>
 <CAHmME9rtEXCHG6LE+JP7jaDnM7cR+faJOAKJLW0bMBKawoZZ0Q@mail.gmail.com>
 <987716C2-3ABE-4705-A7AA-98511627C777@gmail.com>
 <CAHmME9ou95Lq=Dc86iCC7H1_N+oLckyM7Ngrv1hwOp=TarOkRQ@mail.gmail.com>
 <CAHmME9o1tngXJWLOrKMbtwZizb=0gt+njaC9NphJ_yhNfEqk_A@mail.gmail.com>
 <6002289F-7871-482D-A0DE-C2DB3B0A4C5D@gmail.com>
 <CAHmME9rKAXC2AXKkLKK3k5Nw11n1nAF3gro1ynEGXnqMuaxEYg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Jason,=20

I confirm, the hardware is now running for almost 4 hours without any =
issues, so let=E2=80=99s be optimistic and say the patch solved it.=20

I will continue to run the patched version on one device and try the =
latest master branch on another one. I=E2=80=99ll report there is =
something weird.=20

Thanks for your quick help and keep up the great work!

Cheers,
Alexandre=20

> On 30 May 2017, at 18:04 , Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hi Alexandre,
>=20
> As 2 hours have gone by, I assume things are working somewhat =
decently. Great!
>=20
> If that patch is stable for you, you might be interested in trying out
> the latest `master` branch in the git repo:
>=20
> $ git clone https://git.zx2c4.com/WireGuard
> $ cd WireGuard/src
> $ make debug -j$(nproc) && make install
>=20
> I'll probably make a new snapshot in a few days, but if you'd like to
> try things out in advance, that'd be welcome. The master branch
> contains some NEON accelerations for the hardware you're using, so if
> all goes well, you should see an increase in performance.
>=20
> Regards,
> Jason
