Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F5C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Jun 2022 17:24:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 21229744;
	Fri, 10 Jun 2022 17:24:06 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 133cf61d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jun 2022 17:24:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52C77B8367B
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jun 2022 17:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DE7C34114
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jun 2022 17:24:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Tf7WsjO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1654881840;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TIHWv0I4UG7Y3j6Zv+dQAKz3oB+XeXurySSKXt9yOMc=;
 b=Tf7WsjO5Ln74JnurYBgSmVnXKZ98e3F8svOqMCgkQANGo+01KzXlG+plV5BaTYk52Xa/nk
 ICWbdug4jyRaEL+lutar5gvDcuucdL4ue6JBmsv7rh8X/uyY+8LjcK3aSiVxN8keumrBYm
 2UtEHwIUcTgGZ+ijwPNKxyWIBgDQ1i4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 09504b07
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jun 2022 17:24:00 +0000 (UTC)
Date: Fri, 10 Jun 2022 19:23:55 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20220610 is available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <20220610172402.C3DE7C34114@smtp.kernel.org>
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

Hi,

An experimental snapshot, v0.0.20220610, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * if_wg: wg_queue_len: remove locking
  * if_wg: wg_queue_delist_staged: use more standard STAILQ_CONCAT
  * if_wg: wgc_get/set: use M_WAITOK with malloc()
  * if_wg: wg_clone_create: Use M_WAITOK with malloc
  * wg_cookie: ratelimit_init: use callout_init_mtx
  * if_wg: wg_mbuf_reset: don't free send tags
  * if_wg: wg_module_init: clean up more if the self tests fail
  
  Numerous cleanups.
  
  * if_wg: avoid scheduling excessive tasks for encryption/decryption
  
  A nice performance improvement - John reports double on iperf3 TCP throughput.
  
  * crypto: return an error code from mbuf crypt routines
  
  Preparation for the OCF work John's been working on.
  
  * if_wg: account for input function returning a boolean
  * if_wg: account for added argument to sbcreatecontrol
  
  These allow building on recent FreeBSD 14 main.
  
  * if_wg: do not use continue statement on \!VIMAGE
  * build: only include compat.h for if_wg.c and fix build with an obj directory
  
  These allow building in different configurations.

This snapshot contains commits from: John Baldwin and Jason A. Donenfeld.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20220610.tar.xz
  SHA2-256: 518779c383e8087a60a7ec7b0969158a48b2f19a34a13b62683c982960295f17

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmKjfhcQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrszsD/9rSo3Cqx8AqilVII4dpbxGzHXnkSCetUc8
e0nBLtvSZ0C/MiHSJtOD1iwdz8ndPX57P2VUdBVV/xmSeWzblfWDyB2nOoiLUq4P
EoJaAkMD1isErVdJizlq0QQEq6UFegBcb9ttna33IZJm67uRXICzWq55yl/pJMSV
zhsv2cQOKK8S9dUKgBtY31YKnDMZLvbtJbPP5hiDyCmrSVYrQKFd6owhCubRzGKE
thNP/+rDgitz7vFB8Uu84Ib/dY8dVPjFbK/k3DqTdSKhefI4uc0y1buM8mV96zGi
pXXYqi1qrgnMVpO2plhR04thACbAqT1Gbsx402q48LeJ7cD+oL0WxTJ2H9gEv/tA
lJ4e7YnWt3zyu4SW8CvDPbVfWLVTTHR9jvV+/qJp4SVbFsDkmdHT7mWURRUtwawD
C0p+wPlBcqdENXVtFmvaKeqclxCXFUkIC1SorIStKhYDPsFdRexOsiXAqAVdXmvJ
ZdeX8BJWHXz7cxGNdE96ep6qBMAPJ2+9f3nLIoG/1ca0hWvDpWTGbepoekv0Ab0/
gwXqlxUfOmCjjLBRA4vrp0JJpWJJaWWdQSVKmeDwn/z7h/kASjeL1Z7gDlkEq3yI
hKg47SUqupG2/iSoL8EUglAPi1o498BhZANtf3LgYH3z+fd7GU4k/ugfp2KKjsOq
+dNT9WYX9Q==
=yY95
-----END PGP SIGNATURE-----
