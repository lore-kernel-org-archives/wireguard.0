Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7E7C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03e787ee;
	Tue, 20 May 2025 19:37:38 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 89473f19
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Jan 2025 12:59:00 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-216728b1836so164392765ad.0
 for <wireguard@lists.zx2c4.com>; Sat, 04 Jan 2025 04:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735995539; x=1736600339; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7lhW/WxI9EK3nLn5yDY0MQG09nRFtNebbOyrqmZTug=;
 b=DlcPCQdNAlvfuZYiKO9bK0O7DnobXZvKbZFIiY5W2y59AwMg96aQLeT0+ne3sUnPd2
 SU4ACTD9N/BtUkeKy1tnqpz9GQ5nvB//1D1RkIPbC/hTD7a6UxSpeWBPUhK+w5Pm82uI
 kXp3RMDhAnG9/wMwfz/KKOCw4dXJAAxAOqnx0m2kmnvaOyccROVRuPqyNNUmCM3rABJh
 TjNLvina2ZMZdq5pzqopXYN7EEW/JBuV5Oc/tBLtF5ZFSu8tdoaTGQeV4Q0zTT7g+sUo
 Hd8jERlnSnw6P4GFTKrAGKHRv8IvDI4nNzhTWBBkmzIc8rfPwRaaAT2b+hTctQDtbzWI
 MEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735995539; x=1736600339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t7lhW/WxI9EK3nLn5yDY0MQG09nRFtNebbOyrqmZTug=;
 b=j9/JC2leSvLLVfKJJvwpfxhxGaiHfJTkHExiz5tteCpMcIWzje2b2iPgFyrN/g0jFy
 4nP4spd9b1sfbKEMkQUvLhv4zqA8erwMizPoG9pbIc/I62Mg2nZXcRXs/nAgelSvxeq7
 i6KesCyvTsT/Wm1ejQt5nwbUYGAF+oaQLYq/vALEHjoesWOSJqqH+Uif6qU/UjCEB0p5
 nFPX9XsQ3XzxyxsiOi+SQ3yYWEDCoz+5RvBdRxBemEL5eAl+5TGvspLFx8z9vXwaaGtC
 oiYYNcWMJYBcimNtefi13q/mBQfL7/gTgbILrzoDAv8BabmgQ1z6u/3fLNga+yyyvwnZ
 xoaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuR+kFHKm98eR57dQSsYC2hXp5qRXE2RZhQHHNcoW3UbAt52DkalsGcUbI+o0V+9noLsEMonm4bQQ=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxyLJqBF+dhXb4CiZjwVRM9dC9rfpfUkgtUpkGKkyBIKRMz2HQz
 ubdlELgsFoU80kSwwiB/S6wI9QrFRPGdfa+dJXpl0n9Dc11bVFuP
X-Gm-Gg: ASbGncsG7NpemZ9fPcqZ/IarAbcz5cQ5vNNFL/sdnUmPx2q7vs6irVEcS7+CJVgkRNJ
 BDsUmyiTt9BphFrFNthMxKPLeiY95QkoNWdwoTVzsX9AleDmhOpwhk42ugO48cIaK39BLC07JL8
 +BBGkGWYXkvExLuWz7IYKnn5JeyRwvPeQ4z0bhHiho/vsFykt+udmSc1QUs2oaQLcJY7jEG9AGQ
 fb6FEuHKXkyPgcTeBpkKm/68+L0/qDWlJJhV5aNmCCb4Kk=
X-Google-Smtp-Source: AGHT+IHLCiFk9BrspEkmn14rTTpjbLwBW8SdPWZM+0IkwauKRrd0EY+n9DzEaoNgd6USL3r4X9FuKw==
X-Received: by 2002:a05:6a21:99a4:b0:1e0:e027:2eaf with SMTP id
 adf61e73a8af0-1e5e048adf7mr83019375637.19.1735995539121; 
 Sat, 04 Jan 2025 04:58:59 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad830349sm27761344b3a.47.2025.01.04.04.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 04:58:58 -0800 (PST)
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
Subject: [PATCH net-next v7 09/11] rtnetlink: Create link directly in target
 net namespace
Date: Sat,  4 Jan 2025 20:57:30 +0800
Message-ID: <20250104125732.17335-10-shaw.leon@gmail.com>
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

Make rtnl_newlink_create() create device in target namespace directly.
Avoid extra netns change when link netns is provided.

Device drivers has been converted to be aware of link netns, that is not
assuming device netns is and link netns is the same when ops->newlink()
is called.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/core/rtnetlink.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index a2246bbaf2bc..e8126007eb00 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3776,8 +3776,8 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 		name_assign_type = NET_NAME_ENUM;
 	}
 
-	dev = rtnl_create_link(link_net ? : tgt_net, ifname,
-			       name_assign_type, ops, tb, extack);
+	dev = rtnl_create_link(tgt_net, ifname, name_assign_type, ops, tb,
+			       extack);
 	if (IS_ERR(dev)) {
 		err = PTR_ERR(dev);
 		goto out;
@@ -3798,11 +3798,6 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 	err = rtnl_configure_link(dev, ifm, portid, nlh);
 	if (err < 0)
 		goto out_unregister;
-	if (link_net) {
-		err = dev_change_net_namespace(dev, tgt_net, ifname);
-		if (err < 0)
-			goto out_unregister;
-	}
 	if (tb[IFLA_MASTER]) {
 		err = do_set_master(dev, nla_get_u32(tb[IFLA_MASTER]), extack);
 		if (err)
-- 
2.47.1

