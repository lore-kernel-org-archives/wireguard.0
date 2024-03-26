Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D01DCD11DD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Mar 2024 01:58:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c10d1d5;
	Tue, 26 Mar 2024 01:58:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dc945b20
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Mar 2024 01:58:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E95776115B;
 Tue, 26 Mar 2024 01:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D164CC433C7;
 Tue, 26 Mar 2024 01:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711418333;
 bh=UTfqvp1AuKc910NwG5qiGCGZVQiS1WHVFUCW62lxd+k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X4f0bpT7TpZtBq3aljAY2DZe0ImYoiEB+EPRbT0Vj999mU0Vnm5aRDDDpyedBAa4D
 O6OLrsWVZLB0adrw0iPqpdqclw83UJ0hIuylLhDtvplSTHRL7F4FJvCObeWJvJdPa6
 3TNP2513QkRjI9/tl/BuFIY+jcKjmlTwuJUi9shZBGn0hLIJRTFDo28g4XsBjsrAJu
 wtTkHbdjvD1MaQkeQM6v0PYDjxF50OoxpDh4nr9shFSVZ3tnX/qs86TAFFjEG+2Mfo
 BVrro+Z7lPGzighwyYrPag4Y8WxQbq01MfdDdXDwZ8WwTHc5OMLSp/UoF1YG3N2zv6
 SN6JsaFxOBn4g==
Date: Mon, 25 Mar 2024 18:58:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, dw@davidwei.uk, jiri@resnulli.us, Sven Eckelmann
 <sven@narfation.org>, Jason@zx2c4.com, mareklindner@neomailbox.ch,
 sw@simonwunderlich.de, a@unstable.cc, pshelar@ovn.org,
 wireguard@lists.zx2c4.com, dev@openvswitch.org
Subject: Re: [PATCH net-next v2 3/3] genetlink: remove linux/genetlink.h
Message-ID: <20240325185851.1c876761@kernel.org>
In-Reply-To: <ZgG4IebcrI1RCKAe@smile.fi.intel.com>
References: <20240325173716.2390605-1-kuba@kernel.org>
 <20240325173716.2390605-4-kuba@kernel.org>
 <ZgG4IebcrI1RCKAe@smile.fi.intel.com>
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

On Mon, 25 Mar 2024 19:45:05 +0200 Andy Shevchenko wrote:
> > +/* Non-parallel generic netlink requests are serialized by a global lock.  */  
> 
> While at it, maybe drop extra space? (I noticed it was originally like this.

Fair, I'll post v3.

> > +#define MODULE_ALIAS_GENL_FAMILY(family) \
> > + MODULE_ALIAS_NET_PF_PROTO_NAME(PF_NETLINK, NETLINK_GENERIC, "-family-" family)  
> 
> I would still make this TAB indented.

That one I'd prefer to keep. Coin toss between going over 80 chars
and having someone atypical indent.
-- 
pw-bot: cr
