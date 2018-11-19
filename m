Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD3FC04EBA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 17:27:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4124320C01
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 17:27:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TMmZoeIh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4124320C01
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5900923;
	Mon, 19 Nov 2018 17:21:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d1e7fc9
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 17:21:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12321ade
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 17:21:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be6daadb
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=oawBCZAIKPumTtBih
 qqtIbySYJw=; b=TMmZoeIhGw6ZSglVpAqgj9Q4/z/DkDcFL0tIyYmJ3iW/kTCOe
 9In3LA5WbC24wzUOMIXrMQycZ5GVvpXDL9nSPR3QgqULsQfVbYt7rwxrZimfK+jl
 dUZFwKhOTKPjdtP7iULH1vK1hDSZF/+3xB2zluBTFioFPHGrUhSrR930toW3ErGc
 JN7NeBnkr7gKpGFGU9cyF6BFINvn4CPqSkZS+i7ZEvx0YtcuLoIQaE7QKhMiCrqO
 mxLCoHTruBfiSM1RMGZV3thqk+Cqd950xr9yf/THXsXS9XOKrpom45zdzKWjjVXt
 GYZ6dmLZB4HULbPyAKxEM1c6ANFrjCqURHTkg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0f3aef33
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 17:21:28 +0000 (UTC)
Date: Mon, 19 Nov 2018 18:27:27 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20181119` Available
MIME-Version: 1.0
Message-Id: <aab31593d316f5de@frisell.zx2c4.com>
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

A new snapshot, `0.0.20181119`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * chacha20,poly1305: fix up for win64
  * poly1305: only export neon symbols when in use
  * poly1305: cleanup leftover debugging changes
  * crypto: resolve target prefix on buggy kernels
  * chacha20,poly1305: don't do compiler testing in generator and remove xor helper
  * crypto: better path resolution and more specific generated .S
  * poly1305: make frame pointers for auxiliary calls
  * chacha20,poly1305: do not use xlate
  
  This should fix up the various build errors, warnings, and insertion errors
  introduced by the previous snapshot, where we added some significant
  refactoring. In short, we're trying to port to using Andy Polyakov's original
  perlasm files, and this means quite a lot of work to re-do that had stableized
  in our old .S.

This snapshot contains commits from: Jason A. Donenfeld and Samuel Neves.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181119.tar.xz
  SHA2-256: 7d47f7996dd291069de4efb3097c42f769f60dc3ac6f850a4d5705f321e4406b
  BLAKE2b-256: 7691db05dbdc6619700f8334ebf258c6160ae2d6f481ef98475f0c5c2627b3a6

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181119.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlvy8mUQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrrvKEADU62WfrC0UJ0omVR3KnCfCFCubGkEHmDHr
au3H6LEkENJp+JdP593DvSxqdYl6kWKI5rW0IpPJSLCKM17uUHTRKUSDSJ4bvE0h
glAhTXhQXgrWz1RVc6l8veXRORY3ypkrzQGFiVN8gWnTTICvshi+zz4LWUI2AAYj
BRUFIURBM9cDbb/Hucr/vx9S1zj90WSOvRMXgjT708Vf8QSoExgXN5h7gFGdbjz8
AcyVxdGLh9ES3E9232BmWbsO2N2JUAI5WOmMSCPlFZQPZ1XMT1QoqKV7nS17b7OG
jrbLTZ3r4NducKAPt81TE7Z0zrpy9zBm+BP8uJlpATpxa7LH1TK4SkMIBNewoD+a
5H0a4/3DbJ8h53cEQVtrfQYI+tlC9GkW+17GD5PfGJVG1v28VKyWObmOC4+Zm1Wc
p/N3aJYMBCoyIf/d1IRWobP/e6s7B9HcvoLYPsYUdscSJZyMw2If0543v+wVoXmW
kMDdwPNwUCg1T/dcn5Atf+BIq7LpO4y8rGKpONKbPGXjSALQmCTqK8XGLVZU46rW
JrRt/bk3e+CBsTOMpfHSXDJhjiMDViPdqskYGGOfAfGaAUT1V6Oo43fhjC2yAJ4/
ZhmO9NGY697dfcTvD/jq+LlrhAlujOpJYiKJqgE+MWC1OwqUSKP3m1aO5v6gAnpD
6WZrXat0FQ==
=PLaO
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
