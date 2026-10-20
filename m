Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562B606A322
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 06:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MijKg5Pi
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e3ddb49c;
	Mon, 26 Oct 2026 05:28:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 450e994d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Oct 2026 07:55:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D6E860DA4;
 Tue, 20 Oct 2026 07:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC1C1F000C4;
 Tue, 20 Oct 2026 07:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792482926;
 bh=wiYcyYLmidZvaVJOjwXyMAgj6pRDKve8NH/1uX7Y5XE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=MijKg5PiQSN4IeG87vq5Yt3/rVEOVOiaPlYoJcUIm++uXCodktoqH3rFHZJ3vXLg3
 MbEvGyMVcu8ta0JQAZ/6/CyKJfnVs4NOL4EO+SuFnsyFAQfDFloIovKzTmVtFaywE7
 5MMyInA6heob1AvwY1YlJuSGSYD2epYDU9VT0CA8ur5h1stMY9++8Pt69cam5D5j34
 iMie7hxbn7ltrvpnSMwsadaWIPXrdctRpqpTxvJSgyhCjtXz0Swx33L9AsJADIY7qi
 ei8UsEfMAQ9C9tuXNadnmHWd63vc/UzaTHUiXU8zbmpRzPsHDUkiwnCjZDGuQVEOE7
 6TBQDsjEdSP2g==
Date: Tue, 20 Oct 2026 09:55:20 +0200
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
Message-ID: <atcS-NKX1TpbklyR@hobbes>
References: <202610190310.9737b2e3-lkp@intel.com> <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes> <atYuE1xnVYe0BDG4@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a42qtuqnvg7yxrg6"
Content-Disposition: inline
In-Reply-To: <atYuE1xnVYe0BDG4@redhat.com>
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--a42qtuqnvg7yxrg6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linus:master] [sysctl]  8d75c338f0:
 BUG:KASAN:slab-use-after-free_in_touch_wq_lockdep_map
MIME-Version: 1.0

On Mon, Oct 19, 2026 at 04:49:55PM +0200, Oleg Nesterov wrote:
> On 10/19, Joel Granados wrote:
> >
> > On Mon, Oct 19, 2026 at 01:41:05PM +0200, Oleg Nesterov wrote:
> > > On 10/19, kernel test robot wrote:
> > > >
> > > >
> > > > Hello,
> > > >
> > > > kernel test robot noticed "BUG:KASAN:slab-use-after-free_in_touch_w=
q_lockdep_map" on:
> > > >
> > > > commit: 8d75c338f0bcecaa6c9af67f86c176b67b6acf3e ("sysctl: remove C=
ONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL") https://git.kernel.org/c=
git/linux/kernel/git/torvalds/linux.git master
> > >
> > > I don't think that commit could cause such a problem. Please re-check.
> > >
> > > Oleg.
> >
> > That commit might not be the one that introduces the UAF, but it might
> > be the one that exposes it?
> >
> > You have CONFIG_SYSCTL=3Dn & CONFIG_RDS=3Dy & CONFIG_RDS_RDMA=3Dy.
> > Therefore rds_sysctl_init() returns -ENOMEM  and rds_ib_sysctl_init
> > returns -ENOMEM.
> >
> > If rds_ib_sysctl_init is called after a failed rds_sysctl_init, then
> > rds_ib_sysctl_init would call a flush_workqueue on a rds_wq that has
> > already been freed by the failed rds_sysctl_init. Right?
> >
> > Please let me know if I missed anything.
>=20
> I think you are right...
>=20
> rds_init() does
>=20
> 	rds_threads_init()
> 		rds_wq =3D create_singlethread_workqueue("krdsd");
>=20
> 	rds_sysctl_init()
> 		fails due to CONFIG_SYSCTL=3Dn
>=20
> 	out_threads:
> 		destroy_workqueue(rds_wq);
>=20
> After that any access to rds_wq is wrong.
>=20
> If rds_rdma_init() runs after that, rds_ib_init() will call
> rds_ib_unregister_client() -> flush_workqueue(rds_wq).
>=20
> And this will equally happen before the blamed commit 8d75c338f0bc,
> just you need CONFIG_PROC_SYSCTL=3Dn instead of CONFIG_SYSCTL=3Dn.
>=20
>=20
> But. rds_init() can also fail even if CONFIG_SYSCTL=3Dy, after
> rds_sysctl_init(), so to me this looks like a bug in net/rds/.
>=20
>=20
> In any case, I guess net/rds/ init paths should not fail if
> CONFIG_SYSCTL=3Dn ?

That is up to net/rds.=20

The question is: do you have to fail if a sysctl registration fails? Or
another way to ask it is: Can't it (net/rds or others) run while not
being tuned or queried through sysctl?

If the answer to these questions is that the sysctl path is necessary,
then the failure is reasonable. But if they can work without the sysctl,
the failure is an overreaction (IMO).

Best


>=20
> Oleg.
>=20

--a42qtuqnvg7yxrg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmrXHlsACgkQupfNUreW
QU912gv/eejjrtoxUgh51UagvsJXA0SMOI6Yaa+uIBcExUpCjVRcUBjhj2jT/GV9
JRJK0zb9dOeEg4yIm/bzf4j3qYwBTqiRdVf5++8HB9yuqIx4w0NlVIbks9Q8YDQh
QRXDBUAUoP6FxYb3jE1U49avWB37mPqj986qpNiwwqXq9nIRDKDf/9sPY/b2Vvyn
RibI+hOi7hfCSUntOsrbN7NmOtV9e1FQtHZxCjHpdz51bQqn1S84/WJ0dDgy+RUT
J1sLIQsUlmxKtJ78VYmaCPUJ+owrm3mFNvzmw2ERplHoA2JqT3r6lY1jP2G5Xi8y
pRSKsCTfoRUgVrXh6yByuK/2ywuqzfTEneUTJ4F97bLgJClP+4FtYcUjnbZOvsrm
l/VWLpeaTxFHDiDWu/rJ+K9YFs8JcsnTtmJqJ/pLJAW/IjvQ5sQsT6P+d04LgWQJ
fRYc1/dcsViZ1Bz/LUpV4NWsMtqP70EPbjuvvPYA5GG5HRM1bj6x4hHL2e9gGsQ5
vMczI+dC
=OX/2
-----END PGP SIGNATURE-----

--a42qtuqnvg7yxrg6--
