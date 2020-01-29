Return-Path: <SRS0=qOIe=3S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0277C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:40:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC742070E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dvn.me header.i=@dvn.me header.b="Z7DdqnIx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC742070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dvn.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab548632;
	Wed, 29 Jan 2020 12:40:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4946852d
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:40:05 +0000 (UTC)
Received: from q.meshwith.me (q.meshwith.me [IPv6:2001:41d0:1:e20d::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc0a44a5
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:40:05 +0000 (UTC)
Date: Wed, 29 Jan 2020 13:40:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=dvn.me; s=q;
 t=1580301538; bh=8UCpEnqPo02G9g3E7kxRVFteBtDOf0Amnn9+8aBhMng=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z7DdqnIxOfqDJqrKb7CjyGawlPs4LFdB6XbgnZsMMj/mSTU0AHTmlkaBAXg4wboRO
 hYyEoKJVrO6NS7gojiU2mgBJWfWzHQrjpNNZV4ZSrzf7UL0/XWNEWOVDUDpAICQmQQ
 aqF7B1D9goqethu7ZGKnUFbLArZCSRdRk8agln4oWsu8RCOUFHFAYE34dI4VIHIqWZ
 GZAHCuU2bnXaPHBPU19Gcn1T7sMos8q9nmwUiFErpC+Fp98OjR1YnGctpNAvnStAx/
 qlo8WRvVEVwPQcbDThvhYTlVpHkmuk8m93AWmdLvXYvBLUXfWmDkjroCgT5NWPer9G
 rVv134/34ibJQkxuVJWj2Lg1VK6feHnVMEpWSLrOaxLgmQFAcf0f1x1GyhU2AM/9q0
 oR6dw9f2NiT6pGgSxBxt/b/+3h1YdoCPlEfwe1pNnu7E2vFviLXUnP6owdrSUxpYvI
 srb/yIJp79CIZUcuctpMvtRt0kfsnrkxEtvwolad9WWa1Mltu/72banG06FDNi4Col
 LwYhu/77P27fCZl/5bOxRRQ6jUfZxmeXfxqAMmM1qFe2KAxysdJjkhUZLXXqnKoqGn
 GYivCwJzPp37LcEBaPFa6GJ29dvSFcrjZt3mwiuJQAb68O+zORvqmV8+grU5yB0A5x
 K9TU0cGrGUFPQVSISXRzIeDg=
From: dvn <mail@dvn.me>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: wireguard ci hooked up to quite a few kernel trees
Message-ID: <20200129124001.ak2fo6nr2bqp2ywk@iyo>
References: <CAHmME9rProfVf4VGHGX9no3KTa08nL_oYkK8Nv+eknk4ewVMAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9rProfVf4VGHGX9no3KTa08nL_oYkK8Nv+eknk4ewVMAw@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5402692651340141933=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============5402692651340141933==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="flfjngfbaerlpyzf"
Content-Disposition: inline


--flfjngfbaerlpyzf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Impressed by how comprehensive this is already. Would you be up for
sharing some of the details of how this system works. Looks like it's
largely custom. Obviously based on QEMU/KVM, as you say - are you
emulating most of the architectures outside of x86_64?

Good to see a project taking continuous building/testing against
multiple trees and architectures so seriously!

Cheers,
Devan

Jason A. Donenfeld transcribed 2.0K bytes:
> Hi all,
>=20
> With the merging of wireguard, I've hooked the project's CI up to
> quite a few trees. We now have:
>=20
> - net-next
> - net
> - linux-next
> - linux (Linus' tree)
> - wireguard-linux (my tree)
> - wireguard-linux-compat (backports to kernels 3.10 - 5.5)
>=20
> When the various pushes and pulls click a few more cranks through the
> machinery, I'll probably add crypto and cryptodev, and eventually
> Greg's stable trees. If anybody has suggestions on other relevant
> trees that might help catch bugs as early as possible, I'm all ears.
>=20
> Right now builds are kicked off for every single commit made to each
> one of these trees, on x86_64, i686, aarch64, aarch64_be, arm, armeb,
> mips64, mips64el, mips, mipsel, powerpc64le, powerpc, and m68k. For
> each of these, a fresh kernel and miniature userland containing the
> test suite is built from source, and then booted in qemu.
>=20
> Even though the CI at the moment is focused on the wireguard test
> suite, it has a habit of finding lots of bugs and regressions in other
> weird places. For example, linux-next is failing at the moment on a
> few archs.
>=20
> I run this locally every day all day while developing kernel things
> too. It's one command to test a full kernel for whatever thing I'm
> working on, and this winds up saving a lot of time in development and
> lets me debug things with printk in the dumbest ways possible while
> still being productive and efficient.
>=20
> You can view the current build status here:
> https://www.wireguard.com/build-status/
>=20
> This sort of CI is another take on the kernel CI problem; I know a few
> organizations are doing similar things. I'd be happy to eventually
> expand this into something more general, should there be sufficient
> interest -- probably initially on networking stuff -- or it might turn
> out that this simply inspires something else that is more general and
> robust, which is fine too. Either way, here's my contribution to the
> modicum of kernel CI things happening.
>=20
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--flfjngfbaerlpyzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEDMARp8PcbrR1Z5vJrAq6MYZqfnYFAl4xfRsACgkQrAq6MYZq
fnZUHQ/+NNiHTsV0EezQeUvocxvw0QHpKEjDfF8uxrrYKhxPUO3sP/ckzCPM5i+X
UfLB6tK3X9YWxVA9QQbAB09ve0yWtJ4yD/W2gBZsXpCn2e7Jmjo7C19EKZXJbBoC
l64RQJSNkWj1otNQjeuJ6HCHGLEu7sK7kwFGneTaygpMJ25edIBY9JiKlWwk6pNn
616k3cl6QO4GEwc84/wLkra+ct+mJAVPbOd4A/c1kDHvn3L5udhMnmot3Zzjw6gS
d8CGJhlbTEGTQ0bChnXEGMIdxGquD3NwhuEtl/Gp27WSR+glHWKFiF4r7UNhBQnp
n7g/GdMSum3J1TYlOF9/apsgOj5l/vk2Hwkdjj6mGusbHvdTqClQYyFoI7qHd+nI
xissZdYhJGQrFOQ8DwAkFE9Pdq9PPfeNHruZeT97Oa9GUGAJ75HQuNMJmv49xc5D
/5iWWo1TLr2ddPo+bPKe621DZQCHNuNYPl8VSk3STzIH/SO81vtDudgGJ78rZlVA
f0loosJSH8xYTw9o4h1nPhAmoIrXtRO8jwVl8xPD+UYuQ2NpEsNVGL7t6zRPOgRB
cnX9SmlfrMvJmC4tiVLzDCJsYlNPRL69mucvdkiTuT7wLw7cbRpxYWGY/q08uih1
fTCdaTg2qr0VeMwIV47HBcrF4AjaKzvwYd7M1Ujo9U5A5B6F9Zk=
=/59B
-----END PGP SIGNATURE-----

--flfjngfbaerlpyzf--

--===============5402692651340141933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5402692651340141933==--
