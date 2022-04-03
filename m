Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D20C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Apr 2022 20:16:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1e851f55;
	Sun, 3 Apr 2022 20:15:58 +0000 (UTC)
Received: from b.rekudos.net (b.rekudos.net [2a03:da40:0:3e7::70])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 97c18bcf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Apr 2022 20:15:57 +0000 (UTC)
Received: from localhost (b.rekudos.net [local])
 by b.rekudos.net (OpenSMTPD) with ESMTPA id deb50dbf
 for <wireguard@lists.zx2c4.com>; Sun, 3 Apr 2022 20:15:56 +0000 (UTC)
Resent-From: Mark Lawrence <nomad@null.net>
Resent-Date: Sun, 3 Apr 2022 22:15:56 +0200
Resent-Message-ID: <YkoAfKRdw9T0xwUT@b.rekudos.net>
Resent-To: wireguard@lists.zx2c4.com
Date: Sun, 3 Apr 2022 22:14:59 +0200
From: Mark Lawrence <nomad@null.net>
To: lejeczek <peljasz@yahoo.co.uk>
Cc: wireguard@lists.zx2c4.com
Subject: Re: MTUs go strange ways - ?
Message-ID: <YkoAQ2PRIcOxNE8m@b.rekudos.net>
References: <c8f39df3-e207-2dfb-c65d-5c6b4267f159.ref@yahoo.co.uk>
 <c8f39df3-e207-2dfb-c65d-5c6b4267f159@yahoo.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c8f39df3-e207-2dfb-c65d-5c6b4267f159@yahoo.co.uk>
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

On Sat Apr 02, 2022 at 06:41:12PM +0100, lejeczek wrote:

>1370 (server) VS 1320 (client)
>
>Could some expert or two shed more light on what & why is happening?

There is a (very small) clue in the name: Maximum *Transmission* Unit.

Routing between two IP addresses is not (necessarily) symetric: routes 
are computed independently in each direction. So there is probably a 
(1320 MTU) device somewhere inbetween which is only crossed by packets 
in the client->server direction, but not in the reverse.

-- 
Mark Lawrence
