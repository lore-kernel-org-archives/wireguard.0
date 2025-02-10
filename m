Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7F6C54E93
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0399ddce;
	Tue, 20 May 2025 19:40:01 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 647f0bea
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2025 13:30:56 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21f2339dcfdso68365365ad.1
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2025 05:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739194254; x=1739799054; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tN6LBIpl7aUsxZAQ1nC9Mvrd+HBX5wlThy/HCxYMvw=;
 b=GBU29TdB7vLrxxP39GesEUt1htuWOKsR4cwtG8+Qg+oOnjfpV1zBEh9VTuDAEyRtmq
 YQODQS4/rdL9V3YTTOsL0Qe2x4t1N5BDVDATgs4vFomm0LUDZSd1o+8e6780sCFs2pyW
 so+UwXNNQdLB5IhuKqlRRTsCj97k2jlKxc2nByQInWrc71X63p6qJPJYFuC679qNq+u3
 mSUqwyyXASdE8bG05TVPQ+VaHr2Yx/qY7ZnrtVtB4bFDaoGWt7G4aSm+ylqTzmbBuAao
 pq0p39ekkwLpvODUO7B0Pd1KjRo9JTFd2oImsQ1ATQcE4kJB2kbOm5V2PXgyivAcdDt3
 eU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739194254; x=1739799054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tN6LBIpl7aUsxZAQ1nC9Mvrd+HBX5wlThy/HCxYMvw=;
 b=q931jsPvemspKYTWOJdX9io7WNeQrZJ4iv6zgtRUuDg0Syt3poapt10yuWYx6sWn1z
 xBLgQe0poA3iFFpWaqzU+j8VI8DzLndTA/5co8FDerCMxdIXwS0844Rc3zVFTy+/O6ZY
 N9+aF2U2bnrYL9zUc5vwSQXKbFcnUHb9q2Ktoj61/pkyH1Rlk20X4ZajNjNBSUU54rMT
 Q2kn+6zeS9/7Lb+NY+lanFo+S4qdWnJuQWtrKUAS9VHgOECxf9tTb98AWaoM5jAP2DOx
 mGgCZ+vKW95IH7DX8B0T6qXXJL00VdVscPUhIC3xtDNbZ1chI8uirzitt7W7Tyqk03hF
 PRkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4YJHdgSfg+4GVFIk84CkDk+VJLaUj22n6OCLwSdnHGigJBk+hYhHDMcTC1kSnNar96iTKmckBKyI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz2VQyLWsw6fp080YvRG4XKuEijEmi2Ua8Asvn8dlHsuHqI/vYR
 UOSv//2JLqQ7cYvPl5RaWn6L4ZxvtvUbr6A+F8UaD35QWlTU3bHH
X-Gm-Gg: ASbGnctXIvp+VrCsEFtik6gdwGASJnqVzr58RVB+gO7ag4URJbyCsmMbtbd+HBB8fsK
 o21D2c1aik/jU4/PCCn+Gor7IDfltGPAcGtQpAugspfdYutvRMnL9fpmsvysk1Ov4HW2ruWQLDd
 tnj9ujF/SWkAhjoRlQ6E5/xEavknhX0D6GThYUs4a5Ywm0DCmTu3mPOc27EGFhd3xlU54WpN9XZ
 0qen4h5s+KhtYs1h9s6lq/NAMZqE9YKkqadRtpeHMZd8x/Hm9AN+AawEfcAs1uSaoHeKFSlUVsS
 iaRFMg==
X-Google-Smtp-Source: AGHT+IF8gihjdkRbSU1HRP8R4mEppMkEAKGDChElxIvCxKcXV79FUInFhj/RnX7alUKIg2RAq5xNnw==
X-Received: by 2002:a17:903:46cc:b0:21f:6d63:6f4f with SMTP id
 d9443c01a7336-21f6d636ff1mr134607475ad.2.1739194253851; 
 Mon, 10 Feb 2025 05:30:53 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653af3bsm78799445ad.57.2025.02.10.05.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 05:30:53 -0800 (PST)
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
Subject: [PATCH net-next v9 04/11] ieee802154: 6lowpan: Validate link netns in
 newlink() of rtnl_link_ops
Date: Mon, 10 Feb 2025 21:29:55 +0800
Message-ID: <20250210133002.883422-5-shaw.leon@gmail.com>
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

Device denoted by IFLA_LINK is in link_net (IFLA_LINK_NETNSID) or
source netns by design, but 6lowpan uses dev_net.

Note dev->netns_local is set to true and currently link_net is
implemented via a netns change. These together effectively reject
IFLA_LINK_NETNSID.

This patch adds a validation to ensure link_net is either NULL or
identical to dev_net. Thus it would be fine to continue using dev_net
when rtnetlink core begins to create devices directly in target netns.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/ieee802154/6lowpan/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ieee802154/6lowpan/core.c b/net/ieee802154/6lowpan/core.c
index 704bf9e3f097..ee318d46817d 100644
--- a/net/ieee802154/6lowpan/core.c
+++ b/net/ieee802154/6lowpan/core.c
@@ -143,6 +143,8 @@ static int lowpan_newlink(struct net_device *ldev,
 
 	if (!tb[IFLA_LINK])
 		return -EINVAL;
+	if (params->link_net && !net_eq(params->link_net, dev_net(ldev)))
+		return -EINVAL;
 	/* find and hold wpan device */
 	wdev = dev_get_by_index(dev_net(ldev), nla_get_u32(tb[IFLA_LINK]));
 	if (!wdev)
-- 
2.48.1

