Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B601C87FCA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jul 2025 17:18:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 813e0ba2;
	Tue, 22 Jul 2025 17:18:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4d97f662
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jul 2025 17:18:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E6D34447FD;
 Tue, 22 Jul 2025 17:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C418C4CEF7;
 Tue, 22 Jul 2025 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753204716;
 bh=XaHeIrVkz+npBlw1lyf0qJblIEHGZQRxwothP5DgXpo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tj5xUgp9KQ+VF0Wd1AYYCmGk4/nQ5DWiP7ILBiUrnvuGZjbaCieFkxmcWQcAuZPXD
 dir1N8q2XCnfd8GlHFMqlZcDYQBbbVMKqmmOrVTY7I4ViQBuCqn4BPkcrniRSML6tV
 /g5eK40lPYYPwql2757wx4M1U4g845dnVfANTVay4IXjc0bJhHQAIwzPl5d1xFEsGs
 S4Mhe0iR54QBhh1/3jlLaQLT5TgOQo0fcoZtPdIC2awlU6gB1J5cGQr8N0B201fk0U
 hxqpPPPqorj2P1gPrvA0yjIu0smr9SyuZTpO6tlzjoQRuSnv/6PCkh4KDyClyD+Bic
 HDAmZKUC9NTqw==
From: Kees Cook <kees@kernel.org>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Cc: Kees Cook <kees@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, Xin Long <lucien.xin@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH net-next 2/3] wireguard: peer: Replace sockaddr with
 sockaddr_inet
Date: Tue, 22 Jul 2025 10:18:32 -0700
Message-Id: <20250722171836.1078436-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722171528.work.209-kees@kernel.org>
References: <20250722171528.work.209-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=kees@kernel.org;
 h=from:subject; bh=XaHeIrVkz+npBlw1lyf0qJblIEHGZQRxwothP5DgXpo=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDBn1x1+waS/6eaXHauGh7Jlr3071DrVkMA9uNtHtVvsr8
 3Aq55mPHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABNxSWL4n+DN9V/bobTOfGpT
 abnPvEvdApF7tLTXJr22/XDoid3WGIY/nJcY52twtuzIOPChRDHhGxfX2rB7v5z+697k7dTheML
 ABQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

As part of the removal of the variably-sized sockaddr for kernel
internals, replace struct sockaddr with sockaddr_inet in the endpoint
union.

No binary changes; the union size remains unchanged due to sockaddr_inet
matching the size of sockaddr_in6.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: <wireguard@lists.zx2c4.com>
Cc: <netdev@vger.kernel.org>
---
 drivers/net/wireguard/peer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/peer.h b/drivers/net/wireguard/peer.h
index 76e4d3128ad4..718fb42bdac7 100644
--- a/drivers/net/wireguard/peer.h
+++ b/drivers/net/wireguard/peer.h
@@ -20,7 +20,7 @@ struct wg_device;
 
 struct endpoint {
 	union {
-		struct sockaddr addr;
+		struct sockaddr_inet addr;     /* Large enough for both address families */
 		struct sockaddr_in addr4;
 		struct sockaddr_in6 addr6;
 	};
-- 
2.34.1

