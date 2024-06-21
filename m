Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F558C2BA1A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jun 2024 12:31:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a32dbe92;
	Fri, 21 Jun 2024 12:29:36 +0000 (UTC)
Received: from mail.servers.dxld.at (mail.servers.dxld.at [2001:678:4d8::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a4d04a98
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jun 2024 12:29:34 +0000 (UTC)
Received: mail.servers.dxld.at;
	Fri, 21 Jun 2024 14:29:34 +0200
Date: Fri, 21 Jun 2024 14:29:26 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard uses incorrect interface - routing issue
Message-ID: <20240621122926.2xzt7ulno5oczqcv@House.clients.dxld.at>
References: <878qyyim5k.fsf@ungleich.ch>
 <874j9milmo.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874j9milmo.fsf@ungleich.ch>
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

On Fri, Jun 21, 2024 at 01:24:47PM +0200, Nico Schottelius wrote:
> 
> p.s.: the route lookup looks correct on the machine, when selecting the
> source IP:
> 
> [11:15] server141.place10:~# ip r get 194.187.90.23
> 194.187.90.23 via inet6 fe80::3eec:efff:fecb:d81a dev eth0 src 192.168.1.149 uid 0 
>     cache 
> [11:16] server141.place10:~# ip r get 194.187.90.23 from 192.168.1.149
> 194.187.90.23 from 192.168.1.149 via 192.168.1.254 dev eth1 table 42 uid 0 
>     cache 
> 
> wireguard still uses the wrong interface:
> 
> 11:20:13.115154 eth0  Out IP 192.168.1.149.60031 > 194.187.90.23.4000: UDP, length 148

I haven't looked at the details yet but this smells like the same route
caching issue I found a while ago:
https://lists.zx2c4.com/pipermail/wireguard/2023-July/008111.html

Does up/down'ing the interface make the problem go away? IIRC that will
re-initialize the udp socket and thus clear the route chache.

FYI Nico: It may be time to escalate these bugs to the network subsystem
maintainers on netdev@vger.kernel.org since Jason is not reading this list
anymore AFAICT.

get_maintainer.pl spits out this list of emails to send To:

    Jason A. Donenfeld" <Jason@zx2c4.com>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, 
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    wireguard@lists.zx2c4.com, 
    netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org

Do add me to CC as well. Before sending I'd recommend working out an
ip-netns based reproducer script -- makes it harder to ignore the report as
"ugh, too much work" ;)

Let me know if you need help with that,
--Daniel
