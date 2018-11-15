Return-Path: <SRS0=jLHU=N2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BB1C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Nov 2018 20:10:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ED6E20858
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Nov 2018 20:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZYwY8Vxp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ED6E20858
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65bf65a3;
	Thu, 15 Nov 2018 20:05:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13e2c89e
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Nov 2018 20:05:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28c0bacc
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Nov 2018 20:05:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bc161a8
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Nov 2018 20:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=DleMHzPrp5MB2vw3d
 4WGUzgQcRo=; b=ZYwY8Vxpcbm4rD4sEt6GSHIrcP02NwZj3j93JRYgkvey6PZCU
 eNZRvT8jtQ18DVjoQeNigE3RAQbAdK6fbGb2TwwBD9432M7gW9IaV0NITL88f2QH
 BJncW4BBfWr9P4DjCmj4rlr5X34/E3S04smQxMnMbT/gVyQk1Xk9CsF+jg/EnEqJ
 JpYmP06bRIDmmf9Z4tdx6Oti8RrPRzFyApjrR09bm9oWrx//xFwnKpCCR+ox7lkf
 Z8eG+UDQo2bMy+Cc8QdQmeRmZQvSZl8TP91g7MzLhaajNPbm0CW5JsDZQYUzniky
 4sVppY8+Eoi8y8QxCfEESzPlNL4NX5BVoy03Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 04dd9bc3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Nov 2018 20:05:04 +0000 (UTC)
Date: Thu, 15 Nov 2018 12:10:33 -0800
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20181115` Available
MIME-Version: 1.0
Message-Id: <aab2892f08745edf@frisell.zx2c4.com>
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

A new snapshot, `0.0.20181115`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * Zinc no longer ships generated assembly code. Rather, we now
    bundle in the original perlasm generator for it. The primary purpose
    of this snapshot is to get testing of this.
  * Clarify the peer removal logic and make lifetimes more precise.
  * Use READ_ONCE for is_valid and is_dead.
  * No need to use atomic when the recounter is mutex protected.
  * Fix up macros and annotations in allowedips.
  * Increment drop counter when staged packets are dropped.
  * Use static constants instead of enums for 64-bit values in selftest.
  * Mark large constants as ULL in poly1305-donna64.
  * Fix sparse warnings in allowedips debugging code.
  * Do not use wg_peer_get_maybe_zero in timer callbacks, since we now can
    carefully control the lifetime of these functions and ensure they never
    execute after dropping the last reference.
  * Cleanup hashing in ratelimiter.
  * Do not guard timer removals, since del_timer is always okay.
  * We now check for PM_AUTOSLEEP, which makes the clear*on-suspend decision a
    bit more general.
  * Set csum_level to ~0, since the poly1305 authenticator certainly means
    that no data was modified in transit.
  * Use CHECKSUM_PARTIAL check for skb_checksum_help instead of
    skb_checksum_setup check.
  * wg.8: specify that wg(8) shows runtime info too
  * wg.8: AllowedIPs isn't actually required
  * keygen-html: add missing glue macro
  * wg-quick: android: do not choke on empty allowed-ips

This snapshot contains commits from: Jason A. Donenfeld, Samuel Neves, and 
Andrejs Hanins.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181115.tar.xz
  SHA2-256: 11292c7e86fce6fb0d9fd170389d2afc609bda963a7faf1fd713e11c2af53085
  BLAKE2b-256: a49d76514c73f7c901a8fc1e75dc0f561f60d9ff16a8b5a879d92bc2ea89b29b

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181115.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlvt0q8QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DruXJEACd6G1Z7hAvbQ+ZgYdj8u60AZlh+2j89Nyg
o9qPrfc5rPZ0a1lq8vhxHMUX/tPe1wYh0unXAoDL3EuCi9ZhBQ5oSSIk8m77ea2Z
+Fu4zlFPTFhHznfbD0gAiheh9MOmffJQc9Yv1rEO0ycqHlR8rBPilLLAZhxDVvA8
i9ybtY8YH8pRz8AKvoZaK5sdQzSch+SUrBwrEza4EXkRFXSAx6SWbUf0KjythSUb
AlTWI74hAuWIOMFTXzOskriKo+6WueE3Xwkl74MaqAUGL6UEfF37o5bhLFVAW2bU
wj31CiaOndaXV7BDq6W/+txR2ZRPw3Szxt00PIRNHZsugzXxsQ7zac9R0x/sMJ6d
nRLteHYeQvg73B1QbLLKg6UE4Q1uKEyXDHFhEK/mXOq8bNJOO34Nc09YkJgSg9J+
pcZqbn484GOMfGIm9w7WllwmYau3V6BtrcJvFBtjGHjMHhAL5mKirGYLk03EnV/Z
sPel9h/QsvAeN+QtkegpJHEnrGqq9Rhj3b3jgHA1MOkxbpX3UprPWIMt4xeU64lq
FggKaT7rZkDGmtWfnlVJxLiwHj5wlKajm7AVh3bfvKinvg0YHGRWCoN5EMmzAOtv
Jp40uZXvs48PV4OelUUPOeCbqyqHMDG7Goi2n/wtdvgk9bBL+++12hK00DvV/27d
/wX3DQxk4g==
=vTRZ
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
