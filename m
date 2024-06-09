Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F5EC27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 Jun 2024 15:40:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ffa146f;
	Sun, 9 Jun 2024 15:40:32 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8adaa7dc
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jun 2024 15:40:29 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 6004A20C8F;
 Sun,  9 Jun 2024 17:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1717947629;
 bh=PL4kNSTXCv9E7rtzAVD5iqjiTH5b/AojSl22vDsrLvI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RBGt7SPUPJnS/wju9s8yUw4FzYxHXJTUIediW7MTrAxAL32zVvPf0tq6qFJFJ9vR2
 xvEYC+9JMRI3TGrAC10OWd0tY86/JVC89o3Bexbg+C7x1k9T8WIESSaCpEYFrXIgQ7
 B+tkxiND7yeqQlt9awL5r8lh0r8twT11D7AhLAywL5PxH7jT/EURfztLvJuo6KYQ3n
 ZrQtaTs3qhiVirHVoInJNBtws1l7d04Wfp7/NfVkXySsgrZtnXeZiQQvnLIz0SjJHj
 7n0YauEMR2kUR/RP00GmPaQun+CTeFiwmonaTgxK3ri+dRkMIXXgpC7DToXr7zVjTT
 q7xeEKUNc9QdQ==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 7331314C01B4; Sun, 09 Jun 2024 17:39:46 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: d tbsky <tbskyd@gmail.com>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>,  WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard address binding - how to fix?
In-Reply-To: <87bk4tc5m7.fsf@ungleich.ch> (Nico Schottelius's message of "Sun, 
 26 May 2024 10:57:52 +0200")
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
 <87msojhbq0.fsf@ungleich.ch>
 <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
 <87a5kjgw3j.fsf@ungleich.ch>
 <f292656a-52c8-4258-8b6a-45064a702a8a@keff.org>
 <874jarfd43.fsf@ungleich.ch>
 <CAC6SzHJFRNPsLNSd7_w8qQwtyfHLvZtf5SeTS-gvAcY_wAidXQ@mail.gmail.com>
 <87bk4tc5m7.fsf@ungleich.ch>
Date: Sun, 09 Jun 2024 17:39:46 +0200
Message-ID: <87tti2xgzh.fsf@ungleich.ch>
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


Jason,

may I shortly ask what your opinion is on the patch and whether there is
a way forward to make wireguard usable on systems with multiple IP
addresses?

Best regards,

Nico

Nico Schottelius <nico.schottelius@ungleich.ch> writes:

> d tbsky <tbskyd@gmail.com> writes:
>> I  remembered how exciting when I tested wireguard at 2017. until I
>> asked muti-home question in the list.
>> wiregurad is beautiful,elegant,fast but not easy to get along with.
>> openvpn is not so amazing but it can get the job done.
>
> Nice summary, hits the nail quite well.
>
> Jason, do you mind having a look at the submitted patches for IP address
> binding and comment on them? Or alternatively can you give green light
> for generally moving forward so that a direct inclusion in the Linux
> kernel would be accepted?
>
> Best regards,
>
> Nico

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

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZlzMIdHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSQSWRAAhY5peD14jvJCrCV8
gkbCMg1DUHh0UwCYwi9dishHEuBbTk/7RW6YHfmej2JpOBTBfCDpUEYxcupbotCG
0SncGy3Ss812U7fnviQPVGE6g9dxeFrJ5q4332o581h0zCFPqKs7UFSriNRvI/bN
hQ+2rbsvijYhyFTtEWZHMhagdnuTiRitqt6p04QlzMM/SecH6KHWRc26COJBtU/a
B7AT+3lJING9xp7sPMQa5sLOKKyHe/A5D+tQAK+BMVR6UqNRUL8nIbWA2gndUG/Y
0ydIX+25yLZsi1MUK6PNXQlHWFnSc3g18AUbQMv0RL/HvsbdOOEoKU9BCwp6beoI
g3xscejBeY8KcgcK+vhJkxQyMKvWhL5TeBf5dan2NLsmG4DComapJmv85v/d6Eu5
5BwPEBqbaL7k3LbP8lbu+uGU5ssCpEx1lqQ+B97JQp+9QiZr9ouO4R21nnTpU1ce
2IaCUnoDNKGH9J+k1MKKf2PdbWYeGTyb5s4n3Bwd5sayYPRj0JraRsSC83MQatHa
gDhRrIJuIFT1TvO/dA5z093rSBqs+Mo7Gu7CFUl2KrPimAOq29nOsYIYQr0fHduQ
AWdJsnywFi8HMMpAtGu4H1fAUg2/Yw2r7kp68XBJ4b15+jFJDOWNUybqKaKaLo1S
eWvxBgxDxFztoLfGyJ5GJ+gI4h0=
=MuwN
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=--
