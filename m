Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0AAEEC2A0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Feb 2026 22:29:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 52a89c74;
	Mon, 23 Feb 2026 22:29:39 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 28e08567
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Feb 2026 22:29:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5FC060131
 for <wireguard@lists.zx2c4.com>; Mon, 23 Feb 2026 22:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D33EC116C6
 for <wireguard@lists.zx2c4.com>; Mon, 23 Feb 2026 22:29:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Pf2iWNz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1771885768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=aYB/wuimKaQS73aLJ+QOgbL0p8bQPyYINNwRmaZGHRE=;
 b=Pf2iWNz7sNAyZMq4Frx68wNtInagBqDoif65uWRNZ5zlCAcUieAQ+FaPl6zDeByMVvzFcC
 sAo1v5D6DlTL0+QgVObNU6M3DNruab17HL4zLGm7rPsSVeenpD7pi2yELE3u1t95o6v0KG
 +jr76snsPsRG1W+uPXzOiPEtGpsmmLo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d88494aa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Feb 2026 22:29:27 +0000 (UTC)
Date: Mon, 23 Feb 2026 23:29:23 +0100
Message-ID: <9356acf55652c651959056db4def95f0@thinkpad.zx2c4.com>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20260223 released 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20260223, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * wg-quick: linux: use smallest mtu, not largest
  
  The minimum endpoint MTU selection should now actually work.
  
  * wg-quick: pass on # comments to {Pre,Post}{Up,Down}
  
  This handles the case of a literal # being used in a command.
  
  * wg-quick: linux: deal with resolvconf migration more gracefully
  
  This fixes an issue when upgrading Ubuntu boxes.
  
  * wg-quick: use addconf instead of setconf
  
  This will prevent wiping out changes made in PreUp.
  
  * wg-quick: linux: do not unnecessarily set sysctl
  
  Improves docker compatibility.
  
  * wg-quick@.service: add deps on wg-quick.target
  
  * config: preserve const correctness
  
  Squelches a warning on recent gcc.
  
  * syncconf: account for psks removed from config file
  * syncconf: account for persistent keepalive removed from config file
  
  PersistentKeepalive and PresharedKey will be removed if they're not found in
  the config file during a syncconf operation.

This release contains commits from: Jason A. Donenfeld, Robyn Kosching, and 
Doug Freed.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20260223.tar.xz
  SHA2-256: af459827b80bfd31b83b08077f4b5843acb7d18ad9a33a2ef532d3090f291fbf

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20260223.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJgBAEBCABKFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmmc1LYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA670
0RAAnGXdDN58CNN7enbl03NLSAE+rtbjy+YbEyXKjQCEocLseB+9+PHrqpkRXERJ
fA/ysLmlE8ZhZybSjMB25aF32mvYoVwqQbQ6nCfdDR1vPF7wXN184TS4+ZjX4pxT
lu1QQjsJR3DCfV64srqa3a8Z88g/ZYrNE9O/CJn4iL7DHiIcMF2V5s0yRWlRq/Sh
YPSeyxoA4x68jH52b0ppprMW8EB9WfXWy9x+OOS0/2DHmVMdiL5n83IKbG2+MCgQ
dDvPMNYV6N/JR+GPOHVFlnL34/Jqxw6iyh1IjbJ5MfNz0gqjopruXN0kRI6Sf3bE
y4YyJPeZD20l0K4D6Q3Mw2Ar1ryQbwOCrN69WXwBbndxjmoMZ9JLEdSsOlNBwCIJ
aqOp9/rP6QALB7gRV7TicKu55t8554FcXzFAkfaTwnorQRnaWWDpsXJubCRLWTaF
vcVJ9WIbVuzPYjPituRUeYuZQ10DwzLzDzZoBF5aSlCMHwsUZ8ZzAJYySBFindTd
ftSA6mcx47Yln2EYRHARjHV91ZARVDdL4Nd+yVsFNRkVvTKldZSljblLbGwF8lJU
ygxEjwsMMB6DvxMd4I4/Wu/MHQ/h3ETOtc2qPob3bt/vPbpkf5k/DkBbaW3Z9bjk
3m9gtspIuLQEMX3sQq3BxpeJBiTNmYVc913PxGvsyUWzLnM=
=v2Q+
-----END PGP SIGNATURE-----
