Return-Path: kev_pi@mailbox.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0c0017d
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 14:11:08 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e2a4ea1
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 14:11:08 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id D492945BD2
 for <wireguard@lists.zx2c4.com>; Sun, 12 Mar 2017 15:14:19 +0100 (CET)
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id d_bpOc9ZDJRy for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 15:14:12 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: 8177y3hfj2nv5@mailbox.org
Subject: grsec kernel: RTNETLINK answers: Operation not supported
Message-ID: <22326a60-1a27-5916-ff3f-29a9cedb4272@mailbox.org>
Date: Sun, 12 Mar 2017 15:14:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I apologise if this is not a question for here, but I haven't been able
to find a solution for my problem, so I thought I'd try.

I'm running a grsec kernel, and am trying to set up wireguard. I have it
working on the standard kernel, but not on the grsec 4.9 one.

The problem is this:

sudo ip link add dev wg0 type wireguard
RTNETLINK answers: Operation not supported

I thought I traced it back to kernel configuration of several NETFILTER
items, which state 'm'. So I've been trying to find a module responsible
for this, and the closest I have come is nfnetlink, but even after
modprobe nfnetlink it doesn't work.

Any help is much appreciated. Thank you for all the great work on this
fantastic program.

Cheers
