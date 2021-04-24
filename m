Return-Path: <SRS0=FJfC=JV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6E6C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 24 Apr 2021 17:17:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 605F16144A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 24 Apr 2021 17:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 605F16144A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdb6c0b1;
	Sat, 24 Apr 2021 17:16:04 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1fe612ac
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Apr 2021 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619284558;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=rdBfk6Zo0kcZqy7fruKUPZV2BrHDuHnVEY0bKrh1PxM=;
 b=UwtVzBGe0ytwJmJJaOfoiiCzvW37zfI9TAHtL1cclCuhW+hGID7MhcyLxueTKoDEF8suVp
 bbNtTcgxeQcQMuvvg7e9ciHDxiioxVedb0jDqWwOabpcH83f2walL/UN3mseGruUGhaeb/
 W214tATkGMajb/qnWQVPYkCvgD32QNM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d8e81129
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Apr 2021 17:15:58 +0000 (UTC)
Date: Sat, 24 Apr 2021 13:15:57 -0400
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210424 is available
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
Message-ID: <8ee707a9c92e11fe@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20210424, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  This is our biggest snapshot ever, aside from the initial one, with a pretty
  crazy amount of code changed/rewritten/reworked:
  
   TODO.md                   |   14 +-
   src/compat.h              |   15 +-
   src/crypto.c              |   92 +
   src/crypto.h              |    9 +
   src/if_wg.c               | 3076 +++++++++++++++------------------
   src/selftest/allowedips.c |  625 +++++++
   src/selftest/cookie.c     |  291 ++++
   src/selftest/counter.c    |   97 ++
   src/support.h             |   62 +-
   src/version.h             |    2 +-
   src/wg_cookie.c           |  430 +++--
   src/wg_cookie.h           |   92 +-
   src/wg_noise.c            | 1447 ++++++++++------
   src/wg_noise.h            |  199 +--
   14 files changed, 3756 insertions(+), 2695 deletions(-)
  
  In addition to adding automated selftests for some of the more critical and
  finicky algorithms, we've squashed numerous bugs basically everywhere, added
  proper reference counting, epoch usage, and locking where it makes sense, and
  fixed up several critical state machines. Because of the size of this
  snapshot, I'm not going to annotate every commit like usual, but if you're
  curious, many of the commits in the git repo have quite a bit of commentary.
  
  Hopefully this is a massive step toward getting this kmod complete and stable.
  With all the churn, I would expect some whonkiness, at least in the short
  term, but I don't anticipate anything we won't be able to address quickly.

This snapshot contains commits from: Matt Dunwoodie, Jason A. Donenfeld, and 
Frank Behrens.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20210424.tar.xz
  SHA2-256: bfa8d3c4854f802567db51a89fdea32e7bf98a3d54a525359bdb240f2e864735

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmCEUjQQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrkhxD/9R/coAcfFsTW0pCLDCshVFXa3egquRQ8rm
cdkzHqJ1gBELE7W77xWllKkZ1+zejMqzJg0KYOn4ybJv083CYij1htMD9KEr/aCb
HKUbYVptuzGIBC0D+m39GFrkSstdoypRApUPixI5J69JJCCUQtraOJ5pMF8tKllw
Yi5r/axfqZA5NhJKx0Z8HZeKCZWfUX7+ht9GuoYi6Xaw5ZCJF+YrG2g5tX8vebhO
Mcnb6AgQx8AUeGDf6z2m3yEH8N3hqbNyoTd8lCSo2zztsbF52H8wV1b8tiVK2Ebd
cwEpGM4XTCl+lWi+u9k5YhfTd5AyN4xIRReLbBdjt4EaC6abGe5G4/FpukrBgHOL
lqhDfnT3gJxB5yc1p15tXgfnXlSYZiULnwTmOkQi5ZZH70cuypwNq8v9GfromOJJ
PjNKrNH5Jpi9QeIQX2IVLyBeU8cfHldvulOvudfrwSN8FDw5qOzG4NUxS880LSSk
HER8OvwV6PmMFskvhvVxKJfpJXqxm3bwnDjBhEwvQiNQYHLfNxSkg+EC/61ztqmg
qO7gxTxzCRrX0Uz9F/27bVfqO02noeaZ907K54UvlPgAkYowKCBOrPbBxlZkiNA9
p8IU5d069yRbLnoPk/Iu3inw1HNmjUgwmc73wpzwO0M7rZKhY+lPJC1bkHYYGfvg
lvLtFGbBKg==
=MJeK
-----END PGP SIGNATURE-----
