Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A00EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 May 2022 04:51:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ceccc26e;
	Tue, 31 May 2022 04:51:34 +0000 (UTC)
Received: from anamika.lostca.se (anamika.lostca.se [2a01:4f9:3b:505c::2])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 208fdbbd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 May 2022 04:51:31 +0000 (UTC)
Received: from chateau.d.if (unknown
 [IPv6:2401:4900:1c46:b720:d319:c493:5254:8bce])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: abbe)
 by anamika.lostca.se (Postfix) with ESMTPSA id 6388312658;
 Tue, 31 May 2022 04:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lostca.se; s=anamika; 
 t=1653972691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nLLVQfkRqokqKczifWf0GfuCq2AXA+3hR2+IV6b2FII=;
 b=lu6mXFn/7xYIIO2cKfD+f0BnMETU5c+ecUzIl+6eG2fxdPzAvANE5arXrQ63YsTXe+i43h
 QpQ7JCUUJTYinAgy9cPO8/OQdTowWVfS6D7DVlCVXfcPC4fJJdxZxikbL4coHQeq2UyaFX
 RHIKdgzo8v2gHGhatyxd6iGNcAqwRfk=
Date: Tue, 31 May 2022 04:51:23 +0000
From: Ashish <ashish.is@lostca.se>
To: lejeczek <peljasz@yahoo.co.uk>
Cc: wireguard@lists.zx2c4.com
Subject: Re: something affects wg iface - how to troubleshoot ?
Message-ID: <20220531045123.ite3fv33ozmtcr73@chateau.d.if>
References: <84e28e50-caec-072e-f916-870b63110432.ref@yahoo.co.uk>
 <84e28e50-caec-072e-f916-870b63110432@yahoo.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ycbp6p3n5fxu5qug"
Content-Disposition: inline
In-Reply-To: <84e28e50-caec-072e-f916-870b63110432@yahoo.co.uk>
User-Agent: NeoMutt/20220429
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


--ycbp6p3n5fxu5qug
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2022 at 11:36:37AM +0100, lejeczek wrote:
> Hi guys.
>=20
> I have quite a peculiar case which possibly might interest anybody - as
> oppose to just resolving an issue.
> I use a very popular monitoring tool 'monit' to monit my wg0 iface and th=
at
> works okey, meaning 'monit' does not see any issue with wg0, but _only_ if
> 'qbittorrent' is _not_ running!
> When 'qbittorrent' is running 'monit' is reporting:
>=20
> 'wg0' 5 upload errors detected
> 'wg0' trying to restart
> 'wg0' stop: '/usr/bin/systemctl stop wg-quick@wg0.service'
> 'wg0' start: '/usr/bin/systemctl start wg-quick@wg0.service'
> 'wg0' download errors check succeeded
>=20
> in my case monit's action is to restart wg0 iface.
> 'qbittorrent' is not, should not be, particularly interested in wg0 iface.
>=20
> What do you think is happening there? I'm on Centos 9. Is some kind of
> leakage or something more sinister happening there?
> Lastly, how to investigate this, how to tell what is happening to wg ifac=
e?

If I've to make a rough guess without looking at your exact monit configura=
tion, I would say qbittorrent is choking the network interface, causing the=
 wireguard packets to be delayed:

You can verify this by:

 - stopping all the upload/download activity in qbittorrent

 - if previous step works as expected for you, then you can implement some =
speed throttling in qbittorrent

You can also verifying by tcpdump-ing the underlying interface (e.g. eth0, =
and not wg0) for the wireguard traffic and see if it's going out, and comin=
g back in as expected.

HTH
--=20
Ashish | GPG: F682 CDCC 39DC 0FEA E116  20B6 C746 CFA9 E74F A4B0

"If I destroy you, what business is it of yours ?" (Dark Forest, Liu Cixin)

--ycbp6p3n5fxu5qug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEE9oLNzDncD+rhFiC2x0bPqedPpLAFAmKVnstfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
ODJDRENDMzlEQzBGRUFFMTE2MjBCNkM3NDZDRkE5RTc0RkE0QjAACgkQx0bPqedP
pLAKCBAAnXcL3GFGXXZDl+C9wKa6+GUd8oN2vXp6MYzutdI4OKHAGtNhykY1TfKv
mRRfMgbSeSOrTKcibKJZ6DMJ5I6CT4jCoIIMWqAv/tckl1ZeP5YpRHeyWuni/GL/
+u9s34hzz89abTjxiDM2xxuwczfeJR0uPm2e9NgbhtnX3K0VtyzVolte4RcIJCHL
y7rPHBfURw2k6Tqe+AXo+bGljvpwxoYp6oM86yJhIG+vxPXDSK7EQQqKOCoL60kV
wbl0r7zUBB7Y9k5uj9iKjFdXINzDoGCw4IrU8jU9qbXzilSwPn2sb7AvY1rCjW/T
+jhlL7KHD+X57TkfslPcPFJnh66Wv1DiCcwV2G010ncYuBIeTkgNYB151Sv7H+mL
FTjeeXEEICmDWs+UPdFBmHY47DZbl1WnU1jyLM7zmrfAsmOkxjzqtJBwPi5G4c2T
a5BPyAVAZJH6+OeFw1wo6DJEGAuNRuh7gxt4eGqLdMXAjV4i9HRLfiE59VN1qtZz
zDuzreXAPBEGCHVktXcxUjyd1NshBplt6NWtY1GkJfYJ1jmC1MdgVPO4ibkt0pAd
+F+2SGlXYEpRLv6/jedRPa9lSRQrq2u13Qmt0e2zyhq7igttvC3alelqZAxglhq7
QP86UxfQvUcMXA5baTdj0yrnT0P0vQzen/gzWVFgyAxeL9Ql8/g=
=Uere
-----END PGP SIGNATURE-----

--ycbp6p3n5fxu5qug--
