Return-Path: <SRS0=IPCm=D5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3C7C388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Oct 2020 16:10:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7176F24182
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Oct 2020 16:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7176F24182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ovpn.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3bb5e1a;
	Thu, 22 Oct 2020 16:09:08 +0000 (UTC)
Received: from smtpout-51.fbg1.glesys.net (smtpout-51.fbg1.glesys.net
 [2a02:751:100:2::51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0e2c8b8a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Oct 2020 16:09:06 +0000 (UTC)
Received: from MacBook-Pro.local.mail (217-64-148-82.pool.ovpn.com
 [217.64.148.82])
 by mail-halon-02.fbg1.glesys.net (Halon) with ESMTPSA
 id 12f30c23-1481-11eb-b524-ebc997f73d07;
 Thu, 22 Oct 2020 18:10:18 +0200 (CEST)
Date: Thu, 22 Oct 2020 18:10:11 +0200
From: David Wibergh <david@ovpn.com>
To: wireguard@lists.zx2c4.com
Message-ID: <etPan.5f91aee8.f1a4b3.1474c@ovpn.com>
Subject: [Android] couldn't find "libwg-go.so" on Nexus 5X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

We noticed a crash on a Nexus 5X device using=C2=A01.0.20200927.=C2=A0

The error message is:

RuntimeException: java.lang.UnsatisfiedLinkError: dalvik.system.PathClass=
Loader=5BDexPathList=5B=5Bzip file =22/data/app/com.ovpn.android-xxx=3D=3D=
/base.apk=22=5D,nativeLibraryDirectories=3D=5B/data/app/com.ovpn.android-=
xxx=3D=3D/lib/x86, /system/lib, /vendor/lib=5D=5D=5D couldn't find =22lib=
wg-go.so=22

When downloading the specific APK for Nexus 5X devices, we noticed that=C2=
=A0libwg-go.so is not in the /lib/x86 folder, but in the /lib/arm64-v8a f=
older.

Thanks,
David

