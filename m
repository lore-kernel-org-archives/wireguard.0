Return-Path: <SRS0=FpfO=5R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6102C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 12:48:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA6620675
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 12:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDA6620675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0802278e;
	Wed, 1 Apr 2020 12:40:07 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [2001:41d0:1:8b3b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 29b9955c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 12:40:05 +0000 (UTC)
Received: from natsu (natsu.40.romanrm.net
 [IPv6:fd39:aa:c499:6515:e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 0BBC840338;
 Wed,  1 Apr 2020 12:48:11 +0000 (UTC)
Date: Wed, 1 Apr 2020 17:48:11 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: [ANNOUNCE] wireguard-linux-compat v1.0.20200330 released
Message-ID: <20200401174811.5cf6895c@natsu>
In-Reply-To: <38842e471ccb3582@frisell.zx2c4.com>
References: <38842e471ccb3582@frisell.zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 30 Mar 2020 18:19:17 -0600
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>=20
> Hello,
>=20
> A new version, v1.0.20200330, of the backported WireGuard kernel module f=
or
> 3.10 <=3D Linux <=3D 5.5.y has been tagged in the git repository.

My kernel build for 5.4.29 has failed just now:

In file included from <command-line>:
././net/wireguard/compat/compat.h:1029:20: error: redefinition of =E2=80=98=
skb_reset_redirect=E2=80=99
 static inline void skb_reset_redirect(struct sk_buff *skb)
                    ^~~~~~~~~~~~~~~~~~
In file included from ././net/wireguard/compat/compat.h:878,
                 from <command-line>:
./include/linux/skbuff.h:4538:20: note: previous definition of =E2=80=98skb=
_reset_redirect=E2=80=99 was here
 static inline void skb_reset_redirect(struct sk_buff *skb)
                    ^~~~~~~~~~~~~~~~~~
In file included from <command-line>:
././net/wireguard/compat/compat.h: In function =E2=80=98skb_reset_redirect=
=E2=80=99:
././net/wireguard/compat/compat.h:1032:2: error: implicit declaration of fu=
nction =E2=80=98skb_reset_tc=E2=80=99; did you mean =E2=80=98skb_reserve=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
  skb_reset_tc(skb);
  ^~~~~~~~~~~~
  skb_reserve
cc1: some warnings being treated as errors
scripts/Makefile.build:265: recipe for target 'net/wireguard/main.o' failed
make[3]: *** [net/wireguard/main.o] Error 1
scripts/Makefile.build:500: recipe for target 'net/wireguard' failed
make[2]: *** [net/wireguard] Error 2

>=20
> =3D=3D Changes =3D=3D
>=20
>   * queueing: backport skb_reset_redirect change from 5.6
>   * version: bump
>  =20
>   This release has only one slight change, to put it closer to he 5.6 cod=
ebase,
>   but its main purpose is to bump us to a 1.0.y version number. Now that
>   WireGuard 1.0.0 has been released for Linux 5.6 [1], we can put the sam=
e number on
>   the backport compat codebase.
>  =20
>   [1] https://lists.zx2c4.com/pipermail/wireguard/2020-March/005206.html
>=20
> This release contains commits from: Jason A. Donenfeld.
>=20
> As always, the source is available at https://git.zx2c4.com/wireguard-lin=
ux-compat/
> and information about the project is available at https://www.wireguard.c=
om/ .
>=20
> This version is available in compressed tarball form here:
>   https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-c=
ompat-1.0.20200330.tar.xz
>   SHA2-256: 2d57b239605be2ee0e4c2da935ff1a23e9ed8bb3ee692e10ae032ae50f280=
bef
>=20
> A PGP signature of that file decompressed is available here:
>   https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-c=
ompat-1.0.20200330.tar.asc
>   Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
>   Remember to unxz the tarball before verifying the signature.
>=20
> If you're a package maintainer, please bump your package version. If you'=
re a
> user, the WireGuard team welcomes any and all feedback on this latest ver=
sion.
>=20
> Finally, WireGuard development thrives on donations. By popular demand, we
> have a webpage for this: https://www.wireguard.com/donations/
>=20
> Thank you,
> Jason Donenfeld
>=20
>=20
> -----BEGIN PGP SIGNATURE-----
>=20
> iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl6CjGwQHGphc29uQHp4
> MmM0LmNvbQAKCRBJ/HASpd4DrqfwD/wJlEbOhYd1ixM3OI8Q2endXmJBRh9UimjL
> F2moHwTzDM49o3xQpfgQuBFbZWK0L/JNTSlKxrmBLcX9fBJ2VERT1Nrnlh414Ovw
> FLpmJt9gOWMF6hjlptXKaE/T0vRjzfLli2YzfzyvqMQg9hR/eRKlYhYWOu/fsm3L
> UtmBm8wGdDeo7e119M0dnfcfboW2b3NKQX87/bWrAn21BL9F+JsNx8Ytx2a5cU8z
> ZLj56sDWWclmoIXiLI1e+bKO9pXRXvfkSd11p5KK6knD8i8BtAn7uVVfda5VWxmO
> xooFhNq75photRM0t/VAKhp7ji96pYwSQD6Kw91HPgBcptB29XoacUcpLs40TUx5
> D7LpvYISKItZpPdfgSwIx3kyajBDmn8bpFZH8T+/cDsIvuJbdpGjP88Qr86JiKQ+
> BiVmTW5nXWn0d4tQIbw2w34BVre5cLheyWZN3Nk6f7bfxjba52Qa85rrjPoCNWv+
> PPsVTffIfAxk5ZavSuPUx+QMtmIqnC/bOb2WUn/+lukv+HVYYXO5GyHrfTqS9EW/
> kw/2dC9pGSye6bz7KYTQwRHSJnaA+SDk2ZNFdlrsYaoFfuZJeaFMkiU3xpIYGllv
> +v6rmQw/l0d4yZtHR6jmMV4qWeZetH0/5De21/syOQt8XuySjlkNVLRUPgIdZtKN
> ak69693rPw=3D=3D
> =3DK43H
> -----END PGP SIGNATURE-----


--=20
With respect,
Roman
