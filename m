Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB902EB64DA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jul 2023 00:06:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53ce32c0;
	Fri, 21 Jul 2023 00:06:55 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8deaddd4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2023 00:06:54 +0000 (UTC)
Received: janet.servers.dxld.at; Fri, 21 Jul 2023 02:06:53 +0200
Date: Fri, 21 Jul 2023 02:06:43 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>,
 Nico Schottelius <nico.schottelius@ungleich.ch>
Subject: Wg source address is too sticky for multihomed systems aka multiple
 endpoints redux
Message-ID: <20230721000643.44y5pd7sfcjzhbjw@House.clients.dxld.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi wire-guard, :)

tl;dr: I wan to implement mutliple peer endpoints to fix the only two
problems haunting me with wireguard.

I have a multihomed router with two public IPv4 addresses plus default
routes in a failover configuration. The setup includes the two default
routes with different metrics and appropriate ip-rule(s) to make traffic
with a preselected source address leave via the correct interface.

On top of this v4 underlay I run a number of wireguard interfaces providing
IPv6 service for my network. Since one of the v4 uplinks is an LTE/5G
router the main uplink is usually preferable and the (default) route
metrics reflect this.

However I've observed wireguard continuing to send traffic via the larger
metric default route after failover events even after the primary link and
it's default route is back.

Source address issues on multihomed hosts have been discussed on the
list multiple times before. See for example:
- https://lists.zx2c4.com/pipermail/wireguard/2023-February/007948.html
- https://lists.zx2c4.com/pipermail/wireguard/2021-October/007205.html
- https://lists.zx2c4.com/pipermail/wireguard/2021-November/007309.html

So I'm certainly not the only one experiencing issues like this.

I set out on a quest to debug this. My first reading of the code indicated
that perhaps the dst_cache is at fault but after adding some tracing code
it became clear that our endpoint logic is simply broken for multihomed
systems:

The dst_cache gets properly invalidated whenever route switchover happens
but when doing a new rt lookup we force the lookup to use the (known good)
src address.

This is deficient because if we run a full route lookup we might get a
different source address (as is the case in my setup). I do think I
understand why we do things like this: we know this source address is
working and the new one could break connectivity. Fair enough.

So here's a proposal: we introduce a second wg_peer endpoint address for
use with handshakes. This way we can send a handshake using the new source
address and only switch if it succeeds.

I do expect this to be a fair bit of additional logic since we need to deal
with timeouts, retrys and such. However I think this is a good opportunity
to kill two birds with one stone. Hear me out.

I have a second issue with wireguard that's been bugging me for ages:
IPv4/6 non-dual-stack support _sucks_. The kernel only knows about one
endpoint address ever so if a endpoint (DNS) host resolves to multiple
addresses there's nothing userspace can easily do to make things work on
IPv4-only *and* IPv6-only networks.

This is kind of the same problem we're having with multihoming though: if
only wireguard could keep track of multiple endpoints (think: dst+src
address pairs).

So my proposal is to just add support for multiple endpoints. There is only
ever one endpoint involved in sending user data but we attempt handshakes
over all endpoints. (Exact logic TBD)

To fix the multihoming issue we then check if the socket.c:sendX rt lookup
returns a different src address form what we're expecting. If not we clone
the current (dst) endpoint with the new source address and kick off a
handshake over it.

Note "multiple endpoints" was suggested before in "[RFC] Handling multiple
endpoints for a single peer" and I agree with most of the design spec
presented in it:
- https://lists.zx2c4.com/pipermail/wireguard/2017-January/000917.html

I would perhaps not go as far as to introduce fancy RTT measurment. Me
personally, I have a proper routing daemon (babeld) in userspace using an
RTT metric for that. No need to do this in kernel.

The ability to send "out-of-band" packets to a particular peer mentioned by
Jason in the above mail would actually help routing daemons to cover the
entire failover story as that's the only limitation currently: I need one
wg tunnel per-peer to do routing but I digress.

Let me know what y'all think, I'd like to start hacking/designing this
ASAP. These things have been the only pain point in an otherwise stellar
user experience with wireguard!

Thanks,
--Daniel

PS: I have found one viable workaround for this source stickyness. `wg set
$iface fwmar $mark` will reset all peer src addresses, but it doesn't stick
at hight packet rates because (I think) the incoming packets immediately
overwrite the src address in wg_packet_consume_data_done() via
wg_socket_set_peer_endpoint(). So you have to do it a couple of times
(perhaps in a tight loop) for it to un-stick the source address :)
