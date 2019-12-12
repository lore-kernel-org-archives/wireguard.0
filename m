Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6F7C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 11:35:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C38EF20663
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 11:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AwJtWk56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C38EF20663
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51fd9424;
	Thu, 12 Dec 2019 11:35:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0eaf7063
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 11:35:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f0de8e1
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 11:35:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5066075
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=ubdsCAr4d+8v9lLO7
 SvSB7cxTNU=; b=AwJtWk56frgYLvHlyZTCJGgIghaNYQgXkiqpCdXxaXFkpvsDH
 Y/XNBcLNdiHVJ+97xBqWL9dxifmk5nNUYww5i4QjO1R7mInB85OQIXQiLoDUdTym
 tc3/wvG/o8kN+srmrMSXLv0EVrxNxztVNleNK0PwFNJvHY4e0S2sNTq34VdVb8s3
 3FGAZKzzrtJOqnnDIWEUbRg7GHuQGEdMQ4WR3TXDh9Xv6RBg6lqlnatwGTKUqzDJ
 Rvh3/nP3naa+Vq+VjNoJoLTP7WIwyOFccG/e5nNeGXswdhtx+lAiMX0ww+d4h98j
 JFWZxkbhmEpmqVa65UaG9VXt6vroa+XCzBZNw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b0ab5efd
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 10:39:12 +0000 (UTC)
Date: Thu, 12 Dec 2019 12:34:58 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20191212` Available
MIME-Version: 1.0
Message-Id: <fa03d79f3b35a245@frisell.zx2c4.com>
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

A new snapshot, `0.0.20191212`, has been tagged in the git repository.

Please note that this snapshot is a snapshot rather than a final
release that is considered secure and bug-free. WireGuard is generally
thought to be fairly stable, and most likely will not crash your
computer (though it may).  However, as this is a snapshot, it comes
with no guarantees; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * socket: convert to ipv6_dst_lookup_flow for 5.5
  
  WireGuard should now run fine on 5.5-rc1, for folks running pre-release
  kernels. Note that although WireGuard is slated to enter mainline with 5.6
  (thus making 5.5 the last compat-release), the patch in net-next for 5.6 will
  apply evenly over 5.5 as well. The difference between doing that and using
  WireGuard out of the compat-release here is that this one here uses nicer
  crypto primitives. While Frankenzinc has landed, we're still in the process of
  getting some remaining primitives upstream so that functionality is paired. In
  otherwords, it's now an iterative process to transform Frankenzinc back into
  Zinc proper. So until then, I'd recommend sticking with this repo like usual,
  and waiting for 5.6 to start using it in tree, which is the release at which
  WireGuard will be in Linus' tree anyway.
  
  * compat: support building for RHEL-8.1 instead of RHEL-8.0
  
  Please send an email if you're still experiencing build problems on RHEL or
  CentOS.
  
  * wg-quick: linux: add support for nft and prefer it
  
  There was a long mailing list discussion about this. The conclusion is here:
  https://lists.zx2c4.com/pipermail/wireguard/2019-December/004763.html
  
  * wg-quick: linux: support older nft(8)
  
  We can't use all the niceties of modern nft(8) because many distros still ship
  old tools. Hopefully this will be the only old-nft(8)-enabling commit; it took
  many more tries with iptables(8) to get it working everywhere.
  
  * global: fix up spelling
  * main: remove unused include <linux/version.h>
  
  House keeping.

This snapshot contains commits from: Jason A. Donenfeld, YueHaibing, Sergey 
Ivanov, and Josh Soref.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191212.tar.xz
  SHA2-256: b0d718380f7a8822b2f12d75e462fa4eafa3a77871002981f367cd4fe2a1b071
  BLAKE2b-256: 227bb8f54e9dc5e3d3f394c878054b6d377c9ae58f0bb5959477357843d70322

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191212.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl3yJcsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrmoPEADb0HjoMuoWiqja8jaR2WKfGtaLRdT32If8
kOPGDMu5jGRTfb3kuMV0QEMfd4IzAQ9vEkKttRGhTBushOFAEMwU0d6Vlx8KKQOY
P85dac8wxWWamVmEbmS6HweyfZPCIp2kHZWWybsjpglBgM3Ak8F6XpZqOctaMVXt
pX7TXbPydI547ZDZV9byg2r8DeV47bToneyGu3H6mFMydVc+ZwImjKYB5inxORL+
SxUbCZUlRJxTGUlgELI/mQfW070yy8CKn4UtP3RKIJtwOgFaZpOYTEvBu7M9Fijm
RQ/A0jzaDmmHA+VUBqRI/uz0oQfDMXH5CQ9xD2X4qWJ3ucHVd/Fif+FPYaleQ2uC
gvPYleiPhqfETQqrEq/SthT4P1Aq9XlwdMgnL8785/7Eqx2Z4m859Y2ol9Eyn/pZ
9lsa++Y4PlENrOzRfqkad/J2RzSq0UI/7fbz/pJ7mZxHAd6J8fJQyX+2vJILqbZP
WDu14EsmaxB3y5BZSGGQpmLdeklr/i/0H9ytmcxea9Vq8/8rWCMST/1TbhuBUVX7
Wp4hPpfJ1U7ACKpqy/JlDDt8HFbS7Ycl4+SoMELLuYqNctTRJaNWOen58VnqyVyB
sM1Zv0O8HOfXkaXCJgxNiwctUJpbtFZAoXcFzrRWUksITPsx233+9fjIikU44U1p
6bhyjIgGhw==
=EfM3
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
