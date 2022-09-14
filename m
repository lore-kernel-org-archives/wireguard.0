Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190A7C6FA8B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Sep 2022 17:49:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fe8d3194;
	Wed, 14 Sep 2022 17:49:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 511564e7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Sep 2022 17:49:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 808CBB81AA6;
 Wed, 14 Sep 2022 17:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1192AC433C1;
 Wed, 14 Sep 2022 17:48:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hJMsYj5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663177737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F0iTYrs7mVlDybHNBhoUliYhRxu2aTv3ffXeBOI1/I4=;
 b=hJMsYj5/Z0wWbkJBVJOUnImi6RgWweL0qRlunmtvKFedlscGDb8WXxPUOke7kqJ2JfPegv
 4luRogQgJd3fkB5kS0ThYN7kNVlEeEBA7UHPy+ly0nxYQIZHBBjCbV5sdvh6lwg9JPEKAa
 p6HpyFOLXOXuuKWR5fKqosNOzixqr40=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fc52c724
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 14 Sep 2022 17:48:57 +0000 (UTC)
Date: Wed, 14 Sep 2022 18:48:52 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Kees Cook <keescook@chromium.org>
Cc: syzbot <syzbot+a448cda4dba2dac50de5@syzkaller.appspotmail.com>,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, sfr@canb.auug.org.au,
 syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Subject: Re: [syzbot] linux-next test error: WARNING in set_peer
Message-ID: <YyIUBKYWJBilWK3A@zx2c4.com>
References: <00000000000060a74405e8945759@google.com>
 <202209131753.D1BDA803@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202209131753.D1BDA803@keescook>
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

I think I'll open code it like below. I'll include this in my next push
to net.

From 19fb26af00a8266df65b706dc02727c6a608b1b6 Mon Sep 17 00:00:00 2001
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Sep 2022 18:42:00 +0100
Subject: [PATCH] wireguard: netlink: avoid variable-sized memcpy on sockaddr

Doing a variable-sized memcpy is slower, and the compiler isn't smart
enough to turn this into a constant-size assignment.

Further, Kees' latest fortified memcpy will actually bark, because the
destination pointer is type sockaddr, not explicitly sockaddr_in or
sockaddr_in6, so it thinks there's an overflow:

    memcpy: detected field-spanning write (size 28) of single field
    "&endpoint.addr" at drivers/net/wireguard/netlink.c:446 (size 16)

Fix this by just assigning by using explicit casts for each checked
case.

Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/net/wireguard/netlink.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index d0f3b6d7f408..5c804bcabfe6 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -436,14 +436,13 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
 	if (attrs[WGPEER_A_ENDPOINT]) {
 		struct sockaddr *addr = nla_data(attrs[WGPEER_A_ENDPOINT]);
 		size_t len = nla_len(attrs[WGPEER_A_ENDPOINT]);
+		struct endpoint endpoint = { { { 0 } } };

-		if ((len == sizeof(struct sockaddr_in) &&
-		     addr->sa_family == AF_INET) ||
-		    (len == sizeof(struct sockaddr_in6) &&
-		     addr->sa_family == AF_INET6)) {
-			struct endpoint endpoint = { { { 0 } } };
-
-			memcpy(&endpoint.addr, addr, len);
+		if (len == sizeof(struct sockaddr_in) && addr->sa_family == AF_INET) {
+			endpoint.addr4 = *(struct sockaddr_in *)addr;
+			wg_socket_set_peer_endpoint(peer, &endpoint);
+		} else if (len == sizeof(struct sockaddr_in6) && addr->sa_family == AF_INET6) {
+			endpoint.addr6 = *(struct sockaddr_in6 *)addr;
 			wg_socket_set_peer_endpoint(peer, &endpoint);
 		}
 	}
--
2.37.3
