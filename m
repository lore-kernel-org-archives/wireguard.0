Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A960AC072A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 14:42:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d84ce3c9;
	Sun, 19 Nov 2023 14:41:59 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cf0f6f0c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Nov 2023 14:41:57 +0000 (UTC)
Received: janet.servers.dxld.at; Sun, 19 Nov 2023 15:41:56 +0100
Date: Sun, 19 Nov 2023 15:41:51 +0100
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: M P Robert <mprobert@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: wg-quick set_mtu_up - largest or smallest MTU?
Message-ID: <20231119144151.2wcvbph4hplfydfj@House.clients.dxld.at>
References: <81DE093A-5905-49CA-A412-5F934E0E0EBB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81DE093A-5905-49CA-A412-5F934E0E0EBB@gmail.com>
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

Hi Matt,

On Fri, Nov 03, 2023 at 01:12:22PM +0000, M P Robert wrote:
> I was looking at the auto MTU detection in wg-quick.
> 
> It appears that wg-quick is taking the LARGEST of all endpoint MTUs
> 
> https://github.com/WireGuard/wireguard-tools/blob/13f4ac4cb74b5a833fa7f825ba785b1e5774e84f/src/wg-quick/linux.bash#L134

My reading of the code is that we iterate over all peers' endpoints do a
route lookup to get the destination specific MTU and fall back to default
route's MTU if that didn't return anything. In both cases we use the "mtu"
route attribute or failing that the actual interface MTU.

Incidentally the docs don't mention the details of the MTU selection
behaviour. wg-quick(1) has this:

       •      MTU — if not specified, the MTU is automatically determined from
              the endpoint addresses or the system  default  route,  which  is
              usually  a  sane  choice. However, to manually specify an MTU to
              override this automatic discovery, this value may  be  specified
              explicitly.

> In a scenario where you have different peers on different network devices
> or routes with different MTUs, I would think you would want to take the
> SMALLEST mtu from all peers in order to avoid having fragmentation
> talking to the peers on networks with smaller MTUs.

I agree using the smallest MTU would probably be best for most users.

> Or perhaps fragmentation for some peers is faster than selecting a
> smaller packet size for all peers?  Or I am missing something (more
> likely).  Happy to be educated on this point.

In principle hosts that have (some) interfaces using jumbo frames may want
to make use of the largest MTU for efficiency, in this case one may be
willing to take the fragmentation hit on interfaces with smaller MTU.

In this case it'd still be possible to override the automatic MTU selection
by configuring MTU= statically so this isn't a blocker.

> I don't have git-send-email setup at this point, but just in case this is
> a valid issue, I've attached a sample fix for set_mtu_up that will take
> the smallest of the discovered peer MTUs rather than the largest.  I'm
> not a bash guy, so just take it for illustration purposes.

Looks like Thomas already whipped up a patch. You could test it and report
back :)

--Daniel
