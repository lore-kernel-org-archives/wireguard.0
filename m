Return-Path: <SRS0=Vhpd=JN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD477C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 09:00:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA476100C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 09:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CA476100C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=stha.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ee0cd90;
	Fri, 16 Apr 2021 08:57:53 +0000 (UTC)
Received: from deponia.stha.de (deponia.stha.de [2001:8d8:1801:133::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 56f60695
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 08:57:51 +0000 (UTC)
Received: from mail.stha.de (mail.stha.de [IPv6:2a03:4000:24:7d0:100::15])
 by deponia.stha.de (Postfix) with ESMTPS id 9063B1104D3;
 Fri, 16 Apr 2021 08:57:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: stefan)
 by mail.stha.de (Postfix) with ESMTPSA id C72D6185DEC;
 Fri, 16 Apr 2021 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=stha.de; s=20200509;
 t=1618563469; bh=E83cng56anUjIApuouBopKeljKDAHvPTzK5vQBNG1sM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qGgHMMOQCxg2CcFZfigKECFqaVBI8lvlWl8Zsfwd/VKiESolf7Q/UdXPBYHCoBzEE
 q7KakiMGWJc/nMjVLwbOj+HwcXKkXriQa1kb4K3fxo0PF9vUSsCjePL0UFNhshNWrc
 BDkzfUtt4bKHLUqutGsG4dV803suotJrsgnqgag4qXpQ/+4G7B9r8L2GPbs1PQf3JZ
 M/jbC/AfK4dE8auwMAp8Zm8SWtyVg43tv6wYWabPptaKAvvtbEgkS4B3yrLneRkx8N
 LGfXtKjuFg4jbL7npXeczGYCqMwquP88zV+cisfZ7aZ1w4UCVVAoASZ+v/DlzJEhJj
 +NjVwMhsWo6Uw==
Date: Fri, 16 Apr 2021 10:57:46 +0200
From: Stefan Haller <stefan.haller@stha.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
Message-ID: <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de>
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de>
 <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
 <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
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

Hi Jason,

On Thu, Apr 15, 2021 at 06:05:03PM -0600, Jason A. Donenfeld wrote:
> I spent the day playing around with bird and babel and sorted out
> FreeBSD's v6 situation. Basically, ff00::/8 addresses are treated
> differently, and they're blocked unless the interface sets
> IFF_MULTICAST. So I've committed
> https://git.zx2c4.com/wireguard-freebsd/commit/?id=a7a84a17faf784857f076e37aa4818f6b6c12a95
> to do this.

That is also what I observed. Without IFF_MULTICAST I see the following
error in bird's log:

bird[8045]: babel1: Socket error: IPV6_MULTICAST_IF: Can't assign requested address
bird[8045]: babel1: Cannot open socket for wg1

> Stefan - please let me know if those work for you. In my testing thus
> far, things seem to work for me.

After applying Toke's patch for bird and your Wireguard patch in
a7a84a17faf784 everything is working as before (with minor config
changes).

Just for the record, my previous configuration looked like this (using
POINTTOPOINT interfaces, I use ifconfig to set the peer address):

> [Interface]
> ...
> Address = fe80::5/64
> PostUp = ifconfig %i inet 169.254.42.5/32 169.254.42.2

My new configuration without POINTTOPOINT, but only a single peer
directly attached to other side of the wg tunnel:

> [Interface]
> ...
> Address = 169.254.42.5/32, fe80::5/64
> PostUp = route add 169.254.42.2 -iface %i

So for me everything works as expected again. A big thanks to all of you for
figuring out what was going wrong and getting it fixed so quickly.


Kind regards,
Stefan
