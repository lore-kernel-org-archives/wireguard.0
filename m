Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7FA606A31C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=igskeO0d
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d6fba778;
	Tue, 10 Nov 2026 16:57:35 +0000 (UTC)
Received: from mail-dy1-x1367.google.com (mail-dy1-x1367.google.com
 [2607:f8b0:4864:20::1367])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 859277a1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 16:57:33 +0000 (UTC)
Received: by mail-dy1-x1367.google.com with SMTP id
 5a478bee46e88-36f6295304dso3005872eec.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 08:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794329851; x=1794934651;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:dkim-signature
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=FSVjfbOy+6Li8/mrEmgfTAZk9pjE0e6I6pX2kMrymD0=;
 b=PEdopKpb7ZDbg1jnaWhXEKvmTcofNuHmROl1d+mHCDdcYVfuzYnjX65GYWVcVp8pgO
 psEoC1novLnSYpErrfS8E7oZZNLSKgDErfWtpzUg11lzI3+KyVJKDANh2UhP6pXpSBAL
 Q7LgxbVGluQJjLFc2OyrHuu3cnCx73bbZoFCgSdSovjCGJ2X6uGo2sB6G1GNci+nKfmI
 OuKC6iPbQX5akXTX/doQRlX/PwKXHzmA2TxPAPRD1x+30xRrqJyNHDA8pZAFQKnL46hN
 aD1RmidnwS9oRKCGGUbABsjn3+6TJ39/wicH75D6hoPS8noYSb9u13NOQ2RV0FZjxMTI
 +S7w==
X-Gm-Message-State: APuU4Z/gNP/s5YE2VAu84lOUU3WciJNqgmaX+N3sDbq+SfTfaZxfJWL2
 5gDhNUvJS5WbBEEflQjFBYNu9U0FfrmMImbhkHVV1HrIXPdEsWZjxoD3skfeTIlSl2QU5iaczO8
 YnJV6O/14F3QLv7SFKK/xA5ERK/K4kA8D2FE9uvXFng==
X-Gm-Gg: AYBFou1DDNrsgQKGc6oUWZQ00jG6T9pY+WVwICchrdKt6BfkZiWrnoNp7UF10iVrqsF
 iXacI04dYwb8d0n5XRiyMv1Y0BTYRcBrymDNrVyIOxHP2IbKhaIQHMOL2Cdt175LY0IAO5LrPX5
 7DK7azwPFOzoFY1sHPZo9YeDVBZC1mbnVlfHhBm2aMP/FqxPVXhR2zOHuJ+Gq7P10fRGF01ma3b
 EzlB7Hy9sREnXxBFF5S3xFVJmbEyXyH12w7N+jMXx+ZuZPjV/SF48bOvND3/OpdXsY2PQ2n3qXj
 jBrBHAGIt0yAMeortiIMyROW+Lzdp0/zyUPLzwGG+f9zXyxDQSH4OhXOfOr2SYCDfItRaaJK5YF
 odg==
X-Received: by 2002:a05:693c:8357:b0:36e:c07a:426f with SMTP id
 5a478bee46e88-37520218a2dmr3752045eec.39.1794329851138; 
 Tue, 10 Nov 2026 08:57:31 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 5a478bee46e88-3751fc3a433sm26539eec.9.2026.11.10.08.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:57:31 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1794329848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FSVjfbOy+6Li8/mrEmgfTAZk9pjE0e6I6pX2kMrymD0=;
 b=igskeO0dU3czlXFLU3ba5Ctyixi/3mpmhqAyoR0afH1i5cZtn9wxirqKTypweqxdarSCf0
 nm+3JYM7Npe+xc+vRZSGXIqiuK/nnDRDiONzihYmVdv+yteq6kdi3HIfWWkoB2UwyhP5tR
 ek4m/meE/BlTy3JjB9lznpSNB9RYcpU=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 919b48b2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 16:57:28 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:57:25 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alexander Ildiyarov <alex@badcode.im>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net 1/2] wireguard: account peer and allowedips
 allocations to memcg
Message-ID: <avNM9dfdW1uULJUf@zx2c4.com>
References: <20261105141006.95083-1-alex@badcode.im>
 <20261105141006.95083-2-alex@badcode.im>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105141006.95083-2-alex@badcode.im>
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

On Thu, Nov 05, 2026 at 05:10:05PM +0300, Alexander Ildiyarov wrote:
> Peers, allowed IP trie nodes, the per-peer dst_cache and the per-device
> hashtables are all allocated in the context of the process that
> configures the device over netlink, but none of these allocations are
> charged to that process's memory cgroup: the wg_peer and allowedips_node
> caches are created without SLAB_ACCOUNT, and the hashtables and
> dst_cache use plain GFP_KERNEL.
> 
> The amount of memory is bounded only by MAX_PEERS_PER_DEVICE (2^20) per
> device, with no limit on the number of devices or on the number of
> allowed IPs per peer. Since WG_CMD_SET_DEVICE uses GENL_UNS_ADMIN_PERM,
> any user who can create a user and network namespace can do this, and
> thereby escape the memory limits of the cgroup it runs in.
> 
> For example, a process in a cgroup with memory.max=64M that adds 100000
> peers with 20 /128 allowed IPs each grows Slab by ~790 MiB, yet the
> cgroup's memory.current stays below 1 MiB and its memory limit is never
> hit.
> 
> Fix this by creating the two caches with SLAB_ACCOUNT and using
> GFP_KERNEL_ACCOUNT for the hashtables and the dst_cache. The keypair
> allocations are left alone, as they happen from the handshake worker and
> are bounded to three per peer.
 
I wasn't aware of this trick, I think mostly because most drivers don't
use this. Does any other part of the networking stack do this? Is this a
normal thing?
