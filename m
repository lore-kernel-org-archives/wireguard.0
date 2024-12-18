Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EB3C3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0f6c851;
	Tue, 20 May 2025 19:36:08 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bad8a8a9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 13:10:40 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2ef28f07dbaso4477959a91.2
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 05:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734527438; x=1735132238; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEdGbFyA09FJ7+QqmmCxpz6A7u+HUg5+S5fgAXCQeJc=;
 b=eSZ2t/mtwSlJc0evOIWUI8w3U6hdM5nglKDo9JvBJ8VEmbguGinl9p94nUnvrMxDSW
 mbtbQ7Nk68XTwcChQQRvhoOhf1fLS9PPkOS9rmQ7wN0JbidO4nYas9Qw3dTqjn+K7kU0
 /MrDCCH7fzD+1gQurVnhddS46xK1Jed/x/HXoMbeHtnfYEt0nW+1epv9KPGg9Yfv8p0e
 oSEbXK12SjKI6qps5PLPiZQvGA3SXIgU55LZAHN3lRvJF9PaXCkdhh0nsaegGFFy7W0j
 hr+UELKkunucNl/Ps943ghp8TUIz/f1bJ9+uDX9Qf5p9T+SzQm5KIEVdNjK1EOlKjCF9
 DTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734527438; x=1735132238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEdGbFyA09FJ7+QqmmCxpz6A7u+HUg5+S5fgAXCQeJc=;
 b=R9Wdyhp49CysrvWdnlwSzfaNOlVDffbDUGq7jUQu2Scihcjfc0shvagOyWYdKP3TPR
 ZVXaCQ5Wb16a9zBRXn1HvCt4hkOlWgBD4AEO5lO2byb04OxExkFd5rp7UTdmPY/pPLFa
 jfrTBMonJqRLEpa+o86hs/pF2dOItemtGOY1MjXJFhpdd1sjUnZOGydmmChzNCJC+g8H
 48zA4cu68xKtaGrCTKOP7ZHpmUr1c9Zd2ODI5e+H1nbyOFNCVnod7snbuPjaVLuzGwip
 Bo3HvWE1X6MuvFMmzqZIeiwj15daP0RoQsjE6dScwB+anT7v5ozPOzdTqHX3DJ7VQ4wV
 Qw1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNRa/aZOCcLamwJUno4cSPlZ8r++dSdLvVyiXVbdxpEcK/jA/9Rr4oxC0hUIVq7puhMw3iNfbuh3c=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwxuVd3Yn4VPbMjCIBFA4XgRakJhd2n1D4HwC4Eydpj4WNrrZk0
 Cy+sFGNnN7RxuJQ7S8/iJt66Zwz6WmkDXWynRsmfpDv2DxC+eS0k
X-Gm-Gg: ASbGncs+EamNV/lon0VvkpLE5j4yeGWkaGrV+EkkcOzoTtE9H8jF7x3Juw1V/oBmQD5
 QgMaug0ukdX6XjUZftpF277Gi037NT/rJwcFpGuuvbN35hTXTqSfflMdfenbIbcbRHonnSApRt2
 Bx+aBwSbGkAwO4FOkQEa/i/qEBeciPy66ER4f7jFCWDq/kYLm/59vlcnEVhdqKuK5IZIGQAkcLK
 JoyArBPeBjc6v57473NB56eM7Hobpf3lycsv9wKr/vsn78=
X-Google-Smtp-Source: AGHT+IH6m2w3HOgAGhkzn76085OHsWsSUyL1uFaSoqu4LH4xby0CPd4muKbobH9sGAmWFqgh4Hldug==
X-Received: by 2002:a17:90b:53cc:b0:2ee:fd53:2b17 with SMTP id
 98e67ed59e1d1-2f2e934616amr4153078a91.29.1734527438446; 
 Wed, 18 Dec 2024 05:10:38 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c0f59asm7434754a12.67.2024.12.18.05.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 05:10:37 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Hangbin Liu <liuhangbin@gmail.com>, linux-rdma@vger.kernel.org,
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org,
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 09/11] rtnetlink: Create link directly in target
 net namespace
Date: Wed, 18 Dec 2024 21:09:07 +0800
Message-ID: <20241218130909.2173-10-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218130909.2173-1-shaw.leon@gmail.com>
References: <20241218130909.2173-1-shaw.leon@gmail.com>
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
index e33ef8a0a6d6..ce5bea096bac 100644
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

