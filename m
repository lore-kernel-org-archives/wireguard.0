Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1492FC25B74
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2024 13:04:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e730ddb;
	Tue, 21 May 2024 13:04:09 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d93b5e7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2024 13:04:07 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id EC00D20CF7;
 Tue, 21 May 2024 15:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1716296646;
 bh=UMMXmz5Whd33/z46MHA7pkC+G53iU9DlKZJWfTqYP8g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pT4yoSAPnjNCG0JEApqpnCYTDdoIcQ5j2mrq0eAKWGg8G4MpEq8lFnpisSOvECoGv
 hctKUcpkhQcFKIcJz2vzyhF2dKYK6foEiuuaBGyKBB0JiTihv9shNkEP0kCyPKR4q3
 Co54hubRfUGfBLItz9u4gDt3/Sd1eamUotuh09DTMBIwbvv2WRtYcMKjBvXEZ86XPk
 r4KupJ6xh1irJxQao+BNbNu66lDDRyr26sZ2BEbaCaU7U+Gq5/NDkuBflTS0jCttXh
 QrLt/kcP0A6GDr9xu+Zq94oEPdwUTtAB8pr+oxcFqdmsk0RSSGQ7nBF1/5ttXbbIW7
 0i+PWjxa8r4rw==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 6AF6A14C01B1; Tue, 21 May 2024 14:58:40 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Janne Johansson <icepic.dz@gmail.com>
Cc: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>,  WireGuard mailing
 list <wireguard@lists.zx2c4.com>,  "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Wireguard address binding - how to fix?
In-Reply-To: <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
 (Janne Johansson's message of "Tue, 21 May 2024 13:11:00 +0200")
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
 <87msojhbq0.fsf@ungleich.ch>
 <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
Date: Tue, 21 May 2024 14:58:40 +0200
Message-ID: <87a5kjgw3j.fsf@ungleich.ch>
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


Hello Janne,

Janne Johansson <icepic.dz@gmail.com> writes:

> Den tis 21 maj 2024 kl 09:50 skrev Nico Schottelius
> <nico.schottelius@ungleich.ch>:
>> Hello Jason,
>> do you mind applying the patch from Daniel? Or is there anything wrong with it?
>>
>> Daniel: amazing work, I was not aware that you have already put in the
>> hard work, thank you so very much!
>>
>> The world (*) is suffering because of the lack of IP address binding in wireguard.
>>
>> (*) With world I refer to every engineer that needs to run wireguard in
>> non-trivial situations with multiple IP addresses on one host, which is
>> extremely common for anything that routes.
>
> Well, the main reason for wg to NOT do anything special is because
> routing generally is done by looking at the destination ip and then

No. Generally speaking that is incorrect.
It is not special to reply with the same IP address.

Generally speaking, when you have systems with multiple IP addresses you
want to be able to steer the binding to an IP address. And even if you
don't do that, you reply with the same IP address you have been
contacted with. Wireguard does neither of it at the moment.  I have
written this already many times on this list, but the reason is very
easy:

- A connection is initiated from device A, connecting to router B on IP adddress a.b.c.d
- The packet is correctly received by router B
- The router replies incorrectly with address f.d.g.h
- The reply packet is correctly blocked at the firewall of device A, because it comes
  from a random, unknown IP address

This is the basic 101 of networking is to reply with the same address
you have been contacted with, there is no discussion necessary. The
whole world does it, even A-patch-y httpd (*) supports it. Since 1980 or
so.

Routing choices are independent of that, replying with the same IP
address is a standard behaviour.

Nico

(*) As does ssh, nginx, ipsec protocols, openvpn, any rails application,
any python application - I am not sure which software that binds to a
socket does not support it, with the exception of wireguard.


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

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZMmoAdHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSTLtg/+O60XhhvoE1CGmeR1
x77CvLy80Go9cexErsIhi24qkCDYiCdTW9YdZGiIiiqhZiw3IMwNuGSmFXrlRO3X
RBomeXGqGgldp9HiH1zI3eRjdPwIJ4HMWIWc2TpZLyfRl3MszuzwaSjBjh1J7B4x
7QGcTIHX+aRVUvhLIRRYR1qrUeEbpJubIYCcGVe3BMYjEEl6CPtUsIOtNAW4hEEO
GoPa7XJBZ8XEcSHfJx20MRtsCvsPC+VVdfNC8my5V09GQ5Ajn5i+eRwzB+DQfPMC
JP/oCG32wZ9XDirCMMr7f0FC0Ni1IDntz7EgVQ2xWM8jyCG6+SxTa7+auzXAXyuz
eqNYT7RgtgQpt8ouU7kkoiUBowKhpLP5VV4HLsARsUvcvEH8pqF1qSdj+MKj2EUg
M6BWjX2vQGGMdL36dnbVPU2HahLoXOY+1V32A3vLvMos09hWtsY3ibwKe77MI3zT
KIe85wBm1DFlNhd5BmgITziD2WMFNC5aVv92V3O2Q8RxIFaHFmKBmPVIe5MnE+yB
Q4zuOPMjeoRPFUuTN6RLdysbQieHE4oHblgqI2kCNjo8ZRSwE0fadoqccsgFoy9W
tDJK2+eMqZbWou/VtM+9GCcizX/JRmbvF+CVe0RpzS2NhuCtJGjEw1+2/44YgjRl
7Jt7iL8wCRHp1U/muVXuRRL+Niw=
=MkyS
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=--
