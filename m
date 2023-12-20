Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90614C3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 15:07:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e4119ff;
	Wed, 20 Dec 2023 15:04:26 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e3ec73e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Dec 2023 15:04:24 +0000 (UTC)
Received: janet.servers.dxld.at;
	Wed, 20 Dec 2023 16:04:23 +0100
Date: Wed, 20 Dec 2023 16:04:19 +0100
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Raphael Catolino <rca@koalox.com>, Linus Karl <linus@lotz.li>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH 1/1] wireguard-linux: add netlink multicast group for
 notifications on peer change
Message-ID: <20231220150419.zmtlrv3nhkvx2ymh@House.clients.dxld.at>
References: <2328185.xqv9EDfTUt@desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2328185.xqv9EDfTUt@desktop>
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

Hi Raphael, Linus,

Interesting patch, I've been meaning to get around to adding some change
notifications as well :)

I have some notes:

 - It seem to me some more sharing with existing code constructing nlmsgs
   ought to be possible your new code seems quite verbose.

 - Why is the endpoint_monitor flag necessary? Other genlmsg_multicast
   callers don't seem to do anything like this.

Do you have corresponding wireguard-tools userspace patches for this yet?

--Daniel

PS: If you intend for this to get applied you may want to fix
scripts/checkpatch.pl warnings and add people get_maintainers.pl spits out
to Cc.
