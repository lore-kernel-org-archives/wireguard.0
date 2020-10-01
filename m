Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402E8C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:13:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE57020709
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mayam.com header.i=@mayam.com header.b="VsjCQBOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE57020709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mayam.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e9d75c2;
	Fri, 9 Oct 2020 11:40:12 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eccf2725
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mayam.com; s=20191106;
 h=content-type:mime-version:message-id:to:subject:from:date:from;
 bh=BMqKuRep29oPJ3AmeozicKQyJyaQcsv/dDVpRZvXMt4=;
 b=VsjCQBOuY/2sxyyBTvUzORghl3m/BTgHNHaUosItQszeGw1mqHUiqcVib6wTs8QEe+1WZDC+hmR3X
 noLOYzwKItYCtJ0QLZO6BQ/JvfvtR22x662upVneh1aboJV+KWli6003XYBfX7moXhjGezBWSm3Q9z
 xvmqfou7UqBEFpIHrQW7mkiMMNjX0sjm9z+XxeBjY2YZxxtcGas0NmT2Iq04BzK8w5fjzaysn8Bghl
 NAfGP71ph7/Ke+ZgtaF7sUj1hCOblMUJp/0WDHDOb6HlwgEGz5q4kOYVuic8ucNo9G4n9SUDI2tCps
 cMa+nNbv2pDqA35AvHmx01BOCZ2ssDg==
X-HalOne-Cookie: 3cc6263084fa22ff0d0140fcb8a328363de2d15f
X-HalOne-ID: 42150dc0-0416-11eb-9643-d0431ea8a283
Received: from locke.internal (unknown [2a03:1b20:4:f011::a12e])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 42150dc0-0416-11eb-9643-d0431ea8a283;
 Thu, 01 Oct 2020 18:45:22 +0000 (UTC)
Date: Thu, 01 Oct 2020 20:45:15 +0200
From: Mattias Eriksson <snaggen@mayam.com>
Subject: wg-quick leaking DNS on Fedora33
To: wireguard <wireguard@lists.zx2c4.com>
Message-Id: <FFDJHQ.8MYPV8KOQRZK1@mayam.com>
X-Mailer: geary/3.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Fri, 09 Oct 2020 13:40:09 +0200
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

Since wg-quick doesn't support systemd-resolved, which Fedora 33 have 
enabled by default, it will fail to set the DNS correctly. I have filed 
a bug against Fedora 33.
https://bugzilla.redhat.com/show_bug.cgi?id=1884352  , but I don't know 
how responsive they are regarding wireguard so it might be something 
for you guys to look at.

//Mattias


