Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFA1C25B74
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2024 07:24:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c8cdca3;
	Tue, 21 May 2024 07:24:09 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 773ab7ce
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2024 07:24:07 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 03DA820CF7;
 Tue, 21 May 2024 09:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1716276247;
 bh=gBnV57qfS7DSYLNucYbvP3KF8Gw5MOmH4h/FubDVBZ0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gAz8M6LMBKvlzZey+m5oo4xtvvwITGjtlBLC7zMc4vrGBRLecx8AO9szc9mejDyVg
 I4N14vnPYXBH/86qajCJdOadO2A9srmLgDp4ADbwvZGu47/Xu1Alyb0AJ8uyhFn7hx
 NGrCG9BeD9tO/WLjbZYXoLTYYUpXuM8j6FcJ8VUb7WuEVltOsn+NqgY3EMv17fmufC
 GZyQBn343OjyxL9w/K5EwvRULnOflhjtHRvUkszWxOQK0NYIcv/ANAn2ZVNGxYiij3
 MtHIdazj5qKaD43dZvKnVph91fueREjwbeMqdC+GgTJjDe1rwekKu+nLywjccKaxPo
 AUks2OnUjne7A==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 3CD2E14C01B3; Tue, 21 May 2024 09:21:11 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Subject: Re: Wireguard address binding - how to fix?
In-Reply-To: <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at> ("Daniel
 =?utf-8?Q?Gr=C3=B6ber=22's?= message of "Tue, 14 May 2024 13:36:48 +0200")
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
Date: Tue, 21 May 2024 09:21:11 +0200
Message-ID: <87msojhbq0.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hello Jason,

do you mind applying the patch from Daniel? Or is there anything wrong with=
 it?

Daniel: amazing work, I was not aware that you have already put in the
hard work, thank you so very much!

The world (*) is suffering because of the lack of IP address binding in wir=
eguard.

Best regards,

Nico

(*) With world I refer to every engineer that needs to run wireguard in
non-trivial situations with multiple IP addresses on one host, which is
extremely common for anything that routes.

Daniel Gr=C3=B6ber <dxld@darkboxed.org> writes:

> On Tue, May 14, 2024 at 12:50:25PM +0200, Nico Schottelius wrote:
>> To the wireguard authors: what needs to be done to add IP address
>> binding so that packets are always sent from a specific IP address?
>
> Implemented, but wating for Jason to respond:
>   https://lore.kernel.org/netdev/20240219114334.3057169-1-dxld@darkboxed.=
org/T/
>
> --Daniel

--=-=-=
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--==-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


=2D-=20
Sustainable and modern Infrastructures by ungleich.ch

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZMS2cdHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSTQdg//TPn6nSpiBZ3XtOZI
oKaSCAKL0KQImSjXzaeApMfnA6Jj//Idwr5L0abMObhzKCcEgb5wMlAE25IrQnh4
1XlZaTtENHy7+MRMs38+xVRGb5kZOk4XarHAyt5fcmHEzmiwsA5YgOsKgLpME3IL
ubZ+oFwxcQHlQ1dMN39j+x0UtmfyiVsjL1QE6njJ6MEz7N7zW0zui8HjXiFWEykW
0FCmFqTWxIhU1XP+speyjMuf63niJ1hwhkncdDe1vGEUZ7j5tAG40Eu2tApTipZk
J/IIE0bz3qLOry8y6xiSie/LC28mSpyVcd4rjXHohihLGFMfbFRSwoh8G6wHlqph
lno6/24Qk0AgEosI0FvEIyHALwxSGG34UBgIEwCAE7a2v9TbRPd9VVDZUU6L4Z76
QljVFQMRmz6UNUiRtIH1GUVK7jOE7aN1WPfo4iIbOp7898bT3JQyQaSKMHgROQya
CKHgPEyz2JJQWUEZ9Qtb09yvdvy9Lva5ZMcPbdoaLN4iLmdPHuzxIJ8GK7Sh3ZLc
HL9c+4AXuJ6toc5bXiTiXoxBYDsHq2Fu2PAhE6sOMxRuClNFhlZt6r4YKmaTQHEP
5NSnn6JN+1IDg3pnMtggy4mJ6kepefpsdFMonZV8qeeki8dtJ17KDYpw/dT8RG8P
wp9wMs+Eqaxc0GTD3k5nXqM5+lQ=
=mIMS
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=--
