Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868CBC28D1E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 10:10:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B05C220684
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 10:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="S0BijpnW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B05C220684
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a6d768f;
	Thu, 6 Jun 2019 10:09:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6b12737
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 10:09:48 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f78c0497
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 10:09:48 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1559815786; bh=ILCnbyUP78p1ixGIJ2UeCrlzNC6J+NnF+dxPNareKUs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=S0BijpnWMZthARwca94joP637b7XIyI6fneyA8efNG0Kod7OeQV7KAdtojdEW9sf0
 vNQVBezpRme+BMKeEn6L7txytzFqAVQtEe+DhKEKBaSmR/3tTw5AVpDllxxnPnKwn+
 9whaSNGSvuD6vBu3p9LF0NpDYVB4LUF2IERQsjZaft//ykkGPC8asflGgqvlY3iLjV
 MOufvW4sgM8weYEdKlHZOPN1cNCdSP36GpqjfkSvC373wvxx2mWw7ampPmu9Jj8anW
 KH0VYp4ALbl/pmectpOGLKjf6HfGVhk/xkFOGfMYx3vwWOSaZYa61uFzuvzT64TIhL
 t264wRVv3UcQw==
To: Paul Zillmann <paul@zil.li>, wireguard@lists.zx2c4.com
Subject: Re: Overlapping AllowedIPs Configuration
In-Reply-To: <536efee3-3d15-682f-4979-7fa2bb3457c3@zil.li>
References: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
 <536efee3-3d15-682f-4979-7fa2bb3457c3@zil.li>
Date: Thu, 06 Jun 2019 12:09:45 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87lfyfdnyu.fsf@toke.dk>
MIME-Version: 1.0
Cc: henningreich@gmail.com
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

Paul Zillmann <paul@zil.li> writes:

> Hello,
>
> we have the same problem here, although our allowed IP ranges should be 
> 0.0.0.0/0 for all peers.
> We have OSPF traffic on the wireguard links so it should be task of the 
> Kernel's routing table to decide where to send what.
>
> The problem is that the allowed-ips configuration has multiple purposes: 
> routing table and firewall/packet filter. This introduces these 
> problems. It would be helpfull to get a compile flag or something else 
> to make this behavior optional.

That is probably not going to happen; the crypto-routing is quite
integral to Wireguard, and is an important security feature.

> Right now Wireguard isn't very friendly to dynamic routing.
>
> I came up with multiple solutions:
> - create multiple interfaces + tunnels.
> or
> - create a bash script that injects the Kernel's routing table into the 
> wg tool every other minute.
>
> Do you guys have a better idea? If not I would create the bash script.

IMO, the "right" way to fix this is to make your routing daemon aware of
wireguard and have it configure the routes directly into the wireguard
table. That also gives you security for your routing protocol
automatically (since only authenticated sources/destinations will be
allowed), as long as you have a secure way of bootstrapping the
wireguard keying.

-Toke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
