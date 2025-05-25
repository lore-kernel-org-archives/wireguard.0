Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024EEC54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 May 2025 12:48:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b4e76f8;
	Sun, 25 May 2025 12:45:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8193c112
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 May 2025 12:45:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E49C960007;
 Sun, 25 May 2025 12:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E2DC4CEEA;
 Sun, 25 May 2025 12:45:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cbV6N2Rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1748177133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X0IMLIr9XUsYuhPn0ZV1mTdzCq3rdtArgFxVhTo20ls=;
 b=cbV6N2RqdYIFe+YVipBt3SsK1DXf1vslIRMZNLnMVgVVqYi5MKrfYbcI51HoPdWU2jSpDY
 6M/tjOb0Fs0mQ9NBZDBsVtT51sJ4cqabCmguEjJLvgt42GGN5rgthP5Dp1RQsAW6QPR44q
 /bPbGzWNIDkRnHVrDHak/Uxe3h3maYQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dc29e2cf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 25 May 2025 12:45:32 +0000 (UTC)
Date: Sun, 25 May 2025 14:45:29 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Claire Elaina <git@claire.sharkgirl.ing>
Cc: wireguard@lists.zx2c4.com, adam.irr@outlook.com
Subject: Re: [PATCH wireguard-tools] wg-quick: android: add support for {Pre, 
 Post}{Up, Down} hooks
Message-ID: <aDMQ6eE_aIUTV4dB@zx2c4.com>
References: <20250525080457.998659-1-git@claire.sharkgirl.ing>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250525080457.998659-1-git@claire.sharkgirl.ing>
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

On Sun, May 25, 2025 at 06:04:57PM +1000, Claire Elaina wrote:
> +static void execute_hooks(const struct str_list *hooks)
> +{
> +	for (size_t i = 0; i < hooks->len; ++i)
> +		cmd("%s", hooks->items[i]);
> +}

This was also posted here, so copying Adam:
https://lore.kernel.org/wireguard/DM6PR13MB24579CD788EF28E019933C0A92609@DM6PR13MB2457.namprd13.prod.outlook.com/
https://github.com/WireGuard/wireguard-android/pull/23

This feature is appealing, but I've always held off on it because I'm
afraid of the malware potential on client platforms where people are
pretty looseygoosey with loading in random config files. Even on
Windows, it only got added behind a hidden registry setting. If we added
it here, maybe it'd need to be quite gated too. But then how do we
handle cases where a config had it but it was disabled and then it gets
enabled and it's there by surprise? Maybe strip it out on import if it's
disabled? What about the transition from root to non-root and back?
Anyway, many questions.

Wondering, what commands do you want to run?

Jason
