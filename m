Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C32DC04AAB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3FC20830
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKATK/2m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B3FC20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a6b5a8e;
	Mon, 6 May 2019 20:28:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2650a2f
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Apr 2019 16:14:33 +0000 (UTC)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 190a0bda
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Apr 2019 16:14:33 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id p20so7726287qtc.9
 for <wireguard@lists.zx2c4.com>; Thu, 11 Apr 2019 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5HsXp4uVvkti4zNg6p1xY9p2qDmfeqnKk0yTJgyKCms=;
 b=fKATK/2m5qdLp2EwVhjTM/PJDOwRBlG5eW1vRxQjYXZ4vsV7l1iTG1tBrFKVg/TP+7
 YjFPcSq0LJbX3CT/LzA4qaWmrKkqQgVJ/hITfHHtKr/qIOgkxwZb2vqcOtY/vMejH3Ir
 8R4VoTx4NZ/Xy9eUTxu5jc85K31yr8qyHGALrs3vku3b8wf2qan2WbSJnYd1uF8INU2B
 m280slUEAzWppQd4X8oqIuP63r/4VuaojlXodJmNdLWIamJSHIhQO8LkOgUJeoYpnPP8
 29FzOO+a5t3M8WH8bT7nNzDyCznVEj71DlXKLhwUWrGHfQKpMMfK+Yxw6hq2HtLl4hu7
 oWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5HsXp4uVvkti4zNg6p1xY9p2qDmfeqnKk0yTJgyKCms=;
 b=JQEMtjRzsPhHYgwuFr4tNXjRI4a0HJfCIYBAzKLtjuaXJc1aFIaK8KS5kJtZx+Si9p
 Ycd27L3gSf3Qgq5qEnaCt3Jyib5wjQXmYhvgkd17hrpg4Tm/qD/fDqcu8j/L9FfHzAg6
 5fYqLfsX7Ka5EJF5TKv801r/Fe2WLjgKipvpbY0hyQ19SHDd+eKBfUsOZqHDu+tyoAfU
 G2xfyyxYWSL/12V5fbd04sf5Xf2DR/RuoIk+/3zLy/QcxPkBInQX4mPqPvdniOfddbx5
 Tbs5V3qlre88mrqst0ahBn98g0Tvr9zqoS9nmwEfPIv2GjhL2BrGR8pqYIVMDX8aMhDb
 ZssA==
X-Gm-Message-State: APjAAAVsED5SPoiebOvLtiFcOnb0Z7QFIGdyM4EqZWOzLxP0jX6pO7ID
 wa85kUfM7hWOu8dozxI/wgTjWqkHnx52OPmm/lk1zolD
X-Google-Smtp-Source: APXvYqyrnE2D+w8gelWpD1nvAkSapLc7oaQssh5cYiYAT+0dWdNdEScvk3G4Y1UDRCY96OyI1TRG51XhcwLsbkfvYdY=
X-Received: by 2002:ac8:3957:: with SMTP id t23mr42517415qtb.331.1554999272637; 
 Thu, 11 Apr 2019 09:14:32 -0700 (PDT)
MIME-Version: 1.0
From: Luke Hamburg <luke.hamburg@gmail.com>
Date: Thu, 11 Apr 2019 12:14:21 -0400
Message-ID: <CADnbd5jx0PtvG3Vuw8MMnfuXmO184+1J_UAWgud7A7wvfwnnHQ@mail.gmail.com>
Subject: Mac AppStore vs real version string mismatch
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4568875881539510554=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4568875881539510554==
Content-Type: multipart/alternative; boundary="0000000000004589c30586437b44"

--0000000000004589c30586437b44
Content-Type: text/plain; charset="UTF-8"

I know this might seem pedantic, but would it be possible to keep the
actual version string of the Mac app (the CFBundleShortVersionString from
WireGuard.app/Contents/Info.plist) aligned with the version string posted
at the Mac App Store? What I mean by this is: that yesterday's release of
version "0.0.20190409" is listed as "1.0.2" on the AppStore -
https://itunes.apple.com/us/app/wireguard/id1451685025. This causes a false
alert to appear in an app I use called MacUpdater
<https://www.corecode.io/macupdater/> that keeps me informed of app updates.

--0000000000004589c30586437b44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I know this might seem pedantic, but woul=
d it be possible to keep the actual version string of the Mac app (the CFBu=
ndleShortVersionString from WireGuard.app/Contents/Info.plist) aligned with=
 the version string posted at the Mac App Store? What I mean by this is: th=
at yesterday&#39;s release of version &quot;0.0.20190409&quot; is listed as=
 &quot;1.0.2&quot; on the AppStore -=C2=A0<a href=3D"https://itunes.apple.c=
om/us/app/wireguard/id1451685025">https://itunes.apple.com/us/app/wireguard=
/id1451685025</a>.=C2=A0This causes a false alert to appear in an app I use=
 called <a href=3D"https://www.corecode.io/macupdater/">MacUpdater</a> that=
 keeps me informed of app updates.</div><div dir=3D"ltr"><br></div></div>

--0000000000004589c30586437b44--

--===============4568875881539510554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4568875881539510554==--
