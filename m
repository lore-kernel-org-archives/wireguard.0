Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E868D606A31C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=io6hQch6
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 572bfa54;
	Tue, 10 Nov 2026 18:19:35 +0000 (UTC)
Received: from forward504a.mail.yandex.net (forward504a.mail.yandex.net
 [37.230.174.44])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a0705673
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 18:19:32 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-65
 (mail-nwsmtp-smtp-production-main-65.yp-c.yandex.net)
 by forward504a.mail.yandex.net (postfix) with ESMTPS id 50958C0184;
 Tue, 10 Nov 2026 21:19:31 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-65 with ESMTPSA id
 DJXb7GFia0U0-UuobqHqp; Tue, 10 Nov 2026 21:19:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1794334770; bh=VpKp3qfT9I2/4AIFnOHw2thJ8PJrOYzM5pM3X9hSNw4=;
 h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=io6hQch6nxz7t+B89tSpK4FHF7YCawH7TZJcvP2USlG6IPMNsETp8OIJYWzxb9KQK
 2bWsz3AxDOhjRAJigmwP62k4ZioW0UNfDO1iHw/Ea+BQgOYbDQrPrWCFv1xL0odl3t
 WzFeAUXNNdFkrtKsAb3BNKdpMwExD1GAJoTpJlAM=
Authentication-Results: mail-nwsmtp-smtp-production-main-65;
 dkim=pass header.i=@yandex.ru
From: Roman Khromenok <roma55592@yandex.ru>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH wireguard] wireguard: device: allow userspace to enable
 IPv6 link-local addresses
Date: Tue, 10 Nov 2026 20:19:10 +0200
Message-ID: <20261110181910.2679973-1-roma55592@yandex.ru>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <avNKp7OVA7d1X3fL@zx2c4.com>
References: <avNKp7OVA7d1X3fL@zx2c4.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 04:47:35PM +0000, Jason A. Donenfeld wrote:
> This is an old decision, but one I think I'm inclined to stick with. You
> can't use WireGuard with LL generated addresses, because AllowedIPs
> requires explicitly binding to public keys. So you wind up having to do
> coordination between the chosen IP address and the distribution of keys.

Thanks for the explanation, understood. Just to note, the use case I had
in mind is one peer per interface with AllowedIPs ::/0, as commonly used
for Babel/BIRD meshes, where no address/key coordination is needed.

> That's the direction I'd like this to go in, not breaking the whole
> allowedips model, which is what this moves toward. I hope that's
> understandable.

It is. I see the direction you prefer, so I'll drop this patch.

Roman
