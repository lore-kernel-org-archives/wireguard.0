Return-Path: <SRS0=P4Ju=XA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EC3C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Sep 2019 22:25:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0A1D2070C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Sep 2019 22:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DMqqHMgG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0A1D2070C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a978ac9c;
	Thu, 5 Sep 2019 22:25:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a72db150
 for <wireguard@lists.zx2c4.com>; Thu, 5 Sep 2019 22:25:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2fc34f4
 for <wireguard@lists.zx2c4.com>; Thu, 5 Sep 2019 22:25:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 008735cb
 for <wireguard@lists.zx2c4.com>; Thu, 5 Sep 2019 21:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=+XeqUNuTKT9sPuK0Q
 WvIUqQNlY0=; b=DMqqHMgGM4WRrG0uHZ4d365Z8KC0tHe0w453yZDmkrNLTHg+j
 UbT2xtqHHm++flsDSkjS3zYaRzzwzj64UwAHphOTwmDS6cz68sGjl5fznb/8YAJM
 j3OF0HL9Jzl0f3MRxPBYPw/iLV+HUaHaLLTTVgxv9UTH1YCj1CyJpzr8nPpeLMuj
 V5CnJuUzpJlM+PwFGHfpc2ZiNUseDdzaFn+GMkBz0w4zRvRzXc7tuJVdEW7QrzLF
 rrce23Qo3+LUQbBwVAylkn86QVoVuz6b2xY7BGfVprEij6wktAwaJDVA8yIv8sOj
 x3t+E5q7kaNGL9/4tiYWPS9z7Yzpal7/GYppA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 754a3ee1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Sep 2019 21:42:34 +0000 (UTC)
Date: Thu, 05 Sep 2019 16:25:47 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20190905` Available
MIME-Version: 1.0
Message-Id: <74c308376a2bd7e7@frisell.zx2c4.com>
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

A new snapshot, `0.0.20190905`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not constitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * compat: define conversion constants for ancient kernels
  * compat: support running in OpenVZ environments
  * compat: do not run bc on clean target
  * compat: account for android-4.9 backport of addr_gen_mode
  * compat: work around ubuntu breakage
  
  Lots of compat work. Of particular note is that Ubuntu 16.04 screwed up a
  backport, which broke WireGuard. Their kernel team is aware of the issue, but
  due to bureaucratic constraints, they can't release a new kernel for ~7 weeks,
  so we're releasing a new version instead.
  
  * wg-quick: android: refactor and add incoming allow rules
  
  Android battery savers also limit incoming traffic, so we open this up to
  WireGuard.
  
  * netlink: enforce that unused bits of flags are zero
  
  This enforcement means we can use these bits later.
  
  * noise: immediately rekey all peers after changing device private key
  
  It should now be possible to change private keys and then immediately
  re-handshake, without loosing incoming packets.
  
  * netlink: skip peers with invalid keys
  
  We already had this for some cases but not for the invalid case.
  
  * Kbuild: account for upstream configuration maze changes
  
  This should allow inserting into the build system of mainline kernels for
  folks using the jury-rig scripts.
  
  * wg-quick: openbsd: fix alternate routing table syntax
  
  Syntax bug, which should now allow for multiple routing table-based routing on
  OpenBSD.
  
  * wg-quick: linux: don't fail down when using systemd-resolved
  
  This prevents systemd-resolved->resolvconf systems to use wg-quick.
  
  * Makefile: allow specifying kernel release
  
  It is now possible to build for a kernel different from the running one.
  
  * tools: windows: enforce named pipe ownership and use protected prefix
  
  Security hardening enhancements for the Windows tools port.

This snapshot contains commits from: Jason A. Donenfeld, Ronan Pigott, Nathan 
Chancellor, Mikk Mar, and Ankur Kothari.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190905.tar.xz
  SHA2-256: 78767ceeb5286beaa851145f072d920a340a9f1b771a2943b8efd638cee1a8f6
  BLAKE2b-256: 2cb58ed55b4261257b0dcfca58a3e73bc5ea8eb660855e0bbb0639b893d4aa2e

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190905.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl1xi1wQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrnN9D/sHHEJmmQaJZ4RszJjDydUzq8wJ6SliFT0E
JiuDTWyZQld7IRiCAAPmcgH9Xv783icLUQNKcO6JRAV0rTcmUmV4N6iuT1LKeNIj
KrG44SxuAOSKSQacsJHE+jU4Tbn2MqGztw1f9NwUCOzTg/TfivERTG8+Xi5MP0c6
clkHF6I8aTlV30JeqjmbpbSWYnnYJo5k3mMAY7lPZ4ddiWQTfYm3gBRbDu1cdwjX
IHJ0ZtGvnwrb16/OTwxcPkE0lZiV7WLghHmXJjPbN6V0diHUIyvNddPceN1gxOeK
HbI646KtceDBOGlWA+z6qF27W4PVw29fRtfAtUVDsPXNDRhYvGdnjG1p7ReUamW4
KKuHJHfvgJURy++AXV9PUj6V0MtHANX6bWLjVDKRg+DIHPIU5iATF4Cz6vp9jcOh
r3mJ3iA6XJE/0PSmqM1jbbB0Tb6dIGGXZgymMt4H3Uf0HYROQRAD8PZdl5Ii/d26
1lydevz1TiUpO6ADcYq9PYngSVP4McR8EM/eCkBL+dY3RTlx0/lMemKR992FkTyq
7TutFLfSa0FUJvkk1LsEQvLUKKpfkDiGd+/7v/k6DaIBSkA91kBiTdXNkyJpPnJS
KWlH6dz7QZdVZVxdbZacHeFYvtqaa2+YaDyPJiibByBuwK0+g8lPQnTg3wuFjMIo
FW5aLIHbeg==
=vikk
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
