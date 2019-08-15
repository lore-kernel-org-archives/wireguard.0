Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_KAM_HTML_FONT_INVALID,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BC4C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:29:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA0D9206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGjXXr/6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA0D9206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 104cf409;
	Sun, 25 Aug 2019 15:29:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f22b0da
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Aug 2019 05:15:28 +0000 (UTC)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a89d8ba
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Aug 2019 05:15:28 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id c34so3491769otb.7
 for <wireguard@lists.zx2c4.com>; Wed, 14 Aug 2019 22:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=s3bDFyBgZ3WtQWZ3TcFv1Vn4myCBfSGO0UImjx/Giq4=;
 b=TGjXXr/6x6rJV+ZLRsozT3blE5MUdJoKBWBQEVrd77QzcT1Ox8Zp0jko+L6m/ns7yi
 PUoUKxj9bXU9aI4zU5kNwfXJwUTScYPX++QDRarVRACFG80pX3sDKX/nKF6M08fQrwdP
 BOpIfyj2OtpgOXl5ocTUEtIGy0nav95Dfkjrk028DLojlnlBVLTKoyAMReSWm8+e+kBW
 c1yRPJkCq/rlFAmW0h4/D3z3J5QVu7N4L0W5J8l0rTmq1uzS0GPvzaiEar493WfVTMo1
 BqIR5lpmBht7QCkuCTcATQ7yojpAZ3xidK8f5e0WVr85OtKUJ2wTakAyD0WuIZQZ3biU
 H3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=s3bDFyBgZ3WtQWZ3TcFv1Vn4myCBfSGO0UImjx/Giq4=;
 b=Apcf0HgIEMI/q109hpu2jZxHN9XxSGRLFRiPYBcdpXETtY1Zt8c00hoUK1ESQ5VbSy
 wqWuCf90hVlHECgEHbZi7AtTj+Ofeq9KyEOtzrPbciwaOiO+d8v9Wm3sKNCYGCuh4Sfn
 MIOhMflIpjliS9ZAKeuWIFJ8YvdBC9Mv1I1GPfoAeYvdJVZ2E4OZvkNq1pJt5lYx0CMC
 OmsQrtUOUEzkTdZSwhcd4uYEOP8B5h7cW3SDcsRk3vrp9a5iOk26InV53a7YcEeZRAkz
 wFjFGwtU4fbLHBMHaEa7zlLGubRa74xSBLQWIG+V5hEMCowibtVC+ytgF/vy67bHJIxS
 13uw==
X-Gm-Message-State: APjAAAWAK3FOmw34KVZBP0aKMpx/nPQQBtMVsT7R9ecDjUpMx9S2S1i4
 qpAFPVJRkAskt2N1WMz0wbHA/lJwKngOeYpdbD4xW1kJvto=
X-Google-Smtp-Source: APXvYqwTI1DHNViof9omn0DLQWSszJcpIibdP5vi4ac8q1JKDwiabdi02I4HDqJGBGZH/WYe3NMsKmGDREFFmQR5dkw=
X-Received: by 2002:a6b:cd07:: with SMTP id d7mr3526473iog.150.1565846128077; 
 Wed, 14 Aug 2019 22:15:28 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5pu554Wc?= <cao88yu@gmail.com>
Date: Thu, 15 Aug 2019 13:15:17 +0800
Message-ID: <CACu-5+3DggeZ=iBJPrDK-TGSrCO0s7n-eceai0Tvv8dzBvu0aA@mail.gmail.com>
Subject: wireguard on openwrt with mwan3 (multi ip address)
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:29:25 +0200
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
Content-Type: multipart/mixed; boundary="===============4372200901673967202=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4372200901673967202==
Content-Type: multipart/alternative; boundary="0000000000003caf06059020f616"

--0000000000003caf06059020f616
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm using wireguard on openwrt, and I have multi wan links. When I use
wireguard as a server with mwan3, the wireguard client won't handshake
because inbound interface and outbound interface is different.

Details please see:
https://github.com/openwrt/packages/issues/9538

How to fix this issue? Thanks.

--0000000000003caf06059020f616
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><font face=3D"arial, sans-serif">I&#39;m using wire=
guard on openwrt, and I have multi wan links. When I use wireguard as a ser=
ver with mwan3, the wireguard client won&#39;t handshake because=C2=A0<span=
 style=3D"background-color:transparent;color:rgb(36,41,46)">inbound interfa=
ce and outbound interface is different.</span></font><div><br></div><div>De=
tails please see:</div><div><a href=3D"https://github.com/openwrt/packages/=
issues/9538">https://github.com/openwrt/packages/issues/9538</a><br></div><=
div><div><br></div><div>How to fix this issue? Thanks.</div></div></div>

--0000000000003caf06059020f616--

--===============4372200901673967202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4372200901673967202==--
