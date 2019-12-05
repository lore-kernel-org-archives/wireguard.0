Return-Path: <SRS0=YtjY=Z3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92754C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 10:58:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3537124648
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 10:58:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JjpvJRKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3537124648
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00e63e21;
	Thu, 5 Dec 2019 10:57:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 046fc767
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 10:57:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5dcaf36
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 10:57:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c1142e1
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=rIzinjrR/CtYf7qPr
 0SE6JNDIhY=; b=JjpvJRKsOtS7cs8IvxTDHIKU8aJ5aKJIQqfBDQF/VW0Gm1EdF
 GU5GbnK0UzL7g9wQbnVQ3KLHdCPOeGgurFKUcr+aHHLh4FEQe6M7lsl58OF8sOcr
 19cL2Z6WLYZcoMzgmtIZwXh/KGqVsmBLOE8fahg1RxSWJOORrt2HH3wgNoqoios2
 nYRSiIISEi/A2hsM8o7VARDhgIF0VnfqB+6XwkMThuoabt6X7fiTW0IfGXnHzOgG
 EP/f2wIYT93DHWcVrsAgnNH8pcNCyg6WNC0A9zS/MptX4jp4WIZ+3kzEEt+FiY/I
 vBehT4FUesAhZx7+ds4hLfJ7c59UiK1DP8q5Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ee306d1c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 10:03:01 +0000 (UTC)
Date: Thu, 05 Dec 2019 11:57:51 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20191205` Available
MIME-Version: 1.0
Message-Id: <fa4b08ea13cfe13a@frisell.zx2c4.com>
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
  SHA2-256: 4de4c0efa35f8eb170c27a0bc8977e5c0634b8e19c03915d03218cc88bb0adbe
  BLAKE2b-256: 3cf4f58e1e4982ea3f25f287ae035ac2cca86007ceeefd124003982bba800bd4

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

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl3o4qoQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrgToEADabWFukMDvEvTES9ngUnco0xMEz0IOcagF
1GdRXdNugEuxLcpXZKPvqjG6NxehWP9dAygJvXoxGat6BTOKe7VzTqtr2yzSftxQ
Yxa5Fn1ZQGlBGfkKBkMy20QI5XJ43cZ9Rm69I5HybrBjaHa+l15F8soDzSs/Yo4H
LJPoilxi27kylDQDSTPlHRsuEOuwnxY2HRTHrDm13nGXys9eELSsZ0EF1y90kxYC
CV3St8BUCKRB8ezQQiIrTNuiLa9wvJvNAe0tCjUticQyhXlQF9J+vWxRJCr620D2
vAZ9+uPQj1vb9SyJZWhdm08Wc1zYAgty2POL+9x4Wmlz0pSGTbUJKAwNcvAeCBVL
21/72y8HEitK+5/qiTe9wqlNbWIMVqr0GmFod5eMheqfLaepOcCeVMuLhMIUpciD
1vsMzIfOJmNmHUqiDo+vpFVUvlX5NHyB60kn6d90kLgZmd8JqXItZ0qLYT2VIJUe
PKFCOl9p5MNRcYN5ORisOS0H9qkIOXuTaemwf94OvC0VsPxLe1m7dSvfAbHmpM0j
8qB1dWwCWpjy6zzZ0EatKRA5HBwDfWIt2VuhvUj1ai8ayPnXY6PPQsilj6v7OjMW
vvgX6q+NGJ423F5uCaxp/GY1d5ywLjAxURnXG4E3oEQ8RV5QspsvbXQDTV8Yu+0f
08e7E/G2Tg==
=Oi5b
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
