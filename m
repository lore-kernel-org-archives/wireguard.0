Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753F6C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:05:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79FA2074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFGiGENB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A79FA2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d007523;
	Mon, 9 Nov 2020 22:40:34 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d008e710
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 20:44:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w1so4818939wrm.4
 for <wireguard@lists.zx2c4.com>; Sat, 07 Nov 2020 12:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=B8uI3ib+ND1jWJ9Vi+AOa576ZDPXSgB4pgJH3bG+/sA=;
 b=dFGiGENB8xjIgJjYbC6FXqkzDs/gQ4N8cNUMLJdCGqTIJ83/Os/XwDLFblGezOnkHH
 ND+nGjkGHhzw/ry0Y0gADRSczNt++LkTmgJdIJP9WYimw9mPJ47STOFygWAwitDwLBZt
 uUaipIz314tT0+cgsmSlOz7AzRd1tf5uM0fgVG1qXbLW2gNEOMChThJOmgFHAzlawxOE
 CEjH106Kg3p8KLepzkprIy18AfE//xB/S9TYodexOlTFObFhZxfkUheipXSbi9+Wr7NR
 Ddkb00j0xmAfUOb+NZv6pko4K2agJ7FhfPY7dF121lt5aXI3WPvb4uAK7c41eZENJFX9
 HN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=B8uI3ib+ND1jWJ9Vi+AOa576ZDPXSgB4pgJH3bG+/sA=;
 b=DbykTCC3+yZxNTCqfebrZgprDAv5gpCRBPKba5U2sLtQ2d/Y3QUYBiDLMpQ+4eSqgx
 XzbiTLg5fBQOIQ276TmQUsVjOmdty2e84L33pOxbaeXnTDa50k4JScrvzUUh5QZPcFyq
 L7CEDHVAy817xhjJHFAIfMtqv3d9BOXxY7Rvv9oObZeDgXOvxTqK5KQcgEe1DWL1hsMp
 xWuz8wK+DImp33UqU9s670hAqhYoczgs6p7Eb8zlIBNEKlU2FBILGjBp8MmeuGihFFwO
 BlnkphEQw9TLTIZ9AQSyodp52U5P9ZDt9E1P9zjrcIlX1aYIO8/k83WE77Fj7HQV/I0a
 sxGg==
X-Gm-Message-State: AOAM5335Yxo16oLwzUizkH2MaVKat4tK2ZNtZl+jiKnK/QlR6t2pRTN5
 mMXZs6nyTXv5B8YWr0y6rfc=
X-Google-Smtp-Source: ABdhPJxQRIASrUDnVmJ4/YlnJY9R1ijNwNhlwQ9sKCsI/bMFlpH9zvDMMWsE3RFv0AWYqQC7sqv8Og==
X-Received: by 2002:a5d:6689:: with SMTP id l9mr3723656wru.134.1604782098173; 
 Sat, 07 Nov 2020 12:48:18 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:7051:31d:251f:edd6?
 (p200300ea8f2328007051031d251fedd6.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:7051:31d:251f:edd6])
 by smtp.googlemail.com with ESMTPSA id n15sm2157030wrq.48.2020.11.07.12.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:48:17 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v3 00/10] net: add and use dev_get_tstats64
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
Message-ID: <99273e2f-c218-cd19-916e-9161d8ad8c56@gmail.com>
Date: Sat, 7 Nov 2020 21:48:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
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

It's a frequent pattern to use netdev->stats for the less frequently
accessed counters and per-cpu counters for the frequently accessed
counters (rx/tx bytes/packets). Add a default ndo_get_stats64()
implementation for this use case. Subsequently switch more drivers
to use this pattern.

v2:
- add patches for replacing ip_tunnel_get_stats64
  Requested additional migrations will come in a separate series.

v3:
- add atomic_long_t member rx_frame_errors in patch 3 for making
  counter updates atomic

Heiner Kallweit (10):
  net: core: add dev_get_tstats64 as a ndo_get_stats64 implementation
  net: dsa: use net core stats64 handling
  tun: switch to net core provided statistics counters
  ip6_tunnel: use ip_tunnel_get_stats64 as ndo_get_stats64 callback
  net: switch to dev_get_tstats64
  gtp: switch to dev_get_tstats64
  wireguard: switch to dev_get_tstats64
  vti: switch to dev_get_tstats64
  ipv4/ipv6: switch to dev_get_tstats64
  net: remove ip_tunnel_get_stats64

 drivers/net/bareudp.c          |   2 +-
 drivers/net/geneve.c           |   2 +-
 drivers/net/gtp.c              |   2 +-
 drivers/net/tun.c              | 121 +++++++++------------------------
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
 20 files changed, 75 insertions(+), 175 deletions(-)

-- 
2.29.2

