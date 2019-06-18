Return-Path: <SRS0=lEMV=UV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640E7C4646B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 07:50:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF792089E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 07:50:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=riobard.com header.i=@riobard.com header.b="joqMrQmh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF792089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=riobard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5fe58db;
	Sat, 22 Jun 2019 07:50:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b4d432a
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 23:26:59 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 711e8462
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 23:26:59 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u10so10538467lfm.12
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jun 2019 16:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riobard.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=8mZGJ6gvKDZBvkMDB9J1SwGhVfUtueD+3cDAMSTQhkY=;
 b=joqMrQmhyd11B/me6EAPcHIaRoUty4Qv5ak7CI0/jInBTniJPcG5jPIVK0bOTwzZc4
 fD6VspnBKR/NsTyq65pFDzTmfX3gemx1Bdq5ADEIc8Admc297JLHs/NPjmbhuIuPXClx
 Uj3P7c87is97wHvo216c5JpxePcBqAICoUdCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8mZGJ6gvKDZBvkMDB9J1SwGhVfUtueD+3cDAMSTQhkY=;
 b=ai8f4xHQLSlaTRZR3ptzFbPc6/A97+K58VAEl4EeMV+uZMx2dikWqzka+/PtoGCYDJ
 vwmLtZMEOb01gjAFb3JR5yO/SSCKRcNGHigkKRtmDTbMVFc7sa/f8KRORNMgP7crm/t4
 lv9yDoJBs6A45gengQkKiPCWw2O0D33Ac1LR6gBzkW4XPrb5TUtTEG+6EHdL30Iyjc5y
 FVFNrS2osnK0f0usqtlUMQ0rcQcqB06Zz+dNMnOniSHoSRma77hFQJVpza+YasV4eoQu
 X2xOLJIRhbTQ1W792vVyO7se9FWX/sAlxZmwSV+HOWQ4tchNPvjP1hSODgoM0jXqdr7Z
 sexA==
X-Gm-Message-State: APjAAAWD216SPlsM7pNMuAACRfsjtZrc7H/BPw8O9De1jNDyMEPBiDv6
 /Ag1hsaC/eSnoT3IRDrNkjgUHpQw0EqO0cDVdS2OVGcAc8I=
X-Google-Smtp-Source: APXvYqxj2RqiyqvLrL/f3qEoGyGzMbJqcXBrNNwID5bXumhxg2nWgGclmFGmAmBErNHOkCoOQGXf8hbLGcEqD8olObk=
X-Received: by 2002:ac2:42ca:: with SMTP id n10mr19923957lfl.121.1560900417719; 
 Tue, 18 Jun 2019 16:26:57 -0700 (PDT)
MIME-Version: 1.0
From: Riobard Zhan <me@riobard.com>
Date: Wed, 19 Jun 2019 07:26:46 +0800
Message-ID: <CAJxHB+0SvOBvZBkf6N9eyLXC8Hu1dHKgEawAL3QyCt7YKNi-pA@mail.gmail.com>
Subject: WireGuard no inbound traffic after PPPoE interface bounce
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 22 Jun 2019 09:50:24 +0200
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

Hi,

My WAN interface (ppp0) is a PPPoE link. When ppp0 bounces (trigged by
sending SIGHUP to pppd so it disconnects and reconnects due to
`persist` option) with the same IP address assigned by my ISP,
WireGuard no longer sees any inbound traffic. However, if a different
IP address is assigned by my ISP when ppp0 bounces, WireGuard will be
working fine. This behavior can be reliably repeated on Debian 9 and
WireGuard 0.0.20190123.

I'm wondering what could be the cause and is there any thing I could
do to mitigate this? Thanks very much!



- Rio
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
