Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C04C25B75
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 May 2024 09:03:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af0128ef;
	Sun, 26 May 2024 09:03:49 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.114.86])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 91820069
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 May 2024 09:03:47 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 8DA45202A2;
 Sun, 26 May 2024 11:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1716714223;
 bh=rT8yCGtC9niGNRlWWhSpPI1LMo1a+PWhO4M7Xje4zPs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Awn96x8cz7eVOGZ/bilWl9X3leQXsIAB3iJDQ5Pwb0Bx6BAdO7bOIIFY5mFJ51aMV
 lYyMKk53EDgf5n8RkxxW5AEdvk7zvLwDgp7OO8oCB6bziZegJSNdmLWTM7HVZkbGC3
 ZVtTRTVX2947IRVXyDZLZJPhWDQN7XZUM5C2LBGnA13P4H/ytqLK1uUPvhJfFAqjm1
 qjvnS4Y8HTOhIm8Npzb/IwcS3+gmFp9BecmWWSmatecAUBZAAQpUmfWadu/JT0inXu
 ANItOSMBBct1kQctXoSmScLHHOh/+VhHKhtGqIEHH9rEe9/ZjajJ5RhUjBBe0LgJQZ
 Fk2IcC9B5LGeQ==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id D0D4D1A60B41; Sun, 26 May 2024 10:57:52 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: d tbsky <tbskyd@gmail.com>, Jason A.  Donenfeld <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard address binding - how to fix?
In-Reply-To: <CAC6SzHJFRNPsLNSd7_w8qQwtyfHLvZtf5SeTS-gvAcY_wAidXQ@mail.gmail.com>
 (d. tbsky's message of "Sun, 26 May 2024 11:59:50 +0800")
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
 <87msojhbq0.fsf@ungleich.ch>
 <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
 <87a5kjgw3j.fsf@ungleich.ch>
 <f292656a-52c8-4258-8b6a-45064a702a8a@keff.org>
 <874jarfd43.fsf@ungleich.ch>
 <CAC6SzHJFRNPsLNSd7_w8qQwtyfHLvZtf5SeTS-gvAcY_wAidXQ@mail.gmail.com>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Sun, 26 May 2024 10:57:52 +0200
Message-ID: <87bk4tc5m7.fsf@ungleich.ch>
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


d tbsky <tbskyd@gmail.com> writes:
> I  remembered how exciting when I tested wireguard at 2017. until I
> asked muti-home question in the list.
> wiregurad is beautiful,elegant,fast but not easy to get along with.
> openvpn is not so amazing but it can get the job done.

Nice summary, hits the nail quite well.

Jason, do you mind having a look at the submitted patches for IP address
binding and comment on them? Or alternatively can you give green light
for generally moving forward so that a direct inclusion in the Linux
kernel would be accepted?

Best regards,

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

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZS+ZAdHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSSQnw//TUF+mGMsYK3KP1WZ
wFpwpWLpWTVv10iXX3qgVe3bHRGn09ITY7nYyY1Zo9ueqnzEyfA7ZhYCXoTS+2fJ
s24CKXa0NwQ1omxQwP1ek3xUpBuGSnZ4XE9T7+FMPMxEzo4kxyVsYvRk2JoxO2K4
JKEPHfnBf3LIUcCGYn4LU+pPP5dyiaHaKXYPWCPOXR/Mw7tkHZkxv+Ie7xUe4HLx
uFV0gOpykkQpaDNCDk3PPlTHUC1BnsJWLVstG6vi8rD75NCnceSaoCKwS+X7uPyZ
FJT1Sxt3s9GfsTco6EnAGkc+aNMF0SQ9Goz+dZBm/pzlMVLVKtROjTcWfu3rJwnZ
c3RcLQdvxF3L3BevUbmltZMwEUz1MscDt9hmLCRDpA9Op1NB8Gm1rP+8RbwOaJ/d
GXl9TS8s5MPq0avw1nuhg8QbGMQVVaK6KVCoGe7n+Tj4GxlebN4qzD1pT3UiHj4Q
pivBOBSUcUm3Inetp04/QpdYq7pamFr/AvhlLf+wO/q8cqQ6DkQE6KtjUT8+A0Cx
5FfvNC9rzC0aIq148/Z7aGxzGiT/A1R1SgdRipBm/r1bBXVNu23WiL7bcMfSLsy4
7ld3AlpBiU4Bp75WvBNhcC/eWwwfRb9RcUGePwV/j37BBbgoYylj4ulKQJklQ1ja
B7R/Bytax0bwLrCtD1+514ruJN0=
=/7wT
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=--
