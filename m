Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721F9606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 06:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RtgQErrW
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id aa978d8a;
	Mon, 26 Oct 2026 05:29:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 327241b7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Oct 2026 09:06:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0384460136;
 Tue, 20 Oct 2026 09:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340EF1F000C4;
 Tue, 20 Oct 2026 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792487193;
 bh=byMpnzMiLTG8THNjkNmp9UgpYnNMNTx0auzeW57yB8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=RtgQErrWcSXkn4om10fEUZVsYPQS8E0C/5ZMqJW739OOKCRRH5cgZYWz6k9JW+NEA
 TXlyeYKprnZiyrNMoxCJbbwx/VXBq45YssFHz1sFkjxDHLYntyV8QmG1eGeLwBJeXZ
 79cdAncfI+BcHaxn3CPdPzDm1iSaInRvneceLD7fGwATCqRl2B+GAqG6GeVWRk/KmF
 VR1bAD3ZDJ9IabcZtURZJUnMDYc5qfuKlPdxlUDPi5+ksFEQyy+2HiccWtke1b315Y
 4ytv3hocK/lsNGOKxbtNmiQHyzD5hUINETjPtNB7EMhCIC7slgaFYzF9BrNWaAmyJo
 lDTQCa4S6emGw==
Date: Tue, 20 Oct 2026 11:06:18 +0200
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
Message-ID: <atctwUB5NlRLk4Wy@hobbes>
References: <202610190310.9737b2e3-lkp@intel.com> <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes> <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pcvh7stf5trtufk4"
Content-Disposition: inline
In-Reply-To: <atY42k00k0Waj6o4@redhat.com>
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--pcvh7stf5trtufk4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linus:master] [sysctl]  8d75c338f0:
 BUG:KASAN:slab-use-after-free_in_touch_wq_lockdep_map
MIME-Version: 1.0

On Mon, Oct 19, 2026 at 05:35:54PM +0200, Oleg Nesterov wrote:
> On 10/19, Oleg Nesterov wrote:
> >
> > But. rds_init() can also fail even if CONFIG_SYSCTL=3Dy, after
> > rds_sysctl_init(), so to me this looks like a bug in net/rds/.
> >
> >
> > In any case, I guess net/rds/ init paths should not fail if
> > CONFIG_SYSCTL=3Dn ?
>=20
> So I think that something like the uncompiled/untested patch below makes
> sense anyway even if doesn't fix all the potential problems with rds_wq.
>=20
> What do you think?

That is a good option. I also did not compile not test it, but guarding
the error inside an ifdef would work and is a pattern that is used
elsewhere.

You can also do this (also untested and not compiled):

diff --git i/net/rds/ib_sysctl.c w/net/rds/ib_sysctl.c
index 2af678e71e3c6..bc97a3eecad69 100644
--- i/net/rds/ib_sysctl.c
+++ w/net/rds/ib_sysctl.c
@@ -114,7 +114,7 @@ void rds_ib_sysctl_exit(void)
 int rds_ib_sysctl_init(void)
 {
        rds_ib_sysctl_hdr =3D register_net_sysctl(&init_net, "net/rds/ib", =
rds_ib_sysctl_table);
-       if (!rds_ib_sysctl_hdr)
+       if (!rds_ib_sysctl_hdr && IS_ENABLED(CONFIG_SYSCTL))
                return -ENOMEM;
        return 0;
 }
diff --git i/net/rds/sysctl.c w/net/rds/sysctl.c
index 025f518a43495..41c65b98c94bd 100644
--- i/net/rds/sysctl.c
+++ w/net/rds/sysctl.c
@@ -93,7 +93,8 @@ static struct ctl_table rds_sysctl_rds_table[] =3D {

 void rds_sysctl_exit(void)
 {
-       unregister_net_sysctl_table(rds_sysctl_reg_table);
+       if (rds_sysctl_reg_table)
+               unregister_net_sysctl_table(rds_sysctl_reg_table);
 }

 int rds_sysctl_init(void)
@@ -103,7 +104,7 @@ int rds_sysctl_init(void)

        rds_sysctl_reg_table =3D
                register_net_sysctl(&init_net, "net/rds", rds_sysctl_rds_ta=
ble);
-       if (!rds_sysctl_reg_table)
+       if (!rds_sysctl_reg_table && IS_ENABLED(CONFIG_SYSCTL))
                return -ENOMEM;
        return 0;
 }


Both are ok IMO.

Best

