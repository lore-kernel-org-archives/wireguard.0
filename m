Return-Path: <SRS0=wFle=CR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_RANDY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C53C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Sep 2020 16:26:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B52206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Sep 2020 16:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LVoM3p58"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37B52206B8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d6b6189;
	Tue, 8 Sep 2020 15:57:32 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3d0a8e7c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Sep 2020 15:57:31 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5af34e02
 for <wireguard@lists.zx2c4.com>; Tue, 8 Sep 2020 15:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=PESnP+17TQwjCIPvP
 IBeA5o6Rx4=; b=LVoM3p58YNnXiZgWUyroO2MMqevlouChA53Z04jVBYa+cPe22
 Ugq2SETy0xJOEkIhgjDeKBJvn+mw/zUSeze9yg64c1hJBCoFM8SGdqtMGBVZ+RLv
 XWjHTrIOhlJ9nHRO+um7g1B5m4A4OP3W54apHcJpMqVKYSJL+TvDftv5IadBucMD
 WUi4AVfeDKS9g8hte5KHWVXs6pKrzyIWAIeUZEOSQwbCagFmTRuK1pxslXwCwLvs
 QK/EnIgFIPO8JRw6LQANYSAlDC6rdlEiL78GMQB9QEiDHf9ZHVRNIR46Uo+lFtQ4
 sKJHcNMxWEMR9I1M9CeAiRihUrtpYBrqhmlhg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4bf41bba
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Sep 2020 15:57:30 +0000 (UTC)
Date: Tue, 08 Sep 2020 18:26:23 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200908 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <0e2845d19624a97a@mail.zx2c4.com>
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

A new version, v1.0.20200908, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: drop support for SUSE 15.1
  
  Now that WireGuard is properly supported by 15.2 and people have had
  sufficient time to upgrade, we can drop support for 15.1 in this compat
  module. If downstream wants to still support 15.1, they can just apply the
  revert of this commit for however long they need.
  
  * compat: backport kfree_sensitive and switch to it
  * netlink: consistently use NLA_POLICY_EXACT_LEN()
  * netlink: consistently use NLA_POLICY_MIN_LEN()
  * compat: backport NLA policy macros
  
  Backports from upstream changes.
  
  * peerlookup: take lock before checking hash in replace operation
  
  A fix for a race condition caught by syzkaller.

This release contains commits from: Jason A. Donenfeld and Johannes Berg.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200908.tar.xz
  SHA2-256: ad33b2d2267a37e0f65c97e65e7d4d926d5aef7d530c251b63fbf919048eead9

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200908.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl9XsFUQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DruUeEADc1LXeIOzKtEZnOk0gGgPfNlAH229Rzf5m
FkvRgpvCtVysf6JHo2TtsvzVYwibV1tR5HaV2J8y6u1rZZ3gWYmQKR3Eb/v7EIHD
55x689YPbv80t4bzUR691msDVfDzM8z81Y9dzWIh+qCs2FljxmGIoP2y7amXzfyP
CW4Lb1PFyfuNP+Cae7qHYrzUhwD81xzKOyJ5uaASK34iZGolqPaqKX4L+CDnDQ1x
7GZdlMo1w/raNY6I/fAffTdcyfdslXR3uNrwhrfiU1M3heKFEAxI76D+r/g0jqq2
GRCNvyr+G893sa+Xi4PD6XtbySfiYZXD9DDkG0Wo08oUy9IkxjatVRR0XZGdR9LN
U2/VmVDyWugIesrtr3C0hW69TZ2e85TVbLCkK0KdUYpl+VUjX2FlUwXJT5PqbIDf
161Jw6alvK89hNMC2tfgOAN794trQRdA/UPoBNazOW2P9WI5Al98K1g+haLyCUot
SP2xYFr3TqNmF9oNSBpj/RyKoExsYjSQTk34tmWTE1gQRBNXxkFzbCPGEf4BCF6j
BQXEomRrUA4AHkwKzk4hsrFAyxxBwOBc9+L8fC0M319iZsVCNd0bBGXuVMQ3K+Vp
SxSHUjd24Ns78LQJzR8rawMehZIe5tSeXnDAuTUkr+qwOYAE0MmjKkrFBUbsrDMu
9ECSppmVWw==
=f923
-----END PGP SIGNATURE-----
