Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23CAC54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 00:00:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5198522;
	Tue, 20 May 2025 19:41:45 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id efdede1f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2025 12:52:25 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-220e989edb6so137428005ad.1
 for <wireguard@lists.zx2c4.com>; Wed, 19 Feb 2025 04:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739969544; x=1740574344; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HRequyiks98F4TvQO/vmtwESixnPXuO1TfB2/aKs1TA=;
 b=F28w4oWlrjn0onNuO0A5sWQRL2rbGIbD2Dj/qgo+GiaIDunXoYiXMoPJsjaAovxEmM
 L9rQpE8hvy6E4Rt5JwIxc0a9A1c9LONWLc6MJHyz17jJDYzy/WbdMflE41qpNasc5w/X
 9kYGCrPKSaBVTuCwl2O2/g9SSjh8tUyAF3mHYJM7mUK+YUbiLuG/lL5U0vWil67tgSvK
 AXV8IuJcHA0prrsRWGAK1TrkggjWduekb0uXbKh1i8fq2E+BRKJTnN49FfOEWOCzm7+i
 xn3JORPhtMplVhhEJIUnv8Z6u0DUu2k3DwzwHoKwTB70GPnXAswF8IGy2kZE4kpXpL6q
 C3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969544; x=1740574344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRequyiks98F4TvQO/vmtwESixnPXuO1TfB2/aKs1TA=;
 b=KT6kSiw4/EjsqGocs98B8GSXafZ2rm4MdMZZn28CribZFXKkTQ27Esxhnom8H+ORfD
 bznrSU9Y+6vSk83p8OpBo9H09xjoiYoGfqMOje7QnVY/IZWWwlKxSFYyDIRBC92Sf2d7
 lUHVn0IAQxEESQbOwq0bKWb+Ozde2Sx/kIzt0PVz3TeCIh4cbysAE8KBuh+v9+eGzlqx
 YitksujEuS3HE950E0YEZ0cx35uqlAc4w7v2KlYFAc3264UvysaRaEX10eZOQuxooQTP
 /BoKKFlbQABitBBL0R/sJHop4FAhOX9sccSTlCBSesmNpslCj23iXCI6KCKTKwdQ85o3
 Strg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYGRXdqzIJ7XXcYfK0RzRHQMptTDR7lGBgR7bd5Zr+N7OP01SRS6jh/kVP4IDjt276Fr/OAldfSts=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yx/OID85tKHEMZoSog+779KCnZzZyI7s0wlf2cMPxo2byuY5LGd
 KOHBIZTRPHKaIn+suUyCp9DOn2okzy73rNihIwK75bfY2GgnO8d5
X-Gm-Gg: ASbGncvF51mEWQzx728AZopdl5hoslfWnqWUbM99uuou7McBWr7YeZ2R6G1bDcvyhmM
 HuD782PljHPgpe7fN8zTxzGiMNWVhnZYbdst8o84PCitVG2oesz/vx6eshi2lrp52m4K9I4ozH0
 sDAHYTSQWna5ATRvqGZWvhe/WlUquzBaI3cmbXf4y9ltQ8vebwg3J6jES+TDq11AcY3/QZkUJi4
 wN+2zOcwr1F8dZdc3BWoQFztvK2ETQPaxNbfaRkXX2IMvshpPr+iSOwGg/g8yLJq5e1t/4nLJUV
 gU3q6g==
X-Google-Smtp-Source: AGHT+IHnb5v62m0BvDxfIowP9iMNtE/Y7pYhM/eIGIlagffbyppVP0uCqTnvfVFz3C1LICvyxAmpug==
X-Received: by 2002:a17:902:e841:b0:21f:564:80a4 with SMTP id
 d9443c01a7336-221040a9a0emr294098225ad.33.1739969543796; 
 Wed, 19 Feb 2025 04:52:23 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d536436fsm103427175ad.64.2025.02.19.04.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:52:23 -0800 (PST)
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
Subject: [PATCH net-next v10 10/13] rtnetlink: Remove "net" from newlink params
Date: Wed, 19 Feb 2025 20:50:36 +0800
Message-ID: <20250219125039.18024-11-shaw.leon@gmail.com>
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

Now that devices have been converted to use the specific netns instead
of ambiguous "net", let's remove it from newlink parameters.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 include/net/rtnetlink.h | 2 --
 net/core/rtnetlink.c    | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/include/net/rtnetlink.h b/include/net/rtnetlink.h
index b22a106621fb..ec65a8cebb99 100644
--- a/include/net/rtnetlink.h
+++ b/include/net/rtnetlink.h
@@ -72,7 +72,6 @@ static inline int rtnl_msg_family(const struct nlmsghdr *nlh)
 /**
  * struct rtnl_newlink_params - parameters of rtnl_link_ops::newlink()
  *
- * @net: Netns of interest
  * @src_net: Source netns of rtnetlink socket
  * @link_net: Link netns by IFLA_LINK_NETNSID, NULL if not specified
  * @peer_net: Peer netns
@@ -80,7 +79,6 @@ static inline int rtnl_msg_family(const struct nlmsghdr *nlh)
  * @data: IFLA_INFO_DATA attributes
  */
 struct rtnl_newlink_params {
-	struct net *net;
 	struct net *src_net;
 	struct net *link_net;
 	struct net *peer_net;
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 9ebbde0d131c..e980481bdd28 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3798,12 +3798,6 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 
 	dev->ifindex = ifm->ifi_index;
 
-	params.net = params.src_net;
-	if (link_net)
-		params.net = link_net;
-	if (peer_net)
-		params.net = peer_net;
-
 	if (ops->newlink)
 		err = ops->newlink(dev, &params, extack);
 	else
-- 
2.48.1

