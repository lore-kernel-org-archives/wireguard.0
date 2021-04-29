Return-Path: <SRS0=Dn24=J2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64BCC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Apr 2021 01:51:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD82061412
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Apr 2021 01:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD82061412
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0112e560;
	Thu, 29 Apr 2021 01:51:28 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 61cdde2e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Apr 2021 01:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619661081;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=7JyjKD+vQPxwR7H94GaT+ucM4cjwO83F6mJYut2Xjvk=;
 b=oRafulY4qGTgvKeeIjhnL0gLeI9zvP+SmEsbSG3DAnraoWcUi2k3ajBlMoH5OuIlA8Jj3x
 9Zf4e2TYjaEMxLbJOaoE8Iip1L6QsAYsc8WWRRNgs+G1SiCySUcOg9Abxm3NJkAKx0AcSh
 EMFvp/cs4TqqlxpWDeWzAjbFWoFkPpk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f4b07173
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Apr 2021 01:51:21 +0000 (UTC)
Date: Wed, 28 Apr 2021 21:51:20 -0400
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210428 is available
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
Message-ID: <8ee8d72b775ac0f2@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20210428, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * wg_noise: compile on 32-bit
  * if_wg: do not increment error counter when sc is null
  * if_wg: handle if_transmit and if_output properly
  * if_wg: do not assume that IP header is pulled up
  * wg_noise: fix remote refcount leak
  * if_wg: unify xmit error path
  * if_wg: pull up packet before checking aip on input
  * netns: enable debug logging
  * if_wg: simplify state setting flow
  * if_wg: use proper bool for is_retry
  * if_wg: do not block for memory when sending buffer
  * if_wg: write data header directly
  * if_wg: enter net epoch for isr dispatch
  * if_wg: do not double-free after m_pullup
  * if_wg: allocate entire mbuf all at once
  
  After the rather intense set of commits in the last snapshot, this new
  snapshot has been entirely bug fixes and cleanups, addressing regressions
  in the last snapshot and simplifying other things. It should be much more
  stable than last week.

This snapshot contains commits from: Jason A. Donenfeld and Matt Dunwoodie.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20210428.tar.xz
  SHA2-256: cceebd8f3f21d522342b3629fa0350e4fbc64a00035d330f82301741e56def46

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmCKEQIQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrhlkD/9p/xcF9I5i60Qmv6zLSL+Sd88OHx9LXybv
RiLmLjIlKOYq7b5msI7Gxf7UQnHCMiu+UuC8d8ZtsW1SpaPXRx/PFAAAAP/J/RfB
Hd8uYD0whosgdzgaxvfZm+p2FPtDssQW6YNnrmkB62sNqZVEZdtWpLQK0W8BSdSa
DBcgTJe30g/bhFYKQm5GGf3FCR5wIGlcPSJG+h0uhYnRqIJxcDCJEQ9doFQLTHn/
nygIYE4itONeJnT8acmH9zQZ/zuzz4RAHXkE7ux9Ld9pyvFue7OViCYZXNUInVgz
uVbRfL90PUbQz4rcRbRoY2fs+4O5A2HOxegKhf4DqQ6ZGqYYdONnvJ1fZsHhp0zh
ldP6uzDsd1fStyoANEyG/IKRDjpNtRPKVPgtlYLoNdStJll8T6DkdKC2mKAqF4Rp
iBvEXMk1CgsXucqUESogUASKGnuIFfVYp684uqXSIYdga3M0Nnj6ESBhj1GIqGaR
eNkV5DCH3y6MVT0BMs+5UX/qHPLMwwjGYEhzZc4+cqZDjbi8fEMc6+B6SeGdb6I+
+Bl1QXJoD/uzV7OMvXrb+oVGeku59XhjxLe8hf+wilC88R4SKnf0FciiTD0/rAdD
4x+oxW1jRgDk45qN1ryI1d2smPqNaAXRFwbQaL5BpWz6tjEeF4dv9VVCrKVqc1dg
eUDt3xFu0A==
=a84y
-----END PGP SIGNATURE-----
