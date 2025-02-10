Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E59C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfcd5f44;
	Tue, 20 May 2025 19:39:51 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f53ab712
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2025 13:30:27 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21f7f1e1194so35836085ad.2
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2025 05:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739194226; x=1739799026; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1pf9SNTQbR6dSoBCEAV6dPuN8Gz1/YecnHQoz2AJqpo=;
 b=BdjwwWFV7OGsMrcux4cvTE/bDRph3o3qNByBpi2ysLb7tAruCyZcBGFT0kYt/DBS8k
 gxxVlEcxW00ZlLNSsv7Oo0+pXZXjfN1EzVBQ3TwhwzF5YU6iKm6KFwj39kfjdCJnEvFv
 EuKqxxiPg5+0jSV3etfjr4pgm5lPJozYNsZTcMN2CFDR/MjozsAAvgNKOss3vGMQrmI7
 8tEVYI+UYhopzFgqELh/57t09AJGs7I9V1194avfghb/TVomX5bPJcvVNRnZnSVRnQj4
 dU2MhOX8KrXwLRYdmRs/1vko38/X0dsIEGH8nTW+7FFy+1svvv+CgftK/UUa1VqR7AxK
 xbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739194226; x=1739799026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1pf9SNTQbR6dSoBCEAV6dPuN8Gz1/YecnHQoz2AJqpo=;
 b=wdg1Opgd3tSOfxP2vbCmhKLniIHHm/JFGZ9wiKxYO31Y+QMmd47s6d6/KHro1s6Bcs
 8zzT64R+4nnL3i4reqdp01WjtGvyCOjpYMWQur1Q1BcRKs1XUvwBm8V0CRF8FaAFTvPT
 xC17+CLV0fYgc2V91MS0VIbuONn66Y+k7bMMKFplbaDdWvxOTy/EVY2A8M5QdVAGjixU
 cUS7KOvN6Z5o4qh7bnwMrGhUo9GyGyDwmPip7HdGD7uCm3EnqTzM+GpCCpPrNvNWvi0+
 Iybraq/dfO3q3YkBdmeq4X2rHMySonARagbJNX0PmpUhd1lK1MLh/XhEfEbgbg0uZBv0
 wc0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Uw47k9oxnFaga6OMZsZTusjkjheyEbadXXPMi2D/7/IlzJZAJyL6l4TJ34+LykLA6fs0YnUHFi4=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyUaQonvgC7gKmahhXcdasQym2wDKVbSQ9J+BkEK0wRGXicIjui
 n2F9IQK+7v6hR18ewNntqMrwAiLoPmbgEDFH/st9kggFTOfsDppc
X-Gm-Gg: ASbGncszlwPDE6fhZyV0PKkLFQ3klu8aQkzxrsMhJrJyaIW6KMPyQivyLqBeaCi/We/
 uobdPZAxBColgPiVgHj0PcVYsLAbXEqhGb+Z4+NulYLSapVGzgvHyjgD3561BLR7+BgPdwv54DV
 pS9pR5bZu4OcmG9haWuqJPAhROSw1QfrOGjMuzf7vN8HiLeCH+cMRWLEzCvvCllrcdVcXmiTjVs
 tAz867rjT1V7EpmGNRcgRvf3iUyk5xv4XC9qBxg1PK6hsbifCKwwiJJ3TgN937cfz/uxuBhGLJN
 xH1O/A==
X-Google-Smtp-Source: AGHT+IHnIbIec9duqjv7lrtmGReNVQPeBtoczKplB0CDd7UUW+fM90Yj1MwAFqvvYB9Zquhv6onO5g==
X-Received: by 2002:a17:903:240f:b0:216:7cde:523 with SMTP id
 d9443c01a7336-21f4e739f99mr242405235ad.32.1739194225944; 
 Mon, 10 Feb 2025 05:30:25 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653af3bsm78799445ad.57.2025.02.10.05.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 05:30:25 -0800 (PST)
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
Subject: [PATCH net-next v9 01/11] rtnetlink: Lookup device in target netns
 when creating link
Date: Mon, 10 Feb 2025 21:29:52 +0800
Message-ID: <20250210133002.883422-2-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210133002.883422-1-shaw.leon@gmail.com>
References: <20250210133002.883422-1-shaw.leon@gmail.com>
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
Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
---
 net/core/rtnetlink.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index cb7fad8d1f95..3b3398283a8f 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3866,20 +3866,26 @@ static int __rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
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
2.48.1

