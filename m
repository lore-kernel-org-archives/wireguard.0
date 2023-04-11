Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24285C77B6F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Apr 2023 10:27:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07a9d486;
	Tue, 11 Apr 2023 10:27:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aa6aea23
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2023 10:27:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3183061ACE
 for <wireguard@lists.zx2c4.com>; Tue, 11 Apr 2023 10:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CCEC433D2
 for <wireguard@lists.zx2c4.com>; Tue, 11 Apr 2023 10:27:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SCqjIMtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1681208848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=QlSTrmMe32ZyHtdQOVBcwM8f4hG9XvrbaYZGwvT1w6Y=;
 b=SCqjIMttXuStW7DtJ1QTQoc+jOc0uU0AugSCsPgEtrp1yjBkqcUq/aGDqA53B5FQWys2ut
 LllpConMjZn69vT5tV2FuD892pSu2mTuDFs71kqUhpuheeGykKKegB/O9bEJATM3EoAn8Y
 agjm8CdEmUKprx6nHEJiXR6liF7NPqM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86793f09
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2023 10:27:24 +0000 (UTC)
Date: Tue, 11 Apr 2023 12:27:21 +0200
Message-ID: <c77bea9c315db7b4e2373b790bd43427.Jason@zx2c4.com>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: Jason A. Donenfeld <Jason@zx2c4.com>
Subject: Android Reproducible Builds & Signing Key Changes
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi folks,

The WireGuard Android app can now be reproducibly built, so that its contents
can be publicly verified. The F-Droid project now does this verification, by
comparing their build of WireGuard to the build that the WireGuard project
publishes. When they match, the new version becomes available. This is very
positive news.

As part of this development, we're taking the opportunity to unify the signing
keys used for WireGuard builds by F-Droid, the Google Play Store, and
elsewhere. Previously, F-Droid would release builds using their own signing
key [1], and the Google Play Store would release builds using yet a different
signing key [2]. Moving forward, both F-Droid and the Google Play Store will
release builds using the same signing key that the WireGuard project uses [3].
(That signing key is held in an HSM, details for which I dumped here [4].)

This means that it will be trivial to switch between F-Droid and the Google
Play Store as a source for downloading WireGuard, as well as for receiving
APKs directly from the WireGuard project, should we ever move to provide that.
It will also let the app be bundled with ROMs more easily and still be
updatable through any channel. And because the builds are reproducible,
interested parties will be able to verify that they're receiving the same code
from all places.

However, since the signing key is changing from the respective app store keys
to the WireGuard project key, a subset of users will need to remove and
re-install the app using this basic procedure:

    1. ⋮ -> Export tunnels to zip file.
    2. Uninstall the WireGuard app entirely.
    3. Reinstall the WireGuard app from the Google Play Store or F-Droid.
       * Be sure to install version ≥ 1.0.20230405.
    4. + -> Import from file or archive -> Downloads/wireguard-export.zip
    5. File Manager -> delete Downloads/wireguard-export.zip

But most users do not need to do this. Specifically:

  - Google Play Store users who do not care about interoperability with
    F-Droid or other app sources do *not* need carry out the above steps, as
    the Google Play Store will continue serving updates using the old key.

  - All F-Droid users (and users of alternative Google Play Store frontends,
    such as Aurora) with WireGuard below version 1.0.20230405 *must* carry out
    the above in order to continue receiving updates from anywhere.

Hopefully this is relatively straight-forward and not too much of an
inconvenience by those who care. I assume that F-Droid users are in general a
more technical crowd, and should be able to manage. Please let me know if you
have any questions or concerns.

Regards,
Jason

[1] Old F-Droid signing key: d2ccbdf13c52e8905b02d9770dabae0b9d76ecdfe7533814134273ba959e2d3f
[2] Old Play Store signing key: 79758d2ae9cd8b9107c0f6e67ff9ff02d255f9191c5e83202129ec081b4960fd
[3] New WireGuard Project signing key: 84a13fa2c4e0064b0c11654b8a86574b7a9b9352a3834cee32455b061c3d4127
[4] YubiHSM APK signing details: https://github.com/Yubico/yubihsm-shell/issues/329

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmQ0GNsACgkQSfxwEqXe
A64uLhAAgNf96W4ogBcx31JJ+jtwrPB2J22hY+K4K5enBX2Jk0J9j9Kgq3SB74sl
3eg+X1OYypwkKhJMVhBh9LEdaqGCJHYUXc3B/tG0r9XXlYiMaOwry3GA72mPyOaQ
vCgDA6t0a3WkUdib1sArL6Gn+T4w83I3GwbvvkQ1ooidHUtYJ8PsBw5619JSk/fC
MfuPekg5+qfkTcd6dsWzK9O1GTEYO0c4NYubEva5d4VDU2V/cIbfWUCDi3+rMFgx
F1dKMnZK0BWHc6AR7CcFFz1PHGUAPN8plZ2nObVsB9PW2wFq9hOXDJDI+5Sc8XjF
FvG94yoiy7a/iWUfl7e7rllOanXPWdoiUKhX6j5Wsj6N+5+E039TpBN9LWtax7ES
ms1NsbycV0bde+oh6rJud9RcrjXGbN8X/LdYYbZ/Z0F2B84fwzkSC+63EEHpeKOj
uK6Ztc40yWLSJg6YnE4rn0hRfT+jsINXtCV/UcXk+4/asQC6O2EALMTQ83Wc6ONY
MwAPIOFmtUKwgtOBcgsN6RCfyTYLUp+/fz17UtUShUnaK+Zl9NDuRuqLPdKn4mRc
qLm/hBXA8FuqeVdMeQJfw/Xsffij3Yi+ILkBWfw8FqYJ6EUxOk49q0Sx0xF2GrzO
sQfBLh75qJYlRaUhk/WtP3FSWbWbk90j5GcFU7OB4o2X8PKs91A=
=huxB
-----END PGP SIGNATURE-----
