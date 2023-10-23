Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F5DC25B43
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 16:00:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0d21dc6;
	Mon, 23 Oct 2023 16:00:04 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id afc72817
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Oct 2023 16:00:02 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 23 Oct 2023 17:59:56 +0200
Date: Mon, 23 Oct 2023 17:59:50 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wireguard: Fix leaking sockets in wg_socket_init error
 paths
Message-ID: <20231023155950.oyl2olisob6dnvwo@House.clients.dxld.at>
References: <20231023130609.595122-1-dxld@darkboxed.org>
 <ZTZ9XfPOXD4JXdjk@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZTZ9XfPOXD4JXdjk@zx2c4.com>
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

On Mon, Oct 23, 2023 at 04:04:13PM +0200, Jason A. Donenfeld wrote:
> The signed-off-by is missing and the subject does not match the format
> of any other wireguard commits.

Ah, I don't usually send kernel patches. Forgot to do format.signOff=true.

> On Mon, Oct 23, 2023 at 03:06:09PM +0200, Daniel Gröber wrote:
> > This doesn't seem to be reachable normally, but while working on a patch
> 
> "Normally" as in what? At all? Or?

I committed this while working on my address/ifindex binding patch[1]
(which I will also resend shortly), at the time I thought this fix makes
sense in isolation but apparently not.

[1]: https://lists.zx2c4.com/pipermail/wireguard/2023-August/008148.html,

> > for the address binding code I ended up triggering this leak and had to
> > reboot to get rid of the leaking wg sockets.
> 
> This commit message doesn't describe any rationale for this patch. Can
> you describe the bug?

It's been a while since I wrote this patch. Unfortunately you didn't
respond to my initial mail in Aug, so some context has already been lost to
time.

I may have been under the mistaken impression that udp_sock_create can
return <0 while leaving *sockp!=NULL, but as I recall it I did re-test with
this patch and it fixed the bug, that I wish I remembered how to trigger
now. Unsatisfying.

--Daniel
