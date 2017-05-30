Return-Path: bassbeat@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85a552a7
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 13:16:34 +0000 (UTC)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68f07fab
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 13:16:34 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b84so92254785wmh.0
 for <wireguard@lists.zx2c4.com>; Tue, 30 May 2017 06:29:34 -0700 (PDT)
Return-Path: <bassbeat@gmail.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: Kernel panic on ARM
From: Alexandre Karlov <bassbeat@gmail.com>
In-Reply-To: <CAHmME9o1tngXJWLOrKMbtwZizb=0gt+njaC9NphJ_yhNfEqk_A@mail.gmail.com>
Date: Tue, 30 May 2017 15:29:32 +0200
Message-Id: <6002289F-7871-482D-A0DE-C2DB3B0A4C5D@gmail.com>
References: <61E1F38E-66AB-4AD1-B3B0-79FB42A3B4C8@gmail.com>
 <CAHmME9rtEXCHG6LE+JP7jaDnM7cR+faJOAKJLW0bMBKawoZZ0Q@mail.gmail.com>
 <987716C2-3ABE-4705-A7AA-98511627C777@gmail.com>
 <CAHmME9ou95Lq=Dc86iCC7H1_N+oLckyM7Ngrv1hwOp=TarOkRQ@mail.gmail.com>
 <CAHmME9o1tngXJWLOrKMbtwZizb=0gt+njaC9NphJ_yhNfEqk_A@mail.gmail.com>
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

Hi Jason,=20

Thanks for the patch! I compiled it in as well as the extended debugging =
for wg.=20

As I=E2=80=99ve said, the kernel panics in a rather erratical fashion, =
so I let it run for a while and if the problem reappears (let=E2=80=99s =
cross the fingers it wouldn=E2=80=99t), I=E2=80=99ll send the trace and =
kernel .config.=20

Cheers,
Alex

> On 30 May 2017, at 14:45 , Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hey Alexandre,
>=20
> Can you try this patch, and tell me if it makes the problem go away?
>=20
> http://ix.io/vMh
>=20
> If it works, I'll include this in the next snapshot.
>=20
> Thanks,
> Jason
