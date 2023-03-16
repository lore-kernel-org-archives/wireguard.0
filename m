Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E355C6FD1C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Mar 2023 16:38:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ae80bd2;
	Thu, 23 Mar 2023 16:38:30 +0000 (UTC)
Received: from out-4.mta1.migadu.com (out-4.mta1.migadu.com [95.215.58.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 90db3a4a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Mar 2023 17:08:23 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=augendre.info;
 s=key1; t=1678986503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SKXGLlyXGgTovMTbDOJ4FukrZ1iSbMC8J9Kxtvmz+Mk=;
 b=FOQsMnNh4+OXmuOtD/bzmuMQYe+WNdxYdBdnsyvAuEBJT7ECEAcrryC/Wng/jPuVN2kvb0
 Lt+RRvtgHXShKcThtH/COQ163aqTlF9k+pqIM/HUFZYP8777HOSv3JbwQmh3bLoHnR3Zyi
 Og9Ojhj8GQPPzZmfiHmj4+ZG3nMTWtjN96P2P5mauf4nwJYeZxHBazVrcZVRdmy6XxdR5S
 XrG3VfjU7tJRHsi+DmiIpxa6mYo+lqlPxVlaNXSRpGWOvqzTue+iRVw9YGVcTOKtLtSYEh
 ID59WjAiUVyBHH9kopf+eQXlFHLLbN9FP2OqUruDUxWOiHknEenJNQtWIRjUxQ==
From: Gabriel Augendre <gabriel@augendre.info>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: String tunnelListCaptionOnDemand missing translation in iOS
Message-Id: <CB3C1986-2AA8-4B72-9E18-FBF586C9A651@augendre.info>
Date: Thu, 16 Mar 2023 18:08:11 +0100
To: wireguard@lists.zx2c4.com
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 23 Mar 2023 16:38:25 +0000
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

Hello,

When trying to enable On-Demand in iOS, I found a string missing =
translations.
A screenshot is available here: =
https://cloud.augendre.info/s/pCFWiLDZBf8w6Fo
It only appears like this on non-English languages. Switching the OS or =
the app to English displays "On-Demand".

The string label is "tunnelListCaptionOnDemand".

Regards,

--=20
Gabriel Augendre

