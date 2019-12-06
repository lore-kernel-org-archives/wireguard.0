Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0208C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 17:44:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 975D321823
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 17:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uNmTKuEM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 975D321823
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98988e45;
	Fri, 6 Dec 2019 17:44:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be8aa66a
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 17:44:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2871c682
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 17:44:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7dcc515
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=gKVJsv+VZzBInTRWq
 Tt8iie4pPI=; b=uNmTKuEMn6Qw0kDhgD1fGZXBMnLE5sXuglmncMm4Jrv7Ru32m
 bcQn2v664199OvQ1Xo3ChLCEyhwrvhj1NO2kdRBDj7TIyIR1yFG88Yl2vmoUo4zw
 FMOJob3A40x7btO60AtA9G71O/m9DAS3q3SACN27RcbUEi2mS6Oi8ehR6ZHdKap2
 vSIlYvgsUNeSJQ80nGuvfZEhOaxzoqhlmk/MrrX3E/FyKTk9Yj+xuq7757XG+t2w
 woOtr2CW5EO8+edbYoCClCPePKMbNxmWTtJi6UUoLxWoKjkBw0qxNq/zN+UKvW/1
 5t89Y+Mvlbqc5SLveS3CX9rhd20BmrjVXO+ZQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6d58bb92
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:49:27 +0000 (UTC)
Date: Fri, 06 Dec 2019 18:44:28 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20191206` Available
MIME-Version: 1.0
Message-Id: <fa4b2fdad3c0cdfa@frisell.zx2c4.com>
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

A new snapshot, `0.0.20191206`, has been tagged in the git repository.

Please note that this snapshot is a snapshot rather than a final
release that is considered secure and bug-free. WireGuard is generally
thought to be fairly stable, and most likely will not crash your
computer (though it may).  However, as this is a snapshot, it comes
with no guarantees; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * netlink: prepare for removal of genl_family_attrbuf in 5.5
  * chacha20poly1305: port to sgmitter for 5.5
  * chacha20poly1305: double check the sgmiter logic with test
  * crypto: use new assembler macros for 5.5
  
  We now are written for 5.5, and have backported those changes to prior
  kernels. As Linus hasn't cut rc1 yet, things might still change, but as of
  present, WireGuard runs and compiles on the soon-to-be 5.5 tree.
  
  * wg-quick: linux: some iptables don't like empty lines
  * wg-quick: linux: suppress more warnings on weird kernels
  * wg-quick: linux: ignore save warnings for iptables-nft
  
  More fixes for the new iptables call.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191206.tar.xz
  SHA2-256: 75e4e8f2971257339ef45af1be67f0a21435235f25277e3e0e4d6f867714ece5
  BLAKE2b-256: 7ecf56e1404ce1177066aad87b4ba0109a2ae6d12ab0825b2f0076a975f62e07

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191206.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl3qk3AQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrkLKEAC6dkvDmlW6pDxObMqQexdaFf+srWoXU/6o
lh1QiIdJRvFIuxuwzvrxK+BinP17E09lmZYyChv0VzdRlkZMSRhtztnAP9VDb4/h
LaLehBoupKT9GMEYyxOknbzo6vNpVfzaSBEX7O94wePLan7yredAKCUhIkVyoS5w
5+gU5fSdPfTUffmHj/hkTfWA5Gv1gB+In+b7w0FXQNmNFSFwBNNYWRvZ4iVQj5zi
MkSWB212XnlHVBO4PVx27m4oZVthRbQPKBI/1HY0BCJ701WALY2UMGCBdOTDTjxl
+aAKPh2KOQ4Sme/vuCH9fEZmaJmH1hcF/39TrVa9Nho+2jbt1vmvuIH9xR7a7nfx
8V2IZZs4FA/Y3sQ/UxAhF9NNhuBwstafrsg/LnQwCJzDcM9xkR0mSvb6h1w+ByOG
Fm44PkcCyZEY7GmEbOaFQU7nFD7QNDzu45vsbcsIkC4T3V1R6wbQCxrX/Peli9Mq
uk8NHnnedDlCgWW9PSxAEgh7GMm+XyvZ8VOt/pR8o1hGTqPZHB79Qu5dNSAwxgte
emqxZkR7sqVUFAYAwObQWMOeiAskvbRg0o9fRBrr7CsrtFeobOdbDf1vbUS2UF2Q
UmxT14zmd9i06m2iDaVRpy/Ps05lN9n9KqPZTmUrOCQfHTs6Bco1CNmSdNkDNlYY
WUOKxrvRpQ==
=NLtf
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
