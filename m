Return-Path: <SRS0=Vhpd=JN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295F7C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 05:21:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325D961166
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 05:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325D961166
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0786e5a2;
	Fri, 16 Apr 2021 05:21:20 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 16e96394
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 05:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618550475;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TYzsbgD2FQ12oag+4V1Ho2Kk9SGcG/VZc718befae9c=;
 b=Nl5I8uCs9mAjeuJote5yfXFsvNQrmhyQtkez5CT+Kel6RAjAhfJWm0dBYNFl95nLZ2UgFw
 N4leqUIdhoJCuEeDAC6LkWnJOyiXDN0FCZbYDefi8mNph6wgv02bo8C9G/3HssM1eGpR57
 ckv7urpPgx5emiWGY2xroPxtTqzWqNY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c5e8294
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 05:21:14 +0000 (UTC)
Date: Thu, 15 Apr 2021 23:21:14 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210415 is available
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
Message-ID: <ef9b2fb320ad392f@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20210415, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * if_wg: remove peer marshalling from get request
  
  This is a pretty massive code cleanup that decreases memory usage on `wg show`
  and also simplifies the code considerably, replacing 312 lines with 94.
  
  * if_wg: allow debugging with `ifconfig wg0 debug`
  
  Users can now run `ifconfig wg0 debug` to see the usual debugging messages in
  dmesg, just like on Linux with dynamic_debug.
  
  * if_wg: don't check return value of WAITOK
  
  Tiny cleanup.
  
  * if_wg: do not allow ioctl to race with clone_destroy
  
  This works around some bugs in the core FreeBSD kernel networking stack, where
  clone_destroy races with ioctls and sometimes even packet transmission. There
  are upstream patches pending to fix this, but for now it looks like every
  driver works around it in its own way, so for now we go with an approach most
  similar to the if_tuntap.c driver.
  
  * if_wg: set multicast flag
  
  Following extensive discussion [1] with Stefan Haller and Toke Høiland-
  Jørgensen, the IFF_MULTICAST option is now set on the interface, so that bird
  can send packets using babel. It turns out that FreeBSD forbids v6 multicast
  address destinations, even when used in a unicast context, if this flag isn't
  set, which differs from Linux semantics. This patch combined with [2] from
  Toke to upstream bird will allow WireGuard to work with bird as it did when we
  previously used IFF_POINTTOPOINT (which had its own problems). I sent a patch
  to the FreeBSD port of bird here [3] so that hopefully if_wg is functional
  with bird and babel not before too long.
  
  [1] https://lore.kernel.org/wireguard/CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com/T/
  [2] https://bird.network.cz/pipermail/bird-users/2021-April/015415.html
  [3] https://lists.freebsd.org/pipermail/freebsd-ports/2021-April/120867.html

This snapshot contains commits from: Jason A. Donenfeld.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20210415.tar.xz
  SHA2-256: 40dae82e27b37e236f761a2e84f892fe10ee183227287e7affdd5be571a1e612

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmB5HrUQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrhkhEACgF5svIroYhrH23L9/XU9ndBmOqM9kc+ke
nx7w0x+jWdfOOvCRMbuS9LFLLTBfP+/y4igPpDVYi6Njl20YamcfmTa6mqNizpIg
TA5OCYKqOZSPEQynPz4pNtqFhT+ZqxquDgnNQB6RL9PfmVzDT4Jvk4/8IFF5f3ls
hjLa14cpL2MkrGvYbM5WPUo/3zXkHA6Ai1uzAAa8HmxZI8Dl3/L4EEoUXO6VeUK7
KI+EyelH7N8ZLZNKBTT7j0CcTtA26zbMY8VtNlAJBiYaSpktSaox3JcTtS9nRFU8
HOoherDDP4weHMcrr9En2VVkMGHK5F9EvgbpDGPGObLcXY8u/AU9xZTBxn7es7Go
AYtkOcr6q1QvIEtnzQT8hYr8umhq31QnGUuA50LhuSCl5WOPJWAU0+Y9CnszNeyO
KPgou/8zAE7VdUk4js3MXKXm5PbEEFMotqkluXHXYg8SRqyD+lYAi5G+wfc3iFgo
U//8HkAPOr81O32Y+clLsTkmM270QRiQ90UTOBAZPDBjHR+ScUzUa6uZ8GKWasjO
U8xMPw2t1DR1gYvPFQZ6O7VxVp4dL34GNmgrPFr9+pfsNyZ5nEMCYr2IBrHNwN2H
zSWDYyw8ySs053IWZOMIlXGDvKp4xqI0AK8ioHQk3kY87UtNrM1BN1kvQAz7CIhS
vvsCQq6Tdg==
=bgfK
-----END PGP SIGNATURE-----
