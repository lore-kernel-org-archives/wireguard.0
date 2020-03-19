Return-Path: <SRS0=ccJ7=5E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C45C4332D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 22:49:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC07206D7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 22:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Y6vhea2F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC07206D7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1327f44c;
	Thu, 19 Mar 2020 22:42:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4ff75485
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2020 22:42:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9922a9e
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2020 22:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=Gl1IISiyS9qDnmbjw
 9eMSeyjGxg=; b=Y6vhea2FsytVCznKDudQ7re7yEGYUQabFOWp1eqsFKATuPaC7
 dOypE+hy7IqvrqbDjZvc06wQ8FzDSmI1XDDZNJnUONyj5eK5PmQdoGwurFln/Ak1
 FD7kxOOr4c0lqVWUQYpeqOFTUqPVmRoyN/Xb+4UIBLGWns9yf49TnjQzPOTbl4i3
 Qr84TYiob+BMlM8XhOxFi5cT0jtp/DbpVqaYk01GgJ3MFXIMwrgWxUDQv25e56Dx
 FUK/tYvOgNFG/ijahG+BEF9PPeb1xVkKX/jOuXTmJjxcCmd2am6XXnt6HHgzMU/i
 VUkjjYZY4bh1LXHuu47gUlrEyR6yohZ4YiJCg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 761ad64e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2020 22:42:26 +0000 (UTC)
Date: Thu, 19 Mar 2020 16:48:57 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20200319 released 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <3883012e23755f3c@frisell.zx2c4.com>
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

A new version, v1.0.20200319, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * netlink: initialize mostly unused field
  * curve25519: squelch warnings on clang
  
  Code quality improvements.
  
  * man: fix grammar in wg(8) and wg-quick(8)
  * man: backlink wg-quick(8) in wg(8)
  * man: add a warning to the SaveConfig description
  
  Man page improvements. We hope to rewrite our man pages in mdocml at some
  point soon.
  
  * wincompat: use string_list instead of inflatable_buffer
  * wincompat: use new protected prefix on Windows
  
  These get wg(8) running again properly on Windows.

This release contains commits from: Jason A. Donenfeld, Luis Ressel, and Kai 
Haberzettl.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200319.tar.xz
  SHA2-256: 757ed31d4d48d5fd7853bfd9bfa6a3a1b53c24a94fe617439948784a2c0ed987

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200319.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl5z9tEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drk83D/9j7/mBwVTqbEcfMwpsR9S26pveNVuN/kml
wH5WZ4G2Z/RJQQ5GiV6cc0ne2e1SrT0UfJsPc35GS42TihHvcKC41gZICapCNOIl
uC9Xo8y3iseNwvxkcMw5TdWcpEZIOaEUOGY5+bDlwsPp9s0dN9+nY76cAY/5uOrZ
05x0ILCyC3yDOaW3dtxhBq3ahP6jowS2dNLECRNIyvsHxUeFosxSdkQPh5PmlK6L
/+GdlA3dWwm8fzpMiZsOGVrjoDtRZB4M9FOB10uj1Uvmxz9v2EXWx54cRbKCjBff
u2PgUguOTuCvVwSWukzD2pk4a0iKv+O1sTFc1s2/oURPeWBBjZoApd7xHNzpTiHB
UGckmxU/pSbEdH3tZFf3AG5tg9iMPNC+XYJZpBWrorGxkYbgzcBg9x1T3l/GYprC
OyayVe3qPNZVLLPAnK8cAvsJ82jPhwJnAFLO5DTKWMtFcueyTHmyl22Qsz46aiOA
VDXE9YYNx2HIK/2ELuXRoHbnEftmqXif4zwOzikhbxR2pygIQIa2pkSzbmeaXJOR
3Fw9HhdJ70tq2/ZKlHVo5FnzO/ZmgznYNAgOGYJM2J62x054NxMVF0YCGt4YkUgR
OWyF1jsYoKtWsHyWlVFVUxo4rAuNYmbFnvhtwoGVLhyT0ganjXzr8b5590GJXlU9
hDxgs4tnyQ==
=BBmE
-----END PGP SIGNATURE-----
