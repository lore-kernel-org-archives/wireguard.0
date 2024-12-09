Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ADEC54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ff61d50;
	Tue, 20 May 2025 19:34:56 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7c304e69
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2024 14:02:39 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-215810fff52so47769585ad.1
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2024 06:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733752957; x=1734357757; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=93uG6ogDA0suRI92nCq7Qt11rTzcUQ+bpSh6BVGj6ZI=;
 b=OwldjE5cKxjUKMmoOadnWmglP+wpyeXpxtZjNYyix8Rut8Bm5wZNDZOcMtEH4olLBO
 h0UM7qjNDdwYaWcXvoZu+WRkm4dN6g7YckJbkvIwmTm9bp9yZqGehDt3dvZV/frF4WBe
 tw8G4NHDKr+GaE5nXvrypCifl2X+1/RXr4E9tCEATGHWsgEZpdeQ2T1RWmXEtSCzUL5w
 lhJ3WwLvFZHU6rd34aT9FZd0YiTyASID2yVVhRJ3jpbV2b1zBpGDmmr+yZZ1OnJ6q8/s
 KQMlbACLNwYIDWkyYEQO0QxF+PEObms4HUdg4exBu+Bm2NZlImCVj3T0W8YThOnbdqia
 JuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733752957; x=1734357757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93uG6ogDA0suRI92nCq7Qt11rTzcUQ+bpSh6BVGj6ZI=;
 b=fegf1XKTfDLT7E0y8pC2+VHOFzKTPGzjZuQaO09qCEskniZM6o6OkWskMfmjUhQ5YL
 RO0UOnKfkjlb/P5lQF5OexGYuKLV+sr4Bgm2+LeVaaxzAQhCErZgNId9q5a0FiALCL0L
 mrOv4Q60tt8vJg7iwd2MZ134ahqmcYC91j8hslhnRG3qL4tE5RFMtfH88EHpu5WmqCUg
 JOASA7+DU89vSehEgqc5xEwqyBbU3Hes6Zje6UfM24A3VN7cFdquRdiytVhDyFRCYPcb
 9JAcCVDThCAsAGPUH1qgsVUYVQrBXcjJ6hfYxNDAPVt+K/9Bx7ywO6nrbGa17LxoE3e8
 U6QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj8cHPf21u0tEbfm7QKK3j0Q13/44QXg4/AWlYn7PeFQ/PAyyiMdXdR1gQXYG04wIoFeSZ4RYc5ss=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwcpvjSYB5aPo/J3HjjH6FTI7cVYmF4c9kfCsiGPz4bObq5IQUZ
 IIUrW7R5R7a/xtMTMDWOH9yg8+6Q+0+aHoRBFmfms7U9E46ItsJO
X-Gm-Gg: ASbGncvdP5qUT1B9AUeIpZcZY7Im2+YBe9cvTybU27vj5GEAQM305X7qmaID9k7sqMO
 BVgsyLAikw5D1ExSTnpNsCqHjv635AMcO0mX86emOoE/6+0x3GZSrRQUTe+sK6vEFAdU9eXdGQH
 tA1ZyW2VERSNZNtHReofGdWkRpsgn9U3ZRtowhTQ4vgnBKhXMKeu6OPNY7Y9zf+mv9bd1THKuOL
 +YQpAIVH0c009+TBLukfohsmb2pRlipGFzQ5ZXCtCuJegM=
X-Google-Smtp-Source: AGHT+IEJ2QVBGY2MGcE4mBFIU/c+dzWKa28cbDvoqfUFybFT/JmX0nfLyJJqRhwpUbbXsTp1UoSovg==
X-Received: by 2002:a17:902:cf08:b0:205:6a9b:7e3e with SMTP id
 d9443c01a7336-2166a0b59acmr8694095ad.56.1733752957447; 
 Mon, 09 Dec 2024 06:02:37 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216221db645sm49605645ad.46.2024.12.09.06.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 06:02:36 -0800 (PST)
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
Subject: [PATCH net-next v5 1/5] net: ip_tunnel: Build flow in underlay net
 namespace
Date: Mon,  9 Dec 2024 22:01:47 +0800
Message-ID: <20241209140151.231257-2-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209140151.231257-1-shaw.leon@gmail.com>
References: <20241209140151.231257-1-shaw.leon@gmail.com>
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
2.47.1

