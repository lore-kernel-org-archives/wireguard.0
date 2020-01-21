Return-Path: <SRS0=xGSK=3K=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26051C2D0CE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jan 2020 14:53:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6638022314
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jan 2020 14:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="L95ND9k7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6638022314
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cabf618;
	Tue, 21 Jan 2020 14:53:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47f5cbba
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 14:53:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f99746e
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 14:53:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea481f68
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=vtqRxUZLvHIitEAyC
 pQ6Cct3P4g=; b=L95ND9k7bE1TFN4dMGjfAK5vp2k7YBOav4XRzPfrV37lxn7FH
 NyfLzjKpVfjt6hgmFN1hEZSI9hPn5vIQrx/zrdU5Pu0OiOecpFEcmsKM99pU0gI/
 96XXkfOz9WJyaPBz6sCRg/WNhqDTr1Gi0Gf7I8CAb83tVW/MHHBrg8CXyr3BgJGp
 pQ2e1PGtNujtmKfrOtTv4SsSilSOEvAOOodwPTaiS2Unhwcbx6lFkLo11Y27I3q2
 FIbJjep+oLJo4Y6fkVfL6zRsjROKZml7eno3INjCREZuX/fOJz47p87rdhnDAhqY
 xub1dnbnU1wAqzZsyWbUUByhetbAlS6BQOGDQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f1ff2c3f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 13:52:36 +0000 (UTC)
Date: Tue, 21 Jan 2020 15:53:32 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20200121 released 
MIME-Version: 1.0
Message-Id: <fa09a54905aacb71@frisell.zx2c4.com>
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

A new version, v1.0.20200121, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * Makefile: remove pwd from compile output
  * Makefile: add standard 'all' target
  * Makefile: evaluate git version lazily
  
  Quality of life improvements for packagers.
  
  * ipc: simplify inflatable buffer and add fuzzer
  * fuzz: add generic command argument fuzzer
  * fuzz: add set and setconf fuzzers
  
  More fuzzers and a slicker string list implementation. These fuzzers now find
  themselves configuring wireguard interfaces from scratch after several million
  mutations, which is fun to watch.
  
  * netlink: make sure to clear return value when trying again
  
  Prior, if a dump was interrupted by a concurrent set operation, we'd try
  again, but forget to reset an error flag, so we'd keep trying again forever.
  Now we do the right thing and succeed when we succeed.
  
  * Makefile: sort inputs to linker so that build is reproducible
  
  Earlier versions of make(1) passed GLOB_NOSORT to glob(3), resulting in the
  linker receiving its inputs in a filesystem-dependent order. This screwed up
  reproducible builds.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200121.tar.xz
  SHA2-256: 15bfdbdbecbd3870ced9a7e68286c871bfcb2071d165f113808081f2e428faa3

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200121.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl4nEFgQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drtg7D/wJ0GFv2BiQVnDJwpGozfUQr8bKitCkFK/s
i++qMfo+ldw3GOk/X6sEOrho0eGvfTxMPfFTeQvyGapYTDq5nVs8neafJ0byY+4M
rWQaUs2QCUHay23O502hLFY/4SsP7nLxaE6Bx8+BaayTIZDMMix+0wPlhSvEase+
zjBmixg75KmcRPp20+dhsdja3Q3msPC6zycHNCyxRzsWLrjXtfi6O39nagmj0eac
0HBe7ZEfdUqXGijGLlda2JJFngujiInVXT6pl7xMpA8xY/mv5IsRTpRQj8xuwPFQ
uNJr9cLEt/JY9gwucXLskqHBb2dXH60ApJAkEsmVm7YyBYPhVpDk9L11fH6EU7pQ
H+0T6TBndOHf0UWFaPjKnYlABr1jJW4Y7hwn2nFj13XCyWsU+9kEUXDFtGPCf9+2
sPboK/qn+NTDzKYJcWtnOyOfTlcWwnu7D1OYNlJ+gC9vnYELAEwW9nA/rBgrUybQ
a8Lj97Nc6bZNYgauHRU2c9ajUUXwNErnU+5PRZ/cneY/A2s6MqeF8Q0iCx8EHTZC
DxfA0WkuF09l6E2QCnz0dj0kyZldSPXyezKRcupKRemSCtyx6tKP7LghMJXhjeKA
Onkaq1tq2pXEFxExMPzyqooMlZJwPa9Ub2KWQShtV6pCwTbKqUKmotQHgvn8hELU
b9OPMq96Dg==
=4Kn5
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
