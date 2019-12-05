Return-Path: <SRS0=YtjY=Z3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3B6C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 10:55:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD0624648
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 10:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="tzKr0xXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD0624648
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc399534;
	Thu, 5 Dec 2019 10:55:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5f21c6d
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 10:55:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd31bb13
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 10:55:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5807f8d1
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 10:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=Pe/y79vDZPUTuEmaI
 D0ma0NBk0s=; b=tzKr0xXK1op1ao4ObpjYWkCe32d9o8PFTGVMQ6qnaAQaFQF8H
 en1nOUVKIqzKFQkDipE2emjcRKCZuQ61BqsmYqHf8sJknp17PiReAA4q1h+Go9lx
 33jzQZ21y7HSWhj0QCmZtmZMkNIBcNtmAduOBgpaio4nTzIcAcbl9D5lzUgkVc28
 fiUNc0HpyZW2+AIVUJ4YRGFBESux+yYxfCCpMeqFT4+wyVsrh6QKXR2JA6zCGitH
 1MJBCTR3E+LXdh0wSbhJGngv2aZdtOJv7xjsX6OevxhYh6Wvvy1VF3gSEn+uh9NR
 R/ElXYfkNVFPXy9yg2HOUm0IyU1K2uTLV2fNw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 38c76078
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 10:00:47 +0000 (UTC)
Date: Thu, 05 Dec 2019 11:55:38 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20191205` Available
MIME-Version: 1.0
Message-Id: <fa4b08be3b6fee08@frisell.zx2c4.com>
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

A new snapshot, `0.0.20191205`, has been tagged in the git repository.

Please note that this snapshot is a snapshot rather than a final
release that is considered secure and bug-free. WireGuard is generally
thought to be fairly stable, and most likely will not crash your
computer (though it may).  However, as this is a snapshot, it comes
with no guarantees; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * wg-quick: linux: suppress error when finding unused table
  
  This fixes a spurious warning messages seen with recent versions of iproute2
  and kernels.
  
  * wg-quick: linux: ensure postdown hooks execute
  * wg-quick: linux: have remove_iptables return true
  * wg-quick: linux: iptables-* -w is not widely supported
  
  Adding in iptables had some hiccups. For the record, I'm very unhappy about
  having to put any firewalling code into wg-quick(8). We'll of course need to
  support nftables too at some point if this continues. I'm investigating with
  upstream the possibility of adding a sysctl to patch the issue that iptables
  is handling now, so hopefully at somepoint down the line we'll be able to shed
  this dependency once again.
  
  * send: use kfree_skb_list
  * device: prepare skb_list_walk_safe for upstreaming
  * send: avoid touching skb->{next,prev} directly
  
  Suggestions from LKML.
  
  * ipc: make sure userspace communication frees wgdevice
  
  Free things properly on error paths.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191205.tar.xz
  SHA2-256: 
  BLAKE2b-256: 

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191205.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl3o4hYQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrrDBEADQmcpc3SnrfeULKtV3IBeFti9t2H5GejG2
t8/9ekTEAEVRvKIklrltoFZ5gof02BPPuLC0zB0N9UbtRxWdedgYDRjlXPvrkMZd
lvdul+AEOsrj8yySNCNnBWDrUZ8njxWLAMQW4zJI0681yXbjm7ZV6gazeQ89bPei
cYpfgoAlHyVSyT+XeGWtiVoUbGZtK1ocj04bcEAfsF3DFRLKSADR9VzXOId5zNXQ
LMN3vJ0ZGXQey6hDOdbJ1JzwChSDYZGNYE1xtrNLIgx3uZgiNSfjKmPY9XUEc669
NIJc0TBcSlF8HODfUyeMEGhqoLoTz3bZp4ld6jN+5pJ35bd6lDktZM2sbclBTQOm
XeapJ2A5M1hfk74xRMdoZbQpA39idLbUp4INDqYLW+o0lZRRQocEUNw/4uDR0GA9
zOo4nfrMRz4shTgVTbW1So8O+N3aGqQ8n1P7FLHs3CmZmQut37fdIBJkhVSFnBmA
00xNdHYl5JplAWiF4qfKsly+wGGgBeKnWHTunJZ82j8lfqtPL+h5av82Qe1gpDBA
A/MoxyCWH5HedSqBYTNr+xVKuoIBITypCqjyuXlaOaOwSa0T0SjgP2ZjPbYliGZB
xjcgMaWZUKay0pGl1HjpADJ7Bk4llrCHegPFQ13fS3EibzE/BU79zsWT7mqjvJFT
/CK+hrQwRw==
=S8Aq
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
