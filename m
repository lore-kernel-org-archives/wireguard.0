Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8467ECA0FE1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 23:17:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e513e1f;
	Thu, 21 Aug 2025 22:08:40 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6ac94326
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Jun 2025 11:21:09 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-adb2e9fd208so170699566b.3
 for <wireguard@lists.zx2c4.com>; Thu, 12 Jun 2025 04:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvpn.net; s=google; t=1749727269; x=1750332069; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=izHnPXiYoTBneokvv1hu9m+7dLFok2Jhf1Nqy0rykvY=;
 b=MbhZDPTaO9NjD3R1DNWvvloUQwEGI8jwmsgnR/98kb3URjCLwHCYrCwwhQltI7GGlO
 bTzzXxOXRJ4If1hvBvXGiBicDppMsdD4FiTyqYV8bqHe21xGyuH/b+ijWi+FIRKYRqST
 uvW+YYlYPeMwX6K/Q45kzC0V020OaNSKM+xGVf9TIWxuv3FUoJaFtHsBlfOPbbhpNixE
 /xjlVzaxTSxofFu/hO1vP5B86YiV1642Lfztk2VFX7tHD+WnodT3jJyohCnUGDXqcJOI
 gUYJvjRv4QUGXnfbk+KgPvdGS6FWkVtp18At6cTw58+ujkZC/UAIcmzG96gQvzdm4G2a
 1JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749727269; x=1750332069;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=izHnPXiYoTBneokvv1hu9m+7dLFok2Jhf1Nqy0rykvY=;
 b=VEogv6CG4OpoxshnyCiOkv01NUnIq+ugvCgt1yz0E7gerzb4WfsHwfCuGb/av2lt9H
 gr6E1LUamc9Vaw/+Ue9BHa7tn9czd6bW1VMOwxo9dcbi8B4pU5KiRl+rY4BV4LjEzXLe
 X8fXjrtbSMQo3af4oIckSMZ2su6j1goWQpaPADA3YTU6FKLVaoaAl6CrAKVITS6z1dEB
 kIcxOQ4eW6SGvAQG188BI9hCGbmtjj1uWxuQfE537NDIpxucR7wrJLTVOi13N8aspbON
 QmwD0/aCSPpR35VcGYdYQd96cXMlRjZ5NkAh92Z+fNLSksx12F64zujZFphvrEaNgozt
 Wh8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmbQilwxbEMkW3iol/xZ07Nw1O5VPVqzr5DjLPnHBBAFaJlPxqAAiVaqknm3vQxJYTNpHq5tRs2SE=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzGGKgIBX0K9YSmG7+S52a/Q7B7dQ2rrlhD3b1D79X8GXI/nA3C
 pFHetw/9uiUN3OGkLIH+w6hLXqJ/qOFtO0Kj3IPdR8q2xMabrTAAOhgfnkvMe8f78IU8oQVsUr+
 O+pe+9iC4vMZnFuqYS2DrBEGgrmXmcepA9o69d8wL6vGIzAxh4Sfd2Tg=
X-Gm-Gg: ASbGncuhY7QuUZqgrDtIGqD+eAvL3B3yKtDEiiW3fiB9k5gj1K4X1D5S6T9elVsC/8a
 g/oDnhCQn+xxNyniWYunCj9H1cBoBp6I5Cih8qKGTbs5GN6uI73SfH+tJGJK4OFmunqvZVLGXaU
 tDz+nO9gSnajCNsP2v6RZTm5ouIu7/SZcl/G7XbiZg/ILMpRfWebLdmxDHME9mRWeDS5A7GXEai
 Q802ctD2btnDqsmG/Nuu3GYnBPl5cac4wm30VI+onNBirazqgiPlyTe0mvH8MJ0RNR2WPRej5nA
 a+d7+XVDtDhM2v5y+GW87yVIE/WJl9vMGtZLooletlsqzGRgLvTqg7aYMWZVZzmdVHam9nW0DB6
 BzGBJu9Gb1Xd5bchEWl66Ew==
X-Google-Smtp-Source: AGHT+IG32Jgp4TMA7lCBexDTcDiVY2kbdEbExXQqe7eQtCA22E2tcCY1TdJFi3Ti5SLLEYiXvj7ozw==
X-Received: by 2002:a17:907:7f03:b0:ad8:9257:573a with SMTP id
 a640c23a62f3a-ade893dfcf7mr630132366b.5.1749727269216; 
 Thu, 12 Jun 2025 04:21:09 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:66f3:a0b:4137:82f3?
 ([2001:67c:2fbc:1:66f3:a0b:4137:82f3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adeadf204ffsm118284366b.171.2025.06.12.04.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 04:21:08 -0700 (PDT)
Message-ID: <faa9f6a8-daea-40f7-82dd-fb1133010629@openvpn.net>
Date: Thu, 12 Jun 2025 13:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 01/14] net: ipv4: Add a flags argument to
 iptunnel_xmit(), udp_tunnel_xmit_skb()
To: Petr Machata <petrm@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@gmail.com>,
 netdev@vger.kernel.org
Cc: Simon Horman <horms@kernel.org>, Nikolay Aleksandrov
 <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, mlxsw@nvidia.com,
 Pablo Neira Ayuso <pablo@netfilter.org>, osmocom-net-gprs@lists.osmocom.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Taehee Yoo <ap420073@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 linux-sctp@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
 tipc-discussion@lists.sourceforge.net
References: <cover.1749499963.git.petrm@nvidia.com>
 <c77a0c8e4ada63a0a69d7011fb901703ebf1f09a.1749499963.git.petrm@nvidia.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <c77a0c8e4ada63a0a69d7011fb901703ebf1f09a.1749499963.git.petrm@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 21 Aug 2025 22:08:39 +0000
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

On 09/06/2025 22:50, Petr Machata wrote:
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

Acked-by: Antonio Quartulli <antonio@openvpn.net>


-- 
Antonio Quartulli
OpenVPN Inc.

