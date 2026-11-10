Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1557C606A320
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 17:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=VU9PdmUJ
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 946f62c2;
	Tue, 10 Nov 2026 16:57:02 +0000 (UTC)
Received: from mail-dl1-x1265.google.com (mail-dl1-x1265.google.com
 [2607:f8b0:4864:20::1265])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 498612ed
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 16:56:59 +0000 (UTC)
Received: by mail-dl1-x1265.google.com with SMTP id
 a92af1059eb24-1b3beeaf6f9so51624c88.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 08:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794329817; x=1794934617;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:dkim-signature
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=X+GudDoszaGkaaekdu1G8hSiYG4pS+4g5ZGa7GfDq60=;
 b=pttQCO9DIBcDcJkSYUaVJRIRg9fcH2IXW9ZR1h/8sLqAGOq4bbKqOSk/L6hFTcYszP
 QfS22PGU0qLn6RXkNGxqzeqruF7Z9Hzrlv/MaHOwdVVvtPE5TM/1Yox0H9etdVuJNQsc
 7x7mRGZEXKnqqlnCHY03V4yhA8Nut1WCES4VdTGFwXNJAQU55d9O0wGb9EUVILF2FXDH
 wLstMxKEBHZQ/pIK8iYsbKId9o1anVRkRXzAXrt6hzaOi9PLVHGAvjSAi/dkn3K4OE7M
 qLUCBt2szZ7BkbAuoNriWFx7pbj7dN+VkdWefzBom/NM7NIAiVse7ukqVVf0tELYvIbG
 rAVw==
X-Forwarded-Encrypted: i=1;
 AL+hErEN099pGFGAvMXI+SJyJ24Txio6bNNVhVFC+SAsGVY9+fleaO9arBrC99yBOb7UrM3Rxp8/aAMDfe8=@lists.zx2c4.com
X-Gm-Message-State: APuU4Z+xXA8Yu4dBhmqp1LuiKYaB+lA4wQWiZyxxOD4gR9KKtwrboRxG
 dRefUXt2c1CkRRfTE6HGA0Lp3zCepv0K2pwritpU7m7+AoMIX2Fc9L0igm0RwmF4lLTJfkA89fW
 jtbRvPy5nV7u4GHuhFdP2efgqpBlLcQo2cqXWi/A/1A==
X-Gm-Gg: AYBFou1QiO036e7uLwQIpZO01j+wjMCuD1valFnrHaTm+Xxxj5wEHR00Votr3FRLo1v
 b2usoOfb0bnRcyk28zjUmXCXLhrMATboZ/eYClFemL6DsKYdwfHaHI57m7nX6btQPBLL0yix59v
 axQV+PoXJz+epozX1oY1SSiTmCco6n5JdkE59Y9lKoGhO97t+ytjnJZgUKD76mIKlX9w25gAdA1
 xEFwLmAwO1AmHnrVn6iADAKZQMB+2wGNs1dPrDMsEUJLY001OIKmpGqzuSSVSAiWzJjIAseT9e6
 cw05/fy34vZ7oZ3uLdcPfvbgTplCPPiakuL3JBIN8DBYb9T9iGFYzcM5ZRsZtNW/76TUE1AZe6A
 qOA==
X-Received: by 2002:a05:7022:e884:b0:14f:8d59:edcc with SMTP id
 a92af1059eb24-1b3b605bbb6mr4811146c88.12.1794329817371; 
 Tue, 10 Nov 2026 08:56:57 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 a92af1059eb24-1b3b5658ebdsm138363c88.13.2026.11.10.08.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:56:57 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1794329812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X+GudDoszaGkaaekdu1G8hSiYG4pS+4g5ZGa7GfDq60=;
 b=VU9PdmUJxykaWZZSvejhXpmGHLHwalpORgKW+eKYQ29RLeIlDVStYP7vi+u1iI4TbNdVwU
 XayctaVpwOCL+9im7vUTfpqro7jTSU/D3r8GNKnLL1sIwGfCMHSKi7gzC+dhKalCJpYYhe
 u3ie8uMBbRtzNiQfONjeUmnlYdAWslA=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id bb134f9a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 16:56:52 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:56:49 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jun Yang <juny24602@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, Jun Yang <junvyyang@tencent.com>,
 stable@kernel.org, TencentOS Corvus AI <corvus@tencent.com>
Subject: Re: [PATCH net] wireguard: flush endpoint dst cache when a peer is
 removed
Message-ID: <avNM0VAw0fpqzpgv@zx2c4.com>
References: <20261106081538.69465-1-juny24602@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106081538.69465-1-juny24602@gmail.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 04:15:17PM +0800, Jun Yang wrote:
> peer_make_dead() removes a peer from wg->peer_list, but a netlink device
> dump can keep it alive through ctx->next_peer. If the WireGuard device
> has moved to another network namespace, wg_netns_exit_rtnl() skips the
> removed peer when flushing endpoint caches for the original namespace.
> A cached IPv6 RTF_CACHE dst can then survive ip6_route_net_exit(), and
> its later release from rcu_release() accesses the destroyed per-netns
> dst counter.

Can you explain this better in your own words? I'd rather you do the
work of interpreting the LLM-generated output and making it
comprehensible. If you understand the bug, write up your understanding
of it.

> Mark the peer dead and flush its endpoint cache under endpoint_lock.
> Bypass the cache for dead peers in the send path so an in-flight sender
> cannot repopulate it after the flush.
> 
> Fixes: 20ae1d6aa159 ("wireguard: device: reset peer src endpoint when netns exits")
> Cc: stable@kernel.org
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Signed-off-by: Jun Yang <junvyyang@tencent.com>
> ---
> A KASAN reproducer for this issue is available if requested.

Yes, please.
