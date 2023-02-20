Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A48C636D6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 20:43:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6778bbcc;
	Mon, 20 Feb 2023 20:43:54 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4a63aa59
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2023 20:43:52 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 20 Feb 2023 21:43:50 +0100
Date: Mon, 20 Feb 2023 21:43:47 +0100
From: dxld@darkboxed.org
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: Roman Mamedov <rm@romanrm.net>, tlhackque <tlhackque@yahoo.com>,
 wireguard@lists.zx2c4.com
Subject: Re: Src addr code review (Was: Source IP incorrect on multi homed
 systems)
Message-ID: <20230220204347.nqeusqotqtxbjiw2@House.clients.dxld.at>
References: <87ttzhc0jt.fsf@ungleich.ch>
 <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com>
 <87o7pp76a2.fsf@ungleich.ch> <20230220014252.21178988@nvm>
 <87h6vh72d4.fsf@ungleich.ch>
 <20230219224200.g5mwcaybee4hujov@House.clients.dxld.at>
 <87leksbr5n.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87leksbr5n.fsf@ungleich.ch>
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

Hi Nico,

On Mon, Feb 20, 2023 at 10:47:36AM +0100, Nico Schottelius wrote:
> Daniel Gröber <dxld@darkboxed.org> writes:
> > Let's look at the code (heavily culled):
> >
> > 	struct flowi4 fl = {
> > 		.saddr = endpoint->src4.s_addr,
> > 	};
> > 	if (cache)
> > 		rt = dst_cache_get_ip4(cache, &fl.saddr);
> 
> What I am wondering is, how did it get into the cache in the first place?

Right so, endpoint->src4 is set in wg_socket_set_peer_endpoint, which is
called either trough through wg_socket_endpoint_from_skb in the handshake
receive code or wg_socket_set_peer_endpoint in the data path.

The _from_skb variant also calls wg_socket_endpoint_from_skb. Here we're
remembering the src addr of the (received) packet in addr4 and the dst addr
we're going to use for sending as src4 as you'd expect:

	endpoint->addr4.sin_family = AF_INET;
	endpoint->addr4.sin_port = udp_hdr(skb)->source;
	endpoint->addr4.sin_addr.s_addr = ip_hdr(skb)->saddr;
	endpoint->src4.s_addr = ip_hdr(skb)->daddr;
	endpoint->src_if4 = skb->skb_iif;

The dst_cache is set just after those zero'ing conditionals we were looking
at before. It's cleared whenever the endpoint/port changes or one of those
cases is hit. Note the dst_cache is only used for data packets, so
handshakes would be unaffected if it was the cause of your woes.

> > @Nico could it perhaps simply be that you're hitting one of these zero'ing
> > cases and that's why it's using regular kernel src addr selection instead
> > of the cached endpoint src4 address?
> 
> That could absolutely be the case. What is funky is that I see the
> problem on two very different systems
>
> Both systems exhibit the behaviour, but maybe it's better to focus on
> System A first, as this seems to be more the "upstream" source.

It is weird indeed, but yeah. One thing at a time.

BTW, what kernel version/distro are we dealing with?

--Daniel
