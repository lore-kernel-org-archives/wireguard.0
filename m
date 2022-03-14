Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D956C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Mar 2022 22:17:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 51985f1b;
	Mon, 14 Mar 2022 22:17:21 +0000 (UTC)
Received: from anamika.lostca.se (anamika.lostca.se [65.21.75.227])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 17001d2e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Mar 2022 22:17:19 +0000 (UTC)
Received: from chateau.d.if (unknown [182.69.176.88])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: abbe)
 by anamika.lostca.se (Postfix) with ESMTPSA id 24D252AFDA;
 Mon, 14 Mar 2022 22:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lostca.se; s=anamika; 
 t=1647296238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VegWEuoCE99PCIaKtfQl1SfnkAGwY7PbmCe0bz0sqIo=;
 b=pXlpqJFrW+4sMBoZeZ7eGbY86hKc4Bc9HVnSHxjVEii0Yh9daR9cUlcxBxHiDCAoNrDmEG
 VTUJQyr84tNVkvY7+g9TtXbfBYZGrYB5O+A37Ww4cd2sdwDii5G2TfMfsD2YEclKx9SWi9
 DnfvyF6oVQsgF+eYkvHF60YoVBYutZs=
Date: Mon, 14 Mar 2022 22:17:16 +0000
From: Ashish SHUKLA <ashish.is@lostca.se>
To: Hendrik Friedel <hendrik@friedels.name>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard and double NAT
Message-ID: <20220314221716.h6sfkapawd64ijv6@chateau.d.if>
References: <embc5c04ac-b215-462e-b047-6bf76ae1d6ce@envy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zhe7wemzthiclreh"
Content-Disposition: inline
In-Reply-To: <embc5c04ac-b215-462e-b047-6bf76ae1d6ce@envy>
User-Agent: NeoMutt/20211029
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


--zhe7wemzthiclreh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2022 at 12:03:05PM +0000, Hendrik Friedel wrote:
> Hello,
>=20
> I have a running Server serving several Clients with a wireguard tunnel
> already. For this, port 51820 UDP is porwarded in my router to the Server.
>=20
> Now, I have one Client with a bit of a tricky setup: I have two Routers
> doing NAT. For one of those, I have no control, i.e. I cannot setup
> portforwarding.
>=20
> Is it still possible, to use Wireguard to create a tunnel between my serv=
er
> and this tricky client? If so, is there anything special, that I need to
> consider?

IIUC, it's quite possible as long as none of the routers are filtering pack=
ets
with following constraints:

 - client has to initiate the connection

To increase the reliability of the connectivity:
 - preferably not use a fixed listen port in the client, esp. if it's roami=
ng,
   or you failover between gateways
 - setup PersistentKeepalive

I have a similar setup with my internet connection (behind double NAT), and
it works fine.

HTH
--=20
Ashish | GPG: F682 CDCC 39DC 0FEA E116  20B6 C746 CFA9 E74F A4B0

"Should I kill myself, or have a cup of coffee?" (Albert Camus)

--zhe7wemzthiclreh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEE9oLNzDncD+rhFiC2x0bPqedPpLAFAmIvvuxfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
ODJDRENDMzlEQzBGRUFFMTE2MjBCNkM3NDZDRkE5RTc0RkE0QjAACgkQx0bPqedP
pLCC9w/+ORzpVSF5UMlFU0zpUmYAR5WCP8/esKQzEpEqeNuqB/vDMANqUGEI2XF2
T6h1KtnPKfggPVsSfp/rpOJj6DdrJ0luE2YP1G8lveVDgAA6jkX7/DXXUvmGTxIh
ymiDYcJ/liIX05UWAlRnen8VUpb3mqTf7CjtEknIKsHiL3pIskXAYI4NTV+qDN/j
NjEUma4lQgywA1aun++87pG4Wm+lMlc8KgRvcsTVSK3OZR98t/Z4F/yc1pfvcLDQ
VmbDdjUp1+rLNKk/5mm2BXvVjGKwTs3P7Px7m1Fzjpnxt0iAE00gNjr+Ju/E1dsQ
hk9rgw4dQtnkCKOawjMwn6LBqRXHEELZJJCud97wS4O9aNsHekhbIruduIdi45tF
FnkzG/8jOgb7ZB6ONccMNgZmJGpd/4ecqZkaAsPEkmesPWFEKt21vmw2ufNF0pPH
K6xcLGw95MDAidDxX9veKOfow1zySJH7Zvk3mZyVRlh1sfdpZvJAf9vbLIaG8vXM
/0W66/y2CFo7CcGnOEtxHoTEidAYvl+Ly7N+shyByVavv5MUS1OvkU/JFnwpE1ia
bRtVf15vwbT2Kb39BryaNaUmA8KnzbEmlthrinowrianArpjEdDhq4OORaGL7HYt
9rRbNOJQf4PyKaHlwIqmK5OkbSrsw5GjzKkWALGBisfcPn6swT4=
=RT6Z
-----END PGP SIGNATURE-----

--zhe7wemzthiclreh--
