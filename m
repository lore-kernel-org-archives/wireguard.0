Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21ABC47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 13:38:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2CB561408
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 13:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2CB561408
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bad3d4c;
	Sun, 6 Jun 2021 13:38:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 74165ccb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622986697;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=Wp5W1c1tGTJa539H3qAP4agc3nB4MoIDBP77MJP+e9A=;
 b=U32LknoHkzJjq+NDxeTBj7s4SkZQR9xhwF9EI8yJ0DgcLhxYwByqt8jbYMiaABe4GIBN0K
 OiL1wo83kVzcR/E47l2yUcfWnxeAS6MP2ZTu1F3W+Zhbgo5fM/dTBugv8JwcB5482+fGG7
 L9SzqU2X3SRKxBTeQTtfQQJbl/Cpe/4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fc752c2f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 13:38:17 +0000 (UTC)
Date: Sun, 06 Jun 2021 15:38:15 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210606 is available
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
Message-ID: <1649e2dde816a873@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20210606, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * netns: use `exit 0` for early exit
  * ci: add a Cirrus-CI config file to build + smoke test
  * if_wg: pass back result of selftests and enable in CI
  * netns: trim test to working parts and rework jail logic
  * netns: account for FreeBSD 12 quirks
  * netns: use massive datagrams
  * if_wg: do not crash if deiniting before vnet is up
  * ci: test on 12.1 and 12.2
  
  We now have the vnet CI running on every commit on 12.1, 12.2, and 13.0, and
  so a decent amount of work went into enabling this and tidying up the tests we
  run.
  
  * global: destroy rwlocks and mtxs
  * global: replace rwlock with mtx if never rlocked
  
  This uses some fancy SmPL to simplify our lock types when possible.
  
  * compat: account for lack of CSUM_SND_TAG on ≤12.2
  * if_wg: add braces for 12.1 compiler warning
  
  Usual compat work.

This snapshot contains commits from: Jason A. Donenfeld and Ed Maste.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20210606.tar.xz
  SHA2-256: d7501666030619e4ee86e68d2b9fd6a718be6541be83bf726414b821c60383d0

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmC8z7UQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrpTQD/9VenrT33AbdVf688t11dyKD6S/aZ0XLsF8
Qvjpv8tJuLOOHqSm1d7c6UKdsDrc9okbAvQvHoiX/VhU9CxBKzQoK74iTPiO+bL4
Y7Z+fe+25vzjyzJmW8KhPymgQzfhw2JW7KwjtwXqh4NnZ3zKFoaY/9hWBnZAIF2o
pTrjBE6jL5W6smFDyHsa6L0f9hfOJ7PUvNRj9Tym9VQiGxY0Q3z7N845n2gvgwJD
J2UKTugz12zdVt/sKSpqLaLrbGaonqY+10SdLVUNO19+6iIx7hRBPw+BKTakUVGl
aqji3kM7nsszWIt9yEKzdmG62oIMfZg0524yU3ZW9f38TyN2x/5bNoaRcHxNvcA/
SJ+25mVsSKNiNvVho89e6NxSK9tqywkXCbVd62p6KyOKdJSOvsvuT5LhPzlA6RMz
Oli8bpZHQucxNHFzNdnuojo44/G9RlKriCKqMtPY2BH+LJOswzFG071HcWn785hR
96wDkxPvL4QqD/7tHssyPna33Ees/IRSlnYTXaZ5L9wwBTilI0XnKO/X+whpm4jj
21rXfXEXlCbe9tA90H6tQS/sHcn9Ezj2+5MEgCxhZ6yRjeibDZvKR8kCuIcXJxAi
/Y1iF5wyVvWSndNKruvUV7t4+w39WzzxaLNokZ3UZYysmLBvwbf+Ddl5yVUxtEkr
HmA9Tocw9g==
=eYnb
-----END PGP SIGNATURE-----
