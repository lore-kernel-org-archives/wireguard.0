Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A84C3B1BF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 23:03:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D522086A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 23:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SG0meYVP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D522086A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d40e308b;
	Fri, 14 Feb 2020 23:01:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7afa16c6
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 23:01:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0abff60
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 23:01:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77e905c7
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 23:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=6u1M34piMYAXhIcVR
 tY103zfMx0=; b=SG0meYVPqDWo6BYapxpy/DhGtptNzGDSLD21CxedbuxFtJ5+o
 Hx54rmcBWfRvGPAXLm9bWQ0ElXxB3hQCGRdZkioeBgs2g2GwwKpw+JUsfYotxJwk
 XoNE5OX8DtRYp5an5cWFDe8UU+DbYUnpJInBLkqa/rq3z+rMPbC0anps+fyJv4FU
 xamWu6eKazjfOpMWhCdMuh3zjk5XINmzzUx0jhCqf5gOeeHlcPRPW+Q7wmFOX2RA
 BZ4FK0eEZSiInkBOaeO34/kvRSUzpcuVlfsurcASsLgzdmfNnXhK+qrpAneGjKoj
 Ze2R4gDmHWDKf0rXPsPbevUDZd3877Ia/j3fg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e22dbcc0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 23:01:44 +0000 (UTC)
Date: Sat, 15 Feb 2020 00:03:52 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v0.0.20200215 released
MIME-Version: 1.0
Message-Id: <ff1bd2b5643180e7@frisell.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v0.0.20200215, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

Please note that until Linux 5.6 is released, this snapshot is a
snapshot rather than a secure final release.

== Changes ==

  * send: cleanup skb padding calculation
  * socket: remove useless synchronize_net
  
  Sorry for the back-to-back releases. This fixes a regression spotted by Eric
  Dumazet.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200215.tar.xz
  SHA2-256: 0def6f3608ec06f6dfc454aa5281a7c38b06ff27096cb341448d20602da4e923

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200215.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl5HJy8QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrkecEADDiaWXMlsxqEowxnVsZpB3Nl+7gPct4ZMA
KaV6Nj64EFmLLTIpVpLUkttHhWVPlr2Av8lcNO1HE4GeMfQJSgQKhd6ft6a3HYTT
Uq4B8c9+B5Fe++9ROC+NUsJHb1wb1VldKo9x38wAS5U8MKLYP2LTiWwAXbVnDNvk
h+uHpkrGdlXJ9D9d1asjpFQekuemzZ7qdf1W8W5S+6f5rfcH3eAIn0cVghb/iKvW
w9J0lEV8Yny0hq2k24rv6+dzAEHQCALINriZGS0MdNnkwpbcpxvxkQO87jBIVBZz
CNTYWW63JYj/LQagSKBXYMb0jstYMRbdHx37nrmhPFLB27ZwsxtZXDG+ci7MWyqb
hNPHOJQ2HG5OIcjaK+iuXzom+HN/OvwjboTGD3dD0NFuVrjm5zDOaYwjaLW62ijd
/ujys5DxeE0++KBMQ6TMcn+Zakdu5SGmyKcyYrlofTNydY/EsKxdoVdrJrjTUUFg
HN2tjIL6essPLgDyHwJURl2d8y1Jg+unYJb/xKb6CJEVsALpJnbHgJ/CmBjENbGE
GzPWupkuW5ybo4nnMWGzbz3u9sj/sXyTpE2YWRh1UMqMB5BQHqMkXvA0/GUz/EHz
sHdMdSS7+lQgrMQsktxI8E3a9PdxrUCPgZTG+1IyTmR1p4FaClQXvKtQ+eMqHBlT
BGPhnREXpQ==
=RTSb
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
