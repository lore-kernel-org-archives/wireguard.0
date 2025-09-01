Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BBFCEE343
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 18:28:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dbbf482;
	Tue, 18 Nov 2025 17:24:16 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc3ae03d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1756738334;
 bh=A3oQDNtC9t8GXyz1Onu5bXHPGEEu2KnjT/PlSY2LNfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YZcn32pRvgCPxUHhdbcid7QSZs4Y0AsQQQOBZ4giN4TxgRTjsm/pQQicMkxrkngsQ
 +r1+J3vWSQLG4DNXN6ftUKzlB3ZS6ViJCAmDaSBnBPDWtpoN9D3TVtkpbyJhjp9kWq
 UUZToBMPGAlr+kFkxdPyxQY9njO4xtPk+1BzzCwUwKTVlU5fwlhXvnbaPt66SbFf84
 bpXrwF2C8BM9DQy2F+kUynrTgkzaGjn4x2FNNd82oB38Cq9/Uly0g+iKlzqxdh6hA6
 6kOKLM/fH9fHPYAYVXYHyF5v7C9bGG0D+P4Ntpak4Q6F//oPAo0HJeT+iHUNhJA1Wh
 2nr6CXCZRD5fQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id DC5B160078;
 Mon,  1 Sep 2025 14:51:16 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 82082202310; Mon, 01 Sep 2025 14:50:57 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 David Ahern <dsahern@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net 4/4] genetlink: fix typo in comment
Date: Mon,  1 Sep 2025 14:50:23 +0000
Message-ID: <20250901145034.525518-5-ast@fiberby.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901145034.525518-1-ast@fiberby.net>
References: <20250901145034.525518-1-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:15 +0000
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

In this context "not that ..." should properly be "note that ...".

Fixes: b8fd60c36a44 ("genetlink: allow families to use split ops directly")
Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 include/net/genetlink.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/genetlink.h b/include/net/genetlink.h
index a03d567658328..7b84f2cef8b1f 100644
--- a/include/net/genetlink.h
+++ b/include/net/genetlink.h
@@ -62,7 +62,7 @@ struct genl_info;
  * @small_ops: the small-struct operations supported by this family
  * @n_small_ops: number of small-struct operations supported by this family
  * @split_ops: the split do/dump form of operation definition
- * @n_split_ops: number of entries in @split_ops, not that with split do/dump
+ * @n_split_ops: number of entries in @split_ops, note that with split do/dump
  *	ops the number of entries is not the same as number of commands
  * @sock_priv_size: the size of per-socket private memory
  * @sock_priv_init: the per-socket private memory initializer
-- 
2.50.1

