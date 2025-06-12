Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B084C71136
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Jun 2025 10:28:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05a6a9d8;
	Thu, 12 Jun 2025 10:28:24 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 639fa8ae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Jun 2025 10:28:22 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5533a86a134so655493e87.3
 for <wireguard@lists.zx2c4.com>; Thu, 12 Jun 2025 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1749724102; x=1750328902;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jdrRzDXFOwHG448jvig1wt2IVm7ZK5vVmOxfUEc3Mfw=;
 b=k2LWUCF99iaQCXqk/3sCJrg0uzJSDqHg8Ww2VkHmF1f0rEkUXwwFw8RJFwsTR+rzXg
 L16nLaz5sg6nLxODza85FXgBpyLFT9kCMrBmTP9peA7y376jMKJ90tZE8FxyrkykbzjW
 83PocYTBCye893zFYsTYC67V4yYFrX7CbIB3o3Ulbur2kls1ISfT98o/f3QMUSxC7lto
 2pumIV2oh3ElrBJjmcS6VimrkX9qdnNCytWouVt9OmmuHvtzDKm/OWqN5dUDbEXhU7xg
 wfPXXcLGDneZcU5iZrZVTnyO3X08OFweD4Yc5qpY9j46ICgI1mbG3wAStSDP5WYyQMso
 7HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749724102; x=1750328902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jdrRzDXFOwHG448jvig1wt2IVm7ZK5vVmOxfUEc3Mfw=;
 b=So8TF00sZpX9Ll5VoGXIkRVoUyhvTgUKYxFfwCPld9pIMwaGdqVxly5p4uyHr8q/IN
 73h947ABRSKq3if3qGt8O2nwi+lfZagoc+iVqJ8gSTp+Cl0pn1mq6ppCe2KfJN5cpDQn
 9WF5jGwZ/5LOhA5cEq+1i/gf0V5CBSHcB/Y5eWzByoD8Jp/cFTlfF2ruuzmuikN23M+v
 SZNbeMhuqnKE1OL+hUP15eb2qcLq2wJbuxJCQuvYU3rRiWDnoA38jruIN1ZwfVubjflG
 ZX2lIjcfli5nKz+9qyVKgyMrbtjNwi1v8/y821zhMJ3C7TznU/13qBgV8DUxZjmbRoE1
 fvSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbtLjGXzsgeTnFABFA86YECnyHA6K+S1O5kXgjccSixoW92IRoX7CMC7eA7ERmGsOSjTlKdhUTBug=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw6HIBSbLQmTsFIUuJQynpX9Zq0e0c2GIwi3a2dNwHGzJHsIeQl
 XXWOjXjNq4O/RYBmXGDiC2IXydzRX4XpfpDB9WsMuJ90UGa6sDw+9m3RYpcujGfY0ck=
X-Gm-Gg: ASbGncup6E/4Ak3wyG1oSbjHGOMjfUG/IUv8xQPBVM/Y97LQIZ4sVVUpJ5oBkX0rsf8
 GyROz9yvKuprzIk1+fF+WRf26D6m9XkZhvPpv3zUsMUjwf6hCkMZya+GbgzBhFP8nAvFWXcsW6u
 LSX0Qv0j75ALtBCJp3d/8DvTrJaDHh9nXgc6xXBCdMfN7m+7NBcYsGGKAHI7Le6z+rathWTA8Sj
 2qDLv29YAYWVIowLwbArv+fvUAw/bfKBIvXUzjOwibXwJiyEYXcFJfFgTmq6JX8Iqeca3AfrdsB
 QIFysLlCpvO6Fwynn4/knv7vpZaDUjJWrdUA1MqKuvg1ApnnfbjkHMuFJgUs57YGNdl8btdZPii
 FRiaWAAXmXsBXD3uBiFFG8pyoLF4w611SuvRdyMPDgg==
X-Google-Smtp-Source: AGHT+IGMFEbW3kewoiFhwiIdhmG/b2bgCVSsV0qnpHHNcqp+03mzW/XSSQXifX6p6Cue4i8glJvBHQ==
X-Received: by 2002:a05:6512:4004:b0:54f:c6b0:4b67 with SMTP id
 2adb3069b0e04-553a5453064mr1024275e87.4.1749724101957; 
 Thu, 12 Jun 2025 03:28:21 -0700 (PDT)
Received: from [100.115.92.205] (176.111.185.210.kyiv.nat.volia.net.
 [176.111.185.210]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553ac13f0besm68262e87.84.2025.06.12.03.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 03:28:21 -0700 (PDT)
Message-ID: <def0704c-38ed-42ac-8287-503ebbb61115@blackwall.org>
Date: Thu, 12 Jun 2025 13:28:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 01/14] net: ipv4: Add a flags argument to
 iptunnel_xmit(), udp_tunnel_xmit_skb()
To: Petr Machata <petrm@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@gmail.com>,
 netdev@vger.kernel.org
Cc: Simon Horman <horms@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 mlxsw@nvidia.com, Pablo Neira Ayuso <pablo@netfilter.org>,
 osmocom-net-gprs@lists.osmocom.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Taehee Yoo <ap420073@gmail.com>, Antonio Quartulli <antonio@openvpn.net>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 linux-sctp@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
 tipc-discussion@lists.sourceforge.net
References: <cover.1749499963.git.petrm@nvidia.com>
 <c77a0c8e4ada63a0a69d7011fb901703ebf1f09a.1749499963.git.petrm@nvidia.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <c77a0c8e4ada63a0a69d7011fb901703ebf1f09a.1749499963.git.petrm@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/9/25 23:50, Petr Machata wrote:
> iptunnel_xmit() erases the contents of the SKB control block. In order to
> be able to set particular IPCB flags on the SKB, add a corresponding
> parameter, and propagate it to udp_tunnel_xmit_skb() as well.
> 
> In one of the following patches, VXLAN driver will use this facility to
> mark packets as subject to IP multicast routing.
> 
> Signed-off-by: Petr Machata <petrm@nvidia.com>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> ---
> 
> Notes:
> CC: Pablo Neira Ayuso <pablo@netfilter.org>
> CC: osmocom-net-gprs@lists.osmocom.org
> CC: Andrew Lunn <andrew+netdev@lunn.ch>
> CC: Taehee Yoo <ap420073@gmail.com>
> CC: Antonio Quartulli <antonio@openvpn.net>
> CC: "Jason A. Donenfeld" <Jason@zx2c4.com>
> CC: wireguard@lists.zx2c4.com
> CC: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> CC: linux-sctp@vger.kernel.org
> CC: Jon Maloy <jmaloy@redhat.com>
> CC: tipc-discussion@lists.sourceforge.net
> 
>   drivers/net/amt.c              |  9 ++++++---
>   drivers/net/bareudp.c          |  4 ++--
>   drivers/net/geneve.c           |  4 ++--
>   drivers/net/gtp.c              | 10 ++++++----
>   drivers/net/ovpn/udp.c         |  2 +-
>   drivers/net/vxlan/vxlan_core.c |  2 +-
>   drivers/net/wireguard/socket.c |  2 +-
>   include/net/ip_tunnels.h       |  2 +-
>   include/net/udp_tunnel.h       |  2 +-
>   net/ipv4/ip_tunnel.c           |  4 ++--
>   net/ipv4/ip_tunnel_core.c      |  4 +++-
>   net/ipv4/udp_tunnel_core.c     |  5 +++--
>   net/ipv6/sit.c                 |  2 +-
>   net/sctp/protocol.c            |  3 ++-
>   net/tipc/udp_media.c           |  2 +-
>   15 files changed, 33 insertions(+), 24 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

