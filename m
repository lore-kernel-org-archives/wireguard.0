Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4965AC636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 22:42:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33c0f8b8;
	Sun, 19 Feb 2023 22:42:05 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e79c7d2c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 22:42:04 +0000 (UTC)
Received: janet.servers.dxld.at; Sun, 19 Feb 2023 23:42:01 +0100
Date: Sun, 19 Feb 2023 23:42:00 +0100
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: Roman Mamedov <rm@romanrm.net>, tlhackque <tlhackque@yahoo.com>,
 wireguard@lists.zx2c4.com
Subject: Src addr code review (Was: Source IP incorrect on multi homed systems)
Message-ID: <20230219224200.g5mwcaybee4hujov@House.clients.dxld.at>
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch>
 <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com>
 <87o7pp76a2.fsf@ungleich.ch> <20230220014252.21178988@nvm>
 <87h6vh72d4.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h6vh72d4.fsf@ungleich.ch>
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

I though it might be useful to do some quick and dirty code review instead
of speculating wildly to figure out where these source IP selection
problems could be coming from ;)

From previous code deep dives I know the udp_tunnel_xmit_skb function is
where tunnel packets get handed off to the kernel. So in
net/wireguard/socket.c:send4 we have:

	udp_tunnel_xmit_skb(rt, sock, skb, fl.saddr, fl.daddr, ds,
			    ip4_dst_hoplimit(&rt->dst), 0, fl.fl4_sport,
			    fl.fl4_dport, false, false);

Where fl.saddr is the source address that's supposedly wrong (sometimes? I
guess?) Where does that come from?

Let's look at the code (heavily culled):

	struct flowi4 fl = {
		.saddr = endpoint->src4.s_addr,
	};
	if (cache)
		rt = dst_cache_get_ip4(cache, &fl.saddr);
	if (!rt) {
		if (unlikely(!inet_confirm_addr(sock_net(sock), NULL, 0,
						fl.saddr, RT_SCOPE_HOST)))
			fl.saddr = 0;
		if (unlikely(endpoint->src_if4 && ((IS_ERR(rt) &&
			     PTR_ERR(rt) == -EINVAL) || (!IS_ERR(rt) &&
			     rt->dst.dev->ifindex != endpoint->src_if4))))
			fl.saddr = 0;

Well it's initialized from endpoint->src4.s_addr, overwritten with zero in
some cases, which I believe lets the kernel do it's regular source addr
selection, and populated from something called dst_cache at some callsites.

@Nico could it perhaps simply be that you're hitting one of these zero'ing
cases and that's why it's using regular kernel src addr selection instead
of the cached endpoint src4 address?

The first case !inet_confirm_addr(..., RT_SCOPE_HOST) ought to confirm that
the saddr is actually still a local address. Makes sens if the address we
remembered was removed from the interface we can't use it anymore.

The second case looks like it's checking if the (sometimes cached) src_if4
interface index is still what the route we're about to use points to.

If neither of those seem likely we can keep reading :)

--Daniel



