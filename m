Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E44C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Apr 2022 19:45:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3a6781a9;
	Wed, 13 Apr 2022 19:45:18 +0000 (UTC)
Received: from vmi832556.contaboserver.net (vmi832556.contaboserver.net
 [194.233.68.184])
 by lists.zx2c4.com (OpenSMTPD) with ESMTP id 37a9fca7
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Apr 2022 19:45:16 +0000 (UTC)
Received: from inspiro.localdomain (unknown [182.253.127.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by vmi832556.contaboserver.net (Postfix) with ESMTPSA id 455471C06A8;
 Wed, 13 Apr 2022 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kilabit.info;
 s=20210411-1; t=1649879115;
 bh=tB+vGxRzlIUEyJeofWOuPmCg+kF5MkhLxgTNu3RL1uM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XMYnXjJ9wlxHT5uTUw5Wm7+zIjR5DINZ5UlIS9kRFaFBob6gEllAeJPOMLCd2J4N5
 ED6tOm/4VMiuGr7CRsR9skCXn42s1nMSbCjLIf3KganJ+H18tpoMJd4u8izgFJ2HHQ
 Wf2j2iYAFUq4lt69Hc4/PTDEe8hRbBNMZDP3WauU=
Date: Thu, 14 Apr 2022 02:45:10 +0700
From: Shulhan <ms@kilabit.info>
To: lejeczek <peljasz@yahoo.co.uk>
Cc: wireguard@lists.zx2c4.com
Subject: Re: error - ? - Address already in use
Message-ID: <20220414024510.4f980d24@inspiro.localdomain>
In-Reply-To: <077cdb1c-e06c-d2fd-1475-269ed744d5ca@yahoo.co.uk>
References: <077cdb1c-e06c-d2fd-1475-269ed744d5ca.ref@yahoo.co.uk>
 <077cdb1c-e06c-d2fd-1475-269ed744d5ca@yahoo.co.uk>
Organization: kilabit.info
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9/uhpbOvzmXK8UTIUOywpo5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/9/uhpbOvzmXK8UTIUOywpo5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Apr 2022 18:45:24 +0100
lejeczek <peljasz@yahoo.co.uk> wrote:

> Hi guys
>=20
> what is below error the symptom of?
>=20
> -> $ wg-quick up wg-r2
> [#] ip link add wg-r2 type wireguard
> [#] wg setconf wg-r2 /dev/fd/63
> [#] ip -4 address add 10.3.3.254/24 dev wg-r2
> [#] ip link set mtu 1320 up dev wg-r2
> RTNETLINK answers: Address already in use
> [#] ip link delete dev wg-r2
>=20
> I'll only add that I looked into "obvious" places and found=20
> nothing.
> many thanks, L.

My guess is another wg network is already up using the same IP address.
You may check using `wg show` to see the active endpoint or other
net tools like `ip` or `ifconfig` to list of active net devices.

--=20
{ "github":"github.com/shuLhan", "site":"kilabit.info" }

--Sig_/9/uhpbOvzmXK8UTIUOywpo5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEzvGqh+M3psOQ3lVQ+FB+6RSKTOMFAmJXKEYACgkQ+FB+6RSK
TOPCsAf/bVSiadHiORzr4Ww/WrnVZoFOxl/AFBI9MYLf3Lvl9tMBA4sojsp/hc3N
cJ1pXzZudYbLrskO5L0zvH6SrEONigifc8K6PjG+tq/G5WuJFOcXwVOABMYaVx4j
ZVy8NyNygkxBOsTKWu1CW6LpbgVfD1LtAzjKY75J50vH/YSYwBzpPWJ2dHUYdFas
ICMH3mhg7Mv/+vlGZYOw+ml1UfqSJ5zbe3lJ4QersFgvZO6s5o4Od8J4P2ob6tWb
5JybZltGEb6u20MtWPDBdBoOO/trojy+stRklTnnnS8l3fc4Lc7pAGy9Ciql2O9b
RgL6q1JOR7KrKgCwpuTD7NGv0cFh5w==
=aPWX
-----END PGP SIGNATURE-----

--Sig_/9/uhpbOvzmXK8UTIUOywpo5--
