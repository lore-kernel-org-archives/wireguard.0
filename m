Return-Path: <SRS0=KwQm=PJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B06C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Oct 2021 08:10:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8524611CB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Oct 2021 08:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8524611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=smar.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0eac8e6;
	Thu, 21 Oct 2021 08:07:51 +0000 (UTC)
Received: from airi.smar.fi (airi.smar.fi [95.216.48.100])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 09481128
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Oct 2021 08:07:50 +0000 (UTC)
Received: from marie.localnet (marie.smar.fi [IPv6:2a01:4f9:2a:64d:2000::30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by airi.smar.fi (Postfix) with ESMTPSA id A483BDBF05;
 Thu, 21 Oct 2021 11:07:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smar.fi; s=mail;
 t=1634803668; bh=LU+Jv0EuaobabhFd8CbVqAM1a5z9xqP1IP7ueJWyraQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WvLQEju5mvZ2NCRcgFlrHS1JV9yNknxgY5Dbbdueo57aLAEPa8hohAxG3QYi5u+de
 2/3R9BRDqiP3FCb146aj8w0YiMDVMfrDxe+NVjuti03Wo+xttoPHVwU3PytVQtLQDh
 D6w5gdKSdngBB5QtnjQKghrT3tBCRodfIusRNnc4=
From: Samu Voutilainen <wireguard@smar.fi>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: faustin@fala.red
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
Date: Thu, 21 Oct 2021 11:07:44 +0300
Message-ID: <4688156.31r3eYUQgx@marie>
In-Reply-To: <YXEaXIkYfcSPO+tR@falared>
References: <YWFuczOf1dM3B4Pt@falared> <2505087.Lt9SDvczpP@marie>
 <YXEaXIkYfcSPO+tR@falared>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4351787.LvFx2qVVIh";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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

--nextPart4351787.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

=46austin Lammler kirjoitti torstaina 21. lokakuuta 2021 10.44.28 EEST:
> Samu Voutilainen <wireguard@smar.fi>,
>=20
> 20/10/2021 =E2=80=93 19:25:49 (+0300):
> > At least on x86_64 SLE, the module is in kernel-*-extra package, for
> > example in kernel-default-extra.
>=20
> Zypper does show kernel-default-extra but:
> | kernel-default-base | The Standard Kernel - base modules | package
>=20
> That is not installed, maybe this is where the wireguard module is?

kernel-default-base is kind of minimal version of default kernel, usable in=
=20
certain virtualization setups, for example.=20

Actually it looks like in SLE-15-SP3 wireguard.ko is in kernel-default rath=
er=20
in -extra. That was case in SP2.

$ rpm -ql kernel-default | ag wireguard.ko
/lib/modules/5.3.18-59.27-default/kernel/drivers/net/wireguard/wireguard.ko=
=2Exz

If the module is not present, maybe it is not compiled for s390x. Maybe SUS=
E=E2=80=99s=20
support could enlighten why such choice has been made?
--nextPart4351787.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEzQiQ+Sk/d1O26r4vtNtW2rUdxQ0FAmFxH9AACgkQtNtW2rUd
xQ2RAQgAo0YrEIh4QVywNIL8fL02u9dEq6NyQzerOkdXGa0iaIV5uMs2jLRYCCt2
H8HbgNvn1sHa4kPWsovkm/O6CIL0AlIj/xnR1VpX9Y7Jk4kw7APGTHiAkO5gP/qS
WQeMcnAcBVayFPxbcF3i+dq+mIwtcgmTqERR5LX/QklPUX7OuLGr+reArNYgcUfb
wtl9Mu3vMLjgb2Fxc83LoJ+z1mg1oR+4otYtqcNSu/ufZEWk2+AKVta0t69PfH0f
+zjW1OGJ+Sn1k34QODuTZgvszYCkNNlBu13gmr4/kvisTKZ5XzbVc9GCjJZi5yL6
M3udQbmq95KGi0C+v9aMKg0LE0BalA==
=f5Tg
-----END PGP SIGNATURE-----

--nextPart4351787.LvFx2qVVIh--



