Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e06ce86
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jul 2017 17:34:39 +0000 (UTC)
Received: from mail.crimel.ro (109.166.220.71 [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fb661c8
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jul 2017 17:34:39 +0000 (UTC)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "jason A. Donenfeld" <Jason@zx2c4.com>
From: Lucian Cristian <luci@createc.ro>
Subject: wg-quick add_route
Message-ID: <fe5fcf1b-a7d1-6f6c-1561-4b1b1fa4e326@createc.ro>
Date: Wed, 12 Jul 2017 20:53:01 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

I'm using wireguard in some mixed topology and until now I've had LEDE 
routers as clients but now I would like to add some CENTOS(and other 
distros) clients too.

On LEDE there is an option "Create routes for Allowed IPs for this peer" 
that is off by default, but in wg-quick this thing is not optional and 
the routes are created by default, so if I would like to allow 
10.0.0.0/8 it would create default route for all 10.0.0.0/8 to wg 
interface and I don't want that.

I would like to use dynamic routing (rip+eigrp) for routing, if you 
could add an entry to peers not to add default route to allowed ip would 
be great

until then I've disabled add_route rule in the script

Regards
