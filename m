Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28649C54756
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 May 2025 04:34:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2fc5a10c;
	Thu, 22 May 2025 04:34:56 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b660cfdc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 May 2025 04:34:54 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-742c035f2afso3189625b3a.2
 for <wireguard@lists.zx2c4.com>; Wed, 21 May 2025 21:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747888493; x=1748493293; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Dky3FIQgBX8aNP78AifCGTL6ccyTVByog03wzzXO4zc=;
 b=iJND7X/6ctqt6oBcvgzwOx2prXZERTBjM01W8W6a+Euy1Br2Vl+FaQpQQn3RplMJbq
 Lii4s4rWG2VjYk14e2wXElFkqG5g+thE9aPunv+YlzxhhNrZUJrRy2Xs8cZkeR9GTNs4
 QhpajCTTT0b3G3r7oNLYraMzFpGEAvneZQ2sP23KL8+JTUDqhtQrd4DPIIUd5p0Y5JQl
 LnKoh8THjshU0Pfax8fN12fNPZ4ocRxjw1O5z20i62zCg9b/+olcq7jACi6j7oyiLYMx
 Ut5QRYaY+EjTsAlLeUdtpsHN2K/b2y9lIzfl7IF9ZkO/DR8U83Kql2gGLfuZNGSIpGfy
 uEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747888493; x=1748493293;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dky3FIQgBX8aNP78AifCGTL6ccyTVByog03wzzXO4zc=;
 b=bwRvXHV1/Kgkf3EdMyr8m8a6TkCM51WhbjKcIrwKnLzyR+cOFIOEpCtDf+ZAh4iZYj
 ty/Tpl+w5+bOTM2HNIbX2o6rZNaM2zD+N4EGUil75duF4EpGNW7mxkcZaiGfbiJBKQN8
 fbbVMfcOgFQI0cHZ1GagZX6+/izlVOh2Q/DERW6jwkHnnKwaWX0VmmQkg5fBe6qDZ60A
 S9KN4QaYD4qyHWqc4VHDD/qIsAmOfCknLkrL/UmpPN0qKTIVRSTssrR/jKNic/a8MNZM
 6bEUf/nnGG1gCDkZwYSHFbD3Cm8CRq2jnoGHXrwVv3WQAwLOyvMazP8cQdRfq2X3MSLA
 mUEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf8l2Cn5hrwW0slSG8ag2AytSxePYjITsbNircrxTjPwWRw4ipt4udSoV0giS1FwtMbiT4C1uUg0w=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyXJ6PL4+Zhl/8IuelHerRR7sT//+h7lNr3vSfEaF5OBXAFTKw5
 wEDbubNE5EFLkifghP0inYN5l8aAYAIBfuWOt5cQLAvvJAm7goRe35A+
X-Gm-Gg: ASbGncuRohw/F66c6oSEu7IozbpRhW5W7CKO6cztTrRz9ESp8WinPdiYGnpqAchYoJN
 QagLHIapX2R195QLT90+iKvXhPeIu20R2ytKQHSH93kh1pFCHhJ6V1aBzrKvJYZ0rb2igwr2cyM
 QopPcsKtIeBHTO4HI+qNmlXPGcIkBWpeXrSKUM8vPaHAZYqlalVqaT4hlLXlT1/dElpMc1C8P8r
 J0oAk5VqQA0EBYYz5n2Nn6Xhlb5dFOeEYmxlvgH6Ab10bRvmfvwmli3KHYigmbhhitX6gfLMor5
 WuGXAzUmb9NeM/C/OxQp6ag23ffjY30V5d3QF/vYOEDjPw4GZYSAQPCi
X-Google-Smtp-Source: AGHT+IGh3Q2clU7Qyx5JWq+TxnZeFNMMnKfZXa7ry6Qxs7rCrVIzwW2jPAJC0kCMqhcqM6mA3QmumQ==
X-Received: by 2002:a05:6a21:3993:b0:1f5:56fe:b437 with SMTP id
 adf61e73a8af0-216219b13demr42046834637.32.1747888492887; 
 Wed, 21 May 2025 21:34:52 -0700 (PDT)
Received: from fedora ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb0a9893sm10518551a12.72.2025.05.21.21.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 21:34:51 -0700 (PDT)
Date: Thu, 22 May 2025 04:34:44 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv6 net-next 0/2] wireguard: selftests: use nftables for
 testing
Message-ID: <aC6pZJJn3BiGFVwr@fedora>
References: <20250408081652.1330-1-liuhangbin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408081652.1330-1-liuhangbin@gmail.com>
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

Hi Jason,

I just saw this patch set is not applied to wireguard tree. Did I missed
any change request? Should I repost the patch?

BTW, what prefix should I use when the target is wireguard next?
[PATCH wireguard-next] ?

Thanks
Hangbin

On Tue, Apr 08, 2025 at 08:16:50AM +0000, Hangbin Liu wrote:
> This patch set convert the wireguard selftest to nftables, as iptables is
> deparated and nftables is the default framework of most releases.
> 
> v6: fix typo in patch 1/2. Update the description (Phil Sutter)
> v5: remove the counter in nft rules and link nft statically (Jason A. Donenfeld)
> v4: no update, just re-send
> v3: drop iptables directly (Jason A. Donenfeld)
>     Also convert to using nft for qemu testing (Jason A. Donenfeld)
> v2: use one nft table for testing (Phil Sutter)
> 
> Hangbin Liu (2):
>   wireguard: selftests: convert iptables to nft
>   wireguard: selftests: update to using nft for qemu test
> 
>  tools/testing/selftests/wireguard/netns.sh    | 29 +++++++++------
>  .../testing/selftests/wireguard/qemu/Makefile | 36 ++++++++++++++-----
>  .../selftests/wireguard/qemu/kernel.config    |  7 ++--
>  3 files changed, 49 insertions(+), 23 deletions(-)
> 
> -- 
> 2.46.0
> 
