Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750C8C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 02:45:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8817120834
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 02:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8817120834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sysnux.pf
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85d64213;
	Wed, 5 Dec 2018 02:37:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fd65d11
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 20:00:21 +0000 (UTC)
Received: from smtp-pro1.mana.pf (smtp-pro1.mana.pf [202.3.225.198])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b05e8eb1
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 20:00:20 +0000 (UTC)
Received: from tiare.sysnux.pf (111.85.90.202.dsl.dyn.mana.pf [202.90.85.111])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: courrier@sysnux.pf)
 by smtp-pro1.mana.pf (Postfix) with ESMTPSA id 40EBC541EF
 for <wireguard@lists.zx2c4.com>; Sat,  1 Dec 2018 10:07:47 -1000 (-10)
Received: from tiare.sysnux.pf (tiare.sysnux.pf [192.168.10.1])
 by tiare.sysnux.pf (Postfix) with ESMTP id D5DB35C5F4D
 for <wireguard@lists.zx2c4.com>; Sat,  1 Dec 2018 10:07:45 -1000 (-10)
To: wireguard@lists.zx2c4.com
From: Jean-Denis Girard <jd.girard@sysnux.pf>
Openpgp: preference=signencrypt
Autocrypt: addr=jd.girard@sysnux.pf; keydata=
 xsDiBEhHSi4RBAC2J54Syt9hbmoNgiiM4TNNliSgLiHu7q+8s34xiIpPRCO9APZrJjmeziG5
 NFPSZ9ss3TDr92bcjRTejZ1Sn1+N5mSbvARFmohPU5oXy0ZysHNumOvsz6hxK+qu0o6rdm1c
 2mbZVGOkVht/Nete6BH9FS2SEYc1+XuxyX3gCkVuLwCgt4duvuhGKyBvrtmB2CcsuwGn80ED
 /1l+aANGTJd5+cECriOvgYzQjrY/13ITX8pgZXqWFZYf8syD4f2MQYM2WCRn8znnZuslCGYt
 8Cf2uih7r1ZnVFoAq4Aw/YwTsKv6Z/Woyy7ttEL9RGxe95upzjLKracjBcBj6mYVg0+3RsTG
 Z80dQYUgL/9oTk4rRHW9yNrFlbTiA/9ljx87XzKMHKFpMKMVCBP4Tf/QLOySmnCAurIKgOQX
 r0USRNbXam3Xp3j/AIxHqaJaCqH9SxpMJspgmLKWQ4jXih9E7xIXF6ub7Wrip/HAUNobERhe
 ggJqZSA40GDN+tIXRofc0kkZt3lJoqsHJWAH0jXtGttAJuXD/Gd2qtoyWs0wSmVhbi1EZW5p
 cyBHaXJhcmQgKFN5c051eCkgPGpkLmdpcmFyZEBzeXNudXgucGY+wmAEExECACAFAkhHSi4C
 GwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRC67tG/6g6j+CpWAKCASJwHb7ygwtqIkiOz
 yVnwbyHKiQCdGzWQyHQQjwx26L4oLh1AfnCh7jjOwU0ESEdKLhAIAO1p1yIrSrtTS96bqK9x
 Q4f9j9R1zxAtjEjirZxU40LCYZrMvr59U726NqHGvxZZXhKD/FQIEMbah260KM8s0YIH0aEa
 EZR0nx7Bb2IjNqAO6lu7kLcNHKN3NeNzH6Vlui1PsIqaidGpu9kn/tHDx1etGQoISY6HYheC
 NQbvkOpoJ8sWiK6XqvcBHX8Pi+pEctzYwC6LUop9SCU+RMsG3JNdeI9Xyt2OOd/Wyc1h/isC
 hmIxG6duZlSzEqN9Vq/nAo+MuIZnnVvh3mUT6kraWb1fU6NPAvCq1Uxeqqq7ellGh/43+Xbp
 +r/da+F0chMhuGd7AqirVyvZvd2DvBS66q8ABAsIANp6SP0OTEk2Ii4ZzDSDdSFHUHdp3Hq9
 raZ/P8HjYyhcNukDwoSzHaCxW+c7+mqEYQYuRRlNvZ+q6rFYK+Nxz5HemSvi8uimD9BG63iO
 l3KsAMbg0l6XVLT+TXLj7IcEGJAe07/WEnFqbhhMxonTArL9baDq0xjYoEb4tLlAcJd6v7G4
 b4i1J307pZDXDw5CY3woJdF0dv1t7qDo8vFj9GCcDj5Ll2zpQsut2oL1DszNjaDtRuMZy8rj
 2UI4NOmMJV2rX6rmJtvoKbzWen/q+CHdfOUoPsMCxqCPZGzTICck3U4TQrqwo0EFAcnrMwBQ
 bWbcoN/PjauG+QGvnSPRAjrCSQQYEQIACQUCSEdKLgIbDAAKCRC67tG/6g6j+EhAAJ49uucC
 DF1SISmaDULRaiKwRE56sACeLPM7QaXYdy4epaBpOjixOg/rvO0=
