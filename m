Return-Path: <SRS0=oIpX=JQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B679EC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 19:44:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7BE611EE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 19:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A7BE611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=stha.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bee419f7;
	Mon, 19 Apr 2021 19:42:12 +0000 (UTC)
Received: from deponia.stha.de (deponia.stha.de [2001:8d8:1801:133::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 75f29005
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 19:42:05 +0000 (UTC)
Received: from mail.stha.de (mail.stha.de [IPv6:2a03:4000:24:7d0:100::15])
 by deponia.stha.de (Postfix) with ESMTPS id 8E790112426;
 Mon, 19 Apr 2021 19:42:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: stefan)
 by mail.stha.de (Postfix) with ESMTPSA id 1564B18A3B3;
 Mon, 19 Apr 2021 19:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=stha.de; s=20200509;
 t=1618861293; bh=ZMknIrLgBtOluX1qnwFrKShstTKO0JNLzhHVqbeMJfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vYCpxQe/DtPl2nl/BX6f5eIjhO4MkX/AngCW1fZhE/uzalAcSjAn4Qlptm5ayTfq+
 lw0H6rcf66LQGXk0urnjQIo/cLwaoQoOoA5nU+dL2tKTspoavo0gO/FC4D4QDv6OdV
 79cJnzbMzjXsVFtUY+pm9QZJ0sucauy8aso7h0CNfnIuWD9w3VgtA1SSv1bK3IaCjo
 IvKIsH1efaBOjJJsWEjdiuWDNaub3V70Cs80XtyA+W1HMlGlln0SN1/av4DUosoYM6
 PJruxF95mZiQe/gpXQuuDBNUCoZztw7ut7bZ3nEiJNBQPdtS2Bl3hOoufb3UnKapMB
 Ew/dh+OR5XvQg==
Date: Mon, 19 Apr 2021 21:41:31 +0200
From: Stefan Haller <stefan.haller@stha.de>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
Message-ID: <c93d0e62-8992-4c19-a2d3-08f7af3f5873@stha.de>
References: <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de>
 <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
 <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
 <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de>
 <87a6pyinbh.fsf@toke.dk> <87fszmgmhh.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fszmgmhh.fsf@toke.dk>
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

On Mon, Apr 19, 2021 at 08:25:46PM +0200, Toke Høiland-Jørgensen wrote:
> Stefan, any chance you could test this patch to Bird (*instead of* the
> previous one that removes the check from the Babel code)?

The patch is working on FreeBSD 13.0.

Kind regards,
Stefan
