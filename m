Return-Path: paul@mjr.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91f1160e
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 07:17:48 +0000 (UTC)
Received: from mjr.org (mjr.org [212.13.216.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3154671e
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 07:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mjr.org (Postfix) with ESMTP id 1DCE116C386
 for <wireguard@lists.zx2c4.com>; Thu,  9 Aug 2018 08:29:01 +0100 (BST)
Received: from mjr.org ([127.0.0.1])
 by localhost (mjr.org [127.0.0.1]) (amavisd-new, port 10024) with LMTP
 id f8JwDom1OqZS for <wireguard@lists.zx2c4.com>;
 Thu,  9 Aug 2018 08:29:01 +0100 (BST)
Received: from knot (unknown [10.88.6.9])
 by mjr.org (Postfix) with ESMTP id DF7CB16C371
 for <wireguard@lists.zx2c4.com>; Thu,  9 Aug 2018 08:29:00 +0100 (BST)
Message-ID: <967b3455e74694a411fc4c87aa44e523b362d18a.camel@mjr.org>
Subject: wg unable to communicate after laptop suspend
From: Paul Hedderly <paul@mjr.org>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Thu, 09 Aug 2018 08:29:00 +0100
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Morning all - I'm not sure if I'm doing something wrong, or this is
something the kernel module could help with.

When wg interface is started, it punches a hole through my firewall
(upnp?) and all is well. After a suspend wg cannot receive replies from
its peers.

Would it be easy to get wg to notice keepalives failing and try the
upnp again? I know I can just restart the wg interface... but I'd love
to not have to.

Or am I barking up the wrong tree?

Thanks again for an amazing tool!
