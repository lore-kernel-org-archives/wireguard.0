Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAE7D6DDC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 16:28:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e95acb1;
	Mon, 18 Nov 2024 14:33:34 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0fbdd988
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 14:33:32 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ea527ae14aso967048a91.1
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 06:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731940410; x=1732545210; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYvUg1T5qt/avqeB8QMtp6GEfshi9DuIrKXfHc0mOQw=;
 b=cw5wK7Q++7jVdzfxffr2/iwUSq4JzTZyfKc/U5A8myzBiAF9E4zVw+IyZioNkPZNAO
 Or/xBm/iW6lrRn7Fh1B+wUGes3U+fZK2/lqd9qK8GIzRNgtY26tWlcPjjiGHCvZRhast
 HzbZDYq/4vBYONokXQkpVyZdpIZ73sk4yLwOG7k+0ggGDq6d+P9zMl4jjbPgO+gW+FDW
 Le53kNALd+DS8F65CHwH/5ONyIoFyh1Ky3ZZXHUZSx976Unz9ClO2a1d/uEXhzPew5MA
 m1DOgURbVJRFA63zVG6cQox5gaOrs/fjxiSBt+Qm1EFwbhkfft/z9vUGHUAs8+h7hx7A
 UqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731940410; x=1732545210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYvUg1T5qt/avqeB8QMtp6GEfshi9DuIrKXfHc0mOQw=;
 b=RQCedtS9FbqiFKylf56MBr2sJaFPO9q9Nw43AU7WsXah2V3S64Ql+PjiXmu4JuXzGq
 /yDi7DlXIZ/fHuXVRmp5T8ipfkX4k0HHwOUPpeR+fdPH1xXMgCo9bG+b++ZHoJcIP0xP
 qVWXdyf0GD/36V3uGoCbNvP7y5RdvHj8WYL7VskXq2MObh25t4T4jDoRKqZvEnVRz69q
 /3OxR/2Bium1Dg93/C7w5t+vPg8TsiV/DA6JGwCmjWeKg181Nx22IWOLMEV/88bWiUJo
 98u2xoNgiVzX9hhudLkEyC9ht1y90nIicuvc+idkpRnIbq09Wd+G2hsc9kbKyMLQqeIL
 ZQIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvINJ6jg6pS/kvFrUB12tTCw1rt0zN2Ronn2JqINdKIc3v0UGQsSyF6hvNDlHtFIV2mTRh9xtNwY0=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz2aqmPUYYzb+6cWrKXbwv8u7mf/314zQOxzXbZ06ZNKBLOaORx
 ljIEC1+BWauTYdkDu+PWYbv5Z+IQqykGbZOsamX1jN8Rl6Y/4PnilmGhD7PDs7s=
X-Google-Smtp-Source: AGHT+IHPKnavfiiQCNCjr1NezmwMnBacyheV8zyl63QTPg6m3L868R+a4UJrSv5jLV5RsxhfHcRfpA==
X-Received: by 2002:a17:90b:2687:b0:2ea:3f34:f1a0 with SMTP id
 98e67ed59e1d1-2ea3f34f38amr9406817a91.30.1731940410205; 
 Mon, 18 Nov 2024 06:33:30 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ea81b0e2fasm1616926a91.52.2024.11.18.06.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 06:33:29 -0800 (PST)
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
Subject: [PATCH net-next v4 2/5] rtnetlink: Lookup device in target netns when
 creating link
Date: Mon, 18 Nov 2024 22:32:41 +0800
Message-ID: <20241118143244.1773-3-shaw.leon@gmail.com>
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

When creating link, lookup for existing device in target net namespace
instead of current one.
For example, two links created by:

  # ip link add dummy1 type dummy
  # ip link add netns ns1 dummy1 type dummy

should have no conflict since they are in different namespaces.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/core/rtnetlink.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index dd142f444659..bc9d0ecd3a1e 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3846,20 +3846,26 @@ static int __rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
 {
 	struct nlattr ** const tb = tbs->tb;
 	struct net *net = sock_net(skb->sk);
+	struct net *device_net;
 	struct net_device *dev;
 	struct ifinfomsg *ifm;
 	bool link_specified;
 
+	/* When creating, lookup for existing device in target net namespace */
+	device_net = (nlh->nlmsg_flags & NLM_F_CREATE) &&
+		     (nlh->nlmsg_flags & NLM_F_EXCL) ?
+		     tgt_net : net;
+
 	ifm = nlmsg_data(nlh);
 	if (ifm->ifi_index > 0) {
 		link_specified = true;
-		dev = __dev_get_by_index(net, ifm->ifi_index);
+		dev = __dev_get_by_index(device_net, ifm->ifi_index);
 	} else if (ifm->ifi_index < 0) {
 		NL_SET_ERR_MSG(extack, "ifindex can't be negative");
 		return -EINVAL;
 	} else if (tb[IFLA_IFNAME] || tb[IFLA_ALT_IFNAME]) {
 		link_specified = true;
-		dev = rtnl_dev_get(net, tb);
+		dev = rtnl_dev_get(device_net, tb);
 	} else {
 		link_specified = false;
 		dev = NULL;
-- 
2.47.0

