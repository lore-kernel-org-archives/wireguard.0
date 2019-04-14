Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABFBC04AAE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6804A2087F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=z3n.uk header.i=@z3n.uk header.b="W54/EAy2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6804A2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=z3n.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17a5c22c;
	Mon, 6 May 2019 20:39:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3e28c42
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Apr 2019 17:17:19 +0000 (UTC)
Received: from m32-19.eu.mailgun.net (m32-19.eu.mailgun.net [141.193.32.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2912618
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Apr 2019 17:17:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=z3n.uk; q=dns/txt;
 s=smtp; 
 t=1555262239; h=Content-Type: To: Subject: Message-ID: Date: From:
 MIME-Version: Sender; bh=nrf2TOG+XJFXXpGpzl5aKTjJpjMIbPiP1fLrVGT0Ig0=;
 b=W54/EAy2ooMXj1EWutMAZKDlHHPPE9F03h/Ykpohruf81AWVpkkj+5Te6c0qPjLjzQzrZioq
 DVWMm2EKyBljmd+V8JCrG8yrFasKuCYX0sTS9hvasdWD23qrdc1i5H9jzWMZ4mQpwCprSRBR
 i+azguVG9AOsLenwbK2eIBJPuU0=
X-Mailgun-Sending-Ip: 141.193.32.19
X-Mailgun-Sid: WyI2NzAzMCIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImNjODYiXQ==
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by mxa.mailgun.org with ESMTP id 5cb36b1d.7faeb7f93c70-smtp-out-n02;
 Sun, 14 Apr 2019 17:17:17 -0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id w206so5537213ybg.5
 for <wireguard@lists.zx2c4.com>; Sun, 14 Apr 2019 10:17:17 -0700 (PDT)
X-Gm-Message-State: APjAAAW3os8LbhWq2Nx5aZawnX1M40aQiamijwPsaHGAminkdsVfnPvr
 g3O2JD2xogQKApIayfJm8XOakybZ+pf4Xg0Sm4Q=
X-Google-Smtp-Source: APXvYqxvVDFugsOXLj5QqM30YphBKF6Kor3/HiqXlZiw4xIj8f4pQBgNzom22LopUCzcw5SQpXmXn++tHFK4B1RR3mg=
X-Received: by 2002:a25:828c:: with SMTP id r12mr42088269ybk.469.1555262236458; 
 Sun, 14 Apr 2019 10:17:16 -0700 (PDT)
MIME-Version: 1.0
From: Will Tisdale <will@z3n.uk>
Date: Sun, 14 Apr 2019 18:17:04 +0100
X-Gmail-Original-Message-ID: <CAFWLA-XbDKtYHib8G2ujk7E+fsuPco9uX9NvPsu35Dd_HxVGyA@mail.gmail.com>
Message-ID: <CAFWLA-XbDKtYHib8G2ujk7E+fsuPco9uX9NvPsu35Dd_HxVGyA@mail.gmail.com>
Subject: Request to change IPv4 preference - mobile apps
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:39:06 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I sent a message to the list about weirdness with IPv4 being preferred
over IPv6 in the iOS app a few days ago, but it didn't get there for
whatever reason.

I've since done a bit of digging through the code and found that
preferring IPv4 is intentional, and it's also implemented that way on
the Android app too.

It seems a shame to hobble native IPv6 support for everyone just to
work around some peoples misconfigured setups.

My suggestion/request would be to change the apps to prefer IPv6 as
default, but add a switch to the apps to disable IPv6 or prefer IPv4
for those with broken setups.

Does that seem reasonable?


Cheers,


-Will
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
