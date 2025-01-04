Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A083AC54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e6a6411;
	Tue, 20 May 2025 19:37:10 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da84b660
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Jan 2025 12:58:44 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2164b662090so161095615ad.1
 for <wireguard@lists.zx2c4.com>; Sat, 04 Jan 2025 04:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735995523; x=1736600323; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXH8tUP/h7NPxTwhkU8DrmHX10k3nPXxIbmClQOEn5A=;
 b=apXhNKAlStpr3S0feCocl4NEycRYMcPJprF/jNq+vSOQcHJIy7RMBbjxWjPYU0OstB
 8GfItUi72JSktKk92pKXXS2LCR0pBmDMDfrFqBuPLz1aYBWxiLpM6YvtTzRSLeIrP+/R
 o309P5XS7LLH39/PIzNqjWe2lv/wf/0ozX5VQ/ylfJFIgHhQ0aVwrLoNB4ETNv6ivSW+
 VLiMNG63iQ4BBalIeDUC1B+VYG3Q8xZRK3UtU/mxMFvVuC37tYbIKLcpB1dAzpSltL8d
 /OnxvPDj62V9NN/sinYVYz6WUwMdZmdWP1UGg/rQGudqUDTSlNu0XTPEW6uZpln7BLyH
 8QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735995523; x=1736600323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bXH8tUP/h7NPxTwhkU8DrmHX10k3nPXxIbmClQOEn5A=;
 b=pik/PetLfVdkHEP9uL8beUQz8wnV+PNjo82pvpMDqisYcQOYaMTTBkmq3UWNVMoc6Z
 z/nV90w7+iiPkL9cegBbh3oculx2xZwwGAcJv5+oAy4DJjcbQL6fEPnUSviHIYihvqLR
 4IcszIJDXep+hCj6+px9W7/I7S0XxRlcWQx402NrL9a5DzLbFPWqsM+5j0UIBCoQWllQ
 gF8EyUfalxUf3Qgbnp5MC59pjbNjeTuMEswUHcmboJ9+xBP05pPxsajU9RsGtmmdkkZ8
 2QgUzQs4sKNkhh6VBVAUprN/ahKynHNolVVqugcqAJtelh8dyEp44Cfrs6IzjO0zqOqR
 KqGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU61DgKOmR9jxgfIzu2shb0TFqWJSGT12+HcVgEEeN7UdFFsoC/2+1pGte9s2QRxyp17A86K1Z0kCk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwMgK8N+tCXI387r/uMGZvP+Yy8hca879YrR9u/iLlzvslrii0C
 v7KguS555QNNX474dKOMN4pa7rdo3RlC80uKXvh0nXFsPHOakNdC
X-Gm-Gg: ASbGncsEaHRRUMgYsIhpzq2U9UVdgBEAmMTjiNZwONoBN5kxzY1aDptuvRZ3s0/GxsP
 yXwFO8Ot9QWT4yjtPAXow6y+K4/eT3PVsmvuAM/pp5I+KEIMt05qS/QEPTJiuDAE4hzSLiylBex
 8pcTlPkgbGszLLYBvDaGqGiLMeYCDAIbE4gSp1AjgoLr7Jqil73Nq2aGND4qWNTSlq3uE1vlcMj
 D4Wxo5lxKGMpAWWOxiPoSLz25DW7sZyi+Tm6LmujbmGJMs=
X-Google-Smtp-Source: AGHT+IHa35PYbmCu1uOx6CEp/EQWjQpZHigmf2PgIvsgkyK5+Nfa2PQvUpv4CIvsSLNsXb9/anYWIA==
X-Received: by 2002:a05:6a00:cd6:b0:729:a31:892d with SMTP id
 d2e1a72fcca58-72abdd9603cmr90325957b3a.8.1735995523087; 
 Sat, 04 Jan 2025 04:58:43 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad830349sm27761344b3a.47.2025.01.04.04.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 04:58:42 -0800 (PST)
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
Subject: [PATCH net-next v7 07/11] net: xfrm: Use link netns in newlink() of
 rtnl_link_ops
Date: Sat,  4 Jan 2025 20:57:28 +0800
Message-ID: <20250104125732.17335-8-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104125732.17335-1-shaw.leon@gmail.com>
References: <20250104125732.17335-1-shaw.leon@gmail.com>
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
index 77d50d4af4a1..d1198c63dd23 100644
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
 
@@ -819,11 +818,12 @@ static int xfrmi_newlink(struct rtnl_newlink_params *params)
 	struct netlink_ext_ack *extack = params->extack;
 	struct net_device *dev = params->dev;
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
@@ -852,7 +852,7 @@ static int xfrmi_newlink(struct rtnl_newlink_params *params)
 	xi->net = net;
 	xi->dev = dev;
 
-	err = xfrmi_create(dev);
+	err = xfrmi_create(net, dev);
 	return err;
 }
 
-- 
2.47.1

