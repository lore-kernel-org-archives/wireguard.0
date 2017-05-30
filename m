Return-Path: bassbeat@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 132b19ae
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:44:30 +0000 (UTC)
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea6fdeab
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:44:30 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id d127so94816928wmf.0
 for <wireguard@lists.zx2c4.com>; Tue, 30 May 2017 04:57:29 -0700 (PDT)
Return-Path: <bassbeat@gmail.com>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: Kernel panic on ARM
From: Alexandre Karlov <bassbeat@gmail.com>
In-Reply-To: <CAHmME9rtEXCHG6LE+JP7jaDnM7cR+faJOAKJLW0bMBKawoZZ0Q@mail.gmail.com>
Date: Tue, 30 May 2017 13:57:27 +0200
Message-Id: <987716C2-3ABE-4705-A7AA-98511627C777@gmail.com>
References: <61E1F38E-66AB-4AD1-B3B0-79FB42A3B4C8@gmail.com>
 <CAHmME9rtEXCHG6LE+JP7jaDnM7cR+faJOAKJLW0bMBKawoZZ0Q@mail.gmail.com>
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

Thanks for quick reply and sorry I forgot to specify - it is the =
20170517 release.=20

Alex

> On 30 May 2017, at 13:48 , Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hey Alexandre,
>=20
> Thanks for the detailed debug logs. Is this with the latest snapshot
> (0.0.20170517) or with the master git repo? I ask because I recently
> added some unreleased-and-potentially-unstable ARM-specific changes to
> the master branch, which I'm still trying to get right.
>=20
> Jason
