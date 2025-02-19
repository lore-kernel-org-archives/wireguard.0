Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC327C54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 08:29:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bb93362;
	Tue, 20 May 2025 19:41:42 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa1f265f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2025 12:52:16 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-220f4dd756eso93415045ad.3
 for <wireguard@lists.zx2c4.com>; Wed, 19 Feb 2025 04:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739969535; x=1740574335; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PyZ7Oa5HQm/CyDGlUAOCpKikT+Z0UZAcxIZ482ECX9g=;
 b=YQxQZJYptBWkViHB+y1HoMtoKZrWvRAXp9PQwalIDFWPMC0wTzT61YYPt89Sq2S1b1
 rLlhsNB6xXrJHtBjSJi0MGU99WSmUz/9+EWkBa2PplknmvjbvssIlty6iWp/v3gUGD1h
 We+1JuLPvuxLA65udTCwLXnKhWOmx3yz1AVEKrvtiefCLAGELk/INOCwd/gyC0u6CC01
 6B7hoWrcprvlACKox6pv4csnNuYyr/Arub8OHN2uRGwpTo+ohFc8LkZKEDZNVauSIOVi
 GmbqWAhnqmz8N8TTOYLLR0PG6y6Q8gNuBDiOCHZCk12L3tUQdc98wsXkoGj866V47Zqj
 p4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969535; x=1740574335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PyZ7Oa5HQm/CyDGlUAOCpKikT+Z0UZAcxIZ482ECX9g=;
 b=HshyFsyklA2m8S9A/QRHhJbvmuS0FMPwIb1mwio9PoH/OtbRiDPWfipv+NoTvf4oxz
 GEUFSvjujLd369be05qD4ZwhG9EnECwtjpOb/Ds7LkDOENagSyg0aGFcXoaB2rmTckOw
 7ImrEFBYmwwE+4dvO6TodOiuILtLO7n+9LzcA+Yd5SbEUrHld+s1wfuCegwwj9zlviuL
 JRhVKQqiuiBEffw9ks9ZqauC2d/LnJy44wUaFoOZYwuUBj4VkyyrC0ts5Ux/n4aQUjvM
 XKC8I/aB5Ap+rOyYkqEGy1VB2Q+IHVyuOGF2Tj7XsKmpdkEPJPE+LzKUTUfqh55MREKI
 HIFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdDpYmhSrAxM/1tFHRoFJe4r1jfTIt9Z5NRzfB22ZeNP82eRwFaEdEiadP+KBuEXxHp9jN7PJ/CVs=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxKq5fO3PKkBzl5isiwne0p6geDMy+qjO/uzhUNIOxg+3KJ5L9s
 48bER3XEbKChcJ6Q+Ba5IL0vw1X1GgeI8jk6ajvqGrolQHeBR4BE
X-Gm-Gg: ASbGncvwO4NrNZAIzyC4MpEKuxU0qOmVW4zCi+Ot/tOsBiTFFcNkc7Ki7w9WktQShkp
 Q9+ZXinxBvFj9knfyi0mjlO/vDOS9CobZAnLj3Suzl16eCAJ0pQ6nfczoplYz5BGsK/IXDzB9vb
 hZbT0w06doDC9jy3G9fA8vXAo5/l6nFIhEPuCSCi92qthH9NGy0HdyYSgtFyhxlW/QwRACxpm81
 cjZ1/fB6jlAPEnoP27kOTk6rjPDNTFyPjkzoRlcoJDFLbis2hUZvpNsUX9D/TBOFbWAedgVzlH6
 phH7/g==
X-Google-Smtp-Source: AGHT+IGEFP67zSY2isKHwZ8c/HiTSEQrpqN9J90h0hy0pUrJ6TwQBaUnsvMftR+A8p8DsBy8+Vg8gQ==
X-Received: by 2002:a17:902:d502:b0:21f:dc3:890e with SMTP id
 d9443c01a7336-221040255fcmr244598235ad.18.1739969534802; 
 Wed, 19 Feb 2025 04:52:14 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d536436fsm103427175ad.64.2025.02.19.04.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:52:14 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-rdma@vger.kernel.org,
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org,
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v10 09/13] net: xfrm: Use link netns in newlink() of
 rtnl_link_ops
Date: Wed, 19 Feb 2025 20:50:35 +0800
Message-ID: <20250219125039.18024-10-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219125039.18024-1-shaw.leon@gmail.com>
References: <20250219125039.18024-1-shaw.leon@gmail.com>
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

When link_net is set, use it as link netns instead of dev_net(). This
prepares for rtnetlink core to create device in target netns directly,
in which case the two namespaces may be different.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/xfrm/xfrm_interface_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/xfrm/xfrm_interface_core.c b/net/xfrm/xfrm_interface_core.c
index 5659a6cadd51..622445f041d3 100644
--- a/net/xfrm/xfrm_interface_core.c
+++ b/net/xfrm/xfrm_interface_core.c
@@ -242,10 +242,9 @@ static void xfrmi_dev_free(struct net_device *dev)
 	gro_cells_destroy(&xi->gro_cells);
 }
 
-static int xfrmi_create(struct net_device *dev)
+static int xfrmi_create(struct net *net, struct net_device *dev)
 {
 	struct xfrm_if *xi = netdev_priv(dev);
-	struct net *net = dev_net(dev);
 	struct xfrmi_net *xfrmn = net_generic(net, xfrmi_net_id);
 	int err;
 
@@ -819,11 +818,12 @@ static int xfrmi_newlink(struct net_device *dev,
 			 struct netlink_ext_ack *extack)
 {
 	struct nlattr **data = params->data;
-	struct net *net = dev_net(dev);
 	struct xfrm_if_parms p = {};
 	struct xfrm_if *xi;
+	struct net *net;
 	int err;
 
+	net = params->link_net ? : dev_net(dev);
 	xfrmi_netlink_parms(data, &p);
 	if (p.collect_md) {
 		struct xfrmi_net *xfrmn = net_generic(net, xfrmi_net_id);
@@ -852,7 +852,7 @@ static int xfrmi_newlink(struct net_device *dev,
 	xi->net = net;
 	xi->dev = dev;
 
-	err = xfrmi_create(dev);
+	err = xfrmi_create(net, dev);
 	return err;
 }
 
-- 
2.48.1

