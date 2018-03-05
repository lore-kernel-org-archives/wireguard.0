Return-Path: hcarrega@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbff136f
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:02:11 +0000 (UTC)
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 479a1608
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:02:11 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t74so15040600wme.3
 for <wireguard@lists.zx2c4.com>; Mon, 05 Mar 2018 03:11:25 -0800 (PST)
Return-Path: <hcarrega@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: Tunsafe Windows client for wireguard (not opensource yet they say
From: Henrique Carrega <hcarrega@gmail.com>
In-Reply-To: <CAHmME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=rMXLt=U5FA@mail.gmail.com>
Date: Mon, 5 Mar 2018 11:11:22 +0000
Message-Id: <5070B418-FD3D-4DF5-9D12-4EB3868927AA@gmail.com>
References: <41222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com>
 <CAHmME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=rMXLt=U5FA@mail.gmail.com>
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

Just post to alert you:) don=E2=80=99t want to install:)


Sent from my iPhone

> On 5 Mar 2018, at 09:19, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hi Henrique,
>=20
> Thanks for posting this.
>=20
> Please stay away from this software, and generally be wary of
> closed-source WireGuard implementations trying to fill the void. This
> one was written by a community-unfriendly proprietary author, and
> we've got little way of ensuring protocol compliance or basic
> security. Especially from my discussions from him, it's clear what
> he's up to, and this seems like some nastiness. Should I spend my time
> reverse engineering this software and discovering zero-days? Probably
> not a good use of my time, despite my usual love of this sort of
> thing.
>=20
> One aspect of the WireGuard project is that we're taking development
> very carefully and slowly, not jumping to premature releases, and
> really studying every bit of what we produce in order to ship the
> least-vulnerable and most-correct code we possibly can. We're still
> shipping code -- it's not an approach that results in a complete
> standstill -- but it does mean that in these intervening periods,
> there will be propheteers and cowboys coming out of the woodwork to
> fill the void.
>=20
> It's quite easy to make a tiny tunneling protocol that's reasonably
> fast and does a few things; if you look on Github there are hundreds.
> It's quite another thing to write robust and secure software intend to
> last for a long time. That's what we're working on here.
>=20
> Fortunately we have two very nice projects that are rapidly
> approaching maturity: one in Go and one in Rust. I fully welcome
> future OSS authors into the project. When I'm back from visiting
> family at the beginning of April, I think we'll be in a good place to
> have a few first releases.
>=20
> I'll also do what I can to see that people aren't peddling junk and
> calling it wireguard, so as to reduce user confusion, but this of
> course isn't a very easy endeavor. I'm open to suggestions on how to
> approach this.
>=20
> Regards,
> Jason
