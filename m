Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A716CC10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:22:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DBFC2087F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="zpiGNDvn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DBFC2087F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 845804cf;
	Sat, 6 Apr 2019 11:19:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8436e63d
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 11:19:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbca9fb4
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 11:19:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b08ed098
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 10:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=U7MqN2WHPBulfaumz
 d9L5knj1Xg=; b=zpiGNDvn6YfCpZ2BnTYdubAdmyFdEPr1SGWtvVez4CVskwzPJ
 8Py7PRSY6x0ZZx47vZXdX6+1eoIg7CTQLDbISMVzMBy++3TaXyWwgfWwHX4OTpIa
 84kYqRumaIDQl0sEStqvaANS1LtKEof7Z+wnAJrpjLEdIa6uBR59Z5PM9fW9xnYJ
 Bi0UygyMioqO5V9S55Yr8FOqKKRR6xbe1gy/IcniveDq6F5L2k/g59SVZjmN2tK3
 4dExdWH0OzulKbfURChwvBm7iDlLqn7Tqif+XJ6w4JhLYIvwg6reg2DulaFHvSgD
 ysULV8Y0+K+Yir7DKWt7iO2ivvVQqJg2CqZ2w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8925cd1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 10:58:16 +0000 (UTC)
Date: Sat, 06 Apr 2019 13:21:52 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20190406` Available
MIME-Version: 1.0
Message-Id: <36df54f9dbb4609c@frisell.zx2c4.com>
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

A new snapshot, `0.0.20190406`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not constitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * allowedips: initialize list head when removing intermediate nodes
  
  Fix for an important regression in removing allowed IPs from the last
  snapshot. We have new test cases to catch these in the future as well.
  
  * wg-quick: freebsd: rebreak interface loopback, while fixing localhost
  * wg-quick: freebsd: export TMPDIR when restoring and don't make empty
  
  Two fixes for FreeBSD which have already been backported into ports.
  
  * tools: genkey: account for short reads of /dev/urandom
  * tools: add support for Haiku
  
  The tools now support Haiku! Maybe somebody is working on a WireGuard
  implementation for it?
  
  * tools: warn if an AllowedIP has a nonzero host part
  
  If you try to run `wg set wg0 peer ... allowed-ips 192.168.1.82/24`, wg(8)
  will now print a warning. Even though we mask this automatically down to
  192.168.1.0/24, usually when people specify it like this, it's a mistake.
  
  * wg-quick: add 'strip' subcommand
  
  The new strip subcommand prints the config file to stdout after stripping
  it of all wg-quick-specific options. This enables tricks such as:
  `wg addconf $DEV <(wg-quick strip $DEV)`.
  
  * tools: avoid unneccessary next_peer assignments in sort_peers()
  
  Small C optimization the compiler was probably already doing.
  
  * peerlookup: rename from hashtables
  * allowedips: do not use __always_inline
  * device: use skb accessor functions where possible
  
  Suggested tweaks from Dave Miller.
  
  * qemu: set framewarn 1280 for 64bit and 1024 for 32bit
  
  These should indicate to us more clearly when we cross the most strict stack
  thresholds expected when using recent compilers with the kernel.
  
  * blake2s: simplify
  * blake2s: remove outlen parameter from final
  
  The blake2s implementation has been simplified, since we don't use any of the
  fancy tree hashing parameters or the like. We also no longer separate the
  output length at initialization time from the output length at finalization
  time.
  
  * global: the _bh variety of rcu helpers have been unified
  * compat: nf_nat_core.h was removed upstream
  * compat: backport skb_mark_not_on_list
  
  The usual assortment of compat fixes for Linux 5.1.

This snapshot contains commits from: Jason A. Donenfeld, Luis Ressel, Samuel 
Neves, Bruno Wolff III, and Alexander von Gluck IV.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190406.tar.xz
  SHA2-256: 2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b
  BLAKE2b-256: 787a01fa3d6a800d7376a04ff57dd16d884a7d3cb99d2f91bfc59895ab759200

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190406.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlyoi8YQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrjjSD/0fLlg/QLlGngPIldxT/BsaNLyiPxBBcrFv
lr0jl0x6qNXi6Gj/2KEdiTH/wCmzsWhu7Fa+q5KIly8hYDDBnDfDXYVxQcUva9H0
1XNXDuq+R2yW9r7pWZXRWtbmxWrY6SWvoB73L0Tbqrv0AIFNtmJdF5ut7lFuCw+v
5TZ3OsXvATGVDx9wWVdufrT3la+RhzYDushNJ8JZtCcENKutUgLg3QfjiArjfT7W
ndjsVINbeXWeUsB/lEK95U9yliCLjQiaJspf6LSvm/s7V+ZIQybWi2a4x9T5ZwuH
o2JP5x4xOElCH3hJ+lCD/rSSBHFRkwq0XtwjOVcgTRXZSWCbuaE/CSeA4JaAKXdB
rklV+LpBt9h/ghm8o92ieExK2IJwoOBM8b1f+DEjIepc75PA0BuSqhFXRuV4jAr9
i3zEtDz48ZksY6z9o+XObVCAg64sh+7vOr9Ztgkx30juDbwAoMfCx2IDSb702GlW
sBQwt5fbhC1y0k4WfY/MMuuH29jcJUuDHB7bees3atXr5yOR7r58gEKKKGwcHPG+
8+Dz+ihRv9pFSJPCon4nupohHMwBo7ZjpsV3V6lkz8GY7+QeM/P9BQLkdpIU38NS
bazNAN1MAkvLOkYS6gMK5Y8o8+uJsLJJMQCaDSx5eMUkYS4TE8YHBH4BucfpzW6P
bdz1k5I6NQ==
=eR4J
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
