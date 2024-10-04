Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB35D10F54
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 02:40:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88c3d82e;
	Mon, 18 Nov 2024 01:37:47 +0000 (UTC)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b6603b9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Oct 2024 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=7Ko7Q6y/3q1OHxisxRoOV/IlFJ79OSMVDcxVRFjuJ9E=; b=RGmROZbv2BU0U1qwQN4zgQTReN
 4eABstxC2VQbVOSw1xrPlYS5YDR+2LeeZ8M5vt/5siUlWDfLtQ1txmzzt6K9hZ6HOqQE9qFB0gn8o
 +tLBtGpU1qZme7VIeV4Ht/3cyz0yAalVeKJG9LkoAZMQ1NclVTJU0k9j1BKy4T0ixEtoQuaHJ3hHy
 N8ia5ZGVbqINP8AqIzEZwnoerGTOy5I3t8OZVjnpDoA4VZUDVfs5DaX8XVRQgB9e5S52FLGbuLZfm
 SOJt4m/etW5fNgmFlvzyAAwdSZHLrxK4N7ijrLUdH170t/wRtD6reg3FqKgDCuOSDYyxz+0xKBgCD
 izmYx+Hw==;
Received: from 47.249.197.178.dynamic.cust.swisscom.net ([178.197.249.47]
 helo=localhost)
 by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <daniel@iogearbox.net>)
 id 1swlaJ-000HW1-0j; Fri, 04 Oct 2024 18:55:18 +0200
From: Daniel Borkmann <daniel@iogearbox.net>
To: kuba@kernel.org
Cc: edumazet@google.com, Jason@zx2c4.com, aspsk@isovalent.com, m@lambda.lt,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com
Subject: [PATCH net-next v2] wireguard: Wire-up big tcp support
Date: Fri,  4 Oct 2024 18:55:18 +0200
Message-Id: <20241004165518.120567-1-daniel@iogearbox.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27417/Fri Oct  4 10:53:24 2024)
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

Advertise GSO_MAX_SIZE as TSO max size in order support BIG TCP for wireguard.
This helps to improve wireguard performance a bit when enabled as it allows
wireguard to aggregate larger skbs in wg_packet_consume_data_done() via
napi_gro_receive(), but also allows the stack to build larger skbs on xmit
where the driver then segments them before encryption inside wg_xmit().

Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Anton Protopopov <aspsk@isovalent.com>
Cc: Martynas Pumputis <m@lambda.lt>
---
 v2: fixed up my gitconfig and Cc's now

 drivers/net/wireguard/device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index 45e9b908dbfb..79be517b2216 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -301,6 +301,7 @@ static void wg_setup(struct net_device *dev)
 
 	/* We need to keep the dst around in case of icmp replies. */
 	netif_keep_dst(dev);
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 
 	memset(wg, 0, sizeof(*wg));
 	wg->dev = dev;
-- 
2.43.0

