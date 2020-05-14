Return-Path: <SRS0=uW9L=64=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_RANDY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985C8C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 May 2020 00:33:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B35D2065C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 May 2020 00:33:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="D59H8yPu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B35D2065C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 810dc3df;
	Thu, 14 May 2020 00:19:14 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a04ca59b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 May 2020 00:19:12 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 668525df
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 May 2020 00:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=FvvkOoo9Ygqg+8C9I
 hHWQNRM6HI=; b=D59H8yPuBeWQXJdnUMMzEZb6bOOeJjGKyUEFwHMnQu9RhkfQs
 gJdJRdqRPdoGu/fIoB/r+Yde5W8uNLkH7P/mY3jh4aQeg9yLhpe8juEiklHW5qbM
 UPQouanCzY9TgDKI0gvtl7yxOJieG0zcr8vHKLQM5qAUEjjucVDBbRlUda/VaTlU
 BVYTldFJ/d0KWEIduLxZlifQ7kFq0ABC/v7aC18ERIm1uY2hgIUiX2CSoPkRCRX5
 GzbNm/DDsBgHbJ/WpLZZxaLlbw3RalWbHhpwT84QeKmZaH+d0lAWbPGEopLBznFm
 LQ7HdoAa2zv9pFGsBhZiypgpcnx0hkhrBGRGg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 904a7ff8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 May 2020 00:19:12 +0000 (UTC)
Date: Wed, 13 May 2020 18:32:49 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20200513 released 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <5f28d9db5c432c33@mail.zx2c4.com>
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

A new version, v1.0.20200513, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * Makefile: remember to install all systemd units
  
  We forgot to install the newly added wg-quick.target file.
  
  * ipc: openbsd: switch to array ioctl interface
  
  There was some unexpected churn in the ioctl interface that's now been worked
  out. This updates the openbsd implementation ahead of the ports tree opening.
  We also have, at the same time, an update for wgctrl-go, which means there are
  now two userspace language implementations of the interface.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200513.tar.xz
  SHA2-256: e73409a9fb8c90506db241d1e1a4e7372a60dbfa400e37f4ab2fd70a92ba495f

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200513.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl68kaUQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Dru8rD/4lxbhvaiQqWs9S8rC3MDuAeIeDZiAYc/tF
sYZJQcqwOiCRHWfOdx9tQyNFsnoqbMdWxg01yghmW2xtAI8xruUp5W/HyQZkrJqa
lFFAJAjg43Q0IiopmmSTPpPBHWebK/xWPMnCvYkbLjlfVLD+MogRC8RCLXSHgqn7
Ug+6XpEbkYkd+azu8xsHZ0cyGofHl+XJq5ytmK52Peqt/xN5PFqqvnL6OZAbWdfd
3tM6oUoGf69j2zDc5Xy8Htgm5cofCEIKJtZnd1y/4kfQeoFj6vQXM1WxXwu8A/0Y
deFdJQad6VgnaPDQlcis97To2F5qOhIzRjAJecDbsjDbJZy4WAm0I6n+eXiD6nV/
R7KxDYbuVjghBljgOgAff+tAyMWA3qQvjeEGf525ZL7hFEnZjawDyGbDvk7qaqth
Jyt255tO/kezsLykplsZ9kxKkp7AKtB3v37sAeWNwbstP7S05ny8Zj8HqU2UkgJo
LfCRXflVxnpxpFL3U9Z2+UHxvhFU6NFvSGx7zxXXyUGkB/7Pukh+PXxdIVyBwpdO
xmo+xMCD3nGJ5ATwUkWAmcu90YP8eCpCx96P/nXoQpiM5aVJ3+k8uA0buBaXkERk
WqZ4qLgm5qxn8rtiL7PJDYpxIyAO5xBkHtEeO4RjsLW53df7Qas36zpWvkY4UVus
crbjBW+f7g==
=4Uwl
-----END PGP SIGNATURE-----
