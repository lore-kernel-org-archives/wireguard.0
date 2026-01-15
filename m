Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02FED44C48
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Jan 2026 14:26:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eee59cf9;
	Thu, 15 Jan 2026 14:26:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72eb81d9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Jan 2026 14:26:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6470A6001A;
 Thu, 15 Jan 2026 14:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F731C116D0;
 Thu, 15 Jan 2026 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768487203;
 bh=PMAJAir+s0K7IBCyK9b2N9yWQhFNnwBw4MRBfncPqVg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j/e+vRr3yMnj05RMUWiW/nquWu2AgkZz8V8HB3buU57g2zERJDI83jH4s0Pxt0m84
 VC/caCJPd9uqFhlAi91h9J8xIONaj+G7xecXlkJzVHd91iQg6Aw+cUpxjpM1tElAa5
 kUM/4Xzym2j/zRJlwOhXlLgfqZ0gU7y0/ML91nllzb34/8pq/ky/Yu6qBSVazAcVvJ
 aR9pcW06YOn3HQRdGziAv1svEZm1R+CcvXjqqg1v7Ur5SPUhoUTTeQZCc1kKVZI7Lz
 zbbbKU785Ni1by/hM7lOTLwl7Glxn6tzYRvlG9v2zSMSCawEeGI9+tS2pf8/GyXYCz
 M3VtK+ZOZryJw==
Date: Thu, 15 Jan 2026 06:26:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Petr =?UTF-8?B?VmFuxJtr?= <arkamar@atlas.cz>
Cc: fushuai.wang@linux.dev, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 davem@davemloft.net, vadim.fedorenko@linux.dev, Jason@zx2c4.com,
 wireguard@lists.zx2c4.com, wangfushuai@baidu.com
Subject: Re: [net-next, v3] wireguard: allowedips: Use kfree_rcu() instead
 of call_rcu()
Message-ID: <20260115062641.57ef05fe@kernel.org>
In-Reply-To: <202611581213-aWihXdQpdnhXv606-arkamar@atlas.cz>
References: <20260112130633.25563-1-fushuai.wang@linux.dev>
 <20260115033237.1545400-1-kuba@kernel.org>
 <202611581213-aWihXdQpdnhXv606-arkamar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 15 Jan 2026 09:12:13 +0100 Petr Van=C4=9Bk wrote:
> Hi Jakub,
>=20
> Minor side note: I noticed a small typo in the AI review foreword. I
> assume this is part of a template:
>=20
> On Wed, Jan 14, 2026 at 07:32:37PM -0800, Jakub Kicinski wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least pausible. =20
>                                                         ^~~~~~~~
> pausible -> plausible

Ah, thanks :)
