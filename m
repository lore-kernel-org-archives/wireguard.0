Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C70C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 16:48:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51436208C7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 16:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51436208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sysnux.pf
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7754f70;
	Thu, 18 Jun 2020 16:30:15 +0000 (UTC)
Received: from smtp-pro0.mana.pf (smtp-pro0.mana.pf [202.3.225.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a28aba2
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 16:30:12 +0000 (UTC)
Received: from tiare.sysnux.pf (103-4-75-17-dynamic.viti.pf [103.4.75.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: courrier@sysnux.pf)
 by smtp-pro0.mana.pf (Postfix) with ESMTPSA id B745654556
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 06:48:22 -1000 (-10)
Received: from tiare.sysnux.pf (tiare.sysnux.pf [192.168.10.1])
 by tiare.sysnux.pf (Postfix) with ESMTP id 9554014BD3B6
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 06:48:22 -1000 (-10)
To: wireguard@lists.zx2c4.com
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
From: Jean-Denis Girard <jd.girard@sysnux.pf>
Autocrypt: addr=jd.girard@sysnux.pf; keydata=
 mQGiBEhHSi4RBAC2J54Syt9hbmoNgiiM4TNNliSgLiHu7q+8s34xiIpPRCO9APZrJjmeziG5
 NFPSZ9ss3TDr92bcjRTejZ1Sn1+N5mSbvARFmohPU5oXy0ZysHNumOvsz6hxK+qu0o6rdm1c
 2mbZVGOkVht/Nete6BH9FS2SEYc1+XuxyX3gCkVuLwCgt4duvuhGKyBvrtmB2CcsuwGn80ED
 /1l+aANGTJd5+cECriOvgYzQjrY/13ITX8pgZXqWFZYf8syD4f2MQYM2WCRn8znnZuslCGYt
 8Cf2uih7r1ZnVFoAq4Aw/YwTsKv6Z/Woyy7ttEL9RGxe95upzjLKracjBcBj6mYVg0+3RsTG
 Z80dQYUgL/9oTk4rRHW9yNrFlbTiA/9ljx87XzKMHKFpMKMVCBP4Tf/QLOySmnCAurIKgOQX
 r0USRNbXam3Xp3j/AIxHqaJaCqH9SxpMJspgmLKWQ4jXih9E7xIXF6ub7Wrip/HAUNobERhe
 ggJqZSA40GDN+tIXRofc0kkZt3lJoqsHJWAH0jXtGttAJuXD/Gd2qtoyWrQwSmVhbi1EZW5p
 cyBHaXJhcmQgKFN5c051eCkgPGpkLmdpcmFyZEBzeXNudXgucGY+iGAEExECACAFAkhHSi4C
 GwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRC67tG/6g6j+CpWAKCASJwHb7ygwtqIkiOz
 yVnwbyHKiQCdGzWQyHQQjwx26L4oLh1AfnCh7ji5Ag0ESEdKLhAIAO1p1yIrSrtTS96bqK9x
 Q4f9j9R1zxAtjEjirZxU40LCYZrMvr59U726NqHGvxZZXhKD/FQIEMbah260KM8s0YIH0aEa
 EZR0nx7Bb2IjNqAO6lu7kLcNHKN3NeNzH6Vlui1PsIqaidGpu9kn/tHDx1etGQoISY6HYheC
 NQbvkOpoJ8sWiK6XqvcBHX8Pi+pEctzYwC6LUop9SCU+RMsG3JNdeI9Xyt2OOd/Wyc1h/isC
 hmIxG6duZlSzEqN9Vq/nAo+MuIZnnVvh3mUT6kraWb1fU6NPAvCq1Uxeqqq7ellGh/43+Xbp
 +r/da+F0chMhuGd7AqirVyvZvd2DvBS66q8ABAsIANp6SP0OTEk2Ii4ZzDSDdSFHUHdp3Hq9
 raZ/P8HjYyhcNukDwoSzHaCxW+c7+mqEYQYuRRlNvZ+q6rFYK+Nxz5HemSvi8uimD9BG63iO
 l3KsAMbg0l6XVLT+TXLj7IcEGJAe07/WEnFqbhhMxonTArL9baDq0xjYoEb4tLlAcJd6v7G4
 b4i1J307pZDXDw5CY3woJdF0dv1t7qDo8vFj9GCcDj5Ll2zpQsut2oL1DszNjaDtRuMZy8rj
 2UI4NOmMJV2rX6rmJtvoKbzWen/q+CHdfOUoPsMCxqCPZGzTICck3U4TQrqwo0EFAcnrMwBQ
 bWbcoN/PjauG+QGvnSPRAjqISQQYEQIACQUCSEdKLgIbDAAKCRC67tG/6g6j+EhAAJ49uucC
 DF1SISmaDULRaiKwRE56sACeLPM7QaXYdy4epaBpOjixOg/rvO0=
Subject: Re: Kernel Panic after updating Kernel
Message-ID: <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
Date: Thu, 18 Jun 2020 06:48:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="P7AYLdN19Uyupmiu52vHfOj9gItFwuQ0J"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--P7AYLdN19Uyupmiu52vHfOj9gItFwuQ0J
Content-Type: multipart/mixed; boundary="S244tQVpqMUPpXNf03J3Synaa7VLdjZGX";
 protected-headers="v1"
From: Jean-Denis Girard <jd.girard@sysnux.pf>
To: wireguard@lists.zx2c4.com
Message-ID: <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
Subject: Re: Kernel Panic after updating Kernel
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
In-Reply-To: <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>

--S244tQVpqMUPpXNf03J3Synaa7VLdjZGX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi list,

Le 17/06/2020 =C3=A0 19:53, Jason A. Donenfeld a =C3=A9crit=C2=A0:
> Hmm, still not able to reproduce.
>=20
> Are you sure you're running the latest up to date module? Try
> uninstalling kmod-wireguard and reinstalling?
>=20
> What driver is your ethernet NIC using?
>=20

For what it's worth, I seem to have the same problem on a CentOS-7
virtual machine hosted on VMware with vmxnet3. It has been working fine
since installed in 2017, but does lock up after upgrading to
kernel-3.10.0-1127.8.2.el7.x86_64 or kernel-3.10.0-1127.10.1.el7.x86_64.
The VM is now running fine on kernel-3.10.0-1062.18.1.el7.x86_64.

[    4.751926] NET: Registered protocol family 40
[    5.008840] vmxnet3 0000:03:00.0 ens160: intr type 3, mode 0, 3
vectors allocated
[    5.009298] vmxnet3 0000:03:00.0 ens160: NIC Link is Up 10000 Mbps
[    9.148571] vmxnet3 0000:13:00.0 ens224: intr type 3, mode 0, 3
vectors allocated
[    9.149062] vmxnet3 0000:13:00.0 ens224: NIC Link is Up 10000 Mbps
[   13.318360] vmxnet3 0000:1b:00.0 ens256: intr type 3, mode 0, 3
vectors allocated
[   13.318908] vmxnet3 0000:1b:00.0 ens256: NIC Link is Up 10000 Mbps
[   17.704052] FS-Cache: Loaded
[   17.823986] FS-Cache: Netfs 'nfs' registered for caching
[   17.837062] Key type dns_resolver registered
[   17.867211] NFS: Registering the id_resolver key type
[   17.867218] Key type id_resolver registered
[   17.867220] Key type id_legacy registered
[   17.879846] wireguard: module verification failed: signature and/or
required key missing - tainting kernel
[   17.886512] wireguard: WireGuard 1.0.20200520 loaded. See
www.wireguard.com for information.
[   17.886514] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
[  564.297446] nf_conntrack version 0.5.0 (16384 buckets, 65536 max)


Thanks,
--=20
Jean-Denis Girard

SysNux                   Syst=C3=A8mes   Linux   en   Polyn=C3=A9sie  fra=
n=C3=A7aise
https://www.sysnux.pf/   T=C3=A9l: +689 40.50.10.40 / GSM: +689 87.797.52=
7


--S244tQVpqMUPpXNf03J3Synaa7VLdjZGX--

--P7AYLdN19Uyupmiu52vHfOj9gItFwuQ0J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQpXSKzt7TNR5dVgoi67tG/6g6j+AUCXuua1gAKCRC67tG/6g6j
+KVnAKCDMkxBwl+A6v1k+rhT4QUAWGL5NACfSqkGdn39VHhCUCeZfMFCc1Gf7fA=
=WKOc
-----END PGP SIGNATURE-----

--P7AYLdN19Uyupmiu52vHfOj9gItFwuQ0J--
