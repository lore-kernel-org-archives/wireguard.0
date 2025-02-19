Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7837C3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d654377;
	Tue, 20 May 2025 19:41:48 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5a251e95
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2025 12:52:34 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-221057b6ac4so72013875ad.2
 for <wireguard@lists.zx2c4.com>; Wed, 19 Feb 2025 04:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739969553; x=1740574353; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14Wr2OB3TipJqOg2i3ltQmzAxlBlaCt+7msGZ+i4teQ=;
 b=dYMq0ooDTtHwQFt/vbzNphi0mLCHiYyPouYLirFs9WZ/oL+tey/255CY9/NlLcwjsf
 g8IeTJxW4GnuSz2x+w0+k5bD6ksEZ00ecMP2R1yFDsb623LGhvst545JaoKrbPuB7Pji
 QnsW0xir4ajN73wG/pP9BXcaylpBQWVnomPoKqELDej4DeADgiwu1GSEbF0Sf3mO7kAT
 ftFnW8oW/FryPTYQek0GlObSA4f9Qj+KT7/0DENo6HOC6I4EU1fHWbcXFvr1REOfadT/
 6CW1JY66k3czjHVFZPcykcb4rvlD1Tnruwtr1IEBRFBIoi6tJpRlO1nQc08UV7Ivbsei
 Y+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969553; x=1740574353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14Wr2OB3TipJqOg2i3ltQmzAxlBlaCt+7msGZ+i4teQ=;
 b=CSz1fQ6mmFSqMuLS99GcrfSAjzEmGIQwRNt5W3ROpR9uWlaAQb258+tiMQs4QOHgRl
 DixG99VdDAN9Ny/Dh/9rwYOIW8bCiaIVLd42hZpPNAZh78PNXTWh1NS3Eunqd3tGeHZK
 MngnQeYXHhTtMteY6J3gHg4r0pmGDnGWDiEet5iXTpfKCmPx/EpBElM+yAsQmBmqyHjQ
 3CsbhSI6SJKmXJePtD/9WMITgKX1KYOfzWRn4o8kgPmR/XGqs/U3Tzjj+/1zKhH2f/vy
 sd6zoAhx9D0D1uPndXYThntjfEQLV/32I4gd45u18N/PdlqZFGS+Z25AZ1T5PRrWCpL/
 5TsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHWrKRp6Arp2fTC5wKjkRy5N2DNXI+ZaX5ydxm9MWvzLcDPMjSF465sX9nQMsVcLP4ETBK3F2nDIk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz2rA0KCc+TFoWHZ2Id1lyuF78cp+ZvonwJ0vJqU9tfpKWY47nN
 sV5rP+iteS92mlNOMwen2/dTiMQwcZNTLN9onBZY9eqjikxJl7wM
X-Gm-Gg: ASbGncsngD9D4oE6VjAMqEDNi+p8qBaudjvWoao1DhQ/DInqjTXS51G6An33IoCG6S3
 nQXADZWF+wxAzX/TG8mjBNJuvgpgccpItyrw37Xblb9NOiiW5J5M0FKuLPaKXYtqAs5NPqefAsr
 2dljyM1QMpUy26tHa1o6ysc4bW1Fdm4v52SIj3C3/ptI1A/CfZRPjU1SXPE+LFh5hUdzK+Zg3WV
 A82bPIv04gZ26ngz30o47sEvNgsPETxIeCfz8gefa2JhWISygD0/RTkMfMPd8efbuFjAOerC/Zz
 oYoFbg==
X-Google-Smtp-Source: AGHT+IE1TMZXqzhrHhhVSaIMtrPumBVmrpPdtKnId51KbxVQ9NXXxJP9rSJ1kBfk/uhAUxck4sNSxA==
X-Received: by 2002:a17:903:1a2d:b0:220:c813:dfd1 with SMTP id
 d9443c01a7336-221040bd77bmr298031085ad.36.1739969552787; 
 Wed, 19 Feb 2025 04:52:32 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d536436fsm103427175ad.64.2025.02.19.04.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:52:32 -0800 (PST)
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
Subject: [PATCH net-next v10 11/13] rtnetlink: Create link directly in target
 net namespace
Date: Wed, 19 Feb 2025 20:50:37 +0800
Message-ID: <20250219125039.18024-12-shaw.leon@gmail.com>
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
index e980481bdd28..b52e610e157e 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3789,8 +3789,8 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
 		name_assign_type = NET_NAME_ENUM;
 	}
 
-	dev = rtnl_create_link(link_net ? : tgt_net, ifname,
-			       name_assign_type, ops, tb, extack);
+	dev = rtnl_create_link(tgt_net, ifname, name_assign_type, ops, tb,
+			       extack);
 	if (IS_ERR(dev)) {
 		err = PTR_ERR(dev);
 		goto out;
@@ -3810,11 +3810,6 @@ static int rtnl_newlink_create(struct sk_buff *skb, struct ifinfomsg *ifm,
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
2.48.1

