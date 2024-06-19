Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A17C27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Jun 2024 10:16:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 352d873f;
	Wed, 19 Jun 2024 10:15:27 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c68cfc73
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jun 2024 10:15:26 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 8AE7920DC1;
 Wed, 19 Jun 2024 12:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1718792125;
 bh=Va08lsqfy2nv0rDLYrefHSwWe+LDGAkJ7KsKVzpk2AI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ObDzLDbhmQ4AVuUyL627Dl1gbfY6gqarB2p1DjZRIrvKQMLS1QRT+8oSmmn3UgsoG
 Xlt/7FlL9YQWlYOFl1nt4gectJ5RqziNnFX+Ru4lGBvpyFcopJ+yjyC7y0zEGHHFzd
 LoPU/E6ybJVuTbvsA8kD+IjJ/4pm2pm/e2ehGqT9x+QFtoCudptex2pd0fRM0oTZXc
 4YZemZbsWg7jvdOgKZuOYAlNSc/OJ/uWo32khZIs9sWd5G3OSvl/3R5ijcZ77+YJza
 Loz8W2epI2rs0UnYg8SS5qqbYVMaqDU07thkF7GV8+VE2IcMj3uthZHRxrur5IYa+/
 /iANBV2JGZ8Xg==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id 555371A6A2B4; Wed, 19 Jun 2024 12:12:49 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Antonio Quartulli <a@unstable.cc>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard broken with ip rule due to missing address binding
In-Reply-To: <9e91adb2-b155-4eef-8604-a2f762a98d4d@unstable.cc> (Antonio
 Quartulli's message of "Wed, 19 Jun 2024 12:01:07 +0200")
References: <87h6dpi7zp.fsf@ungleich.ch>
 <9e91adb2-b155-4eef-8604-a2f762a98d4d@unstable.cc>
Date: Wed, 19 Jun 2024 12:12:49 +0200
Message-ID: <87cyodi6la.fsf@ungleich.ch>
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
Content-Type: text/plain


Hello Antonio,

Antonio Quartulli <a@unstable.cc> writes:

> Hi,
>
> On 19/06/2024 11:42, Nico Schottelius wrote:
>> I really hope the address binding issue can be solved soon, especially
>> giving there is already a patch for it available.
>
> Question: instead of implementing pure IP binding, may it help to
> implement some logic so that messages to a peer are always sent using
> the IP where previous packets were received?

This would fix the problem of replying with the incorrect address, yes.

However it does not fix the issue of selecting the right ip address on
systems with multiple IP addresses ("Originating / initial ip address
wrong").

Adding this option sounds rather reasonable, but it does not fix the
whole issue.

Note that both issues would be fixed with IP address binding.

BR,

Nico



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

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZyryEdHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSQaGxAAhkPy28g36CYp5Zw0
TDSaAaZvEj5/qQP3ZhAAzsykYy5WSQWci0aBBZ01kKvnNN8mHOAN6EYreOaCNKUk
hKhlrFpsuGaq8tHq3+9bl/NHdotMredl4fbzG+z737VeRGh0elVNZleqbl5PAgB/
4qk739iLySMov0TJWyYoNZeY/ZeQn4MqtMdCP8Fq99ieQ9MQV2PV9qYA35MgJG9U
EIxDmNryu95f+29YcBb9bC/oFSwiVZh2yE8Ih8nmHR31Gl3kKYBFVZREzKpPZrzq
FleNG8cT0rx3somxC2UWHHQafcGr5sEBXvSb1vWvlKqiLo48YX0CaSGmusG5T0Yz
G9RPS384Lc36g0L1EEXki0UyzqPUFpc8gUr75EttTjtfoixHAsiAEhyOAHRwqaoZ
MsC+6Ra0i6yrKYYs0cFAolboSzOHALDHOSDfeWEqUgFA8PSQjO6IxfUh7fthtDue
t17gj1TKkUBxdf+crNje3UfDQTHvMo1s0Kbc45mHZOP6u73i6hk+MKvWp/zePE0R
0bcVC6/4tTqQO31qog6JT9yZllJdXEPu6qOJzSAkqY8dPxMMboMveQkkHVatD7gx
tcueBifeNERCirxRFrRrbKg5YLVy2dhhEAqkx4MvDccTwi7sUhHb/nAett2ayIlY
e91C3a5PSKiOu9usq+XvVrt4YJI=
=NQJk
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=--
