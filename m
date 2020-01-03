Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C60C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:55:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3678217F4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="F77rR9DX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3678217F4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa68c083;
	Fri, 3 Jan 2020 15:54:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19035062
 for <WireGuard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:54:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10cebca6
 for <WireGuard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:54:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f7d8364
 for <WireGuard@lists.zx2c4.com>; Fri, 3 Jan 2020 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=VL//saIwuvoL/PZxL+2nxeqM/uo=; b=F77rR9
 DXRQkm3Zst90ugORILHxQMvFH/kNEQTcV2wrWkyj6+omeh60XK9iBOXnx2wKmlok
 DNfugp5fOavrr37b9cTxYqF0N2G5EQQ6EIO09H8f9O6pAx8d0VilRZ441wabmVok
 96+V6ngOXXBCkSb23wE8rtXhW+tzOS0uzwxzYYAd3cuz/7QP3vZy3Au/B+ai9jHD
 jReKnZMWmeUOyTgcl1h9SkFaXyM6iPon6e2mGeeUFYzcleExHrQG5Sk2TZ4+3/RH
 0Fu8eRzxav+G5MQujD0jKOagFCbw3oM7GCfdhKYDsIRSCY6NhMwHVIIOI5WESMi4
 N1Q5/bAFgyYsldmg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b7c0e9ba
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <WireGuard@lists.zx2c4.com>; Fri, 3 Jan 2020 14:56:04 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id k14so61670739otn.4
 for <WireGuard@lists.zx2c4.com>; Fri, 03 Jan 2020 07:54:42 -0800 (PST)
X-Gm-Message-State: APjAAAVYAHMb+WoFUkcX1HpTwoi61VaPkaSU0f3qEzKZtiPSKUL9PSVO
 +lE0Dt9bxqhm0/Vwhq4+9sYHtikBQhKwFUMmb1g=
X-Google-Smtp-Source: APXvYqwy9wjr1KovjI5y6wwEmhdD8SuoeLiA8gO8kW4FUoS/yAaVfhc+TT9wTYzr0bD3cL6Abo36mTCB69/B/7aTXgg=
X-Received: by 2002:a9d:4f18:: with SMTP id d24mr96083953otl.179.1578066881807; 
 Fri, 03 Jan 2020 07:54:41 -0800 (PST)
MIME-Version: 1.0
References: <ef68748c-4b72-3287-781f-52cb93483de1@icloud.com>
 <eae1d28d-bcf2-8e42-93e9-2b6c5879e28c@icloud.com>
In-Reply-To: <eae1d28d-bcf2-8e42-93e9-2b6c5879e28c@icloud.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Jan 2020 16:54:30 +0100
X-Gmail-Original-Message-ID: <CAHmME9r9HnJWc+_8tEoDKNtd6QrhRKP_nTZSaJ4TGVW5+bhm3Q@mail.gmail.com>
Message-ID: <CAHmME9r9HnJWc+_8tEoDKNtd6QrhRKP_nTZSaJ4TGVW5+bhm3Q@mail.gmail.com>
Subject: Re: DNS fails after undetermined time in-tunnel
To: Lee Yates <rainmakerraw@icloud.com>
Cc: "WireGuard@lists.zx2c4.com" <WireGuard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Interesting bug. According to the man page, the -u should already be
implicit when doing -a, since the contents should be different.

Can you look to see where in the resolvconf script it bails out? Maybe
stick a `set -x` at the top or something similar?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
