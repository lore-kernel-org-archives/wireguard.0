Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDBCC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:18:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4928C2065D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RewXkz0y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4928C2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 043e7b4a;
	Mon, 9 Nov 2020 22:40:44 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d75c7026
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 20:52:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v5so4660688wmh.1
 for <wireguard@lists.zx2c4.com>; Sat, 07 Nov 2020 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=K0xwbWgfzNb+siGOnTIoHV8a22y8LDX4Jm2bW67sNRs=;
 b=RewXkz0yxtg6uetza1ABn8L2kBaJ7gR1QEC6XOoJfzcxVIdzO9VtMc34ucxIQo9HAB
 47oWrL5XwzFQkwDWdzldihU7pUwuSfMwQNbOlV8nfxNcjmynsTI+1xCLC6O8CzJx7HDb
 rqfTjTPrOG1R0OAsX25BSosCjbVtjFegUHAV9eZMI1Aal9pkD9hmk1oTFuoNZbFLzfVW
 8CLvhBJwaAVCUGuPhZ5EpuYJPNpjt7nVwDUBRiPWV0lBlCUKXav+jfHlLKshvUituOx5
 6Cf94DQVBThnAC062jsQ2dnbdyyapRLhFtpZipWKyJO6hCO32VaWhshQ0yxau5fK39Hf
 5LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=K0xwbWgfzNb+siGOnTIoHV8a22y8LDX4Jm2bW67sNRs=;
 b=m8oVOSq+LqrEoSEYOwJYjxzu4G12F3+NVnxfWgKa8HgvxrRryOE2eIBvE3U/2oZcwT
 gpPUqbl29Aufv8Bs64Q/0sq9cTPb7TE27v/M2qL8jy0/kuxxFYUDCetVv76lxbEbxfxv
 Xveloc/157Ju4ScXug97H0gctmmGI42/JGHwm+8mxNyP4fmPkCmsM+yDIQrtJBLnTMVR
 t+r3+Nec6R7FjIWBFrKiYTB/Z/1eDc2Vrx1KEMPXCobU8TJn/Qje7SNVz4Estv12E0+s
 njY7BVygaHGLp7B6FCAtA+stdaEXoQGpqPfu59C6dHnqWG6GZLoTbw7MjKWRpryTWb+0
 KbeA==
X-Gm-Message-State: AOAM532+vlmq2htxw8POMouwBDx7k1Lb9zRuzBCSUz2Rv1sw1ycJhEMb
 sxQZk3N/Ui+OZhlsEDYQ+MM=
X-Google-Smtp-Source: ABdhPJwpKeyWsiU5WCdAlSQ/eplYWVZkfVvVQccFtw50TJ/mpHkRmbUHbOQxf4ZPHjy4+Y7KWGUlag==
X-Received: by 2002:a1c:1906:: with SMTP id 6mr6213436wmz.87.1604782576497;
 Sat, 07 Nov 2020 12:56:16 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:7051:31d:251f:edd6?
 (p200300ea8f2328007051031d251fedd6.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:7051:31d:251f:edd6])
 by smtp.googlemail.com with ESMTPSA id k16sm1179409wrl.65.2020.11.07.12.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:56:15 -0800 (PST)
Subject: [PATCH net-next v3 10/10] net: remove ip_tunnel_get_stats64
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Harald Welte
 <laforge@gnumonks.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 osmocom-net-gprs@lists.osmocom.org, wireguard@lists.zx2c4.com,
 Steffen Klassert <steffen.klassert@secunet.com>
References: <99273e2f-c218-cd19-916e-9161d8ad8c56@gmail.com>
Message-ID: <1d5992f4-6d88-1bef-9756-06d48fc10a31@gmail.com>
Date: Sat, 7 Nov 2020 21:55:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <99273e2f-c218-cd19-916e-9161d8ad8c56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:12 +0100
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

After having migrated all users remove ip_tunnel_get_stats64().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/net/ip_tunnels.h  | 2 --
 net/ipv4/ip_tunnel_core.c | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 02ccd3254..1b7905eb7 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -274,8 +274,6 @@ int ip_tunnel_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd);
 int __ip_tunnel_change_mtu(struct net_device *dev, int new_mtu, bool strict);
 int ip_tunnel_change_mtu(struct net_device *dev, int new_mtu);
 
-void ip_tunnel_get_stats64(struct net_device *dev,
-			   struct rtnl_link_stats64 *tot);
 struct ip_tunnel *ip_tunnel_lookup(struct ip_tunnel_net *itn,
 				   int link, __be16 flags,
 				   __be32 remote, __be32 local,
diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
index 25f1caf5a..923a9fa2e 100644
--- a/net/ipv4/ip_tunnel_core.c
+++ b/net/ipv4/ip_tunnel_core.c
@@ -429,15 +429,6 @@ int skb_tunnel_check_pmtu(struct sk_buff *skb, struct dst_entry *encap_dst,
 }
 EXPORT_SYMBOL(skb_tunnel_check_pmtu);
 
-/* Often modified stats are per cpu, other are shared (netdev->stats) */
-void ip_tunnel_get_stats64(struct net_device *dev,
-			   struct rtnl_link_stats64 *tot)
-{
-	netdev_stats_to_stats64(tot, &dev->stats);
-	dev_fetch_sw_netstats(tot, dev->tstats);
-}
-EXPORT_SYMBOL_GPL(ip_tunnel_get_stats64);
-
 static const struct nla_policy ip_tun_policy[LWTUNNEL_IP_MAX + 1] = {
 	[LWTUNNEL_IP_UNSPEC]	= { .strict_start_type = LWTUNNEL_IP_OPTS },
 	[LWTUNNEL_IP_ID]	= { .type = NLA_U64 },
-- 
2.29.2


