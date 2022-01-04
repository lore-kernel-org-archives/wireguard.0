Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9118EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 21:34:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 066b4429;
	Tue, 4 Jan 2022 21:34:37 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7e63bbdc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Jan 2022 21:34:36 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1641332075; bh=kL8HDIidNBLBtsokfCiV6kPYmhrd+02nihhe0xkFpsw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ofx48yK2ruKu4DIi32niY/cNI6/p9RsRlkodSRekV2SsEFH+oACVrBCcAbGJ52s61
 PtbQSvdar5P08L4tUUVIWYfq+f5tEk0GRsisghJL5hLlbwJoYCt1g5QYud6CfhCE6I
 kZlfgn3wdjePFuQrYV2Tb5Je0GBFE+wo2YHCQzJ1NE2OwS50PJ8ehR+7TDw/gHX4P9
 bFsbb7z+pM4jJ9CXbZ2+6qkR0iJbC9AERWFc32UZIvMrHCL2wSdlDYrQKfTZPMOS3G
 eK6U/FAo0krRAHH8V3HNLkvACyzJVvnxLwwwaBaNusSuYbIuuI0y6Q9xgGTczLdzTQ
 0HvhQf0GkGxww==
To: leon@is.currently.online, wireguard@lists.zx2c4.com
Cc: Leon Schuermann <leon@is.currently.online>
Subject: Re: [RFC PATCH 0/4] Introduce per-peer MTU setting
In-Reply-To: <20211228234524.633509-1-leon@is.currently.online>
References: <20211228234524.633509-1-leon@is.currently.online>
Date: Tue, 04 Jan 2022 22:34:35 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87tuejb2xg.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

leon@is.currently.online writes:

> From: Leon Schuermann <leon@is.currently.online>
>
> This patch series is an attempt to integrate a per-peer MTU setting
> into WireGuard. With matching changes to the wireguard-tools,
> individual MTU values can be set and retrieved for each registered
> peer.
>
> While Linux supports setting an MTU metric for specific FIB route
> entries [which I've only found out after implementing this :)], and
> thus allows to lower the MTU for individual peers, this appears to
> disable regular path MTU discovery (PMTUD) entirely on the
> route. While regular PMTUD does not work over the tunnel link, it
> should still be usable on the rest of the route.

I'm not sure I understand the use case? Either PMTUD works through the
tunnel and you can just let that do its job, or it doesn't and you have
to do out-of-band discovery anyway in which case you can just use the
FIB route MTU? Or what do you mean by "usable on the rest of the route"?

> Furthermore, with the goal of eventually introducing an in-band
> per-peer PMTUD mechanism, keeping an internal per-peer MTU value does
> not require modifying the FIB and thus potentially interfere with
> userspace.

What "in-band per-peer PMTUD mechanism"? And why does it need this?

-Toke
