Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E8DC43217
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Dec 2022 13:11:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8a28a2f;
	Thu, 1 Dec 2022 13:08:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5c4bf313
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Dec 2022 13:08:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48C8B61FF6;
 Thu,  1 Dec 2022 13:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1FDC433D6;
 Thu,  1 Dec 2022 13:08:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="oHMRsg2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1669900095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NvVqm7jcdF+mHvfBEhWPoX+WiaRjBdkYIS+w+Av7JuY=;
 b=oHMRsg2ophAPhSwCV17t6W2HlYAqGR/jggth9NiWwQIT9QO7Ny3WHU9UJ0nJpz6vvid0AW
 0KjgsBdnbi/lcDNpt/seSTXcw13oXjZ95iHpDOpYgRFW05iUOuxJUZXTthG6ZOZ+rWovSf
 DA2ch1V94fAMsN83Z8vZy4MoA1dcG5Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b0afdad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 1 Dec 2022 13:08:15 +0000 (UTC)
Date: Thu, 1 Dec 2022 14:08:13 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Daniel <tech@tootai.net>
Cc: wireguard <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard on Asahi Debian
Message-ID: <Y4inPePWAWCQ/Ejp@zx2c4.com>
References: <0ac435a3-95f4-c005-9834-ffb44360536c@tootai.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ac435a3-95f4-c005-9834-ffb44360536c@tootai.net>
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

On Thu, Dec 01, 2022 at 01:24:07PM +0100, Daniel wrote:
> Hi All,
> 
> I installed Asahi/Debian Bookworm from
> 
> https://git.zerfleddert.de/cgi-bin/gitweb.cgi/m1-debian/
> 
> and face a problem: installing wireguard shipped the Debian arm kernel 
> and I can't get wg to work.
> 
> Is there a solution for this ?

Appears to be available in Asahi's kernel:
https://github.com/AsahiLinux/PKGBUILDs/blob/9fb6fddfdd388190c099a723f046acf7b8b6bd39/linux-asahi/config#L2462
