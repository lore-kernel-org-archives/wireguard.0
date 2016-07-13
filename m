Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dea16f5c
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 09:00:30 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Nathaniel W Filardo <nwf@cs.jhu.edu>
In-Reply-To: <CAHmME9qvXU0GDfjT+4PrvPK3XTUU7LFz8S0b_n_XtJw3wrT7Dw@mail.gmail.com>
References: <20160712231438.GF5136@gradx.cs.jhu.edu>
 <CAHmME9qvXU0GDfjT+4PrvPK3XTUU7LFz8S0b_n_XtJw3wrT7Dw@mail.gmail.com>
Date: Wed, 13 Jul 2016 11:01:14 +0200
Message-ID: <87inw9q5d1.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: NIIBE Yutaka <gniibe@fsij.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard key lifetime / keys in smartcard?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Wed 2016-07-13 10:21:43 +0200, Jason A. Donenfeld wrote:
> The kernel's crypto API has all sorts of async methods of getting
> things done, and I'm pretty sure this was built with smartcards and
> HSMs in mind. In our case, we wouldn't be asking for a signature but
> rather an X25519 multiplication from the device. I assume there's some
> ugly code out there for javacard, but I'm not sure if there's any real
> HSM for 25519. Something to look into... Using hardware to prevent key
> heists strikes me as generally the most robust solution.

it's not labeled officially an "HSM", but Gnuk is a USB hardware token
capable of X25519 and guarded storage of secret key material:

  http://www.fsij.org/doc-gnuk/
  https://anonscm.debian.org/git/gnuk/gnuk/gnuk.git/tree/README
  https://lists.alioth.debian.org/mailman/listinfo/gnuk-users

It has an open hardware design (the small FST-01 [0]) and also targets
the low-cost Olimex STM32-H103 [1].  It has a fully-free software stack
for those who might want to hack it to be more wireguard-friendly.

Access to the gnuk is usually routed through GnuPG, but it's clearly not
limited to that.

The author, Gniibe (cc'ed here), is helpful and responsive.  I'm sure if
anyone tried to get the gnuk working with wireguard he would be happy to
give pointers.

    --dkg

[0] http://www.seeedstudio.com/wiki/FST-01
    https://shop.fsf.org/storage-devices/neug-usb-true-random-number-generator
    https://www.seeedstudio.com/item_detail.html?p_id=1277
    https://www.seeedstudio.com/item_detail.html?p_id=1276

[1] https://www.olimex.com/Products/ARM/ST/STM32-H103/

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXhgNaXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcKoBMQAJXhawrbqH/QST7ylXo28a4Q
eykpSDYcDVSBo0+UReb8YiRg6uvJLaGrSYmRnEeSwTJJe3uhkpnVhJTOPUAGtXXv
GcTFiAsaGdzdcu8BHVjpfTRLQn5fwZzFCYxDp/WNFO7q1xowv3w2hGjn2w9iymNx
Vp39FVaj7SjLf/8K3r4fTndq+3GEoQNgVA/IfLi7s/NMtPdprhn42NMOz0RhH2lq
5oQoyUg+Fk9O28C5mFVyaqXnjw2jhPtmYaa8v8UeImW2NCfeJxbFGdwRs/3OC/gf
1hxUiKS2xkT9rEeuTmbsp+LqFp8blEpcs1Gpceqc+F9BswWc8L4p/zbZsjbduSDo
Jec7CXNeGbaqGsbkPBsi77Ia6MpZ9NNyt+UW3AnTTqmNziJHDxzYhPx3AxfqkdKj
YUHpjIjksWNLldnJd6xn7G9MwjG2cPm2l8gGOkwEwgyRdO1PUFJcGv4Kb8WoLXLC
T/kKKLQEEhoWGp9AE7sOyitQmIlKX4//W0hGnsQjPX/HXzlf9cKEXVHonm6GngAh
kr74zO7JnXxcU6sd7F/Xf3O4pSxgqSlQlYArDEe3HI3MxCnRv6c/3UIR3MaaY2xQ
cTpiNzBFcm4LDGzp7+iz3ohICTz7LIwipcwZCJ2Wp1gHgYJWPQ1lPCILVoGKL2/r
fKyxxIil3vG4m3Svzws0
=sXjG
-----END PGP SIGNATURE-----
--=-=-=--
