Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACB8D49207
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 16:28:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 785cb2b0;
	Mon, 18 Nov 2024 14:33:29 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 83ca61ec
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 14:33:23 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ea1bc2a9c5so1994049a91.0
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 06:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731940402; x=1732545202; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IrCaarQptqoPnVIGF6Rw6t9hI+Rf9ZxQVNSlbFD1HYQ=;
 b=KsN/0NEepS7MVxRuGceBgNyBK60tUaRJdVQ21p8w4J/UUlAMwZbGveuMuE6Ln1h/ZR
 IL4Hh7hwBBF4UHgwE2uZH6+oxTydymauC46mUax2ot292n2zQiF4HSheQhvQo++EE0Bi
 nopXfZ3PiN9hKOFBaF4T21Ctk8gHppABSbRyhIrFZtu0HohrLK3CfDBDXuUfoiEFd9tR
 6du2Dqlshpx92rXNEOckgT2A9kg/9gxQ9SlfeziqMGkUNyKH3derQlcKapjp3ac8yheT
 IJ3IJQVwsuCYcF252hP6atvcTKLw6BMKOEhXOh85cQhD6bDRWLi3lSna9WrncJavTV/C
 cJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731940402; x=1732545202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IrCaarQptqoPnVIGF6Rw6t9hI+Rf9ZxQVNSlbFD1HYQ=;
 b=BLsHbh/n2ECo2AQ7qB003yFSpK8tzmjNSLZUgBLZcVejhFkGDhuV5FFthVoFIfggxB
 gH6zl2ckyhuS7KefX/2o8sNsV+jNDQWES5FX5HmjkrPbcT2sy5PQGBrEcKS9KC/5pC87
 jQQ/4gusX+qAiqJfWcaNNowZXCUhsSlwNySVcfkJthGldhp6lQbBSHe6FovmWoCIDYkF
 KwLIevseMuTJ0S1hl5a/TFP4Gos90cykLJcmHyKyVpaJCZ3AMBaYcKZbLBVAsbmsqdAU
 aT7NMKt0GdmTI+amQhI2hN+E5/Vw0RqdSzQGsvRXe0asKWD/oaasFT4vaypB2A6UfqKb
 Lu9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/1A0tLt5Pag+rptwU8GuWgsb/gLZtvgLZElIfY98li+LAKzzDmq8yE2yCWLkMlHEA0AKlCC81fDI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz44wdLUGnS3jlv/oP6e7sJYApcpOeuOFL5KBSTfxWuqWKO/D/C
 q6qdv0EFmdbtA6KO/LFjrXle03sul9NCTyBaKADm78g5AWXOpych
X-Google-Smtp-Source: AGHT+IGzbRz7s9CT801paPWPDasO606/jlaO2UpnfJMF7tMlUetZpF6RTCqXaMFrG8I7wghYj9+EFA==
X-Received: by 2002:a17:90b:3c4e:b0:2ea:9ccb:d206 with SMTP id
 98e67ed59e1d1-2ea9ccbd33amr1559048a91.8.1731940401993; 
 Mon, 18 Nov 2024 06:33:21 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ea81b0e2fasm1616926a91.52.2024.11.18.06.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 06:33:21 -0800 (PST)
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
Subject: [PATCH net-next v4 1/5] net: ip_tunnel: Build flow in underlay net
 namespace
Date: Mon, 18 Nov 2024 22:32:40 +0800
Message-ID: <20241118143244.1773-2-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241118143244.1773-1-shaw.leon@gmail.com>
References: <20241118143244.1773-1-shaw.leon@gmail.com>
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

