Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB5FC2BA1A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jun 2024 15:19:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cd49cfd;
	Fri, 21 Jun 2024 15:19:03 +0000 (UTC)
Received: from mail.servers.dxld.at (mail.servers.dxld.at [2001:678:4d8::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 361cc658
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jun 2024 15:19:01 +0000 (UTC)
Received: mail.servers.dxld.at;
	Fri, 21 Jun 2024 17:18:59 +0200
Date: Fri, 21 Jun 2024 17:18:53 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Stephan von Krawczynski <skraw.ml@ithnet.com>,
 Diyaa Alkanakre <diyaa@diyaa.ca>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard uses incorrect interface - routing issue
Message-ID: <20240621151853.s7nzoyanrn4sr6gf@House.clients.dxld.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240621155439.6cb5abb9@ithnet.com>
 <O-vEobT--3-9@diyaa.ca>
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

Hi,

On Fri, Jun 21, 2024 at 03:54:39PM +0200, Stephan von Krawczynski wrote:
> ... and in case you do find someone interested at all there is still the
> problem of no signaling to anyone when a client connects.
> I hardly can remember the decade when all this was implemented in cipe.

Yeah. Can be hard to get attention on netdev, but I've been advised that
when the maintainance of a (sub)subsystem is in question that is an issue
they'll take notice of. So be sure to lament the fact that Jason hasn't
been responding in at least a year on this ML ;)

IIRC we have a patch for netlink notifications on handshakes flying
around somewhere tho. Just needs some more work.

On Fri, Jun 21, 2024 at 04:42:02PM +0200, Diyaa Alkanakre wrote:
> The better approach would be to exclude the IPs from your WireGuard
> AllowedIPs. I always exclude IPs if I can before doing policy based
> routing.
> 
> https://www.procustodibus.com/blog/2021/03/wireguard-allowedips-calculator/

Interesting approach, thanks for the pointer :)

--Daniel
