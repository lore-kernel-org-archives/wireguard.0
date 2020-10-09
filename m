Return-Path: <SRS0=77B4=DV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DBCC433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Oct 2020 10:47:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2A1E20878
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Oct 2020 10:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2A1E20878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=max.pm
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55f2f189;
	Wed, 14 Oct 2020 10:46:54 +0000 (UTC)
Received: from hergenrother.uberspace.de (hergenrother.uberspace.de
 [185.26.156.204])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e5b4d037
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 13:53:22 +0000 (UTC)
Received: (qmail 10249 invoked from network); 9 Oct 2020 14:26:14 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by hergenrother.uberspace.de with SMTP; 9 Oct 2020 14:26:14 -0000
Date: Fri, 9 Oct 2020 16:26:12 +0200
From: "Max R. P. Grossmann" <m@max.pm>
To: Rudi C <rudiwillalwaysloveyou@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
Message-ID: <20201009142612.nyremqtnp2yjp257@desktop42>
X-PGP-PK: mDMEXiQ2gxYJKwYBBAHaRw8BAQdAe486pBdti/gJHMqGnKAgX+5K2CiYJGZ6ONHAG8Q31ni0Hk1heCBSLiBQLiBHcm9zc21hbm4gPG1AbWF4LnBtPoiQBBMWCAA4FiEEoJqS/FAV7oYacJhRGZmGHBY2upsFAl4kNoMCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQGZmGHBY2upuk5AD9FArDm6+U2sD5O0PrXUxFQdsPKo7u/yeUAfdVafBIP6EBAMRUTzGsv72kVW/ZCZzzePW+rYFIXT23HHYB5NY+D5UOuDgEXiQ2gxIKKwYBBAGXVQEFAQEHQMRFCdiwQ/SkphEslSmg2TNp8vDM9QkYYrLB0LJ2zEpZAwEIB4h4BBgWCAAgFiEEoJqS/FAV7oYacJhRGZmGHBY2upsFAl4kNoMCGwwACgkQGZmGHBY2upuBtwEA9Sx9td+orI+VHu9QfrV0qw8unIS1MWQi+94PeKYGYH0BAO9Kr/xs0GTjB/1zaeQwC5zo7NvMJjeMlAFlSuGdJgkB
References: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fkfut3tque6m2ndg"
Content-Disposition: inline
In-Reply-To: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
User-Agent: NeoMutt/20200925
X-Mailman-Approved-At: Wed, 14 Oct 2020 12:46:50 +0200
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


--fkfut3tque6m2ndg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
MIME-Version: 1.0

Another idea would be to install WireGuard in a (tiny) virtual machine or a=
 VPS and then ssh into that machine using

	ssh -TD9151 user@example.com

This creates a SOCKS5 proxy on port 9151.

Then, for example, you could create two Firefox profiles; one without a pro=
xy (for the uncensored websites) and another that utilizes the SOCKS5 proxy=
 on port 9151. The SOCKS5 proxy exposed by ssh will route all traffic over =
your virtual machine (example.com above), which will in turn route it throu=
gh WireGuard.

Since ssh can now be natively used under Windows, I'd be surprised if its -=
D option were not available. AFAIR, Putty can also do something similar.

Best,

Max

On 20/10/04 03:41pm, Rudi C wrote:
> I use Wireguard to circumvent Iran's censorship. A major problem with
> it is that it's very hard to selectively proxy specific domains/apps
> through Wireguard, while leaving others alone. This is an essential
> feature for Iran's internet, as:
> 1. The connection is terrible, so avoiding using the proxy for
> uncensored sites helps a lot.
> 2. International traffic is 2x more expensive, so avoiding the proxy
> for internal traffic is very beneficial.
> 3. Some internal sites ban international IPs and need Iranian IPs.
>=20
> The easiest way to solve this program, as far as I understand, is to
> add the ability to expose the tunnel as a socks5 proxy on the client
> side. This is the approach that shadowsocks, v2ray, etc have adopted.
> There are mature solutions to selectively routing traffic through a
> socks proxy.
>=20
> I searched around, and there are docker containers that already do
> this wireguard-to-socks thing; But running docker is expensive on a
> non-Linux machine, so it'd be much appreciated if you could support
> exposing socks and HTTP proxy servers natively.

--fkfut3tque6m2ndg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSgmpL8UBXuhhpwmFEZmYYcFja6mwUCX4BzBAAKCRAZmYYcFja6
m9O5AP908v4nOMGcBVGTGMy6A/xwJHrU1XC7auTsS08OOVFHTwD+L5yHT9fRLJsi
A/Jd7SG2jaF3X7QLooXKsN+VWr/ZDwI=
=otc4
-----END PGP SIGNATURE-----

--fkfut3tque6m2ndg--
