Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1363ECAAD5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Aug 2022 15:59:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d43893ce;
	Mon, 29 Aug 2022 15:59:46 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 219c0c1c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2022 15:59:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15EE6B81113;
 Mon, 29 Aug 2022 15:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8B7C433D7;
 Mon, 29 Aug 2022 15:59:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="d2BJbhWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1661788781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f8fyl1SUahek9UEGFqS+LHRrP+xRh3MIEDm7G5T/EfM=;
 b=d2BJbhWs0JvcHjgQzoGpjaSQyige0b8VRaD/QI44DodX4R3FJNoLFD/6RX0wxAozWVOyS5
 D0KrOHm0i+Md1Lj0Zn1y27c0o/fb51J6ti3YQ7G0R+mVXnsDfadoTfRvCbNwUTcmgTOmn1
 u8jEDMkCwPhZcEOI6UCb1gTeZSaIaJI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a540d00
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 29 Aug 2022 15:59:41 +0000 (UTC)
Date: Mon, 29 Aug 2022 11:59:39 -0400
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Shengjing Zhu <i@zhsj.me>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH wireguard-go] tun/netstack: bump to latest gvisor
Message-ID: <Ywzia/T9qQIATX0J@zx2c4.com>
References: <Yv52gBY0uZadNNzs@local.zhsj.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yv52gBY0uZadNNzs@local.zhsj.me>
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

Hi Shengjing,

Thanks for the patch. I'll apply this. But one question:

On Fri, Aug 19, 2022 at 01:27:28AM +0800, Shengjing Zhu wrote:
>  	dev := &netTun{
> +		ep:             channel.New(1024, uint32(mtu), ""),

How did you come up with 1024 here?

And more generally, how's performance of this compare to what was there
before?

Thanks,
Jason
