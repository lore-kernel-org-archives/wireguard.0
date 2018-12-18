Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2092C43612
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 15:50:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5F821871
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 15:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wSEKEJvx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F5F821871
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02e9a5d0;
	Tue, 18 Dec 2018 15:50:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 471c7385
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 15:50:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81f32557
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 15:50:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cedb159
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 15:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=YmOCrFtHWFTM7+4tR
 f8y5Z/uZes=; b=wSEKEJvx4GXgOGXJyXmAXgryeCCP0GBM8W2bQ/uA+DjahC0sL
 zu9/Wk0LJ6AJBiaRbuGNIoprEiN6KZmhy/pWa0fczVngMzBnF+ehLu7KPdP669RV
 0QK5YsYrqXqQXvbmr/d2Jzs36TyBEZNMqXI9uCH0e6974mPN7tQHnyCGari+cmyH
 1vCFvFLXIV68q/p9BCJL2KdkYXDhhbXHfmgGgX+WildAnHotcbReUzetod6eghR0
 GwM2J7JdgYGewLD1Z4jODAOSddL3tqmpndW/WRl+FF3VAd/FewZ6ytQdiev3p2IE
 xAtGdyrGeL28sJk3IfiAMwfGzh8ehRN0VdPRQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db79bc69
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 15:40:49 +0000 (UTC)
Date: Tue, 18 Dec 2018 16:50:27 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20181218` Available
MIME-Version: 1.0
Message-Id: <f809b7b3bde6dbfc@frisell.zx2c4.com>
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

A new snapshot, `0.0.20181218`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * jerry-rig: replace S_shipped with pl
  
  This fixes our jerry rig script, so that people can patch WireGuard into
  arbitrary kernel trees, instead of building as a standalone module.
  
  * chacha20,poly1305: simplify perlasm fanciness
  
  Numerous cleanups and correctness fixes in the assembly generators.
  
  * compat: don't undef BUILD_BUG_ON for Clang >=8
  
  The clang bug was finally fixed upstream, so we remove the workaround, while
  retaining the hack in our compat layer.
  
  * embeddable-wg-library: do not warn on unrecognized netlink attributes
  
  This brings behavior into parity with wg(8), and also allows more graceful
  addition of netlink attributes.
  
  * chacha20: do not define unused asm function
  
  This not only decreases code size, but also makes PaX's RAP happier.
  
  * compat: account for Clang CFI
  
  It turns out that RAP is no longer the only game in town, when it comes to CFI
  on kernels before Kees' epic timer_list refactoring. The Pixel 3/3XL kernels
  are based on 4.9 and come with Clang CFI on by default, so we account for this
  in our compat layer, so that we don't get CFI violation's and thus crashes.
  
  * wg-quick: bring interface up while setting MTU
  
  A small optimization to save a fork/exec.
  
  * makefile: use immediate expansion and use correct template patterns
  
  Coming up with the right combination of makefile template params that work on
  many kernels hasn't been easy, but hopefully this should solve building in a
  number of strange circumstances. If you're still having issues and you're
  using ccache, be sure to flush your cache first, as the cache might be serving
  stale copies of gcc's dependency info.

This snapshot contains commits from: Jason A. Donenfeld, Nathan Chancellor, 
and Aaron Jones.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.xz
  SHA2-256: 2e9f86acefa49dbfb7fa6f5e10d543f1885a2d5460cd5e102696901107675735
  BLAKE2b-256: e83755faa9ccb87048bc53b5d533c4b8e4a6fa859d2f95400c5a1716ff31a457

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlwZFzEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrpAZD/0cyPj0K2lq6vf0NyFVAWrrHY2JL5OC/tmx
lLBkQ/+Uvbam8MmXPdDrd0irFKW/9oc63bEFvuueyZpmNpWxvyzhsQ7ssKmL3Q7V
CRfNCO76s/JTbxiPcDyWCbB2pjx/1nNNDikqChPXRgupKJJREFjwOFWC5ypctHrh
pXxbS0YfmUotq7nkAqouwFkulO1sreM0n/Oe9TLdNhKjR3Y9pLBR9Ft9nWcU/0JJ
f1vhHhGWYM16u42cVUq/eoNDKZIJCGYIF2oGaIdNTVSfKIPyDLUJ1nr/PQpodrK4
jWLj4Xb/+zyGjdxQhKCfASRZPwLivhETxGPS8ZdhjDYVbxPJyUG3ICDIXGpLje9X
7pOmyEGTisyxEzhCvu2f6FDQYqOlHor31g2HjDG1ZpicnyEnFIFjvkjbD17bBb6y
LKNHt6cix4VkJkNz1/ENmey5WyA/+4qMoiI7/1aXJWPtI4k3wigsKxWogi1FWKiA
L20TqdPW8zU/Z5RQPviUcgI4GpYXE4o05ssEQAzeKdEcgADjXgytXMCZYgE4Nfb0
WfsjfJzPZBsDh1/XFxeNg7W2dKxfIjqCs/QRN2NpJJeU2mHq4osZaHm7wfhhcqne
Rmip//d93wiSFrjDzr2Vxh9QoAd81dB2l31dBlfylTqiF6TufLeHtljPw4pS0WHj
taams54OYQ==
=1aaJ
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
