Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AED7C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Nov 2023 01:23:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60047ab1;
	Wed, 1 Nov 2023 01:23:26 +0000 (UTC)
Received: from mail.mokrynskyi.com
 (static.230.39.109.65.clients.your-server.de [65.109.39.230])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 42d52ce2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Nov 2023 01:23:24 +0000 (UTC)
Message-ID: <1ac814fd-85ba-4b73-97b2-b13ddde13873@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
 s=dkim; t=1698801803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cDBwu7eCkjWre4UKtolnoCNne3TWXJWbY+pqmIrPXzU=;
 b=s4VS5jYYDGNkYZu4PLd6ok06ay+ZY67g3/4+rxDulaBri5WLNeeJCFvjOxU9XhrSOGhxoA
 AfeBDd2WRsGrB5uwznAB3Ks9+fet2cmTn4wr4d7HjqvPFvjeed0qLpmg+ebracy+1TCsef
 eYxG6FpmK5WPuJJ6HlgVC5tdHdLFCrxeWC6KnOPNsXzKCJj84m8JBTuuWehQqeoZ4A29sc
 ZtogvYrlVw0G/gt6a4WVAv5pVkotZbMj9KFF39t+U39sJKc6scrpCco0ivVhzpX+0ikpMV
 oLGU1Ek4k1y1gYbbnEXvOPcjDUr/7rhi9uemqQIy2Z8TSy9foflLe3dGIF9nwA==
Authentication-Results: mail.mokrynskyi.com;
 auth=pass smtp.mailfrom=nazar@mokrynskyi.com
Date: Wed, 1 Nov 2023 03:23:22 +0200
MIME-Version: 1.0
Content-Language: en-US, uk
To: wireguard@lists.zx2c4.com
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: Android can't complete handshake
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: -
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

Basically every day I have the following in logs:

> 10-16 00:46:05.380  5200  5568 D WireGuard/GoBackend/xyz: peer(8MoP…XPVc) - Handshake did not complete after 5 seconds, retrying (try 2)
> 10-16 00:46:05.381  5200  5568 D WireGuard/GoBackend/xyz: peer(8MoP…XPVc) - Sending handshake initiation
> 10-16 00:46:10.468  5200  5678 D WireGuard/GoBackend/xyz: peer(8MoP…XPVc) - Handshake did not complete after 5 seconds, retrying (try 3)
> 10-16 00:46:10.469  5200  5678 D WireGuard/GoBackend/xyz: peer(8MoP…XPVc) - Sending handshake initiation
This is happening on Android 14 when connected to Wi-Fi.

It is definitely not a loss of Wi-Fi or Internet connectivity, I turn off and immediately turn on the VPN connection and it connects instantly and successfully, it is just those retries that are not succeeding.

Is this a know issue, maybe there is a workaround?

I have seen similar reports online that seem to be related to network connectivity, which is not the case here or else reconnection would fail too.

-- 
Sincerely, Nazar Mokrynskyi
github.com/nazar-pc

