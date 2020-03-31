Return-Path: <SRS0=yWyP=5Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738CCC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 00:19:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A63206F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 00:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hvxHwDs+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A63206F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7be3d6c9;
	Tue, 31 Mar 2020 00:11:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7047ac0f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 00:11:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b61f38d4
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 00:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=5CCzmeTvWXrBw3g0U
 cRTm1A2tzg=; b=hvxHwDs+Ko+Aa293Qf0CR3iJehdlplfKlw5ze31Tao7Rn3O2x
 0dKrLGPUK7RzzjNgswMgmLlBGZbLn0/3gYmxwkAsi9OoU9UKWXCxXp6lOb6MwAXI
 /58E1JqjdmX+bDveK8RcUWrq1OOYLMhMRSoG8B16ni5fKxvBRhPVMUSZwWEGAtwh
 BmCJ15KIouU12G4h4kSQga16hUKeLvBd84wB9nyFX9rffu6bEiTPxlW8mSy6tPzO
 1NcSLAdoBfz31iNX3Exmwjx4dJD0JA1U1/b1zUWOUUh47KYlaQJak5kq6x+SKM+K
 OP9pdyuBzljOU6NjOSHUyWuz6nM3UmaAeQpgw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 58702ff4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 00:11:20 +0000 (UTC)
Date: Mon, 30 Mar 2020 18:19:17 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200330 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <38842e471ccb3582@frisell.zx2c4.com>
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

A new version, v1.0.20200330, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * queueing: backport skb_reset_redirect change from 5.6
  * version: bump
  
  This release has only one slight change, to put it closer to he 5.6 codebase,
  but its main purpose is to bump us to a 1.0.y version number. Now that
  WireGuard 1.0.0 has been released for Linux 5.6 [1], we can put the same number on
  the backport compat codebase.
  
  [1] https://lists.zx2c4.com/pipermail/wireguard/2020-March/005206.html

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200330.tar.xz
  SHA2-256: 2d57b239605be2ee0e4c2da935ff1a23e9ed8bb3ee692e10ae032ae50f280bef

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200330.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl6CjGwQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrqfwD/wJlEbOhYd1ixM3OI8Q2endXmJBRh9UimjL
F2moHwTzDM49o3xQpfgQuBFbZWK0L/JNTSlKxrmBLcX9fBJ2VERT1Nrnlh414Ovw
FLpmJt9gOWMF6hjlptXKaE/T0vRjzfLli2YzfzyvqMQg9hR/eRKlYhYWOu/fsm3L
UtmBm8wGdDeo7e119M0dnfcfboW2b3NKQX87/bWrAn21BL9F+JsNx8Ytx2a5cU8z
ZLj56sDWWclmoIXiLI1e+bKO9pXRXvfkSd11p5KK6knD8i8BtAn7uVVfda5VWxmO
xooFhNq75photRM0t/VAKhp7ji96pYwSQD6Kw91HPgBcptB29XoacUcpLs40TUx5
D7LpvYISKItZpPdfgSwIx3kyajBDmn8bpFZH8T+/cDsIvuJbdpGjP88Qr86JiKQ+
BiVmTW5nXWn0d4tQIbw2w34BVre5cLheyWZN3Nk6f7bfxjba52Qa85rrjPoCNWv+
PPsVTffIfAxk5ZavSuPUx+QMtmIqnC/bOb2WUn/+lukv+HVYYXO5GyHrfTqS9EW/
kw/2dC9pGSye6bz7KYTQwRHSJnaA+SDk2ZNFdlrsYaoFfuZJeaFMkiU3xpIYGllv
+v6rmQw/l0d4yZtHR6jmMV4qWeZetH0/5De21/syOQt8XuySjlkNVLRUPgIdZtKN
ak69693rPw==
=K43H
-----END PGP SIGNATURE-----
