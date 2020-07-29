Return-Path: <SRS0=HOwu=BI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5166C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 08:19:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8332076E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 08:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xo1OFbjD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A8332076E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5523f794;
	Wed, 29 Jul 2020 07:56:06 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 453a5011
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 07:56:01 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87ed1b8f
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=1H2q8iiOlsxEM3gZe
 3GOpUAkaxE=; b=xo1OFbjDObfQ5/eGAmHPHkekRBxFHUfrCPwi2i3PhjNVBrVZ6
 AK00pdXB80OKla/xmyJb3L7T3zYXhqtobVcgknY6RpdlzhW2ahPsAOd3o3iTKz8s
 QfPq4QX4pypxq2M7CY0yEGZkE4U4IOEYyKiXzYCT9oc3YrrRcAxR5kpEfxxeN4lz
 leL1ZLZo7mCJkbdFNQMEySauVQPLRF3L0h6o4whv6rpJB8KnCzWFQPykqoSQqHmE
 VA+JtHL8q9A3mYu1YpCfsZ+JrOsZgH5X+htGbjtLcuRAN7Hk/sFHUxzetFXgetmO
 4ZpqMp6BWC7zZHv5QfBLwHkZtl74fG0jzOSJw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2e568fa9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 07:56:01 +0000 (UTC)
Date: Wed, 29 Jul 2020 10:19:31 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200729 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <914341600569c84c@mail.zx2c4.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20200729, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: rhel 8.3 beta removed nf_nat_core.h
  * compat: ipv6_dst_lookup_flow was ported to rhel 7.9 beta
  
  This compat tag adds support for RHEL 8.3 beta and RHEL 7.9 beta, in addition
  to RHEL 8.2 and RHEL 7.8. It also marks the first time that
  <https://www.wireguard.com/build-status/> is all green for all RHEL kernels.
  After quite a bit of trickery, we've finally got the RHEL kernels building
  automatically.
  
  * compat: allow override of depmod basedir
  
  When building in an environment with a different modules install path, it's
  not possible to override the depmod basedir flag by setting the DEPMODBASEDIR
  environment variable.
  
  * compat: add missing headers for ip_tunnel_parse_protocol
  
  This fixes compilation with some unusual configurations.

This release contains commits from: Jason A. Donenfeld and Ricardo Mendoza.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200729.tar.xz
  SHA2-256: 690c7d9e115e2ff27386811cb495c9784678f717c8d6fc4cc7469dce373f252e

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200729.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl8hMPsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drs22EADY8PNxh653h2kUrDaiSFyHWfQ+9fg4p/Kt
14hj7uxFBCsEzwZst9aG85+2gJjVoHE/O4Zytq4p2tVP8xl220jwaTgbBicwuqly
oh4z5aMdVbcFZHueE7u5D1N4dQvGvNdAorYwzSf01670zql/onGIwYBQr+Qe3E3d
RWbRl50cBA8MbUSo6m+LPwtDvU+aMc8b+UK1P0yy/SeFifr8ULmIEAcFR+VLytSz
WRoESTOHnu3o6mboR/V5uhQzIay9AlYkuJsLBczGw+O4AMwKBsRW5u30VjAeE5TT
DtDdjJnUh/GN7CXvpftyCZhcsK1vRLPsEDz0MGb+XB3gA/eKws5nUbj5aQszh9bK
m3vB8kFEUlJpnrrUAnJNifJmeslEfTlLHjzkn5Lz1BwG3H3piSFvc5wyYmM9H+1k
bIvKOrnuU1d70MggJxhJ7DNpdSounGEu3uk5ONHzKsfIe+OASwsAn5gdGeM9OdzK
MxwBjXik0LO3pQUkV1mc6KiVvv6Dp0oIldlSwSkXWjQAkN39l7KhHrYJE7XkC6d0
9tqUHfBSi8z5nGAdTbiS3Do+WlgB/73Vzh9qia/Vzl90eXptq57BizqsbTGFzjpr
LUGC/2wFtry/lRlzHgDXeN0ToA+Zha4u/DPSGvh5U8VtkupzkQbfpmGb4D+YXoDk
Ey7maHbo5Q==
=AoZB
-----END PGP SIGNATURE-----
