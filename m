Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5e267a6
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 12:18:34 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id faa1e54a
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 12:18:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v17-v6so17340666wrr.9
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 05:19:03 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 0/7] Allow changing the transit namespace
Date: Sat,  8 Sep 2018 14:18:34 +0200
Message-Id: <20180908121841.8372-1-ju.orth@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This series allows users to change the transit namespace after the
Wireguard device has been created. The transit namespace is the
namespace in which the Wireguard UDP socket lives.

This allows Wireguard to be used in unprivileged containers [1]. This is
based on the following observation:

* Within the unprivileged container, the user has CAP_NET_ADMIN and can
  create a Wireguard device.
* In the init namespace, the user can create a UDP socket and bind to an
  unprivileged port.

Therefore, the following is possbile as an ordinary user:

$ unshare -r -U
$ export SAVED_PID=$$
$ unshare -n
$ ip link add wg0 type wireguard
$ wg set wg0 transit-net $SAVED_PID

wg(1) accepts the following new argument:

wg set <device> transit-net <pid|file-path>

The distinction is made based on the format of the argument. If it is an
unsigned 32 bit integer, then it is interpreted as a process id.
Otherwise it is interpreted as a file path. /proc does not need to be
mounted to use the process id interpretation. To force the
interpretation as a file-path, use a ./ prefix.

[1] https://stgraber.org/2014/01/17/lxc-1-0-unprivileged-containers/

Julian Orth (7):
  device: protect socket_init with device_update_lock
  device: rename creating_net to transit_net
  device: store a copy of the device net
  socket: allow modification of transit_net
  netlink: allow setting of transit net
  tools: allow setting of transit net
  tests: add test for transit-net

 src/device.c           | 46 ++++++++++++++++++++++++-------------
 src/device.h           |  6 +++--
 src/netlink.c          | 52 ++++++++++++++++++++++++++++++++----------
 src/socket.c           | 18 ++++++++-------
 src/socket.h           |  6 ++---
 src/tests/netns.sh     | 40 ++++++++++++++++++++++++++++++++
 src/tools/config.c     | 32 ++++++++++++++++++++++++++
 src/tools/containers.h |  6 ++++-
 src/tools/ipc.c        |  4 ++++
 src/tools/man/wg.8     |  9 ++++++--
 src/tools/set.c        |  2 +-
 src/uapi/wireguard.h   | 12 +++++++---
 12 files changed, 185 insertions(+), 48 deletions(-)

-- 
2.18.0
