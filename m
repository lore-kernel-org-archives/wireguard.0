Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf3f241b
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 11:13:19 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 014bf9c3
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 11:13:18 +0000 (UTC)
Date: Mon, 1 Jan 2018 12:14:36 +0100
From: Simon Ruderich <simon@ruderich.org>
To: Mathias Hall-Andersen <mathias@hall-andersen.dk>
Subject: Re: [PATCH 7/7] tun_darwin: adapt to TUNDevice interface change
Message-ID: <20180101111436.GA3346@ruderich.org>
References: <cover.1514726309.git.simon@ruderich.org>
 <33cfb3925304d5047a6e9e81eef0900329aad3b5.1514726309.git.simon@ruderich.org>
 <510f63e7-e50a-46a1-b2d8-ea49ae5f2fc8@hall-andersen.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="=_zucker.schokokeks.org-16737-1514805318-0001-2"
In-Reply-To: <510f63e7-e50a-46a1-b2d8-ea49ae5f2fc8@hall-andersen.dk>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_zucker.schokokeks.org-16737-1514805318-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2017 at 08:17:58PM +0100, Mathias Hall-Andersen wrote:
> Hi Simon
>
> Thanks for your patches!

Hi Mathias,

Thanks for your quick response.

> I am still fixing the interface up / down semantics (stopping / starting
> peer timers and routines not needed when the interface is down).
> I hope to fix this and merge your linux code in the next couple of days.
> This should bring us very close to a usable linux client.

Awesome!

I just sent out a second set of patches with stuff I noticed
while reading the code (I only stumbled over the TUN code when I
tried to run the test suite).

While I'm at I have a few questions about the code (zx2c4 said I
should ask here):

conn_linux.go: DstToBytes() uses end.src, however DstIP() uses
end.dst. Is this a typo?

device.go: removePeerUnsafe() doesn't unlock the peer mutex. Is
this intended? If so a comment would be nice.

ratelimiter.go: RoutineGarbageCollector() uses time.Second as
magic value, maybe use RatelimiterGarbageCollectTime or a new
constant instead?

receive.go: RoutineHandshake() returns on some errors (e.g.
"Failed to decode cookie reply" or mac failure), shouldn't it
continue instead?

timers.go: TimerEphemeralKeyCreated() uses 3 as magic value
(multiplied by RejectAfterTime), why 3?

daemon_darwin.go, daemon_windows.go: the Daemonize() function
uses a different signature so the build will fail on those
systems (but I think there are more compile errors on non linux).

Regards
Simon
--=20
+ privacy is necessary
+ using gnupg http://gnupg.org
+ public key id: 0x92FEFDB7E44C32F9

--=_zucker.schokokeks.org-16737-1514805318-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO7rfWMMObpFkF3n0kv79t+RMMvkFAlpKGBEACgkQkv79t+RM
MvmmxxAAn5rjrCl57vXFIVhXrtX9u5pqgci32bvHPBQp6zvSGlqGuJe/JYk7mQ57
ioPA8LYVMWgWhduThMQVAq45x64QLdewgmU0V7iwm3GaldUpj46ZIUdE3ASroCNU
Jays7ynkMorDo8eWtBPBH5goYm1giZds8JEWdQy1EkEtMSfUSOwQw/4pe5T8rkC/
OxRfhzkbGW7Qm1yiFIBnu6kVyCzzPrKjGUzXgocdHFjFA3VUqg2ks3YPKRYw90lr
Fy5jtahepceYBUPlItTbJJJGgZZvOsioOxs3spQhHK+7JvSGfmVTwXeUSDxPecqP
dPCHOqXIy/no6N0wfchMLgYd2BcSUz0C+1peSgd6gdhyFEuOyWyGRv6p/CmaxIp9
RgWJYSMzgAmDhabm+hcwcIo/csUEGSHL0H/AOaOZp1nN3HU4fc97t6z+1TwJq4mx
fKqLrRctRLDeymCMjPpHwrkHkMp4Ik9sH3uINgeAUjiWnMop9X43JTXfalm1Oz0a
sWau8ZU9aVPpLbKieCvsMRFFE6zyKy1yKsx3sypdxOADXUJ9DMN8tBpuoQAyXAUk
2sZyLLFK/CC111nqPJq564K5rz/Akm8HqkEp8H7FoJLZEvZHKAztajRTQHO/7Sym
AhwjFd/HSr8Ge5yTB4eJAKDkMtBiVXWvSuuas3k2gRLm2V2+Y84=
=HiQA
-----END PGP SIGNATURE-----

--=_zucker.schokokeks.org-16737-1514805318-0001-2--
