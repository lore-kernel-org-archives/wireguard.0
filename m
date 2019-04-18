Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC08C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD6B2087F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="yISB6oBB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD6B2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6215b127;
	Mon, 6 May 2019 20:39:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 036fef97
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Apr 2019 09:47:30 +0000 (UTC)
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cde01f37
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Apr 2019 09:47:30 +0000 (UTC)
Date: Thu, 18 Apr 2019 09:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1555580849;
 bh=gAUxJBEZGjPJAQex08m8sea9lvNMAwK+2vxuGb/PkwM=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=yISB6oBBkktw/cKTBu99asel1ER2vo5YRHdD4hDNGGBUIvbXk4ZMK+lvBWzo/LDRr
 Duq6d2mOXpB4H2eIlaHGtOiN+OW+rpH9pGXzjn+2uFbm3/KwMx3L4S65nBYOKMA5hc
 skasJwTixZnOQ29WK5vhOJ7TgroN6ch+pyP334vg=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: steamport <steamport@protonmail.com>
Subject: WireGuard Android kernel module+gnirehtet?
Message-ID: <EwYrrc-xpesfT0VwXUQnoXU-HHmFugo8Pj3MZu7o6nDNgazeJIegFKwyCNXABg4fBvsuTbTwAnEy52gaBLbzckHhOwUaFEFXOQggOQwGYPM=@protonmail.com>
Feedback-ID: jANpjqAK6RrAef0NMEKwvyO0wY_aJb7rf807BzQ2x9V22Rs05Ex-I_cRaP062agZ73T6bwWsNUUMRTHrLkrUYw==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 22:39:06 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: steamport <steamport@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5717210260609191473=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5717210260609191473==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="---------------------18b32289ba871d821bee430e8e5450b7"; charset=UTF-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------18b32289ba871d821bee430e8e5450b7
Content-Type: multipart/mixed;boundary=---------------------9568cf77b773fb9921a263faf5fac4a7

-----------------------9568cf77b773fb9921a263faf5fac4a7
Content-Type: multipart/alternative;boundary=---------------------a968e90239cd9e2cdf8c998b9eb9e7f2

-----------------------a968e90239cd9e2cdf8c998b9eb9e7f2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hey, it appears the WireGuard kernel module doesn't work on top of an Andr=
oid VPN, even if it's a reverse tethering thing like=C2=A0gnirehtet.

Also sorry if this isn't the proper place to report/say this.

Sent with ProtonMail Secure Email.
-----------------------a968e90239cd9e2cdf8c998b9eb9e7f2
Content-Type: multipart/related;boundary=---------------------d776b9eec0d7f5f86accb9a4530d2e91

-----------------------d776b9eec0d7f5f86accb9a4530d2e91
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj5IZXksIGl0IGFwcGVhcnMgdGhlIFdpcmVHdWFyZCBrZXJuZWwgbW9kdWxlIGRvZXNuJ3Qg
d29yayBvbiB0b3Agb2YgYW4gQW5kcm9pZCBWUE4sIGV2ZW4gaWYgaXQncyBhIHJldmVyc2UgdGV0
aGVyaW5nIHRoaW5nIGxpa2UmbmJzcDtnbmlyZWh0ZXQuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+QWxzbyBzb3JyeSBpZiB0aGlzIGlzbid0IHRoZSBwcm9wZXIgcGxhY2UgdG8gcmVwb3J0
L3NheSB0aGlzLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2ln
bmF0dXJlX2Jsb2NrIj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay11c2Vy
IHByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLWVtcHR5Ij48YnI+PC9kaXY+PGRpdiBjbGFzcz0i
cHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stcHJvdG9uIj5TZW50IHdpdGggPGEgaHJlZj0iaHR0
cHM6Ly9wcm90b25tYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPlByb3Rvbk1haWw8L2E+IFNlY3Vy
ZSBFbWFpbC48YnI+PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+
-----------------------d776b9eec0d7f5f86accb9a4530d2e91--

-----------------------a968e90239cd9e2cdf8c998b9eb9e7f2--

-----------------------9568cf77b773fb9921a263faf5fac4a7
Content-Type: application/pgp-keys; filename="publickey - steamport@protonmail.com - 0x170EF114.asc"; name="publickey - steamport@protonmail.com - 0x170EF114.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - steamport@protonmail.com - 0x170EF114.asc"; name="publickey - steamport@protonmail.com - 0x170EF114.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQpWZXJzaW9uOiBPcGVuUEdQLmpz
IHY0LjQuMTANCkNvbW1lbnQ6IGh0dHBzOi8vb3BlbnBncGpzLm9yZw0KDQp4ak1FVzFDVWJCWUpL
d1lCQkFIYVJ3OEJBUWRBVisyazNmck9iRE5XUXRQK25tcklrZkVvMFJZZGZjNnYNCmVvWEdDaXZL
clJETk5TSnpkR1ZoYlhCdmNuUkFjSEp2ZEc5dWJXRnBiQzVqYjIwaUlEeHpkR1ZoYlhCdg0KY25S
QWNISnZkRzl1YldGcGJDNWpiMjArd25jRUVCWUtBQjhGQWx3ZHVJUUdDd2tIQ0FNQ0JCVUlDZ0lE
DQpGZ0lCQWhrQkFoc0RBaDRCQUFvSkVQUDF3U0hxR3EzS1Ywc0JBT3V3dC9mYlFpZXdBVzhWUTZS
dEIxcWgNClBtN0VsYmpZVGZ5UnFNR0ZWU1JvQVA5clc5bjh1UmttSEt0UlZJNlJKQ1JFN0txWC9t
VUg4QkJpT2l6Qg0KN3pDNEFjNDRCRnRRbEd3U0Npc0dBUVFCbDFVQkJRRUJCMENrNG1ERk9zdE1x
eEtZbG9naTdiSHNMRjB3DQovRDhYYzR2Mlg3ZE5IZHA5Y3dNQkNBZkNZUVFZRmdnQUNRVUNYQjI0
aEFJYkRBQUtDUkR6OWNFaDZocXQNCnlqWWhBUDRuR1p2Q1JSUjh0dk1Ga2V4WWxETXU2WS92RTVz
Y01vaGVZcW9qVDIwZ3dBRDhEd2NDN3N6Yw0KanhLRCtrVURBQVRJQmFac251NHJjeG5qOG8wSU5Q
R2VYUUk9DQo9NHRlVg0KLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ0K
-----------------------9568cf77b773fb9921a263faf5fac4a7--

-----------------------18b32289ba871d821bee430e8e5450b7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail
Comment: https://protonmail.com

wl4EARYKAAYFAly4R6oACgkQ8/XBIeoarcrzmAEA7p86/z+RgmJ2OSV4ZvYB
S8TVoZ1F3gFhq/jh3KIxszAA/iURDEV8fz06A1RVNV7UFCYZhlCqLPIksTId
AyjzOYcC
=fWnn
-----END PGP SIGNATURE-----


-----------------------18b32289ba871d821bee430e8e5450b7--


--===============5717210260609191473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5717210260609191473==--

