Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61013C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 21:17:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBB264E24
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 21:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBB264E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 296ac9e2;
	Thu, 25 Feb 2021 21:17:14 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [5.45.107.185])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 50eceb29
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 21:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A96AE23B3
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 22:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1614287832;
 h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=2BhYOmuNAnJ0mmPl09MUaQmc2+zMTRtSc2bW3qKHoiU=;
 b=igNfY9ALS5wDxbavy7VIsEADJwuf7oyuWb+qj2V5dGWq0VQZoOvuMgzoKkl52AddekVNx6
 OBXF5EeI1RAIpN+SldkdvcWO2CZ39rch+qwNShrmgzzV2bhcmpt3UBceKhxJOiqrUH+N9x
 PT3pU7hWr7/M1HXbZQBP+A0hJOgwfJBwSm2ASt77frC7vaHl7fObI1+9Mvz/uGIzCagSf1
 x5nJjYGTj6DXn1NgwO2myVaedUGP8Zw2akSdUfeyzJoJ1/DpsDamvR598AXyYEOYKSwWiL
 AJGUximpWXpejktd0OXfe93WK2EHMJxrLcSfdCL56TRHobr5x/0YBl+mz2YeGg==
From: "Joachim Lindenberg" <wireguard@lindenberg.one>
To: "'WireGuard mailing list'" <wireguard@lists.zx2c4.com>
Subject: best way for redundancy?
Date: Thu, 25 Feb 2021 22:17:06 +0100
Message-ID: <03ff01d70bbb$953d4750$bfb7d5f0$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain; boundary="----=_NextPart_000_03F3_01D70BC3.BC357FF0";
 charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQE+hwIAWYrP/YPvbDhwUEJcpF2BHA==
Content-Language: en-de
X-Last-TLS-Session-Version: TLSv1.2
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

Hello
I do have a wireguard VPN that connects multiple sites. Unfortunately =
some routers are not available all the time, causing network disruption. =
I=C2=B4d like to improve connectivity via redundancy, i.e. add multiple =
routers that connect the networks.
What are the options to do that using wireguard? Can I have multiple =
peers with different keys and endpoint but same Allowed IPs? Will =
wireguard select the one available?
Any suggestions?
Thanks, Joachim


