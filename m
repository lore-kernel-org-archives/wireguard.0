Return-Path: <SRS0=j77k=JK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6322C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Apr 2021 03:09:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFF0611F0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Apr 2021 03:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAFF0611F0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80219b01;
	Tue, 13 Apr 2021 03:09:18 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 54d10be8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Apr 2021 03:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618283352;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=5tp/mo38Qi6CPtJ+0u9+fs1SApg+iL7r8XnfuIAVCNk=;
 b=kUt5yp6VQwEb0t4fS4r+UHVWdNQFJa2KHKlsna7kyGpDad1qEytEWjch34BV3DJVClcU1W
 IyED0GAiumA2Eys6gtS+nYyZYuwAzuUkrdQ6xyIk6oRGTG+/dHHTFr/0F6R4ob9MgSDwXC
 xAwUUcNXlQ2tUmW2tEJwIaBDNaa52tA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 472f07f6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Apr 2021 03:09:12 +0000 (UTC)
Date: Mon, 12 Apr 2021 21:09:11 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210412 is available
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
Message-ID: <ef99438165fa9aca@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20210412, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * if_wg: set persistent keepalive even if interface is down
  * if_wg: remove old link state check
  * if_wg: allow getting tunnelfib to race
  * if_wg: set user cookie and fib through proper sockopts
  
  Various state fixes.
  
  * if_wg: simplify jail exit logic
  
  Fixing the jail exit logic here means that you can set jails up and down
  without rendering all wireguard tunnels useless.
  
  * TODO: initial dump
  
  There's now a pretty big TODO list of goals before switching into more intense
  bug fixing mode: https://git.zx2c4.com/wireguard-freebsd/about/TODO.md
  If you'd like to help out, please get in touch!

This snapshot contains commits from: Jason A. Donenfeld.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20210412.tar.xz
  SHA2-256: eff7fdff89949ea294177fe9b18fde99a016fc4ad44aaa0f31ba6c2cff5ac506

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmB1C0QQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrvE4EACNi7dCF+GUOh1FsEqLmovrcWTLk4+w9lm/
AFOB8X2mC3IYjDC1TNin7AnlG07uRE6W8ocLGywDdUYjh6ahozRqjbDIO/ZTuUD+
lc7IlisbDJ4QhJPbbuYpVnztKllptRvfuhDT28hX8T+3xhH0zdK7YfrotraEMMrt
wiQSk4GNZvr+Z79h3Ev8vHv25EfzL8HNzg3k15kEPNsERvdcPdovSFYqAxS1+oss
6Z/L2OWlpCqVdOAwoQIxO1yWStxwEO8+x1SPHSDz8IS9lIrldPBgm277mEafo5u2
0jPd9D/9IS9tVgXFF9EcR/I5oPe1lUhpl193xEHgLnxlmD+H5ZhTi2Jud1s8MPmK
XmqSTE2GA0clEwE0y4evBgDxP6B8o1LBcRsF62RR/KPASYAqoteQBAmv78MtL98S
iluf4nGWwE+IrgSE1gfLbkHADo36GyX3a4jmEz5//IbjpnIzpuudqeH/p4d7QM4Y
4rS0egtkMF69cHtVdi98Xbi7vCDlXYEv1ikdi/mjAO5dr0sUoBisGSl0Uewje8Wl
Lo3367BJOl7jwTUhRGtlxt8duR8FyYRvYAbMh+NJHCDjhwIWsqYZ+VW8/26YF2VX
6zg1Ge41kVgFvNaqrRXFKlWTJO0k8VIywbOWK6CnfB9LjborWhRSGF+hLXuGrxGx
MxZAIgD/XA==
=1CAc
-----END PGP SIGNATURE-----
