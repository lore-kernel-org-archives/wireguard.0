Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9993BC2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:35:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F013F206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.de header.i=@mail.de header.b="goRj+gbm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F013F206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=e.mail.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 516ab4ac;
	Tue, 14 Apr 2020 08:25:34 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [2001:868:100:600::217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8b8fdfc
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 00:55:13 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 940F8C00AB
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2020 03:04:58 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 7CBDB8002F
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2020 03:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
 s=mailde201610; t=1586826298;
 bh=SGxBM47xyCbwiT6apFaz0cyXBIO/bsq4xuOWNObe6qY=;
 h=Date:From:Subject:To:From;
 b=goRj+gbmb1CNE6EVGDcsKNaDUqSqCshuiKS6nekNjBAeQ6dTI59V3J6nh3fzvwjGk
 DvB5APNJUu7V93khiV37HePRmZdtC+/zLemm44q+wC27O2J8bkY7HTKXFX87aIw+le
 MV8epkFU1Q0G7TR1acXTA0WZqJRSn4TuQDXUNU+c=
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 4879BA030F
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2020 03:04:58 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 14 Apr 2020 01:04:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "szaimen" <szaimen@e.mail.de>
Message-ID: <08eb74400f4d94855ffd4390ac4a9eb3@e.mail.de>
Subject: QR-Code support for Wireguard-Windows
To: wireguard@lists.zx2c4.com
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 833
X-purgate-ID: 154282::1586826298-0000058E-DCE50E20/0/0
X-Mailman-Approved-At: Tue, 14 Apr 2020 10:25:33 +0200
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

Hi,=0A=0AI would like to propose a feature request specifically for the W=
ireguard-Windows client but=0Aprobably also for other desktop-clients; I =
hope this is the appropriate way of doing this since the=0Aissue category=
 seems to be disabled on github for this repo.=0A=0AI really would like t=
o see getting QR-Code Support for the Wireguard-Windows client since most=
=0Alaptops where you are most likely using wireguard on have a camera and=
 could propably use it to get=0Athe connection infos directly from the se=
rver without having to copy it to the specific device.=0A(e.g. when not h=
aving a second PC, this could work if you connect with your smartphone to=
 your=0Aserver over vnc and scan then with the laptop-camea the qr code f=
rom your smartphone)=0A=0AThis would be really awesome!=0A=0AThank you!
