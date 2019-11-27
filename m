Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960B6C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 14:48:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B6A2073F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 14:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="zSQhS/q+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7B6A2073F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f294f6ba;
	Wed, 27 Nov 2019 14:48:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 786f7075
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 14:48:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5cfd471
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 14:48:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 748dd835
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=9d6t95DmnyqAK/6HT
 bYGUIZXTUk=; b=zSQhS/q+AjJDObt9I6pPdx+LqxQfXC2tlZjzwALFYk26zEUrI
 D1H8CADbFh0htGsmX116TEV99AkPxOnJOLNAwMSyaZK2cS1dYGiYDovf/Fy+200S
 GsYJvMtqJMOE/Fz/AMJcBAD8MS/wKXnGn4IF79UAdXdkTJR1FBw4vkuJvTtyjljF
 yW8X8qGtg37ez4gRD+K1Ns2w2Nk4EvmAQEmho4Zx8qQ2akSrDTGaTnmq0DkqZr7R
 9rWbOBQlqYx2wmYk5c0JFGeam9TI5+5aFM18uEdY3ddQDrfgTOmiquFkX3aC2sB4
 mW/u4tku/MVDzUNe67/GLrx5GAyeaX8RrgMLg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3b56da61
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 13:54:26 +0000 (UTC)
Date: Wed, 27 Nov 2019 15:48:16 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20191127` Available
MIME-Version: 1.0
Message-Id: <fa4a192e28e16916@frisell.zx2c4.com>
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

A new snapshot, `0.0.20191127`, has been tagged in the git repository.

Please note that this snapshot is a snapshot rather than a final
release that is considered secure and bug-free. WireGuard is generally
thought to be fairly stable, and most likely will not crash your
computer (though it may).  However, as this is a snapshot, it comes
with no guarantees; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * wg-quick: android: check for null in binder cleanup functions
  
  This fixes a bug in Android 10 when using the kernel module.
  
  * messages: recalculate rekey max based on a one minute flood
  
  This is a mostly theoretical fix, but an interesting one nonetheless. The idea
  is that if we're nearing the reject limit, the rekey limit should probably be
  somewhat far away to give time for rekeying.
  
  * allowedips: safely dereference rcu roots
  * socket: remove redundant check of new4
  * allowedips: avoid double lock in selftest error case
  
  Some nits from sparse/spatch.
  
  * wg-quick: linux: only touch net.ipv4 for v4
  * wg-quick: linux: filter bogus injected packets and don't disable rpfilter
  
  I'm not very happy about adding iptables invocations to wg-quick(8), and maybe
  we'll get rid of this for the next snapshot, but publishing this now seems
  worthwhile. Essentially the problem is that an attacker on the same local
  network can send packets to a host that has a 0.0.0.0/0 VPN (not just
  wireguard) and do some mischief with an active protected TCP session. We
  mitigate this in wg-quick(8) by rejecting packets to the VPN local IP that
  don't come from the VPN interface. This isn't perfect and is kind of ugly, but
  it seems important to get something mostly working out there now, and we can
  refine this as suggestions come in.
  
  * qemu: work around build bug with powerpc64le
  * qemu: respect PATH when finding CBUILD
  * qemu: bump version
  
  Usual improvements to our QEMU test suite.
  
  * reresolve-dns: remove invalid anchors on regex match
  
  The DNS reresolution script now works when configurations have multiple peers.
  
  * tools: add syncconf command
  
  Long desired, `wg synconf` now exists, which is like `setconf`, except it
  first gets the existing configuration and merges them in memory before writing
  back only the changes.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191127.tar.xz
  SHA2-256: 7d4e80a6f84564d4826dd05da2b59e8d17645072c0345d0fc0d197be176c3d06
  BLAKE2b-256: 4d8281b0e6505853c636a9f329a983014019e3fde110bf750d242de0e15edfb6

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191127.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl3ejKYQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrkebD/9ltecsspJK3bmc5RSfp1SXpbgqURx/281u
xXb5Fwqf0WTHHY0K7vsaKYesl2BJOABTs+pHcy2cNGRG5t08mcQKdqolzJjSS7fF
c/WkxilKNSp+qCnHMsd9uZ/chC8UV/QOl1GSjz1+htFDM9hGeTJqMFuzm79PMMS+
qmmexZG+mwEge5gWIJpu3FxRGPtn80LOGPMAieOcgw81h0hOoYhDv5uGmVBc4NZi
/KZqv55XYClgHLj2GI16BLpHiSQjSCR3wf6zLg0vwhWiTCRyfDryKlmhSt+zkSfY
la2XWTTXLyrCnewbS59XV4XMxzCyImhtF1CQ5EykYqNeLWtJZYZ0d/bzIpHL+MpY
g6WMaAe+/wGrs9gGU06VUHh0xzE3Gv0VtrVnho0955Xn2ptkrDap1d84Ge9RajZ+
X6UQhRJPPawuqpJo5xX2zFjBcPOOJZe7s6Jdai2JTaRA+Vnp8WcNVsdUxzBTc5bN
0s5kG4WJ/07MCWdDQshkJ5oQfjScKPyTVWhUJjND1xJ8kf06KFeKykjSLdQyBP+v
k2mG3UX/Z+57McB677v0CzDWUPFn2xLqePGgskvWET1kgQVDeWX647bICIMQah2y
tKInOFUG7ZF2PsJxDR6/6c8L2Mtp2GekTLV4ooDa42o4idWcvBwAsWYjbNprmaKC
XSsamA6pgQ==
=1yYc
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
