Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BA4EB64DD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  1 Aug 2023 09:10:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd9bd8e8;
	Tue, 1 Aug 2023 09:07:10 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5d1938b7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2023 09:07:08 +0000 (UTC)
Received: janet.servers.dxld.at; Tue, 01 Aug 2023 11:07:08 +0200
Date: Tue, 1 Aug 2023 11:07:07 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Daniel <tech@tootai.net>
Cc: wireguard <wireguard@lists.zx2c4.com>
Subject: Re: Endpoint failover ip
Message-ID: <20230801090707.lrsxcpwjkrwftarc@House.clients.dxld.at>
References: <e9ddd93a-4517-7411-a5d3-360fa8e1bde6@tootai.net>
 <20230731222744.5wej7mv5sef57w46@House.clients.dxld.at>
 <b112c414-36c6-d87f-3568-f3a740c52877@tootai.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b112c414-36c6-d87f-3568-f3a740c52877@tootai.net>
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

On Tue, Aug 01, 2023 at 10:33:03AM +0200, Daniel wrote:
> > On Mon, Jul 31, 2023 at 11:39:35PM +0200, Daniel wrote:
> > > I create a hostname with few IPs v4 & v6 for my wireguard server. I faced
> > > today a problem that after a failure with the ip a customer wg was
> > > registered, it continue to try to register with this ip insteed to fallback
> > > to another one.
> > [...]
> > [1]: Supporting multiple active endpoints is where we have to head to fix
> > this properly IMO, see my recent proposal
> > https://lists.zx2c4.com/pipermail/wireguard/2023-July/008111.html
> 
> Yes, that's exactly the problem. Will see with babeld but hope that
> something native can be done in wireguard.

I'm on the babel-users ML (babel-users@alioth-lists.debian.net) if it gives
you any trouble. Getting the filtering setup just right for the VPN
use-case can be a bit daunting if you've never used a routing daemon
before.

    https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/babel-users

--Daniel

