Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82b94053
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:08 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6c5f86e
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:07 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 0/7] TUN fixes
Date: Sun, 31 Dec 2017 17:16:47 +0100
Message-Id: <cover.1514726309.git.simon@ruderich.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

While looking through the latest commits I noticed that 996c7c4
("Removed IFF_NO_PI from TUN linux", 2017-12-04) broke the test
suite and darwin and windows builds by changing the TUNDevice
interface. This patch series adds documentation and tries to fix
the tests and the darwin/windows tun (however that part is
untested as I don't have access to these systems and it looks
like the build is already broken for a while).

Note that d73f960 ("Peer timer teardown", 2017-12-29) broke the
tests in a separate way so even with these patches the test suite
will not pass.

Regards
Simon

Simon Ruderich (7):
  tun: TUNDevice: document behavior of offset parameter
  tun_linux: add PIHeaderSize constant instead of magic value
  tun_linux: document packet information header values
  helper_test: reorder DummyTUN functions to follow interface order
  helper_test: adapt to TUNDevice interface change
  tun_darwin: adapt to TUNDevice interface change
  tun_darwin: adapt to TUNDevice interface change

 src/helper_test.go | 26 +++++++++++++-------------
 src/tun.go         |  4 ++--
 src/tun_darwin.go  | 13 ++++++++++---
 src/tun_linux.go   | 11 +++++++----
 src/tun_windows.go |  8 ++++++--
 5 files changed, 38 insertions(+), 24 deletions(-)

-- 
2.15.1
