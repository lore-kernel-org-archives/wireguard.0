Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FC3D49226
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:47:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76661bb7;
	Mon, 18 Nov 2024 12:39:25 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6261afaa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Mar 2024 10:34:33 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a3f893ad5f4so87550966b.2
 for <wireguard@lists.zx2c4.com>; Fri, 08 Mar 2024 02:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709894072; x=1710498872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XagB2LkBSV5q8D6u6Fwx7UufMS0bw8vTRFIb2KLQwug=;
 b=ZysvVmorGLY7x88LFaQWLR0HyijlY2Up3GfuzbQyd187gUJ9GqUpi8xoZKgbTI48u9
 N3Q0Qsyb2s7G+RouWfDNW0Z8w0BhkxZFhklGkww1o4oeW0rbEj6ogI1E4lYn5/1TfeJm
 Ls6FK0a4aDMy1vxOv4220SH/eBmfeIObDTeyNYQA05qy/VZycgQ7QxLkcl2vYavDDrQc
 5BIw6Y2FcraZlrMjvDIIjh9BM/dEQGK7InbnBaHJBnIg0XrvYCPvhQfDDY+blXxRuIgB
 GQWzxV1APnKfmWV9EQxP3S8tpWzdQr/YiumSpRZ25GlOqXXnIp1oeZkk5+/Jx3bVbuqV
 tiLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeOnuRyT60/KlVnVUdJRXFHQXOwuVtv+uGaFi3vcoJbGjxZes+kYs2VKqNbCI7kz1/Ox6sa8OVwSFxOpFuN/uXG9qkI7NJG6Fu
X-Gm-Message-State: AOJu0YxXZJ/RCxdSBH0llPiB+8isuZQkxoy6Ykfl6o7qE85UCFFxq2NA
 2ffduo9lsy3V+vEDrg/wg6ZnD+vgEqS2GAE2Y1aEgM76hIqRHLe7
X-Google-Smtp-Source: AGHT+IGyNSLodNc0h4ktHrVIEYbbfZTb0oilAJIHPaJ7ue0mB7a++vK8N5tq65PuSeYnwlaBf4byHQ==
X-Received: by 2002:a17:906:c7c3:b0:a3e:34e8:626f with SMTP id
 dc3-20020a170906c7c300b00a3e34e8626fmr14919878ejb.66.1709894072325; 
 Fri, 08 Mar 2024 02:34:32 -0800 (PST)
Received: from localhost (fwdproxy-lla-120.fbsv.net.
 [2a03:2880:30ff:78::face:b00c]) by smtp.gmail.com with ESMTPSA id
 p16-20020a170906229000b00a442979e5e5sm9133311eja.220.2024.03.08.02.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 02:34:32 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 dsahern@kernel.org,
 wireguard@lists.zx2c4.com (open list:WIREGUARD SECURE NETWORK TUNNEL)
Subject: [PATCH net-next 2/2] wireguard: Remove generic .ndo_get_stats64
Date: Fri,  8 Mar 2024 02:34:18 -0800
Message-ID: <20240308103419.1771177-2-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240308103419.1771177-1-leitao@debian.org>
References: <20240308103419.1771177-1-leitao@debian.org>
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
index cb025ba8f60d..0f7ed274fdf7 100644
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

