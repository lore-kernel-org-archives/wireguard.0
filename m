Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57BDD49225
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:47:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7c5fa22;
	Mon, 18 Nov 2024 12:39:28 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a921b601
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Mar 2024 11:27:56 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a45bdf6e9c2so237215166b.0
 for <wireguard@lists.zx2c4.com>; Fri, 08 Mar 2024 03:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709897276; x=1710502076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2tYchlzzh0DWN5u11fzPiUQLbsNm+gor451RXEwI+Y=;
 b=YNL2ZwYfpYRC3hMoeuAVWPcYR0t0AndHa+whs0S9KfrFuYyGSX70y9MZajlkTexk7G
 g55H1790KkoBcVqH98kYnWj4Jj3d07a/GD27oL/O8EaiymP+HhKFBqam5iY/S5q/QTBy
 /h+WdWDLX9QY/Q1PZlvfNwUohZdZ6YUIEa7BhvL5tGEycKJjlbTr3zwXiIV0AWPfgkav
 WThsXh7OE2QeVrYbq+n7jTScct6y46FYh6NIDt1tDmBIvhAf/GL5vFMu+mqxc1wRvlKV
 tB2BG5QFFfL7QHhfsc+vjY+C20r/9E5AmWFNFOvh1kXktCC8svzpd5Yx1PV6864mvmCd
 feXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM2sDjrhkL0eEAiYR918IV/1zTsUF1dx5Hk/dOpoOGWrZ8pq3G66V+kV32EV1Q4CPr0sQ22UB9C+F12ZprhRel02drggzDak2I
X-Gm-Message-State: AOJu0YxcYStZhdeFSQEKI0BGZb5ylpO9/17TeAVsaPYyXLeppFNsMWUQ
 M33mQnhUuIZjMpFrM/ofa9GR6XVNd+7giJazymsr/yeFqNKIIM9b
X-Google-Smtp-Source: AGHT+IExIjq/3gTAAba1u39o8IWU9zZ2Oe9BqI1GRzXLIcpP/kx/b/AaCO9kcs8m3n31QLxpnNoezA==
X-Received: by 2002:a17:906:4888:b0:a45:b1cf:42f6 with SMTP id
 v8-20020a170906488800b00a45b1cf42f6mr6172173ejq.9.1709897276329; 
 Fri, 08 Mar 2024 03:27:56 -0800 (PST)
Received: from localhost (fwdproxy-lla-118.fbsv.net.
 [2a03:2880:30ff:76::face:b00c]) by smtp.gmail.com with ESMTPSA id
 p22-20020a17090635d600b00a45f2dc6795sm339290ejb.137.2024.03.08.03.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 03:27:56 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 dsahern@kernel.org,
 wireguard@lists.zx2c4.com (open list:WIREGUARD SECURE NETWORK TUNNEL)
Subject: [PATCH net-next v2 2/2] wireguard: Remove generic .ndo_get_stats64
Date: Fri,  8 Mar 2024 03:27:45 -0800
Message-ID: <20240308112746.2290505-2-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240308112746.2290505-1-leitao@debian.org>
References: <20240308112746.2290505-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:39:22 +0000
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

Commit 3e2f544dd8a33 ("net: get stats64 if device if driver is
configured") moved the callback to dev_get_tstats64() to net core, so,
unless the driver is doing some custom stats collection, it does not
need to set .ndo_get_stats64.

Since this driver is now relying in NETDEV_PCPU_STAT_TSTATS, then, it
doesn't need to set the dev_get_tstats64() generic .ndo_get_stats64
function pointer.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/wireguard/device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index 6aa071469e1c..3feb36ee5bfb 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -237,7 +237,6 @@ static const struct net_device_ops netdev_ops = {
 	.ndo_open		= wg_open,
 	.ndo_stop		= wg_stop,
 	.ndo_start_xmit		= wg_xmit,
-	.ndo_get_stats64	= dev_get_tstats64
 };
 
 static void wg_destruct(struct net_device *dev)
-- 
2.43.0

