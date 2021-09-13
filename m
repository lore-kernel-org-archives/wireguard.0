Return-Path: <SRS0=Aoek=OD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868D4C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Sep 2021 22:52:04 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 993AD60F6F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Sep 2021 22:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 993AD60F6F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c197b9f9;
	Mon, 13 Sep 2021 22:48:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6e70eb26
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Sep 2021 22:48:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A110060F3A
 for <wireguard@lists.zx2c4.com>; Mon, 13 Sep 2021 22:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Tpwxekrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1631573299;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=kULBSkSQqOcWSADFPx1FL8mJt9SAKtXwz8T0w5G0GuA=;
 b=TpwxekrwNWSJrCzWzABx60sNu5YF/G/mOwFAi4LfkC3uhUAuV0Gjinb0c/2hL93t+SCgtC
 GRicvmhyBdUm3rpPlFlCXYpsqMh7cSljJU0tO8S02SRX1D6uFXL0hKaG6MwfLX24SLdh8E
 m9OUP3qrHCc90eHelpzTPqoC75KIcs4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a43a27e1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Sep 2021 22:48:18 +0000 (UTC)
Date: Tue, 14 Sep 2021 00:48:16 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20210914 released 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <20210913224820.A110060F3A@mail.kernel.org>
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

A new version, v1.0.20210914, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * contrib/launchd: fix xml syntax error
  * wg-quick: darwin: account for "link#XX" gateways
  
  Small macOS fixes.
  
  * ipc: add wireguard-nt support
  * ipc: cache windows lookups to avoid O(n^2) with nested lookups
  * ipc: remove windows elevation
  * ipc: windows: don't display disabled adapters
  * ipc: windows: use devpkey instead of nci for name
  
  wg(8) now supports WireGuardNT.
  
  * wg-quick: android: adjust for android 12
  
  Android 12 will ship with WireGuard kernel support for more recent phones,
  which is exciting. This commit makes some changes for 12. Hopefully there'll
  be a non-root userspace in the future.
  
  * wg-quick: openbsd: set DNS with resolvd(8)
  
  OpenBSD now has resolvd(8), so we stop writing /etc/resolv.conf ourselves and
  call `route nameserver` instead.

This release contains commits from: Jason A. Donenfeld, Matt Dunwoodie, Laura 
Hausmann, and Hangbin Liu.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20210914.tar.xz
  SHA2-256: 97ff31489217bb265b7ae850d3d0f335ab07d2652ba1feec88b734bc96bd05ac

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20210914.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmE/1QMQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrvTkD/9YPIHO9JrbsOJ+4tSfCYcErC1inNy+Tz38
t0wWyEY6xnG5w+HwEFMyG9QU4NpngTosc6UkD4I1tA0oTvUKZpzwhHII1lU0Qbsf
0iP3FMXjbGppSsHJQAIBA0XDcaEN0z63PrVKxbzyFahuAJkrTJkTK2kWiPDBc8kC
0LF235hR7lHp5YjaaonCScTlXwrEsb9infggr5NNwBGtIaOZagwsG76m4+TPePlB
A35OpeYTZFM/+niJoCfVaSsC5HRkqmISC0EFrZ2/MfYrBdnTQ3Grp9SVkuT1+7DO
GaBZGH7QrWerF7WIah48aXiOXPfaEKVaQFnMpt62ZWUfuOO+aOr8hmPsPglhpPWD
8kcYZbOGSdGeTxx4oqhICmYNbQev8BMc6i7+cg5B4c6fjxV6FnJToBfCg7PWq9in
+E4FE6FMhqeeSJxYmp4TVa8mUeHQ91UHgL954gjEkBg7PbMfRFOPvZtzhVlEr5TF
2keS8NgSvvVqdemw4ZdkjKcfWV77VLganpPGcpRNyIJPeKzljYHTaTxVMseaEB+b
75SFUqyo/po7lOBaLdALXhIIPfhY20LFbAdIZKEcGZJVnv8z4rXNTcBCi8GkzbpL
IPPdTSdq/zjpXMzURYrtjDDKuufhwm8ailtklfEp+5R3dD+rnmf9WGw2W0io6ENU
9faeh8o/jg==
=r/+M
-----END PGP SIGNATURE-----
