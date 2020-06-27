Return-Path: <SRS0=xwVK=AI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934C9C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jun 2020 01:26:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E797B20720
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jun 2020 01:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E797B20720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sysnux.pf
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92daa7a6;
	Sat, 27 Jun 2020 01:06:49 +0000 (UTC)
Received: from smtp-pro1.mana.pf (smtp-pro1.mana.pf [202.3.225.198])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60e58de1
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jun 2020 01:06:46 +0000 (UTC)
Received: from tiare.sysnux.pf (103-4-75-17-dynamic.viti.pf [103.4.75.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: courrier@sysnux.pf)
 by smtp-pro1.mana.pf (Postfix) with ESMTPSA id 78CFB5425D;
 Fri, 26 Jun 2020 15:26:02 -1000 (-10)
Received: from tiare.sysnux.pf (tiare.sysnux.pf [192.168.10.1])
 by tiare.sysnux.pf (Postfix) with ESMTP id 5B23F1555378;
 Fri, 26 Jun 2020 15:26:02 -1000 (-10)
Subject: Re: Kernel Panic after updating Kernel
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
 <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
 <613e8bab-4062-3cec-15ab-eeca325a5859@sysnux.pf>
 <CAHmME9rvJmH=fvxvVYi5n3QHzt2tNskqoghjWG++bJSsv8iu7g@mail.gmail.com>
 <975a5f77-5c7e-dcfe-6bbe-d4b6e2c5e379@sysnux.pf>
 <CAHmME9qy4j2XpsTu1syABo1g6BZyS4w3OYghmT4T2kj7WjTyyQ@mail.gmail.com>
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
Message-ID: <8e3c1299-3b4c-1673-205d-e006998bcead@sysnux.pf>
Date: Fri, 26 Jun 2020 15:26:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qy4j2XpsTu1syABo1g6BZyS4w3OYghmT4T2kj7WjTyyQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="DVoHwbJnKa4E12yqW6v8xSJoDKRX7IZDz"
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
--DVoHwbJnKa4E12yqW6v8xSJoDKRX7IZDz
Content-Type: multipart/mixed; boundary="BtJmOTDrDIkOYPv5DMlyu2um02JFl07Je";
 protected-headers="v1"
From: Jean-Denis Girard <jd.girard@sysnux.pf>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <8e3c1299-3b4c-1673-205d-e006998bcead@sysnux.pf>
Subject: Re: Kernel Panic after updating Kernel
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
 <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
 <613e8bab-4062-3cec-15ab-eeca325a5859@sysnux.pf>
 <CAHmME9rvJmH=fvxvVYi5n3QHzt2tNskqoghjWG++bJSsv8iu7g@mail.gmail.com>
 <975a5f77-5c7e-dcfe-6bbe-d4b6e2c5e379@sysnux.pf>
 <CAHmME9qy4j2XpsTu1syABo1g6BZyS4w3OYghmT4T2kj7WjTyyQ@mail.gmail.com>
In-Reply-To: <CAHmME9qy4j2XpsTu1syABo1g6BZyS4w3OYghmT4T2kj7WjTyyQ@mail.gmail.com>

--BtJmOTDrDIkOYPv5DMlyu2um02JFl07Je
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: quoted-printable

Le 18/06/2020 =C3=A0 21:38, Jason A. Donenfeld a =C3=A9crit=C2=A0:
> Remove all wireguard packages. Update to the latest kernel. Run `find
> /lib/modules -name '*wireguard*' -print -delete`. Then install
> kmod-wireguard.

Sorry for late reply. I can confirm that removing wireguard module and
reinstalling (from elrepo) worked.


Thanks,
--=20
Jean-Denis Girard

SysNux                   Syst=C3=A8mes   Linux   en   Polyn=C3=A9sie  fra=
n=C3=A7aise
https://www.sysnux.pf/   T=C3=A9l: +689 40.50.10.40 / GSM: +689 87.797.52=
7


--BtJmOTDrDIkOYPv5DMlyu2um02JFl07Je--

--DVoHwbJnKa4E12yqW6v8xSJoDKRX7IZDz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQpXSKzt7TNR5dVgoi67tG/6g6j+AUCXvagKgAKCRC67tG/6g6j
+GllAJ4z93imL096gPEmJlsfN0iwsyQbXgCfR0OEJqQAqYLVAgMXt/2zcgBKNDs=
=X5Ft
-----END PGP SIGNATURE-----

--DVoHwbJnKa4E12yqW6v8xSJoDKRX7IZDz--
