Return-Path: <SRS0=YtMA=6O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=3.0 tests=CTE_8BIT_MISMATCH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_RANDY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8291C83001
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Apr 2020 04:41:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468FD21D7E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Apr 2020 04:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="qvXcNyQz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 468FD21D7E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d70626b;
	Thu, 30 Apr 2020 04:29:25 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c1da5381
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Apr 2020 04:29:23 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cc8b0a1
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Apr 2020 04:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=Ly5gxMdZv1ZtSkdTP
 +ycaRve3r0=; b=qvXcNyQzkK+4FG5zawCToZJVXbZW3Xe+FxnjIwhRfdKxxQy6k
 Hica6Gb2DtC6MQwdfjF/adaIaaupvjjkEWj47srCnYbj2Y1uEGpEFai1uQQ0YPzT
 3ODKVbpV1R1vQBflUKd4dYAhhaExGw0mQOpeEB6DKQLTYg+gLjzFWbAMDjRGo4aj
 FFT8F8ttsGw9do7Q/tHKS3Ej1+7isPmdZspS6es7fDjNKUsH5gFLj8FXt+jR6EBV
 X4z/nJXIh2zS72gb9DaO3190n70YUbnNLJtN9uPeW6nf11Enq3nlooyCE7qBKKcX
 cpNbTy6uLJ8jTu1OS80BzuvmJRYlhc84GnG5g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f9e45010
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Apr 2020 04:29:23 +0000 (UTC)
Date: Wed, 29 Apr 2020 22:41:13 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200429 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <b9ca878e1f0ade3b@mail.zx2c4.com>
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

A new version, v1.0.20200429, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * receive: use tunnel helpers for decapsulating ECN markings
  
  ECN markings are now decapsulated using RFC6040 instead of the old RFC3168.
  
  * compat: ip6_dst_lookup_flow was backported to 3.16.83
  * compat: ip6_dst_lookup_flow was backported to 4.19.119
  
  Greg and Ben backported the ip6_dst_lookup_flow patches to stable kernels,
  causing breaking in our compat module, which these changes fix.

This release contains commits from: Jason A. Donenfeld and Toke 
Høiland-Jørgensen.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200429.tar.xz
  SHA2-256: c0050a94c33c195d4129a75ab4dca05ba021c5265e40fce8b2dfda7d7055cda2

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200429.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl6qVt4QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drg0fD/4qdNPOkG/Yve98FyM8fXAaX3BcgvuwY2md
DL/roczbyOHKMa1CLEJ+u/xNto9Vq7vFVY7hW5bFyOlaD30mmdERGH8Xi2sF3bQb
bYrNNaq66aTEUtWrBCFn5D9WZAQ3WFxVpTPKZlvjKZrwAfwJYkjvP0ubQpsgI3K2
3uY0xY94mEexqbRO9H4FMtZH0Hk4oL3s4tzHZFMtYqjuzr9CLtleJQuksdyHb0Ip
aqrBwkYpn5B0rU1vIwwlRyzwxzdMlKM2vpdodYeJoGnMZNzp78Y3L8TCfSWYgut0
jPfqOHgJaqZbgTzkGTGXwEuFHwDuivRA+tn6B/zf7IpSN8YdTgffKS/o+7Tfuxqo
bTeDIBAbe2voskyDwCTEv7aVK14X9/OPq8oAuQogpqVTSEl7UW2dXhr6aPtAo5C1
aFRun4yh91yU0KVBvrgrKnr7g/606VvTjHbFoKqYwZmrPtdhzw38nMGzeVaSeNXG
oovWNq5tZLhhjzhp6Z5pn0hxhOrx8GZBXhH+R5yh7qJJBCgPrRqKQu5glRqN/OB6
iREAzK0jxc3FrNgLz0//ONGr/Eg5JaULyY+GToP0bWuJcgTN7adMXY/FcEquoJsA
+0IV03hkXqCZRNfCiiRAuoCn/hy6yHEWDLh6Lwoh5cbnvjnbGxON+LEXgTVl+vQQ
eMO7VIQj9Q==
=QwjT
-----END PGP SIGNATURE-----
