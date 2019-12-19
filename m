Return-Path: <SRS0=Cs4w=2J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C548BC2D0D3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 00:15:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FEF622314
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 00:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GBcUuBm5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FEF622314
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8af4f4c7;
	Thu, 19 Dec 2019 00:15:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d19589d7
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 00:15:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac3706e2
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 00:15:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a455db1a
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2019 23:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=MA2LbPIage/1HLJC6
 vMUXj30SEk=; b=GBcUuBm5uxKk5PowrAFCmlOtnglBH90EfOIOF6foYAxwp1ygx
 fbdxuchrg2uEKCLYm508p14lig4c820wXsW9XbgskoUoBzCB13oZrJh49AXo7ny5
 8gOsFkxLecErYV9pNMRT/uqYqIUuzd0n6F5Eu9YqQ1bRur9ZuDQwrixC+9OjzbxF
 lvvMC4viQMi+h5ckz0WAiBP1BcURyYdX3+Sv2MLyBOFWgKExNEe3m/wKwclNOPEI
 cPxdtUn6SUq8YE7QcIRl6eZIOuwYLIu7JESo321AZh/HNt6I0Ydrm5VVtZttbVYx
 R1whDLcip5TXis/8gbQVp+n9PTiALZbWycBNQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50ac40a1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2019 23:19:01 +0000 (UTC)
Date: Thu, 19 Dec 2019 01:15:36 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20191219` Available
MIME-Version: 1.0
Message-Id: <fa04e438d58a37ed@frisell.zx2c4.com>
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

A new snapshot, `0.0.20191219`, has been tagged in the git repository.

Please note that this snapshot is a snapshot rather than a final
release that is considered secure and bug-free. WireGuard is generally
thought to be fairly stable, and most likely will not crash your
computer (though it may).  However, as this is a snapshot, it comes
with no guarantees; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * wg-quick: linux: try both iptables(8) and nft(8) on teardown
  * wg-quick: linux: use already configured addresses instead of in-memory
  
  More fixups to the firewall support in wg-quick(8).
  
  * compat: ipv6_dst_lookup_flow was backported to 5.3 and 5.4
  
  The primary motivation for this snapshot: new stable releases backported an
  API from 5.5.
  
  * tools: adjust wg.8 syntax for consistency in COMMANDS section

This snapshot contains commits from: Jason A. Donenfeld and Kai Haberzettl.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191219.tar.xz
  SHA2-256: 5aba6f0c38e97faa0b155623ba594bb0e4bd5e29deacd8d5ed8bda8d8283b0e7
  BLAKE2b-256: bc3c0d3103f799288287fd9872a3eea82e1c478c1090eb0cca6bea33d5676238

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191219.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl36wR4QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drmk0D/0UmodDIai+NfkaCHxp4qutPpdwo0/FGH/w
q45XymjDCzO6PeVOW9TiO6asC9Vbh7atkLoig23eI85AIbHZY75NpZMMtuPSIYYq
Dw5OgotK48CmrTF10wEXhp5N8pDDXxzh84PuW44P60Iyv4tZFFfYZHhh9Nwup1eR
IhKXMR0RkwtxvSgWMG5R6NZBvE+EC/gECbnz/7c5b9P2NgFem8UJbEQ6KUWLs9SI
2kA42rkRSgP/tpJvP1Dw9udjISEemr9OyK+7pxS7A53L2W86kub71AI/RK/5L6c1
2g5XCMTIhln0icnQS5OP4TQX9j0AK4N9gwI2Z3tffAeGKHlEPDVeKgcmOKSAt0y8
w7fwh7PZH7prlqiq54/o4z9KK8zSC5JqkA/IluN+NwRCq8IeSIOrm5ee/Gmb0R1b
dEh3w4mT+/ldLzwjrOChQz0brbNGSASdHP9a6NV31sHA1tdtxeUNHk6Nhl8+CqSp
tVEK9dOMsid5+8XKssiUi6KQ55r40YIRiJxtvkFsvKqyumumZExEHYMWuIkS6P1X
nmbwmAHBA7ijmRtOJ1wcyOLgWwhtrg99R8yeD6dgnEAkqoUB1CYqAbLtVTeqNCiY
sxdt23SGZZoPRbTrKnoYcptC2NHiWoQQ2tsCM2sU746iDWxg+X52h8DH4upfGKBa
SbQxrHJqoQ==
=SOBL
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
