Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AAAC77B75
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 May 2023 12:43:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b25286dd;
	Mon, 15 May 2023 12:40:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6f53feaf
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 May 2023 12:40:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F96461336;
 Mon, 15 May 2023 12:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CA9C433EF;
 Mon, 15 May 2023 12:40:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="j5f5COxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1684154444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=mNAb4Wekm0nmVgb6xJUdHBLap9TU/y7zwBEGDTdyy/g=;
 b=j5f5COxX7IrgGWjpMPX+VK/sBoFV80MdI/UGnY80LaiYSrloemMsUUo/uvr8K2HB4zeBCf
 sBImCBEcYpAgatug/NuSSDKvBy7L/aWWOtzNs4EZsbAv4ohv0clEtepm0x8tlRGFZwF4Wo
 KnUhSAd1kdbkPlwk46LdxNkhd6jKDSI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2edfe9f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 15 May 2023 12:40:43 +0000 (UTC)
Date: Mon, 15 May 2023 14:40:41 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: Direct APKs for WireGuard Android are now available
Message-ID: <ZGIoSaDgYW91wCsv@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

By popular demand, on <https://www.wireguard.com/install/>, there's now 
a (somewhat small) link in the Android section called "Download APK 
File", for those who want to sideload the package or bundle it in an OS
image or whatever else.

The recommended method of installation is still of course the Play
Store, because its updater is known to work very well across devices.
But now there's a decent alternative method.

The new direct APK download and the Play Store are the *only* two
supported installation sources. Alternative builds and alternative app
stores aren't supported (unless they're shipping the direct APK file
that the WireGuard project provides).

You can verify those direct APK files using OpenBSD's signify(1):

  $ cat wireguard-android-release.pub
  untrusted comment: wireguard android release key public key
  RWTAzwGRYr3EC9px0Ia3fbttz8WcVN6wrOwWp2delz4el6SI8XmkKSMp
  $ curl -O https://download.wireguard.com/android-client/latest.sig
  $ signify -V -p wireguard-android-release.pub -e -x latest.sig -m latest
  Signature Verified
  $ read _ file < <(sort -k2 -Vr latest)
  $ curl -O https://download.wireguard.com/android-client/"$file"
  $ sha256sum -c latest --ignore-missing
  com.wireguard.android-1.0.20230512.apk: OK

This is the same Ed25519-based signature mechanism that is used by the
WireGuard Windows client. The private key lives in an HSM [1].

Jason

[1] https://marc.info/?l=openbsd-misc&m=155723329924761&w=2
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmRiJ/QACgkQSfxwEqXe
A669fg/9GnopO43uXGIB6T1IZbY1WkIDZt7pMdq52rypqMq9PwG4HK+kQbGJWJYC
IBW9v3ae3uhVhX84Qnke7RJ3aYVMltfyp0BoTzsIsyk4v4U8KguGchdI5Mn59sj/
2HSUVMQ9+5n7SCQqsJp9CW0GSBoME2AU1zzjEyzwr1SM7zq/5CCLEBvMsImhP0rw
n1Vzb0o24CUNyiNbNy4op4eEAuLs8lpfj95qs0kpaLM2vH13LBeO0sKHdKUQe9dd
iOJRXBrx8FAy/kwweycFww6KhGtO1fKzWwLyAwEhKvvcBC+kBhFfEU/mO6iIuao+
YQ8VDw4uSaHrP3RFBFxVUlcMhI/ytShwnW2CIuKd1/tpCk9Pdq5tg+QQB5FqVv0A
evAhjuI0ggzmsEpnh9ldYDWCDViKBz7TdBYgsQ+lW4lwQLNIAn3jzqHTSLNtJPY2
Obw9E5PvZK/kw+cHbZJP4mRXpSl2sLL6HocDPUwRWNwEFAVawHlPNSkaNhiiWpmg
HO0m7FMh7NP7R/IVA+7ULaUFL3X+R9d66znn2uoGwU783FQFlfKb4X5CCsP8h3+A
YoJJ5v7328LHc6tajprvPSEH5Lt0ok+4cKxq/wAQb4AI2SUIFW77MRmM44q2TYrd
mr0v2FmZxOlTdENn5lMyj2580k9E41zuH85/Pz0VxmgdbUuGqKM=
=ACE8
-----END PGP SIGNATURE-----
