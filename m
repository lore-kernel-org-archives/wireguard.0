Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EDCC04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 17:42:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225C920892
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 17:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="PGxVMnq5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 225C920892
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ed805e6;
	Thu, 6 Dec 2018 17:34:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25b4493f
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 17:34:10 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01df8743
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 17:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5iXJdIhfJCp2sQTuucNSiIuouqQdB11p6rWmPIPeuAU=; b=PGxVMnq522pe6+lZ6nnukbQ3Uj
 hfyG5OpLahk3NSuxbkLYCSYIgDU3dET4B8bQiVYjbcvVPMDMm7XrYKXnehxlzTyCTofkmqMDrtlO0
 sGd8OgF3fxucl6sv8kgNj1JBj5vP+QF5IN1gJ6WHFOL/zDGJDZ0Y8UeGVR+q3vwpxWw5Gk+b0G1EJ
 EGOSAC/NtjUbDRf68QyVZc7xhKgTmP5Pb34n/JGZKMjzJk74DoQzr+KB4aFcqYa/1Ghn9ARHaxQra
 mImZQHlsZ9kcv7QbDr+z9s5HIONzJ0jkm7spE21krH1R6DveUJ26zQT0Zcuev9ot558dQJUyc05YW
 QNnkDlRP9Q8R9vuzW0CAohXqcuCro7SnB/nXM/00W4iXPGrf/dnGKY3Ig2p60pzZtBabbtDDWeF27
 P7Ffe5tdleZ2H6NdRVPRSWvR18n7LorBAC94cKDsMbUDPvsGBuqGdvh5lXcZHyrl9Ytuz6qUYYVU3
 rDic+UUB8epx0+FfOh06AYneYJli1YV6ugobMgwsYdahORUpEoZMa89fYRriNTyFuHmBUbw9RWdKV
 PgPLA8R46awAAzKE05VV2QTpnTPx1YLw0oe49zBxHQaFlBUMBABe0p25Vuvcz43ndCaNqv6KB+BJ8
 p4CtlSBeXI+DbfRjO/FryjIDDClUYbW+Q1oEpRo94=;
Received: from desk.s.smurf.noris.de ([10.107.0.5])
 by mail.vm.smurf.noris.de with smtp (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1gUxeO-0005Tl-Dh
 for wireguard@lists.zx2c4.com; Thu, 06 Dec 2018 18:41:24 +0100
Received: (nullmailer pid 7016 invoked by uid 501);
 Thu, 06 Dec 2018 17:41:05 -0000
Date: Thu, 6 Dec 2018 18:41:05 +0100
From: Matthias Urlichs <matthias@urlichs.de>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Option to fwmark incoming packets?
Message-ID: <20181206174105.GA6666@desk.s.smurf.noris.de>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
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
Content-Type: multipart/mixed; boundary="===============7914314394603680461=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============7914314394603680461==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I seem to require firewalling some peers' incoming traffic with special rul=
es.

While it's certainly possible to add a bunch of iptables/nftables rules to
classify traffic from the WG interface (just mirror the peers' AllowedIP
entries =E2=80=A6) this is redundant (thus possibly inconsistent) and bad f=
or
performance.

How about a per-peer "fwmark" setting that marks that peer's incoming packe=
ts?

--=20
-- Matthias Urlichs

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEr9eXgvO67AILKKGfcs+OXiW0wpMFAlwJXy4ACgkQcs+OXiW0
wpP0fRAAwFSOxmtIe/a3eVLyBMgdJD+DD/92Du9Y4+lZFryd1GqytdHfC4agctnN
k0jbTdWl3suxO7dpo64bfm/Yaen/JXP0mPIr/9+XuJLFH7w/3TAGH21IjrAhlUnO
0ivoCFk4HH6HdnwsMI88eUTZZWg7Pvveibv5I+ohu6aZm1g61lZdFX1AB4wWsXkL
5KrwkH6nzM8SAd61yU15SKrMdB/qJHxp96v+klr+hQnjYblKn0nv/ekq3gAos9XM
Ye1OxNBEfR1V6s5U16O+R6iJekvGXSnIgqwK8jSc4WcDxBgcx6gXCb4kehNaSq4x
u1X9zb1ICpdYVg6VgHgZVdk+Mzej3xsIaItkafOPh08XyK6jwTbucqpcjx6W5bXK
BpRlvribx8bFL0e0sIP3cUZRBk4LsLbW780ADEMKFOumb+aD/fFv5b6jRliRTYwk
tR1/AqVwlpM8ABlB5z5nhuwTxosxYVCvRnsg9RK81hq4JbpejAGKTF90iC2hSnKs
wyESNBuli70tQAQ7bNJZKKaUu0HPcvE2XuJzuCPRFADQUiRoehvbHQVba6CMutuR
pgOKm9QjI+WM0j0L7DyCHHTm4Gw+ibrcCzp9yyPGa9WgtYz8kL2/kOHlvmOKGHo6
w+sINLeTugBAo1+AgckDS6iUEtNWWA6nuLL2uP7HszuUPbeobqU=
=mNvu
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

--===============7914314394603680461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7914314394603680461==--
