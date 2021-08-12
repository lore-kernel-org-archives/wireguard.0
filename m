Return-Path: <SRS0=nWA3=ND=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9962BC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Aug 2021 14:31:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BF346108C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Aug 2021 14:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BF346108C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ka-fi.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 554bba7e;
	Thu, 12 Aug 2021 14:31:03 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.106])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a0c6bfc1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Aug 2021 12:23:27 +0000 (UTC)
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4Glm7L6xCyz795C
 for <wireguard@lists.zx2c4.com>; Thu, 12 Aug 2021 14:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ka-fi.de; s=key2;
 t=1628771007; bh=pCTNX/ZVPyjMIC2E15PML5l4sLTEPMKjxv3M7ZI1HJg=;
 h=From:To:Subject:Date:Reply-To:From;
 b=PeBQnWw+asbpFCXl2jfwpi15Ngm46JWQAnhG/slPnQVXVtWqGr3Hmj4YpO1krzwxl
 pfOG9acEnYUnvHWh+2ObD2PHDVzwnHFY9mNHP6Bzmr9PCRTVCoK8H3myPQzYibfc44
 gyfFmYwtubFtgzVJvSg9gVH0y11Pb2om4vPaMYVQu5+EGiPdH80Ip3Mk2VBaq8LLIz
 Rb3h2Tn0d5YhHZEO5V2mWf5enw+OtDbs0E6rhAAsSKNi8Mfj/e2ErK9QK3ot2FEe9f
 YQHyjM4+J7Qfqz/r6qDcQLkm9359c9L7WUA4ugxN3lxndwKhP4onN/7PXXkvdacnKr
 UJYJPBh3kQE9g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4Glm7L6bCwz78s1
 for <wireguard@lists.zx2c4.com>; Thu, 12 Aug 2021 14:23:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2e48.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4Glm7L36v0z8t3S
 for <wireguard@lists.zx2c4.com>; Thu, 12 Aug 2021 14:23:26 +0200 (CEST)
Received: from [192.168.1.4]
 (HSI-KBW-078-042-105-127.hsi3.kabel-badenwuerttemberg.de [78.42.105.127])
 by mx2e48.netcup.net (Postfix) with ESMTPSA id 702C21C005D
 for <wireguard@lists.zx2c4.com>; Thu, 12 Aug 2021 14:23:25 +0200 (CEST)
Authentication-Results: mx2e48;
 spf=pass (sender IP is 78.42.105.127) smtp.mailfrom=wireguard@ka-fi.de
 smtp.helo=[192.168.1.4]
Received-SPF: pass (mx2e48: connection is authenticated)
From: "Kai Fischer" <wireguard@ka-fi.de>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Wireguard Android is not working since Android 12 Beta 4 (Pixel 5)
Date: Thu, 12 Aug 2021 12:23:24 +0000
Message-Id: <em507732db-ef11-4d52-a054-041c04c32830@renderstation>
User-Agent: eM_Client/8.2.1224.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: <162877100582.17474.7637826817600498588@mx2e48.netcup.net>
X-PPP-Vhost: ka-fi.de
X-NC-CID: AoWuSkoSNqO90zO3HANkmJgcweuTW+phcuN98+XzNp+bIg==
X-Mailman-Approved-At: Thu, 12 Aug 2021 14:31:02 +0000
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
Reply-To: Kai Fischer <wireguard@ka-fi.de>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I'm not sure if this is a issue on the system side or on the apllication=20
side.
Since the newest Android 12 Beta 4 Wireguard is establishing a=20
connection but not data transfer is possible.
A ping to the host is also not possible. There's an offical issue here=20
at the Google Issuetracker:=20
https://issuetracker.google.com/issues/196271165

This seems to be an issue with a lot of VPN apps .
I don't know if it can be fixed on the application side.

