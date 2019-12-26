Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988E6C2D0DA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 17:03:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9572206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 17:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ecmFnFSf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9572206CB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2da58cbd;
	Thu, 26 Dec 2019 17:03:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c1fadf9
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 17:03:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d21d5a95
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 17:03:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ea9b753
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=mJM64TvV5gb1gIYKt
 fdULv1Pzhs=; b=ecmFnFSfsQJ5Vr6BAxUF793qrcAiBq7drOYjpKx/52IGrmkX7
 rJ2Jg9HZ3DEDIE7bsYZwz7O2iYMyxMDVvK7AS8lDtNeiiQd74X0ZJaod+Xla9OzD
 3UnG5Y5hYkQhM8UEljufkOChbiQTFQSfj45X0RAqppOnnAZoEJbBAfi4wP2kFNGG
 uGPpoIcf00lxVODDWGfr/Q3yZVo/7tPvN+xDJeWHodwyDQXLtTGOP8v8c2BPlOAR
 4rbhkc7Q3JycqbvW23nnZVJELU+fo6ObhEbFEG5j4haYhlmDrIdTW6BuQNWX3sPf
 f+QdF/QYP+F5ZYPXAGx3ZYcxjnR3qxLfYLFzg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3d1dc453
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 16:05:45 +0000 (UTC)
Date: Thu, 26 Dec 2019 18:03:15 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v0.0.20191226 released
MIME-Version: 1.0
Message-Id: <fa05b35c817d1eeb@frisell.zx2c4.com>
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

A new version, v0.0.20191226, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

Please note that until Linux 5.6 is released, this snapshot is a
snapshot rather than a secure final release.

== Changes ==

  This new wireguard-linux-compat.git repository replaces the older WireGuard.git's
  kernel module subdirectory, offering compatibility for kernels 3.10 to 5.5.
  There should be no functional changes from the previous 0.0.20191219 snapshot
  from WireGuard.git, but there may be build nits. Please send feedback as
  issues may be encountered. This corresponds with the recent tools split into
  the wireguard-tools repo.  We've tried to retain as much of the git history
  for the tools as possible. It's still slightly possible that the repository
  may be rebased a bit during this week and next, if we receive reports of
  missing history, but hopefully what's there now will form the basis.
  
  The versioning scheme for these will be major.minor.date -- so basically
  semver, but we encode the date as the last nibble, so that it's easier for
  humans to keep track of how old things are.
  
  For now, we'll retain the 0.0.date version for this repo. When Linux 5.6
  lands, we'll cut a new 1.0.date release.
  
  In case this is confusing, see https://www.wireguard.com/repositories/ for a
  list of all WireGuard-related repositories and detailed descriptions.



As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20191226.tar.xz
  SHA2-256: 7c0e576459c6337bcdea692bdbec561719a15da207dc739e0e3e60ff821a5491

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20191226.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl4E57EQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrhStD/9V+AuEDk0x7tuyzbALVssH7c9wMvJrgl+U
4lJwd02mMPP2j+N2+f12hV0ggxss7odEqxCat3Xqa7pJv+1ZWnrX7aSYkHAnNYyn
JchQhD2Ki5eBVcpkcXygTEIykjus1wbN6wp8zNVxDG9Syt9S6xktmbAQKCMBzANJ
aDRWVkNClpKkysa91REcaqF/OL9CP8knm22ouTl0VF8ljS36WRzX5ZoklcpuwaqQ
rJdIKWO5pOiwrUmJC1JBLKEpfQNd8+PRKcgzE4Cgd1A+on+HlKsGGwLFRrbcayoV
Y/WhciZ2lVHNZq7sSLZry//FmJrGjj9o1S+cLEf+csjFAlc/o4WiyhnVziJDiKpb
VJGL5Pjp1tkvIpZ9TB/7STteaBWVPnRf4GQ3Fzx/EomaYJuF+NFkMbX0R+dloPOW
HV53pU5tg2I6Un2OS2D+JZ2KRA6uxyZnYzNMs9COrMg9kB6Obs6JgBlgChvU2U5A
6nLpSWZHYrRaMZt8EvZww+ix8HorRT56fF3UUFNMvcfFSx60ObA/+cUWCcfXRS+R
qEwIjt660OQn9tQiOtQ8V5jQpKA1MzYkhKk3aSqcaEQ+8g58xxpKTZ+yDXHawB4+
q2CgJc7BdVqlvShHKGrgh3qdqvmDAFwYTrSfp9x/xo8pko8FCbV2PKJ0RL8BEAtw
Rbt13HPNgg==
=/od7
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
