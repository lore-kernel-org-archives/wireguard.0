Return-Path: <SRS0=FNV9=G3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C85C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 13:50:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478B4229C7
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 13:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 478B4229C7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1aafac92;
	Sun, 24 Jan 2021 13:50:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 43c14b9e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Jan 2021 13:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1611496208;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=FPyV2kmORgiyN3SJsrFULYooi/4jooUh3EswZUNxSH0=;
 b=l9i4swTq2qZJYzB/jYbcpgC5iL4Dudd4D2wEDl1HyN2Mc2XP46R67cnMMBdYBbdKsXyvIG
 ox5XX69T0/aiSGgHogwF4Jf00VWBVyzsEQTD8XheXW5QuCjP/WCe1nu2zB+MRhf+oJ/CGx
 lwWrLb3j7TBJX/E7KCAfi2SLBZkYa/s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ee557862
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Jan 2021 13:50:07 +0000 (UTC)
Date: Sun, 24 Jan 2021 14:50:05 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20210124 released
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
Message-ID: <4c225ba6d6bf4420@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20210124, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: SYM_FUNC_* was backported to c8s
  * compat: skb_mark_not_on_list was backported to 4.14
  
  This release addresses two small compat issues, one in CentOS 8 Stream and the
  other in the recently released 4.14.217.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20210124.tar.xz
  SHA2-256: dac6e68cd4c3db441499850dfa8a70706384a3295f37fda1b839a50b79faef54

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20210124.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmANeuoQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DritSD/wJQJkW95fCKjpaN617s3IPTg+k5dyQ83hh
JAoCuPcbx50hO+75TFFaYseTNI6qkVZT5xejyoWFxZ2oJ8lprTZTklEknuC7Zaj9
o/KbRUGT1jML/Oup4BLz4AAIZT4RECCQ5E2j/vQJFRyMbSopZ5F8qRpr7Uf51Mpo
uc+ZLPaylCcJPPJ8txh9esNPt0/F6QLZ89AkaNR/DC6BThc9f/2AVbZi4KT4QkRb
CDJa9OI9cVroFP3GL+hpbFIdxghLmG2/kRNnnkcXPfyWqPzpUksEkyjbk8ERJZqC
h1YZk54heDQvWnhDItO4cPg6Bh5M8z3823GgD3jnBeg7hCKRiQEJtaFJA0mqrlz7
z/+aF6xbagMzGVSC9R8p1tzqjU/Ov0WQ+Sc/9WRi/NDoDg8LH3CS9a2ichdcdiWu
ztdJibopa7JJbCxjXjvFpxe7+qrLc8rIGtHNWRnri5zafP+L3KKhvr8kzFyvxXk+
sPrCF7svJXYGcqFVX6Vb1h4s11clgFqFazADu8TfZkfr17DZvg7spwShLozgckis
FNKlPYh8Gc3qcauF67IpHQeojlRccKsc14MqgOvQRYzSCk71Tjg4W04aSGt58R15
+L40wsXvo9MWisLGaTDGrtfElruLUnwz3FutLr3YjZubw7u5U8b45VmxMar3zadk
v88lB5NWOA==
=GYqc
-----END PGP SIGNATURE-----
