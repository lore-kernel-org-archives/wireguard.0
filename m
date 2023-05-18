Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95592C7EE23
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 May 2023 14:39:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a28ebd6;
	Thu, 18 May 2023 14:39:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a2e21df1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2023 14:39:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53E9B60C59;
 Thu, 18 May 2023 14:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B4BC4339C;
 Thu, 18 May 2023 14:39:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gXQwOvOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1684420784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
 b=gXQwOvOKHN4PfQb0s2n63yRMT6mmTUeMtJ81uKuhJv/azMSNj28wQmbdniH/zm7+AAmLRn
 imPhVgimNTgCjgKZ725Or4nsvxNMzNjHzaIs3GdtrlCvOjaBtJypzpJ3ZjoskmZGAGCHAm
 4yxyqSKJes1WPMea2EndceJtK5DPcPc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 93c200d6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 18 May 2023 14:39:43 +0000 (UTC)
Date: Thu, 18 May 2023 16:39:38 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: Allow setting iface VRF in PreUp hook
Message-ID: <ZGY4qpRx5eiyF-tU@zx2c4.com>
References: <20221207180031.301766-1-dxld@darkboxed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221207180031.301766-1-dxld@darkboxed.org>
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

Applied, thanks.
