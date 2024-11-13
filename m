Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4C1D49233
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 15:19:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26c50ed6;
	Mon, 18 Nov 2024 12:45:29 +0000 (UTC)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc6c0e77
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Nov 2024 12:57:54 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2e5a0177531so5402939a91.2
 for <wireguard@lists.zx2c4.com>; Wed, 13 Nov 2024 04:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731502673; x=1732107473; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IrCaarQptqoPnVIGF6Rw6t9hI+Rf9ZxQVNSlbFD1HYQ=;
 b=DEUNZvRW0tp28bLPkC4eLeMCzaYBZ6JwB1CyUfaFtWkwYQQsCnu7ReXI6N+EhNKXWh
 g4SLEuy3e3op1cx7QHdHR8vO1+zUHqaFLHwmVGxNj+qyWlRMS7VQ7y5yyrF71MX24EtL
 8t2beK0bQPY5F6nnQYKv/BIdYIIlxKQFSUATV/k17mHAw6XVUxzkgm8jmo32ZcxPjT53
 AFv0k54ISJC7A1GZhYW9BjZP6gXzPLTBCl/CQ+an/RAMt5TWDxznQpUVOhw8auGjm9zr
 qmD8ekCIIKEuLY6spJx+cNsFDBXbag2aM8pSpKh7oDaZdoB+35m8prMNVgSjLATgGQU7
 3Y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731502673; x=1732107473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IrCaarQptqoPnVIGF6Rw6t9hI+Rf9ZxQVNSlbFD1HYQ=;
 b=ii/xp725YXpSeXXEN4920+nvjfSwGTjM5AIq89nCcvSoUWpOAXkEc9k1oeRLJKH5SW
 5Bl57L2lo869yRZ/GJ/0APjNF60LlFv5BBl9Ix0zhRej/FKtDGfHlQEknWuXRuSNeBe7
 /iTzvjh4bLvRNdbbOEtXsOkEChC7UQWz3usYIXsQAB2uXWGUsE3uOduh66FNEDPPCUsD
 vgyaSDMtjW8pgpyQ3l3J+EvX0Pa4cRekAdO/fMCIObfg3io7QTnixR4ZCKfBMMrON0wa
 hObKP21koUA0P8XBGuW1nR1SKheaaYkGwLDiZe01u9uU4eJIEJRMuPDSFy9k5HP5gONp
 r6/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbHxaMS1oj/9W31NcQUz+yCRGFdI8y9RjA8yyEbKhOnEVcYvyQwG+Y3fgAp2xYPF0j2o9ptunMYVQ=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxUrsmBNPem1kdEaTZgcPcsYmczj+Kfi9L81cEcAzKUMfGAzH8d
 rYOrp5qnT0qKWHaSlUJ9vvgwZzGeiWnhYo0CHNZgpexpKbHGVDsB
X-Google-Smtp-Source: AGHT+IGJi6Tp37K+i8d+pRtqcGbSCXzQQJQiHEkYvBXRMyT+Ytmcy1PnetStqWOPaDWwW+msVvcvjQ==
X-Received: by 2002:a17:90b:38c4:b0:2e2:c6a6:84da with SMTP id
 98e67ed59e1d1-2e9b1799123mr24937176a91.34.1731502673070; 
 Wed, 13 Nov 2024 04:57:53 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9f3f8ed0esm1398632a91.40.2024.11.13.04.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 04:57:52 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jiri Pirko <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, bpf@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/6] net: ip_tunnel: Build flow in underlay net
 namespace
Date: Wed, 13 Nov 2024 20:57:11 +0800
Message-ID: <20241113125715.150201-3-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113125715.150201-1-shaw.leon@gmail.com>
References: <20241113125715.150201-1-shaw.leon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

Build IPv4 flow in underlay net namespace, where encapsulated packets
are routed.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/ipv4/ip_tunnel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 25505f9b724c..09b73acf037a 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -294,7 +294,7 @@ static int ip_tunnel_bind_dev(struct net_device *dev)
 
 		ip_tunnel_init_flow(&fl4, iph->protocol, iph->daddr,
 				    iph->saddr, tunnel->parms.o_key,
-				    iph->tos & INET_DSCP_MASK, dev_net(dev),
+				    iph->tos & INET_DSCP_MASK, tunnel->net,
 				    tunnel->parms.link, tunnel->fwmark, 0, 0);
 		rt = ip_route_output_key(tunnel->net, &fl4);
 
@@ -611,7 +611,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	}
 	ip_tunnel_init_flow(&fl4, proto, key->u.ipv4.dst, key->u.ipv4.src,
 			    tunnel_id_to_key32(key->tun_id),
-			    tos & INET_DSCP_MASK, dev_net(dev), 0, skb->mark,
+			    tos & INET_DSCP_MASK, tunnel->net, 0, skb->mark,
 			    skb_get_hash(skb), key->flow_flags);
 
 	if (!tunnel_hlen)
@@ -774,7 +774,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	ip_tunnel_init_flow(&fl4, protocol, dst, tnl_params->saddr,
 			    tunnel->parms.o_key, tos & INET_DSCP_MASK,
-			    dev_net(dev), READ_ONCE(tunnel->parms.link),
+			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
 	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
-- 
2.47.0

