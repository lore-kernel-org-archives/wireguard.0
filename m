Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5033d7bb
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 05:20:24 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8892fddc
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 05:20:24 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
In-Reply-To: <20180211184312.GD12558@lud.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
 <87r2prs80x.fsf@fifthhorseman.net> <20180211184312.GD12558@lud.localdomain>
Date: Sun, 11 Feb 2018 22:34:29 -0500
Message-ID: <87zi4erid6.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Sun 2018-02-11 19:43:12 +0100, Baptiste Jonglez wrote:
> On 11-02-18, Daniel Kahn Gillmor wrote:
>
>> i'm curious from the graph -- do you know what happened at the start of
>> week 6 where there's a sawtooth?
>
> Actually, the amount of "slab_cache" didn't change at that point, it's
> just the amount of application memory that dropped a bit.  I looked at the
> logs, some userspace processes were being killed by the OOM-killer.

ah right, this makes sense, i'd forgotten that these munin
RAM-consumption graphs are "stacked".  Thanks for tracking down the
oom-killer event anyway.

hopefully we can sort out the rest soon, thanks for raising it here.

           --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTTaP514aqS9uSbmdJsHx7ezFD6UwUCWoELRQAKCRBsHx7ezFD6
U65eAP9SqgIT2kg2Oj4Jhxyi+JJ4gARG4dGfaVdep6uz6jlC6gEA9u1T1kBkXBn9
SFS/bvhFvMbX3Njogw5+jnSAS7RpSww=
=5u+k
-----END PGP SIGNATURE-----
--=-=-=--
