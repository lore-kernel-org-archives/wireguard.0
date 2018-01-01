Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe0d6e8c
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:57 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9387cc97
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:57 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 00/12] Misc patches
Date: Mon,  1 Jan 2018 11:52:50 +0100
Message-Id: <cover.1514803815.git.simon@ruderich.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

In addition to the TUN patches I noticed a few other things while
reading the code. Some of these patches might be biased so just
drop anything you don't like (or tell me how to improve it)

Regards
Simon

Simon Ruderich (12):
  Fix typos in comments
  tun_linux: use getDummySock()
  receive, send: use AtomicBool for dropped in QueueInboundElement,
    QueueOutboundElement
  device: move removePeerUnsafe() into Device
  index: NewIndex(): don't use separate read-lock to check if index is
    present
  device: use UnderLoadAfterTime constant
  peer: NewPeer(): add missing device.mutex.Unlock() in error paths
  conn_linux: move comment to make its meaning more obvious
  ratelimiter: Allow(): don't use separate read-lock to check if ip is
    present
  receive, send: specialize addTo*Queue() functions
  noise_protocol: mixHash(): remove unnecessary Reset()
  timers: log error if handshake sending fails

 src/conn_linux.go     |  9 ++++-----
 src/device.go         | 12 ++++++------
 src/index.go          | 14 ++++----------
 src/keypair.go        |  2 +-
 src/main.go           |  2 +-
 src/noise_protocol.go | 11 +++++------
 src/peer.go           |  4 +++-
 src/ratelimiter.go    | 10 ++--------
 src/receive.go        | 30 +++++++++++-------------------
 src/send.go           | 17 +++++++----------
 src/timers.go         |  4 ++--
 src/tun_linux.go      | 23 ++---------------------
 12 files changed, 48 insertions(+), 90 deletions(-)

-- 
2.15.1
