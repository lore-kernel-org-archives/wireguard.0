Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30E0C04A94
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Jul 2023 22:29:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3f6a35e;
	Mon, 31 Jul 2023 22:27:48 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f0b1a1f0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2023 22:27:46 +0000 (UTC)
Received: janet.servers.dxld.at; Tue, 01 Aug 2023 00:27:45 +0200
Date: Tue, 1 Aug 2023 00:27:44 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Daniel <tech@tootai.net>
Cc: wireguard <wireguard@lists.zx2c4.com>
Subject: Re: Endpoint failover ip
Message-ID: <20230731222744.5wej7mv5sef57w46@House.clients.dxld.at>
References: <e9ddd93a-4517-7411-a5d3-360fa8e1bde6@tootai.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9ddd93a-4517-7411-a5d3-360fa8e1bde6@tootai.net>
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

Hi Daniel,

On Mon, Jul 31, 2023 at 11:39:35PM +0200, Daniel wrote:
> I create a hostname with few IPs v4 & v6 for my wireguard server. I faced
> today a problem that after a failure with the ip a customer wg was
> registered, it continue to try to register with this ip insteed to fallback
> to another one.

Your message is hard to parse, but I think you're having the same v4/v6
failover problem as me. See my patch "wg: Support restricting address
family of DNS resolved Endpoint":

  https://lists.zx2c4.com/pipermail/wireguard/2023-February/007961.html

which has yet to get any attention from Jason unfortunately.

The headline is this: wireguard doesn't support multiple endpoints so you
have to be careful with how you setup your host records. At the moment you
can't just throw multiple IPs in there and hope for the best. Wg will stick
to whatever IP the system picks when the tunnel comes up.

> Is there a way to avoid this problem and to get failover working properly
> with wireguard ?

There isn't any wg native solution[1] right now, only hacky
workarounds. You basically need one wg tunnel per unique endpoint but once
you do that routing becomes an issue. Plain static routes wont cut it
anymore. On top of that using an endpoint domain with multiple IPs is a
problem. Things are easier if you stick to one IP per domain or just
hardcode one endpoint IP for each of the many tunnels.

[1]: Supporting multiple active endpoints is where we have to head to fix
this properly IMO, see my recent proposal
https://lists.zx2c4.com/pipermail/wireguard/2023-July/008111.html

Anyway with the many wg tunnels one could then write a script to ping
through the tunnels and switch the appropriate route to the one that
responds. This has to happen at both ends of the tunnel. Me personally, I
just use an easy to setup routing daemon (babeld) to do that.

--Daniel
