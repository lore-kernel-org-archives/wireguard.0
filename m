Return-Path: <SRS0=WErI=2X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5489AC2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 20:10:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C14DC21582
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 20:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="aPopwBk9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C14DC21582
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51433eb5;
	Thu, 2 Jan 2020 20:10:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ea7def2
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 20:10:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32be6824
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 20:10:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1e8393e;
 Thu, 2 Jan 2020 19:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=515R5UqtoWY0
 Qb8RIQWLHtFH9bI=; b=aPopwBk9ZQg0zFtQMqeiY/mXrdTqF6ObdV+A2lFonwRu
 SyCEZp5ZZpConAVMX2Ez9MvrqZLMvus+y79nRPhJxZnH0Ct8ZXqTxLfirRSQ6CLn
 DYtLhuU0pfjp28TT1zfkOJU34uQBXmg2jeU0xGg0HbHN0t945BkGWl72OB04VfUZ
 UWW8Q74e+2pNgTwtEVvaWKlnOdJssI69oCE5QDYcVA3jiDpSlI7UY5UC1Q0OIENu
 oVbl5rvuXotVYRovzSpu1FdORkMtrw8V7xyh6wxBAPiqHX5RGkLvB3MJZ5PC9+Jj
 d6OPdaxsvQtERZg2gRTNjXApLlaL+rR7fJZ+yxZUWQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id afb602c9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Thu, 2 Jan 2020 19:12:05 +0000 (UTC)
Subject: Re: wg-quick: syntax error, unexpected saddr
To: stunnel@attglobal.net, WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <762ea0a4-cc2a-4b7d-91fc-efa9e9531043@zx2c4.com>
Date: Thu, 2 Jan 2020 21:10:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 1/2/20 6:25 AM, Eddie wrote:
 > First time running wireguard as a native client on my Slackware 14.2
 > system throws this:

So far as I can tell, Slackware hasn't updated its WireGuard since 2018: 
https://slackbuilds.org/repository/14.2/network/WireGuard/

I've tried several times to contact the maintainers and have not 
received a reply.

It sounds like their kernel and/or nft are similarly bitrotted?

Maybe consider a new distro.

Alternatively, just get rid of nft from your system, and it will 
fallback to using iptables.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