>=20
> Oleg.
> ---
>=20
> diff --git a/net/rds/ib_sysctl.c b/net/rds/ib_sysctl.c
> index 2af678e71e3c..bccdb5c4df1d 100644
> --- a/net/rds/ib_sysctl.c
> +++ b/net/rds/ib_sysctl.c
> @@ -36,19 +36,10 @@
> =20
>  #include "ib.h"
> =20
> -static struct ctl_table_header *rds_ib_sysctl_hdr;
> -
>  unsigned long rds_ib_sysctl_max_send_wr =3D RDS_IB_DEFAULT_SEND_WR;
>  unsigned long rds_ib_sysctl_max_recv_wr =3D RDS_IB_DEFAULT_RECV_WR;
>  unsigned long rds_ib_sysctl_max_recv_allocation =3D (128 * 1024 * 1024) =
/ RDS_FRAG_SIZE;
> -static unsigned long rds_ib_sysctl_max_wr_min =3D 1;
> -/* hardware will fail CQ creation long before this */
> -static unsigned long rds_ib_sysctl_max_wr_max =3D (u32)~0;
> -
>  unsigned long rds_ib_sysctl_max_unsig_wrs =3D 16;
> -static unsigned long rds_ib_sysctl_max_unsig_wr_min =3D 1;
> -static unsigned long rds_ib_sysctl_max_unsig_wr_max =3D 64;
> -
>  /*
>   * This sysctl does nothing.
>   *
> @@ -61,6 +52,14 @@ static unsigned long rds_ib_sysctl_max_unsig_wr_max =
=3D 64;
>   */
>  unsigned int rds_ib_sysctl_flow_control =3D 0;
> =20
> +#ifdef CONFIG_SYSCTL
> +static unsigned long rds_ib_sysctl_max_wr_min =3D 1;
> +/* hardware will fail CQ creation long before this */
> +static unsigned long rds_ib_sysctl_max_wr_max =3D (u32)~0;
> +
> +static unsigned long rds_ib_sysctl_max_unsig_wr_min =3D 1;
> +static unsigned long rds_ib_sysctl_max_unsig_wr_max =3D 64;
> +
>  static struct ctl_table rds_ib_sysctl_table[] =3D {
>  	{
>  		.procname       =3D "max_send_wr",
> @@ -105,6 +104,8 @@ static struct ctl_table rds_ib_sysctl_table[] =3D {
>  	},
>  };
> =20
> +static struct ctl_table_header *rds_ib_sysctl_hdr;
> +
>  void rds_ib_sysctl_exit(void)
>  {
>  	if (rds_ib_sysctl_hdr)
> @@ -118,3 +119,15 @@ int rds_ib_sysctl_init(void)
>  		return -ENOMEM;
>  	return 0;
>  }
> +
> +#else
> +
> +void rds_ib_sysctl_exit(void)
> +{
> +}
> +
> +int rds_ib_sysctl_init(void)
> +{
> +	return 0;
> +}
> +#endif
> diff --git a/net/rds/sysctl.c b/net/rds/sysctl.c
> index 025f518a4349..a0673a41633a 100644
> --- a/net/rds/sysctl.c
> +++ b/net/rds/sysctl.c
> @@ -36,11 +36,6 @@
> =20
>  #include "rds.h"
> =20
> -static struct ctl_table_header *rds_sysctl_reg_table;
> -
> -static unsigned long rds_sysctl_reconnect_min =3D 1;
> -static unsigned long rds_sysctl_reconnect_max =3D ~0UL;
> -
>  unsigned long rds_sysctl_reconnect_min_jiffies;
>  unsigned long rds_sysctl_reconnect_max_jiffies =3D HZ;
> =20
> @@ -49,6 +44,10 @@ unsigned int  rds_sysctl_max_unacked_bytes =3D (16 << =
20);
> =20
>  unsigned int rds_sysctl_ping_enable =3D 1;
> =20
> +#ifdef CONFIG_SYSCTL
> +static unsigned long rds_sysctl_reconnect_min =3D 1;
> +static unsigned long rds_sysctl_reconnect_max =3D ~0UL;
> +
>  static struct ctl_table rds_sysctl_rds_table[] =3D {
>  	{
>  		.procname       =3D "reconnect_min_delay_ms",
> @@ -91,6 +90,8 @@ static struct ctl_table rds_sysctl_rds_table[] =3D {
>  	},
>  };
> =20
> +static struct ctl_table_header *rds_sysctl_reg_table;
> +
>  void rds_sysctl_exit(void)
>  {
>  	unregister_net_sysctl_table(rds_sysctl_reg_table);
> @@ -107,3 +108,15 @@ int rds_sysctl_init(void)
>  		return -ENOMEM;
>  	return 0;
>  }
> +
> +#else
> +
> +void rds_sysctl_exit(void)
> +{
> +}
> +
> +int rds_sysctl_init(void)
> +{
> +	return 0;
> +}
> +#endif
>=20

--pcvh7stf5trtufk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmrXLwMACgkQupfNUreW
QU9Yjwv/cCHjunDrXXsuyNvatzPDExXb5X0UzfkQLy2qA3coR/DKb4c6DSrxHAXb
KpHrt6e9QT0I2SPoxXj4PltCuUz848uz0awIUBqnTzndf0VHj3hXQlnOzH0fZ65b
Wn0qAyxnEitEIbt1uSa7Xq24CfbATRcSjtPthG34yTnbF733Fz4lvwVkXbJi4TPl
uoyvrPEcXxnogCVN0W9XNu8u5UHk0CuHOFVj13NvhFcoykqRQbMQcpefAKpJzm2Y
0yUyZK+zZ2CyFchpYt4khOGyW5RLiwV0d1kER0UKqD9lnH4cznErsgqU0tb34Rn1
Xig5W0V/rLLEemKlyC6sdnq1ZeigxxSHlwcRUVMt1UOsECTmaTfaTaO79R2BVLSU
y8a8NvfPWzuASlTcNMV+AT03DA/syjvh2OihVN7ec7ExnUAdfEmpibahUar/MDZA
bBMHemB+kEmt61+nBWc6VAsa6/WJEzxKtDaaR4rMdSuyi20EQBPQsryOF1YPAYRT
Lm5E7bEc
=mg3e
-----END PGP SIGNATURE-----

--pcvh7stf5trtufk4--
