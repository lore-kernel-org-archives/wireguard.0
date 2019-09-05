Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D33C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:10:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7371B2081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:10:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=coryfields.com header.i=@coryfields.com header.b="Lzn1aV7e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7371B2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=coryfields.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41eceeeb;
	Fri, 6 Sep 2019 19:09:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a9be013
 for <wireguard@lists.zx2c4.com>; Thu, 5 Sep 2019 05:11:41 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a7a1cbd
 for <wireguard@lists.zx2c4.com>; Thu, 5 Sep 2019 05:11:41 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id m3so689604pgv.13
 for <wireguard@lists.zx2c4.com>; Wed, 04 Sep 2019 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=coryfields.com; s=google;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=1//uDrvL0I5+Cw/gEebSuY1f1z9fsuzFnqEBNljOGg8=;
 b=Lzn1aV7ehy1j12m7Y3DBIKiU9cKHmEkv2BZ5M12fYwHhbX4KYi06L3LwMCAYD6Np2R
 AqL86jk3PHqtSVpGjl8vFycZTKQZUPhnIZed6FDfowWo+Hb7l2KvLCFlATOmBa2ytLgn
 Qk6qg79Uo5Z+NCTi5ItUKlU6Bv60q5IQsXSBghec/MbOEMcSaw/1s+sRLi0LTeoGHixy
 tQ0MzCGs2oZRDKLbhuYCx/HVHvYze9j1aW99eFSoLxnDkrf57/Z9fmeSCeUiAH+KYNN2
 d9vZr301bEMOlc+6pmn+r0vODm6jMKjQMguI54akeievo62DEx+EbHFlSpCY2wEF8UAb
 3OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=1//uDrvL0I5+Cw/gEebSuY1f1z9fsuzFnqEBNljOGg8=;
 b=tCAvdNfnIeXzPLytEsNWTgAUQBmCI6gmMlVprj7TcQt8sBUjRlEorXIPlnGOVz3bzF
 gefNN9x6YW9vB1d62dg9Av1F319cVfL489WqchCWq6+I7ujvqs1srCmeo7WZNqoO7ExQ
 Nb3rHPol+if9gjmVoD+eb7kpdPQcCDMyDeR0S1A55V69zfx9GOHfnucrD4B8G9hGS+ZC
 RGY+IVWO23nPOJV/TjIFiJthyH4jN+mEWINq6KDHS16+m1AVw7LWzvsIvJTjbU+mOA4V
 zDrBWSjcthMtf0LnWcKHx3LTDRSiMHKeLOQ6xc0KsGRCg+JVACfHiRQGmEIva+FE9RV/
 XYcQ==
X-Gm-Message-State: APjAAAVYv5Y78qMFp2sxaZ3llZlCS42SK8XTQBRicg6HRz1GWf4fkaUH
 C83qCdqAzI3iAMR24VOwf2PdCOGxdxGg56eRFU0Vb3k+MToFsA==
X-Google-Smtp-Source: APXvYqwLPbfli2Faj5VM7s7Xhwjhrk6eIApiZpBwuE/byfuXn54KJcP7BKarrPtldQ0OaQqH0brBcc1Z7IqsbsfHD0o=
X-Received: by 2002:a65:6281:: with SMTP id f1mr1377594pgv.400.1567660299858; 
 Wed, 04 Sep 2019 22:11:39 -0700 (PDT)
MIME-Version: 1.0
From: Cory Fields <lists@coryfields.com>
Date: Thu, 5 Sep 2019 01:11:28 -0400
Message-ID: <CAApLimgrYEmnRXNuOdnkPW=uihe325z5xzBAGGHZx-YB0L9CCQ@mail.gmail.com>
Subject: wireguard-android broken after update to Android 10
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:09:44 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: lists@coryfields.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2820318362539126303=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2820318362539126303==
Content-Type: multipart/alternative; boundary="0000000000004d4d480591c75bf0"

--0000000000004d4d480591c75bf0
Content-Type: text/plain; charset="UTF-8"

Today I updated my Pixel 3 to Android 10 and my wireguard vpn is no longer
functional. Everything appears to be working fine, just no connections.
It's a very straightforward ipv4 setup with a Debian host on the other side.

It seems maybe I'm not alone:
https://old.reddit.com/r/WireGuard/comments/bnx4yy/wireguard_tunnel_broken_on_android_q_beta/

Might there be some non-obvious new security setting that needs to be
turned off (or granted) after the update?

I'm afraid I don't have much other useful information to provide here, but
I can send a log file from the android client off-list if it would be
helpful.

Regards,
Cory Fields

--0000000000004d4d480591c75bf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Today I updated my Pixel 3 to Android 10 and my wireg=
uard vpn is no longer functional. Everything appears to be working fine, ju=
st no connections. It&#39;s a very straightforward ipv4 setup with a Debian=
 host on the other side.<br></div><div><br></div><div>It seems maybe I&#39;=
m not alone:</div><div><a href=3D"https://old.reddit.com/r/WireGuard/commen=
ts/bnx4yy/wireguard_tunnel_broken_on_android_q_beta/">https://old.reddit.co=
m/r/WireGuard/comments/bnx4yy/wireguard_tunnel_broken_on_android_q_beta/</a=
></div><div><br></div><div>Might there be some non-obvious new security set=
ting that needs to be turned off (or granted) after the update?</div><div><=
br></div><div>I&#39;m afraid I don&#39;t have much other useful information=
 to provide here, but I can send a log file from the android client off-lis=
t if it would be helpful.</div><div><br></div><div>Regards,</div><div>Cory =
Fields<br></div></div>

--0000000000004d4d480591c75bf0--

--===============2820318362539126303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2820318362539126303==--
