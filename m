Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDCEC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 20:10:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0901207E8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 20:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0901207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sysnux.pf
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d616e3b;
	Thu, 18 Jun 2020 19:52:12 +0000 (UTC)
Received: from smtp-pro1.mana.pf (smtp-pro1.mana.pf [202.3.225.198])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91dfa77d
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:52:09 +0000 (UTC)
Received: from tiare.sysnux.pf (103-4-75-17-dynamic.viti.pf [103.4.75.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: courrier@sysnux.pf)
 by smtp-pro1.mana.pf (Postfix) with ESMTPSA id 373815413C;
 Thu, 18 Jun 2020 10:10:22 -1000 (-10)
Received: from tiare.sysnux.pf (tiare.sysnux.pf [192.168.10.1])
 by tiare.sysnux.pf (Postfix) with ESMTP id 13AB314C0809;
 Thu, 18 Jun 2020 10:10:22 -1000 (-10)
Subject: Re: Kernel Panic after updating Kernel
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
 <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
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
Message-ID: <613e8bab-4062-3cec-15ab-eeca325a5859@sysnux.pf>
Date: Thu, 18 Jun 2020 10:10:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="VJZfMYQ2CXAEBWbqmmeQPTKEDb1E9CJ4O"
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
--VJZfMYQ2CXAEBWbqmmeQPTKEDb1E9CJ4O
Content-Type: multipart/mixed; boundary="7sTTI71LbK7tMqnsecGZF1B4l9SADLFCF";
 protected-headers="v1"
From: Jean-Denis Girard <jd.girard@sysnux.pf>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <613e8bab-4062-3cec-15ab-eeca325a5859@sysnux.pf>
Subject: Re: Kernel Panic after updating Kernel
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
 <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
In-Reply-To: <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>

--7sTTI71LbK7tMqnsecGZF1B4l9SADLFCF
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: quoted-printable

Le 18/06/2020 =C3=A0 09:48, Jason A. Donenfeld a =C3=A9crit=C2=A0:
> I am unable to reproduce this issue with vmxnet3. However, as I noted
> earlier, your wireguard version seems old. Try updating everything at
> once, and then see.

yum updated to wireguard-dkms.noarch 1:1.0.20200611-1.el7

By the way, yum complains :
Error! Could not locate dkms.conf file.
File: /var/lib/dkms/wireguard/0.0.20181218/source/dkms.conf does not exis=
t.

I cannot reboot now, I will let you know how it goes later.


Thanks,
--=20
Jean-Denis Girard

SysNux                   Syst=C3=A8mes   Linux   en   Polyn=C3=A9sie  fra=
n=C3=A7aise
https://www.sysnux.pf/   T=C3=A9l: +689 40.50.10.40 / GSM: +689 87.797.52=
7


--7sTTI71LbK7tMqnsecGZF1B4l9SADLFCF--

--VJZfMYQ2CXAEBWbqmmeQPTKEDb1E9CJ4O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQpXSKzt7TNR5dVgoi67tG/6g6j+AUCXuvKLgAKCRC67tG/6g6j
+MskAJ9RiyrmeT/JPQ/O+tWDQXM8juwUagCgrcnNZ4ZWIyzw2s8DNUs/2GYJ26c=
=+gqz
-----END PGP SIGNATURE-----

--VJZfMYQ2CXAEBWbqmmeQPTKEDb1E9CJ4O--
