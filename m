Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823FB606A323
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=oMYGPlhN
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8300c8e8;
	Tue, 10 Nov 2026 16:20:37 +0000 (UTC)
Received: from mail-qv1-xf65.google.com (mail-qv1-xf65.google.com
 [2607:f8b0:4864:20::f65])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b040b758
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 16:20:36 +0000 (UTC)
Received: by mail-qv1-xf65.google.com with SMTP id
 6a1803df08f44-91eb7d1478cso21773526d6.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 08:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794327635; x=1794932435;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:dkim-signature
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Wn9pl2dWY0mvsidzC7ZDrdvAm0x6tULK0E6nQnzg3QE=;
 b=mQyAWReHsta+4Q1u2CRb8lrm4Pp9msAhkZ9b2Qdh3ZODs14J05LgHyOPpg45HZWx01
 MiCxhJU8NbYvKCjIkCl4yD9n0UILegnKW5+TOhH7/owTHHkSoovmlnp4CIF2JYSz2jEZ
 FH3AvRInVD9pid9+ebk5o2XT0o78qlbuHbqG7fOixJAxIC6x7/7jfhYg6FG8GTelzyGv
 +ZXJPKfHaWAQyHSHmZp7Ls8Ky00Y56kwA5VdCbXt1ZimWht91eiyLMHP2+LrDWHx+l6w
 LYTzxHLbYSqnFj/ke4jM7VeToUcaPFvgzLNLGfZNso+24f4RHBvQxYtjzt9tUK2kdfew
 JXHg==
X-Forwarded-Encrypted: i=1;
 AL+hErHfKpBMOYhFNLsHqrT5xDJJxNnlroaXwX3Twngf6jIxIhkM3xKJiKBT1MGPGhIe+1V8UeeU4h5di/M=@lists.zx2c4.com
X-Gm-Message-State: APuU4Z8TgTrVuYAly/S1YLJPtAuGM0TES1LMP+6kX5yq+scIy8ckrK50
 SUS+QCuZoaFjq98GEhk0i9akK+U2zmlmsTuOftwqiAgISnqAbPmeZBixwtQNVfLRLM2EZZSYP1v
 XsgBVD+vP3GrHF2wnrysOyxsMDZCOrdENvbDPbtoEhw==
X-Gm-Gg: AYBFou2m+h4oCX7fpmfPBoywbbPrxOslcznZsgN2FhsdUmVRUKKm5tD8XO6V5jMT8jz
 h6Sl2+QhXeZjLR4Z5ldtaJHgqpzKii2Qcx2dInRv+hld9m+Jq+zYQX67LyZuutKQB62tzPZojdP
 QfmuYFGFN7f1xwxNHDEB7MEZzy3fAU1Erlyl9oMGE8SVcMjRrTyqZJyPyyjlihAajVPf3IwTd5w
 IiqGpp0QrhG9DRenaD94xSzwbTlrrq0XrNQg8Vsh2rgFLdWcl3Z6URLgRyYD4fF6Re7VMq7NLnH
 IVqTzMWiq9Akex3Rcm0FkGoiCRqHXxXVn0C9Vg1LxzUgegY1I8g2XSJJPX32uvkj0SEEVGmq21M
 YgA==
X-Received: by 2002:a05:620a:26a1:b0:93f:1e3c:4a31 with SMTP id
 af79cd13be357-9479f337933mr473994085a.61.1794327634556; 
 Tue, 10 Nov 2026 08:20:34 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-9479efb239csm35618885a.10.2026.11.10.08.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:20:34 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1794327631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wn9pl2dWY0mvsidzC7ZDrdvAm0x6tULK0E6nQnzg3QE=;
 b=oMYGPlhN+9g4AeBDfpCGTBZvu9Avf73LXYnRU6qvPzJzuBsQ3shkH5vxk/jmMg8gWGzwbl
 iRS9Y/grD05nLAnzDqY6ePcGBUuSJekQMzyZ7RF8Z1y6YzzHA0AyatbgR2FGsdiWhRAshw
 xeD1NXhYrsxQ+z6vA0sPv74b16eUe6U=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id cd041934
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 16:20:31 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:20:28 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+de9701a2cad597c14d34@syzkaller.appspotmail.com
Subject: Re: [PATCH net] wireguard: mark racy persistent_keepalive_interval
 accesses
Message-ID: <avNETK_9e7sr-JSB@zx2c4.com>
References: <20261011102322.355167-1-ngocthang2710.1999@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261011102322.355167-1-ngocthang2710.1999@gmail.com>
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
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 11, 2026 at 05:23:22PM +0700, Nguyen Ngoc Thang wrote:
> wg_set_device_doit() updates peer->persistent_keepalive_interval under
> device_update_lock, while the RX/TX paths read it locklessly in
> wg_timers_any_authenticated_packet_traversal() and in the persistent
> keepalive timer. KCSAN reports the race:
> 
>   BUG: KCSAN: data-race in set_peer / wg_timers_any_authenticated_packet_traversal
> 
>   write to ... by task 3648 on cpu 1:
>    set_peer+0x...  drivers/net/wireguard/netlink.c:457
>    wg_set_device_doit+0x...
>   read to ... by task 3652 on cpu 0:
>    wg_timers_any_authenticated_packet_traversal+0x...  timers.c:217
>    wg_packet_consume_data_done+0x...
>    wg_packet_rx_poll+0x...
> 
> The race is benign, but the reader also loads the field twice, so the
> zero check and the timer expiry computation can see different values.
> Load it once with READ_ONCE() and mark the writer and the other
> lockless reader accordingly.
 
Applied, thank you!
