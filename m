Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED760606A31B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYmuGmm/
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2bf2f9f9;
	Mon, 26 Oct 2026 05:29:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6961decb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Oct 2026 08:58:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0DB9240D58;
 Wed, 21 Oct 2026 08:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939011F000CB;
 Wed, 21 Oct 2026 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792573080;
 bh=PZFsgaUptmthCT9AGjarLBj+dSK/kXdt7D60tO+Fc1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=aYmuGmm/+X3TuMt6En/yuxlAevDmd0Bbvy4zAnvkecXFDCBCHH4BFV2HeLMyOncG6
 iKGNu8yvxaVvHYNxWEAcOVN5XFBxUULSVRqwdk8C1wabWjN9blXkG2dsAwo0wOz2hT
 mif8kBJMD1JtRyluN3jtJHEYpowNAAb1jQwIZ/Thfthe/YwWNZrd+u5P5X/YRZJrTI
 aD3T+PeiWZ6esjBFkbxkPU/x7zC6FMhPE9NGjjuHBE0rmfM1jCQ0Ypf5czE90KkfD7
 bfQzKNg7L4JGb9MoBPFM0DJ3BgiIuLatLnXE+esDNPjTCoLkzQ8plSnmclDPAZaIgf
 TJQiZ5tyQBJzQ==
Date: Wed, 21 Oct 2026 10:57:53 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Allison Henderson <achender@kernel.org>, 
 kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-s390@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, rds-devel@oss.oracle.com
Subject: Re: [linus:master] [sysctl]  8d75c338f0:
 BUG:KASAN:slab-use-after-free_in_touch_wq_lockdep_map
Message-ID: <ath-VoGkY_1JBES9@hobbes>
References: <202610190310.9737b2e3-lkp@intel.com> <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes> <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
 <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
 <atdE-TB8hkqcwp6g@hobbes> <atdK3ZkT4YqjGICq@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bt355i3q7cyhktpe"
Content-Disposition: inline
In-Reply-To: <atdK3ZkT4YqjGICq@redhat.com>
X-Mailman-Approved-At: Mon, 26 Oct 2026 05:28:33 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--bt355i3q7cyhktpe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linus:master] [sysctl]  8d75c338f0:
 BUG:KASAN:slab-use-after-free_in_touch_wq_lockdep_map
MIME-Version: 1.0

On Tue, Oct 20, 2026 at 01:05:01PM +0200, Oleg Nesterov wrote:
> On 10/20, Joel Granados wrote:
> >
> > On Mon, Oct 19, 2026 at 12:52:58PM -0700, Allison Henderson wrote:
> > >
> > > CONFIG_SYSCTL=3Dn.  A simpler fix might be to just handle the NULL at=
 the
> > > three call sites, e.g.:
> > >
> > >         rds_sysctl_reg_table =3D
> > >                 register_net_sysctl(&init_net, "net/rds", rds_sysctl_=
rds_table);
> > >         if (!rds_sysctl_reg_table && IS_ENABLED(CONFIG_SYSCTL))
> > >                 return -ENOMEM;
> > >
> >
> > Remember to NULL check rds_sysctl_reg_table in rds_sysctl_exit(). You
> > might hit another UAF on exit if you don't.
>=20
> Why? unregister_sysctl_table(header) does nothing if header =3D=3D NULL.
Nice catch! You can forgo the check as it is the first thing that
happens in unregister_sysctl_table.

Best

--bt355i3q7cyhktpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmrYfooACgkQupfNUreW
QU/WnAv/YVbhwQnlgm1v0MJMVqJO5TZOJ+RcOu/m4rFbvIPU8twKRupXLpWiQn/b
ICa4TdGkh96N3eS3UkV+Iiv9cSUVYgRBt1AXsJZ+JHRaufbZJIVIPhejQnxhjJe9
IQp55/hIG3MqlAbVIJBOgMKo5F7PbnElO2mRDkCXoc9KJ1wxvrjVCZodr+J6RWtt
e5OdPT9V1YmTuf37xRxpDWt4VRAtIrKIGMg3IqxHPPhFQlvepKVGLzgJYLNy/Ovt
vQkSONcvJhN1xkgKv+L+9cvlixaZaechi9psoCxWnDH0fxQBxamwcWmIKewNeoza
0W1An6oKC7did7l+hnLFAHKkt/8ePeddQM6ImdSmgAXueiCJ/Nr6hnI21D8eKQoA
U0n/7WU6S4/E7warmYG64iiAzKsI76Jd5nFYQY1feOLgQdMaa9RbcBFVqEAAoCQz
HvCPKex1+h1Ah/HxuC2wrvmUI3dX9AxrSo7NpuhKtPTzgXaLEfaAfW8tINh4pRXR
ZrHBWkU5
=s4u6
-----END PGP SIGNATURE-----

--bt355i3q7cyhktpe--
