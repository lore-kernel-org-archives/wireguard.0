Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F34C47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 06:24:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFD120708
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 06:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cowboyprogrammer.org header.i=@cowboyprogrammer.org header.b="H1m1asIr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CFD120708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=cowboyprogrammer.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f8b6b28;
	Mon, 11 May 2020 06:11:03 +0000 (UTC)
Received: from mail.cowboyprogrammer.org (cowboyprogrammer.org
 [2a01:7e01::f03c:91ff:fe55:618b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ee8b32bb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 May 2020 10:30:33 +0000 (UTC)
Received: from rodimus.cowboyprogrammer.org (83-233-107-18.cust.bredband2.com
 [83.233.107.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.cowboyprogrammer.org (Postfix) with ESMTPSA id C523220BA
 for <wireguard@lists.zx2c4.com>; Thu,  7 May 2020 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cowboyprogrammer.org;
 s=mail; t=1588848199;
 bh=mpL8+mKkfEEFA9oxL7vmSJyow+WNCgFCkfKhjqyYXVw=;
 h=References:From:To:Subject:In-reply-to:Date:From;
 b=H1m1asIr+YOKocJ2vkUkj9sfXztEFdjLRS8SCO4LAMni3q9BoZsc2efP5BKZEUkDN
 JTfFXBcEASFwrnMnjpSTDnQI1J2n4ioeo1fanPWGJV3H7o2ODJk+BUT0xrHRSZVIGh
 twTMK7UXo9Ua9hDHmXqprvRpaFnnXxi4GKSDvIhk=
References: <cf665c35-adf9-6f74-b360-1c3cfd723963@hanswkraus.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Jonas Kalderstam <jonas@cowboyprogrammer.org>
To: wireguard@lists.zx2c4.com
Subject: Re: Newbie - WireGuard per systemd on Debian Buster
In-reply-to: <cf665c35-adf9-6f74-b360-1c3cfd723963@hanswkraus.com>
Date: Thu, 07 May 2020 12:43:18 +0200
Message-ID: <87o8r0xby1.fsf@rodimus.kalderstam.se>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Mailman-Approved-At: Mon, 11 May 2020 08:11:02 +0200
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

--=-=-=
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


I've been running wireguard with systemd in Debian for some time=20
now.

On 2020-04-16 =E6=9C=A8 18:23, Hans Kraus <hans@hanswkraus.com> wrote:
> /etc/systemd/network/wg0.netdev
> ---------------------------------------------
> [NetDev]
> Name=3Dwg0
> Kind=3Dwireguard
> Description=3DWireguard kraush
>
> [WireGuard]
> PrivateKey=3D<private key server>
> ListenPort=3D#####
>
> [WireGuardPeer]
> PublicKey=3D<public key client>
> AllowedIPs=3D<free range>.0/24
> ---------------------------------------------

The only thing I can think of here is that your AllowedIPs ends=20
with a
zero - on the server you have to specify the exact IP=20
address. It's on
the client side where you let the AllowedIPs be a wildcard.

Examples:

server-side:
=2D--
[WireGuardPeer]
# Client1 address
AllowedIPs=3D192.168.2.5

[WireGuardPeer]
# Client2 address
AllowedIPs=3D192.168.2.6
=2D--


client-side:
=2D--
[WireGuardPeer]
# Entire wireguard range
AllowedIPs=3D192.168.2.0/24
=2D--

> /etc/systemd/network/wg0.network
> ---------------------------------------------
> [Match]
> Name=3Dwg0
>
> [Network]
> Address=3D<free range>.1/24
> ---------------------------------------------

You might want to consider adding

 IPForward=3Dyes

for the server's .network file, and

 FwMark=3D1234

to client's .netdev file, to be sure you can do proper road=20
warrioring
down the line.

I'm also a bit paranoid and have added the following to my client
.network files:

client.network:
=2D--
[Route]
Address=3D192.168.2.0/24
=2D--


Hopefully the peer address fix solves your issues.

=2D-
Jonas Kalderstam
PGP key: 987C54AB0D4451ED

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"; name="signature.asc"; description="Digital signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEMnDcQ1p9YE9bBjUhmHxUqw1EUe0FAl6z5kYACgkQmHxUqw1E
Ue3LfA/+P0aDsBOCDFLLg8ezun22BRA7Sca+gajoSHjdyuA+ekfwMsU1PGCDO+pK
8flIYchZgSTZYsSi123KxWxSsiaA2AmRJpPVNm58irlfjOaPXCbyXUUMJc05b0rO
jCvBEFHZ3IdNRtGRw+2K1/+hnFWprs3VQRHkEAO32B28FP3HTKe7vLd0TN2nE1bX
HQGhRQiN2rV9kpSppfzsX2Cvvf4o/kw86P+iIBkE0sfuaese3blKWGxzMfaMzCKc
uDzSwFMHfYqXyu2s5ynbZ1B/ofKPT1cX9UT0uQrPRLz1W23RdZwHwFxMtVQwCYkb
AW7JsykNRj/0sOnUL96ohO51tvwJGVW4djOp7Lb2oj8RO+Ut47we6EuZr5bnL0JA
J/q+R0zX0jkq+rVYdZSmtZcgMO2QELGpLBOM41xDeNBxJ+PJx5g7P6IthNCEIJ/0
5OjUZ78hxwq1cp+QIwPPxVsDethcjcOUDES82DR68YvfOglSFkTrXg+SGOItbm5k
y10TkU6jFiPkR9YOeU4fcdJEGyXoKZnAK2bKvVZux97s51bgDxH3y/xuQHvGGBsr
tWJ9l3EQS70ycFldCP+BwNsbLeGqckTyqZbIs0P/9XBT8eJvpAFNhP9w91a/BuVG
5BK7zl9mLfBcJphLivDhcsTeHehkdpPJPuXP2/UKe1xqmZRF6IY=
=5Ys6
-----END PGP SIGNATURE-----
--=-=-=--
