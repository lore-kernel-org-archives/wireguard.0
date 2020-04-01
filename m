Return-Path: <SRS0=FpfO=5R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE44EC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 19:11:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1664A206F6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 19:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="n2cZPf2o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1664A206F6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9927b36e;
	Wed, 1 Apr 2020 19:03:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2f779bd3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 19:03:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e2d19fc
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 19:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=485HTUmIirP89tc2S
 6Rk+0lNqKE=; b=n2cZPf2oVaS502J2l3UQ6epBSIjohMnNOjQa2iuEQwE2c2Yf6
 +0UbOzlvTtdkuc7I5z97pshKruq1zWTv/RIiNCGp4+5QWCrIFJ7iqTiOoTi7+QsD
 fXg8xT6AQ77bPtPysHQrDrnD+oiHa0cdea/kzC4S46GjLoZGnUCzAp3sgZyv5AvW
 o1Oa9R879XnewTlkXMAFQEG8GEAC6Vqtibhq4eRUwEiTMHhaoXK1UsSkJDrU33rm
 PyGaQ6+aLJ7MKLgg2UoKUyYh49sxZ7MhGElIOMeROLL0hqXQvjMlnP9qQL0ii1tU
 tFLdvzekeAkMZZLJEvY3Mc1fJE8QgMT730mkQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id afcf96e8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 19:03:05 +0000 (UTC)
Date: Wed, 01 Apr 2020 13:11:15 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200401 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <38846280368266f8@frisell.zx2c4.com>
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

A new version, v1.0.20200401, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: queueing: skb_reset_redirect change has been backported to 5.[45]
  * qemu: bump default kernel to 5.5.14
  
  An upstream stable backport broke our compat layer, which this release
  rectifies.

This release contains commits from: Jason A. Donenfeld and Christian Hesse.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200401.tar.xz
  SHA2-256: 7dfb4a8315e1d6ae406ff32d01c496175df558dd65968a19e5222d02c7cfb77a

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200401.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl6E50wQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrkKyD/9I2vPCtJxtW3zdsbFo6hHMvHuJfUPsj361
NyOk2VfsKSWIPAkBWP5pUZIxOMqCpB/oyyybfNMBo4863r6shStvMMqGifZMZBBK
kfYZGiE8A+nv9P9QWyzeiB6RPFHfeSWuzldhSFdoV6XLTwi0eWvMuvFRsCy/9P27
O0xgKyFjk3K7y74USDR/6xJK/6tzwpa2UYLaSxvIrO03D+qxgK4KQiNR53Oz+Gic
byPF14X57ibGx7NxVquAAPK1IA89zfNgM9TW6MTNvxctnmzm7AJ6JFIcfBlqyUGA
lQNRxST5j8HOMQAOFNlrhxTfIQP5R/KphfX35s/xBZdLPXm3//1V5is+SVNXcScD
attsaiJq7BP6R23hA/R3uJYd9nmEqUPBiKZLiSWcgsmN+pUrwuT62mrG79MVwO2z
pgo8Fo76rIOL5XwJnmqjtKpUnFRoS1NR72fz3qp9ep0Zg7eIW14p9iYEsHKXyr7z
DhLJSEuKZixfmJatpZEPwUMZSDwACSHjG8kpdMSDIMu/xkL42U2/8o79S1OQyRMD
nMklhBiPdKxF2jOSX9jtHamOiOijRw2tJeF/LOcXqwsQYBKnaxswKJ1tqyrMrpQG
nB90ccerpwN6Rup7DIrv3FXLniv9exilJquugimpZkiBIaLXCDhjHzsochdHFLi2
4ugVM6Aw+g==
=0Zlp
-----END PGP SIGNATURE-----
