Return-Path: <SRS0=ozWx=Y7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F925C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Nov 2019 21:52:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60692166E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Nov 2019 21:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEjFxdvP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60692166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e1a9e7c;
	Thu, 7 Nov 2019 21:51:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ac55967
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2019 21:51:51 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fc35c55
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2019 21:51:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c22so4195068wmd.1
 for <wireguard@lists.zx2c4.com>; Thu, 07 Nov 2019 13:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=KfMRTN9le52K1euKW9Ky9UTM9KyPzpVb60r/DOAQf2M=;
 b=NEjFxdvPZFN54RC1og2d7vxB2q6UAPjmmjHPoQrI+P+YauxrSHq10jzRtwaM/aHR/y
 b407OEvjtDtg/S6OjZYExXG4Brc7vO/+iGlJKmj9fmYl3AK4x4CYBMHKa5adJF7L6SD1
 mO+tjz1hKcefoUGbMHoWGKbh9R6leMC6iLRv3xc/q9tgeLetbint5za3yxqJS0BVXs6U
 /bwnQLTACsHzk/FLr/sqD7c5Xkag/qnY1qevYZ2BJPsN932VvCUriq7BlDTP1/6XUn6B
 S7U+kwXNZBvB2i4TEpEiJ5KR7KPbqheEIfHEYrkWAlZ7E0nXoV7dL+kCMLoe0WNNt/7+
 DVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=KfMRTN9le52K1euKW9Ky9UTM9KyPzpVb60r/DOAQf2M=;
 b=ptcQ1gi422EhlE9wJfhYXQ2tF9ZyUupA9sSkQAa+Mmbcc3XYBxBGU+XnUDjoI1lnMO
 KKAD4XcFf742SJW/q7P84PYr+GaqJ0XZmQmBP+gw+HxcdTxI33589GUVCDF1NC5AMU7o
 TnTB/3KUCwEanNaNflUNBjl70YxYSg5Vp/A9L8/jxocAa7NGJMaECc3zClom9Xk4XR+o
 TDCIRoCy6yCZAUe32fgH/6apdCL0KJyKf+9oszPW1oR8W6TU3AtY81j+4vVREdnyqEkb
 Nmc5WHqdPpm1HoeaxLy21J+ebOrBsRBbe7lF52bjymZLjbTAXBqHFd8AfbdLKSYkLzmJ
 7aDw==
X-Gm-Message-State: APjAAAXsgr2SmVoc+ZJEUG34pxjkFHycwA7xekig6fhjJboX5D29L8o/
 PcJenNWHkMOapROkeNKx4G/2HO6ybrkexA==
X-Google-Smtp-Source: APXvYqywRTzs6Uk0+hnw1ts4uZCorlXoeZ0R3CIAV0gmnUJcucm4KxtSVp2Zt0gx97fKvihhp7nlfA==
X-Received: by 2002:a1c:9917:: with SMTP id b23mr4999942wme.42.1573163509247; 
 Thu, 07 Nov 2019 13:51:49 -0800 (PST)
Received: from [192.168.1.100] (90-64-21-199.dynamic.orange.sk. [90.64.21.199])
 by smtp.gmail.com with ESMTPSA id 11sm4439791wmb.34.2019.11.07.13.51.47
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Nov 2019 13:51:48 -0800 (PST)
From: =?utf-8?Q?Adri=C3=A1n_Mih=C3=A1lko?= <adriankoooo@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Unable to retrieve tunnel information from the saved configuration.
Message-Id: <6BEB9EA2-322B-4782-A9F4-F5094B2AF9AB@gmail.com>
Date: Thu, 7 Nov 2019 22:51:47 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.11)
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

After update from yesterday I am unable to connect to my WG server, I get: Unable to retrieve tunnel information from the saved configuration.

Client information: 

App version: 0.0.20191105 (16) - 1.0.8
Go backend version: 0.0.20191013

Mac OS X Mojace 10.14.6.


Best regards,
Adrian
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
