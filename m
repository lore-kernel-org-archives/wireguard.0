Return-Path: <SRS0=FUvr=KB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A01C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 May 2021 09:22:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6576E6112D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 May 2021 09:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6576E6112D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5257912c;
	Thu, 6 May 2021 09:20:16 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c9050d89
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 May 2021 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620292811;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=3J/5xGqI27ddtyjgvNx510mRJmmdrfStyVw71qSlcBc=;
 b=Y2/+wVk1wQ4NgcBZwG+4OGGUmFRCs+ZwMxDWy+7XfPBhoot06hP1tuPpK3Ky3XKn7JgLwH
 6wRXqUlP02ycpLpMiNxMtmzdLjpsOyBegCcHIWhFTBG6a6zyaOp/+FvY4CQCSme8Ws/+/a
 /rp8hmoV5iM+U7aDLvzXn9EfEtAF7IE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a9b072f1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 May 2021 09:20:11 +0000 (UTC)
Date: Thu, 06 May 2021 11:20:08 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210503 is available
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
Message-ID: <8eeb0f78721e66e5@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20210503, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * if_wg: put event notifiers in main loop
  
  Should prevent connection stalls at sustained high speeds.
  
  * wg_noise: set handshake to dead before removing keypair
  
  Fixes an unlikely crash.
  
  * if_wg: destroy interfaces before uma zone
  
  Allows for removing the module while traffic is flowing.

This snapshot contains commits from: Jason A. Donenfeld.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20210503.tar.xz
  SHA2-256: 96b2bceadc05dac2f026e203d1c0d25f114491afc8fbfc8d6f71c3de7f4a22f1

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmCTtMEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drtf0D/40Pz8jc7sNfLZYWYrQfra4gIgkScBkQFxU
FqLnh3sG0Vc3lcLuhdXunowgTGXd7tTUW4HlQ5RcqtJimtogBI1bO8ZYo8lcYAJE
wJPl7Jn5BEVDRKYUuXpDhtto5zpuWtyao/j1m3fyStnrZ19xqCMCsdCc5ULq2q7j
m2Xo0z+ImqMM1l/PgnAM//aG1RvhJmzEQrMrYS6eBvTvphoDRjMztWT0UrkSM8EO
Cn3EqH55KZZHz40654jLb8SxlDj8gJvFP3V0zzHvfcdDv/A3Shu1Mp8hSsmA0Da/
280EZG9CjaAMsyEBBXnZGoFxgXq4xPGNVOC1N9TMnqUbh6q56yU/ABfYgC6yPD84
v//b6mJZ9DYITUq7t7h1TGgfAazD76C3O4v8JIHmRXg3xygsItWKO8QtoEWdtsBX
Tqi45h5wq6Xn/dll2RkkeTkFa4lUKeSgpM3gWHNnBVHk8gNOHK1b9oujen59eOdK
nN4vQ3DjXskDHMp4qabf9ffqD22C/BWQgBH8BTwmuAjSZq38SFBn/VGCzJwRR8OC
VPYmlgo3aP6lbrIQqqSgZS8pGjR9m6w/aWuwQD+JOtEiiHU+VkivsKgeYCQAlctz
/XvjxAqviEnxUEnJRDBmieGlLSEo+ED3F9Iu16n6E1WewdYhGh80G+KqlYTDQuvR
c+Tmm2i3DA==
=oVK+
-----END PGP SIGNATURE-----
