Return-Path: <SRS0=Mtl/=6L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_RANDY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBD5C54FD0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 01:24:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD64C206A5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 01:24:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JnEDEzlN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD64C206A5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b5528e9;
	Mon, 27 Apr 2020 01:13:05 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62574b43
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 01:13:03 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83b2f43a
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 01:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=Y+n/1kpend3fVxTa2
 658ongVnzY=; b=JnEDEzlNDtodk2JnqMIqOZb5HpS09TjPGLhCh2mbOaEKS170K
 sS43NH1x6WXmLe4wfvYSqIIE2bWBVOCFEaEgFhNDsVzah4tUEtOYL4+sBwmJ869B
 LoS6XEVN9Ou1NbA2BnEMGh8fhEpd6HBC3pfKLN9T+SHCBqzQbEU8UBhJOgo2jg9m
 zdiiKif3cRH56g8Ql2TrsRTsQxShe3vs65aE/j5kmhkJPSOJCOQKPSTHGs22ZHy9
 tWnZJMEMMrpbQW9Irkn7vz+w7sutOs+Vjqc5fTR/NtMi6KNZsRUgAl+TPchlEF0w
 pkbMPcZivnxR/NSsN1rc53+B0NDgejb8SOKHw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 45686762
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 01:13:03 +0000 (UTC)
Date: Sun, 26 Apr 2020 19:24:29 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200426 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <b9ca30b38895d715@mail.zx2c4.com>
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

A new version, v1.0.20200426, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * crypto: do not export symbols
  
  These don't do anything and only increased file size.
  
  * compat: include sch_generic.h header for skb_reset_tc
  
  A fix for a compiler error on kernels with weird configs.
  
  * compat: import latest fixes for ptr_ring
  * compat: don't assume READ_ONCE barriers on old kernels
  * compat: kvmalloc_array is not required anyway
  
  ptr_ring.h from upstream was imported, with compat modifications, to our
  compat layer, to receive the latest fixes.
  
  * queueing: cleanup ptr_ring in error path of packet_queue_init
  
  Sultan Alsawaf reported a memory leak on an error path.
  
  * main: mark as in-tree
  
  Now that we're upstream, there's no need to set the taint flag.
  
  * compat: prefix icmp[v6]_ndo_send with __compat
  
  Some distros that backported icmp[v6]_ndo_send still try to build the compat
  module in some corner case circumstances, resulting in errors.  Work around
  this with the usual __compat games.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200426.tar.xz
  SHA2-256: 

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200426.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl6mNEcQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrpqAD/4xD9CHxEIRdCKy/j/0qSBegU9wokp8uOpt
anYHDU8lnma+Om9F6r43zo2wByBb3re68r7S7XH8VNEG3qlTPaRGQ3DKaquUzrI5
rPVFDHz/6v8s5PghqHke2rdEANTlaxzE2oNxWSMz8LnC2dvbl7SKWTp+onfz9YIk
cU0MSUqebwYu4hYGSiYGYCs0qcWEQIO8Ux/6YT1SXwVzCF2yVhQ/OpYAiKIiai6s
R1iz3GMVroOL5ssu2jB23Ge21RQHI6sSs2RKUJ06wgTMl6zLZd0zkmohMSkbQihh
el5MalXFKkZ98bUDaujCM+UAQrt7asaIt9Ezm2pxwXr9GxDnjnIrecQLGAM8Jcub
im/A/3xoplOF5fCyQzsBuNSt4lfemZ4e1auVKl+0xvgtf5uYUhA3I+kTts1EE0fm
74yxFuV3dXTQtZukf4jV7gT1RXebrWSrcCHcLXLi228ltUbhk7swECFzEOG++hCP
J+llzIT3iLblN/dgayX+FkZPKiw5++jl1X77TDc6KC1z7LdbDZPjgekfGPVZGYqy
W37xweT5TAWCm816EnzuES8Oz+9WvUfghTGnpxEiGiYuPaEKGMUeUU37Qc1YTwcM
K1iFkrxoi11ygM8iOy384bDAD7z7nLZBYYJzYlSnRCWis08Lr853afl+s4xVYbOh
42ZO//eS4Q==
=7G1T
-----END PGP SIGNATURE-----
