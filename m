Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBB3C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 May 2022 20:09:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e1c4e349;
	Sun, 8 May 2022 20:09:23 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 67e18545
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 May 2022 20:09:21 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by rin.romanrm.net (Postfix) with SMTP id CE36F6F8;
 Sun,  8 May 2022 20:09:20 +0000 (UTC)
Date: Mon, 9 May 2022 01:09:19 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Outgoing ping required in container environment (even with
 PersistentKeepalive)
Message-ID: <20220509010919.390ea1d8@nvm>
In-Reply-To: <878rrcfrpv.fsf@ungleich.ch>
References: <878rrcfrpv.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 08 May 2022 08:34:46 +0200
Nico Schottelius <nico.schottelius@ungleich.ch> wrote:

> The connection stays correctly established.
> 
> If anyone has a pointer on what might be going on, any help is
> appreciated.

Maybe you don't have a corresponding firewall rule, and happen to rely on the
ESTABLISHED,RELATED matching instead? This could explain the "works after a
ping" behaviour. But then the PersistentKeepalive could be expected to help as
well.

-- 
With respect,
Roman
