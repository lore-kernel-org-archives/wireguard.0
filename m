Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E87BC2D0DA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:38:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6409206A4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Ck57MEbw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6409206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98a53088;
	Thu, 26 Dec 2019 15:36:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f11a8e02
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Dec 2019 00:26:59 +0000 (UTC)
Received: from st43p00im-ztbu10063701.me.com (st43p00im-ztbu10063701.me.com
 [17.58.63.178])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76d57562
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Dec 2019 00:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1577060818;
 bh=nJSRMNqFN+Z8pfJmiHK4BoffdkqTL95L6QcFWsQQWjk=;
 h=From:Content-Type:Subject:Message-Id:Date:To;
 b=Ck57MEbw2GRLFb/kwJgx+8w9xQfWZPRFOQEoCJPEI8h7yec/f9TpBRTcJBPKF5uDd
 IxqwCxv8w1LHjChjn1ULTJol9k6V2Hl0AD4jRFU/frelNat/Ep4KQ5zn4qY/wjnfNH
 +e+AWzibZm9YZCuWP3lEGlW1R8tGqMzwc8356Fnnb3ozGhO9N8jiEPf/cwXH8H/cAh
 IYpB2TYFmUtdTiGY8V84PGwsy65faIniCzcAp8WTpacVWHku+CnUdDefjQl97zVZn5
 LgcMIDHGF81H43ZPqVtvvpVxHFx8tW5Wx5hM36yMk/ko7sAluU56bHuwcKZYN7AZl8
 FutQcgzYR57wQ==
Received: from [192.168.1.3]
 (cpc110903-live30-2-0-cust870.17-2.cable.virginm.net [86.7.43.103])
 by st43p00im-ztbu10063701.me.com (Postfix) with ESMTPSA id 3116D9A0ACC
 for <wireguard@lists.zx2c4.com>; Mon, 23 Dec 2019 00:26:58 +0000 (UTC)
From: Lee Yates <rainmakerraw@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: DKMS failure on Ubuntu with linux-5.4.6 (generic)
Message-Id: <1FF80632-4AB8-4A48-BDD3-E166AD407E00@icloud.com>
Date: Mon, 23 Dec 2019 00:26:55 +0000
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-12-22_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=984 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1912230003
X-Mailman-Approved-At: Thu, 26 Dec 2019 16:36:40 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4184098988468982628=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============4184098988468982628==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6C1BAE72-2BCE-4154-99A8-87201B35F97D";
	protocol="application/pgp-signature";
	micalg=pgp-sha256


--Apple-Mail=_6C1BAE72-2BCE-4154-99A8-87201B35F97D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I have just built a Threadripper 3960X system as my new desktop machine, =
and as such wanted to use a more up to date kernel than is provided in =
Ubuntu 19.10 by default. Currently that means 5.4.6-generic. I also have =
installed the linux-5.4.6-headers and build-essential.

After installing the kernel and rebooting, I noticed I can no longer =
connect to Mullvad using WireGuard. On further investigation the DKMS =
module is giving the following error during build:

> Building initial module for 5.4.6-050406-generic
> ERROR (dkms apport): kernel package linux-headers-5.4.6-050406-generic =
is not supported
> Error! Bad return status for module build on kernel: =
5.4.6-050406-generic (x86_64)
> Consult /var/lib/dkms/wireguard/0.0.20190913/build/make.log for more =
information.
> dpkg: error processing package wireguard-dkms (--configure):
>  installed wireguard-dkms package post-installation script subprocess =
returned error exit status 10
> Errors were encountered while processing:
>  wireguard-dkms
> E: Sub-process /usr/bin/dpkg returned an error code (1)


Does anyone have any ideas? The error log was somewhat vague (to my =
uneducated eyes).

> DKMS make.log for wireguard-0.0.20190913 for kernel =
5.4.6-050406-generic (x86_64)
> Mon 23 Dec 00:18:36 GMT 2019
> make: Entering directory '/usr/src/linux-headers-5.4.6-050406-generic'
>   AR      /var/lib/dkms/wireguard/0.0.20190913/build/built-in.a
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/main.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/noise.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/device.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/peer.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/timers.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/queueing.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/send.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/receive.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/socket.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/peerlookup.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/allowedips.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/ratelimiter.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/cookie.o
>   PERLASM =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/chacha20/chacha20-x=
86_64.S
>   CC [M]  /var/lib/dkms/wireguard/0.0.20190913/build/netlink.o
>   PERLASM =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/poly1305/poly1305-x=
86_64.S
>   CC [M]  =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/chacha20/chacha20.o=

>   CC [M]  =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/poly1305/poly1305.o=

>   AS [M]  =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/blake2s/blake2s-x86=
_64.o
>   CC [M]  =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/chacha20poly1305.o
>   CC [M]  =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/blake2s/blake2s.o
>   CC [M]  =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/curve25519/curve255=
19.o
>   AS [M]  =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/poly1305/poly1305-x=
86_64.o
>   AS [M]  =
/var/lib/dkms/wireguard/0.0.20190913/build/crypto/zinc/chacha20/chacha20-x=
86_64.o
> /var/lib/dkms/wireguard/0.0.20190913/build/socket.c: In function =
=E2=80=98send6=E2=80=99:
> /var/lib/dkms/wireguard/0.0.20190913/build/socket.c:145:20: error: =
=E2=80=98const struct ipv6_stub=E2=80=99 has no member named =
=E2=80=98ipv6_dst_lookup=E2=80=99; did you mean =
=E2=80=98ipv6_dst_lookup_flow=E2=80=99?
>   145 |   ret =3D ipv6_stub->ipv6_dst_lookup(sock_net(sock), sock, =
&dst,
>       |                    ^~~~~~~~~~~~~~~
>       |                    ipv6_dst_lookup_flow
> make[1]: *** [scripts/Makefile.build:266: =
/var/lib/dkms/wireguard/0.0.20190913/build/socket.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1652: /var/lib/dkms/wireguard/0.0.20190913/build] =
Error 2
> make: Leaving directory '/usr/src/linux-headers-5.4.6-050406-generic'


I=E2=80=99ve rolled back to the official kernel for now but with the CPU =
being so new that=E2=80=99s not ideal.
Thanks in advance.

Lee Yates

--Apple-Mail=_6C1BAE72-2BCE-4154-99A8-87201B35F97D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEExF+G9PyiAB1cKHnz7yXLzDsoqZIFAl4ACc8ACgkQ7yXLzDso
qZJsTwf+J4rdYBEyvdeUqY7V9GBwHWoac/X1l8FMvD/bCDzWV1lK1iBsRqiV5HV4
r1vecCEHuHHscRFET0Kz4QhUUycbQi5iTihTo2LDU11xIN7rmaFg1E7ukrRkh5HL
A36xk1UkHdo/d4a6zi/ksFcyASCVQ3A4D9ymXDsOYRWWp6CjiakQ7LhH2T2pdLBF
A3+B6FIvAIRhCa45bmQ4/7IAlrt07vbprBJzJcDEjPhYghx6wVovmCXwmDGygyB6
XNN6D8Lgsge86n1BeyZBxmu8CjqbEX+ut9Knoi49uMYHkjZkItenQBOIvJmCiAkP
f/5eoSKXGtO4I4M0VVy1DA9y+1kRAg==
=jnJU
-----END PGP SIGNATURE-----

--Apple-Mail=_6C1BAE72-2BCE-4154-99A8-87201B35F97D--

--===============4184098988468982628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4184098988468982628==--
