Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7fec7db
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 13:45:51 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 490c4007
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 13:45:51 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Stefan Tatschner <rumpelsepp@sevenbyte.org>
Subject: Re: WireGuard in systemd-networkd
In-Reply-To: <CAB=oiXauSSzhqEgF32spvWmkd3ZaGZfFmy5NEpQmvqxeuDASqw@mail.gmail.com>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
 <81bb0726-8f67-0163-875f-0d3403f8df29@urlichs.de>
 <87wp0p1h5j.fsf@fifthhorseman.net>
 <CAB=oiXauSSzhqEgF32spvWmkd3ZaGZfFmy5NEpQmvqxeuDASqw@mail.gmail.com>
Date: Thu, 11 Jan 2018 08:43:17 -0500
Message-ID: <87k1wo1pfu.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Stefan--

On Thu 2018-01-11 07:37:49 +0100, Stefan Tatschner wrote:
> Is it really neccessary to recommend an additional tool in the
> package? Wireguard can already be integrated in debian's native
> network configuration via /etc/network/interfaces:
> https://wiki.debian.org/Wireguard

these instructions already assume that you have both wireguard-dkms and
wireguard-tools installed.  wireguard-tools supplies both wg(8) and
wg-quick(8), which are used in the different /etc/network/interfaces
stanzas there.

Matthias was suggesting a simply-named meta-package: just "wireguard",
which would ensure that both wireguard-dkms and wireguard-tools are
installed.  The advantage there is that you can tell people to do:

   apt install wireguard

and apt make sure the system has the common setup by default :)

> I just do
>
>   # ifup wg0
>   # ifdown wg0
>
> and it's fine.

i'm glad it works for you, it's always nice to have positive feedback :)

happy hacking,

    --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEzicvlOwymaWlnoHjyu+ogyFnUzMFAlpXafUACgkQyu+ogyFn
UzPVtRAAzaPE2BNlJFN71oOm5u9XSgd/hJQ0CsmXUHTlrYRWZlyth8TB1bgMDjy3
aHkFadhm+kR6Y/CUK2sdBh8ULov+HR5mHBkZqsGAE5S3It2mhTPPQFCveab6Us2v
6UZMzhfEHr6YeZqrfQq8wgRzlnENoRBZtlDhtlZ8q3gJVSHSOsad87AtZUtvhs5S
YliAVAnaM8f9xG+f1eVTcySl0EsXT6W7BpmzwHksk3dYo0cany73O5LwIaHibjIv
uhPOP6K9Ac29c/fm5J6oJgNxfsHZd+cZL10qY9bhYjYBNaIhTmlcuI2JPTgds9TG
Pe0iskN5rypIEnMLQgXY9SCjal3X9LAAWAkRiuS6BqO3YLA0fEHEY8HNszvYksDQ
y3XyfmG2WAAFEFezJ+efLtSCQPvByqL2hmFbaOiICBdJTTTghgX9FZ2qRbXMwjJh
9ip0mNndooiFU/uT02MKFpWnYa1bcO3SDDG6hEhvVx6K+olCxUXIPRxI3cbQm/EG
bJpz+9xYjTb/Cl17htfbaF66KiU1aGbdp8tMIIyVqfCuxsnswrWtSHG8r8Wh4Fgb
/OjDpG8uH30kwyacWJeER8lGzp2+Jlg4DIaZd2NpQ+keTbR9yquNyCkFdSPOf4Bw
Ff2YPDbSPDfrvMofs/r1WXyx/6rcMsm6TN1YXMOsQIZGBohGTI4=
=Iw19
-----END PGP SIGNATURE-----
--=-=-=--
