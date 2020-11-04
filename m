Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E06EC4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:47:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B44F1206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtgT+zS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B44F1206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d6a07c6;
	Mon, 9 Nov 2020 22:40:20 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 847b94fa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 14:20:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id k18so2477629wmj.5
 for <wireguard@lists.zx2c4.com>; Wed, 04 Nov 2020 06:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=sAFLjN4ixxy17kgbFWahJMbPyXmphyBag2SqscTf81U=;
 b=QtgT+zS0egP5DPQ1l06MHd/ZoaweA4XkqKLQqOOODh89FNmYsrIHcKFLRCmzXZmo/x
 w8keMj7G8YEk8ozSzHRY5ZrDz9iFAZRAbhq59u/2olT7o9cI17KTWT37hpZqns9q4X8Z
 eyd2KlVHieVzZgNP9lec3P3A5BHXwVoJW+c1YX2Ci5dzfxEpBRl5+HdaZtna3a1Eh/LU
 ENjQU0oXHIwZYqdYLcyaD6Uyw4S8E4QZgjWL4PHKo6ZBg0Ql3KCnA5IGJ86/ELFRMPXT
 mnCz6vwUq/zD2sVs8DmUDnZM2lL05HRU2RpO003y7vQCU+PTqL20DkYSeYNw0yXkzzzj
 E73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=sAFLjN4ixxy17kgbFWahJMbPyXmphyBag2SqscTf81U=;
 b=JTUY7PefUhpdYxRHdoCtgp54FNWoSllhV48jKOBLPmTrCXF77GNRUluvaAOba+R6HU
 75df3DdkJm6uCvtu82SjpzwbrDDlz5pLJZpFDrhRu1AIiUVSos3Xuh6sK+syUj3zeRQk
 4cDwQXqBm8p4s3n0a0T6YeV1vTA1//FG/casn9dzKo933U3/W5yOf2PkTSegnKjz6sBy
 mPMTfTvXY4RDhCbC87DlDfGqLgwNHp9LhYZZYSUvLttQBq2MVuKlqCFikheMDbF4Axpg
 Ly8k56M+t1RK6H0+JSy7D4RWRddoOvKxkjgB7QogiueCtacpGLgekPPoRnpZHRvDuZbI
 fFqQ==
X-Gm-Message-State: AOAM533OzwilJaPww6pT5919as8fVPPMAq+BaFmIfKX2nRlxm0FvlElk
 HqdUcq+nfeg9Zwv60yo670k=
X-Google-Smtp-Source: ABdhPJyIXiEIUfwfazgmJaWSHB/oz7V51EN1FrvzBr4dTC9NTfkCsHD2QEpvmenUDs3pPo9PQGaEow==
X-Received: by 2002:a1c:3502:: with SMTP id c2mr5022741wma.79.1604499793388;
 Wed, 04 Nov 2020 06:23:13 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:d177:63da:d01d:cf70?
 (p200300ea8f232800d17763dad01dcf70.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:d177:63da:d01d:cf70])
 by smtp.googlemail.com with ESMTPSA id m126sm2356252wmm.0.2020.11.04.06.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 06:23:12 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 00/10] net: add and use dev_get_tstats64
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
Message-ID: <059fcb95-fba8-673e-0cd6-fb26e8ed4861@gmail.com>
Date: Wed, 4 Nov 2020 15:23:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:11 +0100
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

It's a frequent pattern to use netdev->stats for the less frequently
accessed counters and per-cpu counters for the frequently accessed
counters (rx/tx bytes/packets). Add a default ndo_get_stats64()
implementation for this use case. Subsequently switch more drivers
to use this pattern.

v2:
- add patches for replacing ip_tunnel_get_stats64
  Requested additional migrations will come in a separate series.

Heiner Kallweit (10):
  net: core: add dev_get_tstats64 as a ndo_get_stats64 implementation
  net: dsa: use net core stats64 handling
  tun: switch to net core provided statistics counters
  ip6_tunnel: switch to dev_get_tstats64
  net: switch to dev_get_tstats64
  gtp: switch to dev_get_tstats64
  wireguard: switch to dev_get_tstats64
  vti: switch to dev_get_tstats64
  ipv4/ipv6: switch to dev_get_tstats64
  net: remove ip_tunnel_get_stats64

 drivers/net/bareudp.c          |   2 +-
 drivers/net/geneve.c           |   2 +-
 drivers/net/gtp.c              |   2 +-
 drivers/net/tun.c              | 127 ++++++++-------------------------
 drivers/net/vxlan.c            |   4 +-
 drivers/net/wireguard/device.c |   2 +-
 include/linux/netdevice.h      |   1 +
 include/net/ip_tunnels.h       |   2 -
 net/core/dev.c                 |  15 ++++
 net/dsa/dsa.c                  |   7 +-
 net/dsa/dsa_priv.h             |   2 -
 net/dsa/slave.c                |  29 ++------
 net/ipv4/ip_gre.c              |   6 +-
 net/ipv4/ip_tunnel_core.c      |   9 ---
 net/ipv4/ip_vti.c              |   2 +-
 net/ipv4/ipip.c                |   2 +-
 net/ipv6/ip6_gre.c             |   6 +-
 net/ipv6/ip6_tunnel.c          |  32 +--------
 net/ipv6/ip6_vti.c             |   2 +-
 net/ipv6/sit.c                 |   2 +-
 20 files changed, 72 insertions(+), 184 deletions(-)

-- 
2.29.2

