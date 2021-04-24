Return-Path: <SRS0=FJfC=JV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D3CC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 24 Apr 2021 20:54:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B7C613DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 24 Apr 2021 20:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84B7C613DB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6b72e69;
	Sat, 24 Apr 2021 20:54:53 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 409e0ac7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Apr 2021 20:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619297689;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=/atJFaCV/K8GJVarkaPcAn8nnsq+WErj/sdjJbiIH9o=;
 b=F9LsRU4bZeb2KUaMl0xcSQHrbL4Tu8sgVP4UaPNmA9KwxtRmg8hSi1h90Ilx0Qtp9VWi78
 ZN3Ue3O8yvUP6CFPU4bHVY42njzd5l5knfWPTwFzX1Tyq3R4YJkzXpjljk8WFn2Z0HeK9N
 Z7/Zq/FEooKHU1TSqtnxMsrtSQs9Jik=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b79ae8cf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Apr 2021 20:54:48 +0000 (UTC)
Date: Sat, 24 Apr 2021 16:54:48 -0400
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20210424 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Message-ID: <8ee7255741cca07d@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20210424, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: icmp_ndo_send functions were backported extensively
  
  Backports for Greg's kernels.
  
  * compat: update and improve detection of CentOS Stream 8
  
  We now support RHEL 8.3 and >= 8.4, since Stream targets 8.5, rather than 8.4
  beta.
  
  * Revert "compat: skb_mark_not_on_list will be backported to Ubuntu 18.04"
  
  Canonical broke CI for two months, which is now fixed.

This release contains commits from: Jason A. Donenfeld, Thadeu Lima de Souza 
Cascardo, and Peter Georg.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20210424.tar.xz
  SHA2-256: 8839139a53733bd20602e39cfc679a8176747dae8fe9f9c7fce28f8fba71abde

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20210424.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmCEhY4QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrouMD/9wqagrs6jcFR99c5teyVBbUlqMxFC+4gMc
EGzBQ80zsPGvYjOXUUM839PIXP+CnBox3empyITPj3kCdI4LcWxsEPDtpYoE+Igu
K8pyzjf2g6leK9vy1AfTbW/azsM2rRhKO7Z0MJ2+3OyVKJsj3DzOMbOAN5EJjF+r
SEkuMereJBQnuM8UvmxdWbc7ZKeUl9ux+hr0G/Cdqg5igfSGOiDpzmJTL59ojEJp
FPi78B0CTyUJSvUfNt7JTLuqf2BOroOXa5Ps1gp4KeTvPvRi4lXlLG3VghA09hY2
1v/rNlOwjdPlDIrwyZkjuss69HRfkeoq3D8nZjZqV4K9hQ0rCPhiqk2wDIhO/U/q
+Vv9y6vQCRzrSEUx5qq6Vmze+/r4iB3kgP41FjYxRSserumrSimIfWOTeSWsIpp8
vBjFK/4TFsXLNdrXd3ZM2TRH96ExTPvTYuPgb0gRdiYDYlkDZE+O8cBa46B1zfel
GhnzQ7SRIXN4o2Pex3DljWjuoIbrmrui4+FzXY1/C61/+eAA8rUaF6bPhrp57woE
JOV9on+q9f5Z1fQ7Y80fYdU0aZrdrcs3LInA1dtgaTBRx+Dk4vl8OVuavLsLA8Ce
XHFiwkTFA0/z6mh28JSIEwBpr0AFyhgF/PF8IbaXRFIgKDZsfebS5BClOMZokc7a
/5KA6uh/qA==
=nBlG
-----END PGP SIGNATURE-----
