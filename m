Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5582606A323
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=WhZUmgXT
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a5784017;
	Tue, 10 Nov 2026 16:12:56 +0000 (UTC)
Received: from mail-pj1-x1065.google.com (mail-pj1-x1065.google.com
 [2607:f8b0:4864:20::1065])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7abdce73
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 16:12:54 +0000 (UTC)
Received: by mail-pj1-x1065.google.com with SMTP id
 98e67ed59e1d1-3ae6b4c669fso1413221a91.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 08:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794327172; x=1794931972;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=in2GRGedn8xujhUfMjqdyzbGddtgYvZlV+27x56RYsw=;
 b=ykQ8kAgKQsc1bqC8eM8w399WUQcbd9NFa7mHYxcvnuQy1YyqoVr0WC8yc/tvc80cn5
 Qp8ogGRB7DGckTPCVQwsE+kb6pTNjIFqX7ZU303tOqQP0namQujZNrGwlV2q+i0pUgEl
 dLyQelNUS3OmF5dWmSryxw2oymG37d1IoHs0HgSqZqqC9wgLLi9v73KPU9I5m1UkW/B2
 oqsWrUEOm58R4QLxWmAxN9zWfFafWAPVDeRvXOPCG9DTNSs2eNznNjzalmvZ6qIbYaXf
 uwXuNwFPd1tLBcd3pLTnssN25b5ESmdiapxghnAhvgAQKBh6pCM/JLVEyvYR1QKfTG6m
 u8uQ==
X-Gm-Message-State: APuU4Z/MSTnfXxE5KSOjCyoTZ6xyJk0oXO9/lOMRYNkcx6eujuf45s7G
 AnYYWkmct5VwhS7nrj0rSsT1OsR5NwtVYEEKyVsufoj7UegmuJ4B2p5L6Oeq83yAnz0SCxnN547
 ObDlPn37iAsZjF1U4B1wjmnxugEhd2s1Y26lYZEnjUA==
X-Gm-Gg: AYBFou1YWJlObpAlbe5RACmpfhdqS3mGRNk85ZZz+RpfAdomN08E2LxIgjf1pVBd5rz
 ByAnQk1J5n0omDmuhlt9eEzcwFmG/V/T62FVQd6snwFkrT6xOsSnVkTve0mHUlLtpubir+iqbbi
 O5Rkxf2QLoftaDkpTi4jfC7wNKaCGeTSKOlwt1OJgRvXETu4UYFIiD+uV7nbuLbkDlkueVsP68K
 yFoMetg8O3Ao16u/L0lwWwx/8+0FvBSJdRnC/EcJmn2DERF2ZFET5SeE37bhlW2ZWLzRNwxRV22
 I9IvlvcmzpOyRVdbCOogZEhQwPaMYI3YZt9l44YqkYRyXFgMoZMXwMCBknSlu6B39kdxD3TDpmZ
 CfQ==
X-Received: by 2002:a17:90b:5625:b0:3ac:36c7:c144 with SMTP id
 98e67ed59e1d1-3b1679ba42emr1924377a91.28.1794327172047; 
 Tue, 10 Nov 2026 08:12:52 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3b17e0dccfesm170958a91.4.2026.11.10.08.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:12:52 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1794327167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=in2GRGedn8xujhUfMjqdyzbGddtgYvZlV+27x56RYsw=;
 b=WhZUmgXTiHPEQa5m8oXC9xJGHWmDVDhBJOCOKZ68i0JAgrryuJ2OpKISMMArTDvqKX9J3p
 gly0mlrzj/PiWbAWnd57JXbMST0Ayd3lZxBjRTHC45wOgvxvTiqVvYN7mP52oUauJ3QI0S
 qnL9KbBPK/0Od73r2/adXduAhczgmS4=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id b5d66eed
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 16:12:46 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:12:37 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S.Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Antonio Quartulli <antonio@openvpn.net>, Ralf Lici <ralf@mandelbit.com>,
 Sabrina Dubroca <sd@queasysnail.net>, openvpn-devel@lists.sourceforge.net
Subject: Re: [PATCH] wireguard: socket: fix sticky source address on p2p
Message-ID: <avNCdbpjxM752XSw@zx2c4.com>
References: <116cec552f58748d434d4825c6c74f39266b265f.camel@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116cec552f58748d434d4825c6c74f39266b265f.camel@infradead.org>
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

On Fri, Oct 30, 2026 at 04:38:06PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> WireGuard attempts to reply from the address to which the original
> packet was sent, caching it in endpoint->src4 and validating it before
> each use with inet_confirm_addr(..., RT_SCOPE_HOST).
> 
> For Legacy IP that validation always fails for an address on a point-
> to-point interface, because confirm_addr_indev() insists on
> inet_ifa_match(), which compares against ifa_address — the *peer*
> address on a p2p link — under a /32 mask. The local address is never
> within that "subnet", so a perfectly valid source address is discarded
> and send4() falls back to kernel source address selection.
> 
> For peers on the far side of the p2p link, the fallback happens to
> select the same address and nobody notices. But when a peer on a local
> LAN sends to the p2p address (e.g. my OpenWrt box listening on its
> external PPPoE address), the reply is sent from the LAN interface's own
> address instead. A stateful firewall on the peer then drops the reply
> as unrelated to the flow it originated, and the handshake never
> completes.
> 
> inet_confirm_addr() is an ARP helper answering "do I have an address
> on the same subnet as this"; what send4() wants to ask is only "is
> this still a local address". Use __ip_dev_find() for that, matching
> what send6() already does with ipv6_chk_addr(). IPv6 does not have
> this problem.

Hmm... How did you choose __ip_dev_find() over, say,
inet_lookup_ifaddr_rcu(), which is structurally more similar to
ipv6_chk_addr()?
