Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0543606A325
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=IoRLkDg/
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c8396d0a;
	Tue, 10 Nov 2026 16:47:50 +0000 (UTC)
Received: from mail-pg1-x567.google.com (mail-pg1-x567.google.com
 [2607:f8b0:4864:20::567])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id bb8dd095
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 16:47:44 +0000 (UTC)
Received: by mail-pg1-x567.google.com with SMTP id
 41be03b00d2f7-cdd4dafdce9so921903a12.2
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 08:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794329262; x=1794934062;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:dkim-signature
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=nG9stXQkwLVFlp/SM6Lzv9KwcbHb+1wfgq3qgejLqIQ=;
 b=t50nkFqEMd6Mw2jhxMHzYyRucyrRM4pirJCmk0kkus9QYjQl2n2ZFriWDVt11tlM9f
 Qp0ecOD/3Xay4mutLUaD5hRDWvhKAWFDmcl/II55K56JMaDYolMgw/VFdGlxjYDy0Eil
 BXGOSHTEd0/HpS5JHwhLVRl1Y0uHHVj6CHYrJit6eFemwPT8HNJtBLGPSiZsNcZ9YHS3
 Zn9fX/QikAPcBAFBwJeCPMy9CxR0M7stXkXgn52EgkggYGNr7eXFSCh1PP010hukIt41
 szsDQaLywuz7b6+0RBRWrmmsqjZ9ycKqg0f5WEg8am+q0+0jlMEr3syFUDcFlT8vEeqI
 bnXw==
X-Gm-Message-State: APuU4Z+21XAwRBoAVPEFP/Tmf7pdbfz13nwYGvTylY9ZbfP3n0+E4GgO
 h38PkgK7Xwhm1sAUIs7is5PYh01zJlW4gi8XoPWCrHQTkRZazRhK5wT49y7Ca5ubXHWtQGQ5LKO
 5hgeBmM91IWcPTD7HxywJR48dRcRkRVbKhlkll2eb8rhmF2ptKfW7
X-Gm-Gg: AYBFou0GRBizhEW6okgWr4NmG8AmCywoOvieylRThTLUH0o1+yfLoyvU/QkuZQGcgVc
 iIaa9n5dJseq/wy5HQ0AGHFlCZc1dPUtBsSge7maRhEshqJlkHXEHJY4eNpm1PFTuIw8qR4aYJi
 IhEohcna2qlM8CFaahDkTwDj0SihyWlaHZlQ/zua7caBw4vBylMeanTk6Lyabep4pRb7zpMeeDP
 uR9Y+AeKXE6LCBzKvLTkFlgx5GATYAYQVhAA1ApQr7mNdK9tK5B9WCbdF7JPMSvEukz06BPOKnj
 dsBFM5RzDqm3Qknag9oacAp0U4l3JOEGUo0Qnpgiu0geChXm4tSsTNLdczbu3WP5hRxJWJd4kFP
 Shg==
X-Received: by 2002:a17:90b:2707:b0:3b0:9e2c:9b61 with SMTP id
 98e67ed59e1d1-3b166cf6979mr3264778a91.35.1794329262291; 
 Tue, 10 Nov 2026 08:47:42 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3b1690d291dsm990689a91.4.2026.11.10.08.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:47:42 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1794329258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nG9stXQkwLVFlp/SM6Lzv9KwcbHb+1wfgq3qgejLqIQ=;
 b=IoRLkDg/XdQGCsYApczobF0xNyOZOVRsSpJaAeYcx8Z4QeSgHjqeionaAzNoKZGOOgM+oL
 LUN63e/LMgVxBdYJN+e5T0DV8vpyjFnXnv5/I8AeILJ1A8QyF5AC0xmKpQ2laIA3oeKy2D
 2Wj2oRk0lyawSr8TLpuq0OlohsoH0do=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 6530d039
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 16:47:37 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:47:35 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Roman Khromenok <roma55592@yandex.ru>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH wireguard] wireguard: device: allow userspace to enable
 IPv6 link-local addresses
Message-ID: <avNKp7OVA7d1X3fL@zx2c4.com>
References: <20261022110039.270335-1-roma55592@yandex.ru>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022110039.270335-1-roma55592@yandex.ru>
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

On Thu, Oct 22, 2026 at 01:00:39PM +0200, Roman Khromenok wrote:
> WireGuard interfaces do not get an IPv6 link-local address by default,
> which wg_open() achieves by setting addr_gen_mode to
> IN6_ADDR_GEN_MODE_NONE on every ndo_open. A side effect is that any mode
> chosen by userspace, via sysctl or IFLA_INET6_ADDR_GEN_MODE, is silently
> reset on the next down/up cycle. Users running routing protocols over
> WireGuard, such as Babel or OSPFv3, need fe80::/64 addresses and today
> have to set the mode again after every ifup, which network managers do
> not expect to have to do. For example, systemd-networkd cannot honor
> LinkLocalAddressing=ipv6 on WireGuard interfaces because of this.
> 
> Instead, set the default once, when the inet6_dev is created. That
> happens on NETDEV_REGISTER, both when the device is created and every
> time it is moved to another network namespace, since addrconf tears down
> the inet6_dev on NETDEV_UNREGISTER. So register a netdevice notifier
> with a priority just below addrconf's, so that it runs after the
> inet6_dev exists. The default behavior is unchanged, but userspace can
> now opt in and the setting persists across down/up.
> 
> An alternative approach using IFF_NO_ADDRCONF was proposed in [1], but
> it removes the ability to have link-local addresses altogether, and it
> was reverted because it broke the selftests.
> 
> Add a selftest checking that link-local addresses are off by default,
> that they can be enabled and survive down/up, and that the default is
> restored after moving the device to another namespace.

This is an old decision, but one I think I'm inclined to stick with. You
can't use WireGuard with LL generated addresses, because AllowedIPs
requires explicitly binding to public keys. So you wind up having to do
coordination between the chosen IP address and the distribution of keys.
The solution for Babel and the like is to add explicitly WireGuard
support and use the neat mesh qualities of Babel for key distribution
too. There has been some talk about implementing this for a long time.
That's the direction I'd like this to go in, not breaking the whole
allowedips model, which is what this moves toward. I hope that's
understandable.

Jason
