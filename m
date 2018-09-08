Return-Path: david.w.cowden@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40bc124e
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 04:45:05 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08fc43f9
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 04:45:05 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id f1-v6so7435963plt.4
 for <wireguard@lists.zx2c4.com>; Fri, 07 Sep 2018 21:45:31 -0700 (PDT)
Return-Path: <david.w.cowden@gmail.com>
Received: from dcx1.dcow.io (eero.static.monkeybrains.net. [199.116.72.162])
 by smtp.gmail.com with ESMTPSA id y69-v6sm19775216pfd.36.2018.09.07.21.45.29
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Sep 2018 21:45:29 -0700 (PDT)
Date: Fri, 7 Sep 2018 21:45:27 -0700
From: David Cowden <david.w.cowden@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Broadcasts over L3 tunnel
Message-ID: <20180908044527.7dhejnj2yp257pdt@dcx1.dcow.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I've been playing around with wireguard and I'd really like to enable a
scenario where a remote peer appears like they're on a LAN (at L3) somewhere
so that e.g. mDNS broadcasts reach the remote peer. I can create all sorts of
topologies where traffic can flow between the remote peer(s) and the LAN peers,
but I'm hung up on getting the kernel to send broadcasts to the wireguard
interface. If you put everything on the same subnet, you essentially end up
with two conflicting entries in the LAN host's routing table: one that routes
LAN traffic to the gateway for egress or if you're running on the gateway then
egresses upstream, and a second entry telling the kernel that the same subnet is
available across the wg interface.

Is a topology like this possible without hacking up some facade into L2?

David
