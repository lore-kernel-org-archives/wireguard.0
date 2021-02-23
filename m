Return-Path: <SRS0=mBYR=HZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDEFC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Feb 2021 18:38:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF1364E6B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Feb 2021 18:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBF1364E6B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae664978;
	Tue, 23 Feb 2021 18:34:50 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a6af17f5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Feb 2021 18:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614105282;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=IWjfxx1lOymp/5AVm2LGuulSoXbbUTatrksrlxmBrnM=;
 b=EEjAHBPfxDiYZtXUZ5JUw6YjnT6/EV0qZQmW4tdtmEZKFNSpyQxKOwiuNULsFVzqv0Jtxj
 TjafSwrrs29n3vFSlluoewddFBoDJvTOL7S1RWjxiF+Z27pE449cCrGrBmpfelQj/JPz+A
 5XYEKrLSoA8/B/zkwkXW2SQsVoC2FcA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4c03e646
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Feb 2021 18:34:42 +0000 (UTC)
Date: Tue, 23 Feb 2021 19:34:40 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20210223 released 
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
Message-ID: <5b8364607bfcf588@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20210223, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * wg-quick: android: do not free iterated pointer
  * wg-quick: openbsd: no use for userspace support
  * embeddable-wg-library: sync latest from netlink.h
  * wincompat: recent mingw has inet_ntop/inet_pton
  * wincompat: add resource and manifest and enable lto
  * wincompat: do not elevate by default
  * completion: add help and syncconf completions
  * sticky-sockets: do not use SO_REUSEADDR
  * man: LOG_LEVEL variables changed name
  * ipc: do not use fscanf with trailing \n
  * ipc: read trailing responses after set operation

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20210223.tar.xz
  SHA2-256: 1f72da217044622d79e0bab57779e136a3df795e3761a3fc1dc0941a9055877c

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20210223.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmA1SrkQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrhPKD/0WYx0cqotY+xmQWyoti03cYo0QPB5uhcSk
Y+DFJb2uSBAgrSGwFPojozsR7JqT8vTxtVloxM/HGBU1f0e8bC87rSdqu8XJUuJV
s9SCvFfTjKL72l6C4a7o53HGQbtge4qsY3O0qFuX/LTCanryHk3mX48nsKFnZyBC
AMOR3lQPwxolshp7brrdfPYQk32ZOMnhPJcozvHMw7opxgeUhkA7KQVPsndSB6fr
NZK5f+OW3C2Z/d8HFzEtrLrdGlhIelcDxFCye5X3sUagZYnBSnCbQU0g93t9YC9+
/FKKYJSoJ28qZiRJU1oTYRo/wcBBWazAOqMni7MT/cCV8sILba7zRem2/AySpTV1
nNWCcoGsLbeM5kpaYMHpdtL3MKUUOI9FlLX/kfULg3d1xfpLv+A0mzs0YieM0+/5
HcnGD9lBhTEE70kic5OduMlyScLDhvclM9bOdN3/npW4xYy47R3896bSU0SMLk6C
S/ccax8XTFYKaq9aeKbi1k77RTPF1ZEBvLa+PQktHfWbl0MSc6XmETBoI0MJr1tL
b77MPz5sl1WJC653Kx+hD+8qIimiebZvY0GAAUo9GolaHqS3dapPAcUD2LyN+EUF
c8yMig3lqV7Lmr/b+ZSIceJuepYPt3BjfiNhnoZl85WbYmxXH2xsILvmqsECwdVn
bIyIEdAG7g==
=9bPf
-----END PGP SIGNATURE-----