Subject: Presentation
Message-ID: <ad67d00f-069c-6d1f-b519-dea5cb6d9f04@sysnux.pf>
Date: Sat, 1 Dec 2018 10:07:45 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Dec 2018 03:37:03 +0100
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
Content-Type: multipart/mixed; boundary="===============6973509935645259664=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6973509935645259664==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="LDn2FFiOT5kvZHiPDwT09f2rlRlmZ4TCE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LDn2FFiOT5kvZHiPDwT09f2rlRlmZ4TCE
Content-Type: multipart/mixed; boundary="Sd2UgTZrYqcXSuqMrobbNoELlTxepamtT";
 protected-headers="v1"
From: Jean-Denis Girard <jd.girard@sysnux.pf>
To: wireguard@lists.zx2c4.com
Message-ID: <ad67d00f-069c-6d1f-b519-dea5cb6d9f04@sysnux.pf>
Subject: Presentation

--Sd2UgTZrYqcXSuqMrobbNoELlTxepamtT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi list,

I'll be doing a presentation / demo of WireGuard to the members of
CLUSIR Tahiti (https://www.clusir-tahiti.org/) on December 13th. My
presentation will mainly be based on the materials available on the
WireGuard website.

I've been using WireGuard on Linux and Android for some time, but only
in a very basic way: mainly establish peer to peer tunnels. I like WG
because it is easy to setup, light, and secure. My main gripe with WG is
the Android client caching resolved host (as reported on the list
before:
https://lists.zx2c4.com/pipermail/wireguard/2018-October/003508.html).
Also I haven't found a way to log incoming connections on the WG servers.=


I would be interested if some people could share advanced usage of
WireGuard, especially setups that would have been difficult to achieve
with other VPN technologies.

You can contact me off list.


Thanks,
--=20
Jean-Denis Girard

SysNux                   Syst=C3=A8mes   Linux   en   Polyn=C3=A9sie  fra=
n=C3=A7aise
https://www.sysnux.pf/   T=C3=A9l: +689 40.50.10.40 / GSM: +689 87.797.52=
7


--Sd2UgTZrYqcXSuqMrobbNoELlTxepamtT--

--LDn2FFiOT5kvZHiPDwT09f2rlRlmZ4TCE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQpXSKzt7TNR5dVgoi67tG/6g6j+AUCXALqEQAKCRC67tG/6g6j
+AhiAJsF9yqxEcbNCtNXPZFUVc3a5aNdvACeMNV/2WQdPzqv+yaHyvBYfiyWEUk=
=5FPE
-----END PGP SIGNATURE-----

--LDn2FFiOT5kvZHiPDwT09f2rlRlmZ4TCE--

--===============6973509935645259664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6973509935645259664==--
