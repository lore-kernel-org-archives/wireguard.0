Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B16C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 10 Apr 2022 19:06:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2a9f26f7;
	Sun, 10 Apr 2022 19:06:48 +0000 (UTC)
Received: from mail.dr-lotz.de (mail.dr-lotz.de [5.9.59.78])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 52823e0e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Apr 2022 19:06:46 +0000 (UTC)
Received: from linus-pc.. (ipbcc0dc80.dynamic.kabel-deutschland.de
 [188.192.220.128])
 by mail.dr-lotz.de (Postfix) with ESMTPSA id C24EC6CC2C;
 Sun, 10 Apr 2022 21:06:43 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=lotz.li; s=202112; 
 t=1649617604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oHGVSKjxLfGZ9kXsGPLVJ4mzKISbI8GOmRKzSRzUt0s=;
 b=A/ZKGj0injh20M74Z3KxdU2m+7O07kre3ZLBw/sDtueWWUVQkzTycmU85sZa4UMfETcjJ6
 A/ngVay/QRPV4gDA==
From: Linus Karl <linus@lotz.li>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: wireguard: add netlink mcast on endpoint change
Date: Sun, 10 Apr 2022 21:06:34 +0200
Message-Id: <20220410190635.1171195-1-linus@lotz.li>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch adds the possibility to retrieve notifications of peer
endpoint changes via netlink multicast messages. It has been a while
since I posted v2, the main difference is that I've added an extra
attribute to the netlink device attributes to allow enabling or
disabling of this feature. It is per default disabled.


