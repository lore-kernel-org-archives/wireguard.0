Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ce191d1
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 15:13:45 +0000 (UTC)
Received: from mail-wm0-x233.google.com (mail-wm0-x233.google.com
 [IPv6:2a00:1450:400c:c09::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6316fe8c
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 15:13:45 +0000 (UTC)
Received: by mail-wm0-x233.google.com with SMTP id n11-v6so18816006wmc.2
 for <wireguard@lists.zx2c4.com>; Sun, 09 Sep 2018 08:14:22 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v2 00/10] Allow changing the transit namespace
Date: Sun,  9 Sep 2018 17:13:52 +0200
Message-Id: <20180909151402.6033-1-ju.orth@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is v2 of [1].

As in v1, this series allows unprivileged users to create Wireguard
devices within a user and network namespace and then move the Wireguard
UDP socket to the init namespace. This allows Wireguard to be used in
unprivileged containers.

You can see the new functionality in this bash script:

#!/bin/bash

exec 100<>/dev/udp/127.0.0.1/0
exec 101<>/dev/udp/::1/0

unshare -r -U -n -- bash <<EOF

wg-quick up ./wg0.conf
wg set wg0 transit-netns 1 transit-credentials 100,101

ping -c1 wireguard.com

EOF

Compared to v1, this version contains the following changes:

* The have_transit_net_ref field has been removed and the story around
  ownership of the transit_net field has been cleaned up a bit.
* In the user-facing API, transit-net has been renamed to transit-netns
  to be more consistent with the ip(1) syntax.
* Unless the caller can prove that she owns UDP sockets in the
  transit namespace (IPv4 and IPv6 if configured), changing listen-port
  and/or transit-netns now requires CAP_NET_ADMIN in the transit
  namespace. This ensures that the Wireguard device does not give the
  caller unauthorized access to (ports in) network namespaces.
* In order to prove that she has those UDP sockets, the caller passes
  the corresponding file descriptors as arguments in the same call.

As you can see in the example, the syntax is

wg set <device> transit-credentials <fd>[,<fd>]

The first fd must refer to the IPv4 socket and the second one to the
IPv6 socket. The second fd is optional iff the kernel was configured
without IPv6 support.

[1] https://lists.zx2c4.com/pipermail/wireguard/2018-September/003322.html

Julian Orth (10):
  device: protect socket_init with device_update_lock
  device: rename creating_net to transit_net
  device: store a copy of the device net
  socket: allow modification of transit_net
  netlink: allow modification of transit net
  tools: allow modification of transit net
  tests: add test for transit-net
  netlink: require CAP_NET_ADMIN for socket changes
  netlink: allow bypassing CAP_NET_ADMIN
  tools: add support for transit-credentials

 src/device.c           |  44 ++++++++------
 src/device.h           |   6 +-
 src/netlink.c          | 127 +++++++++++++++++++++++++++++++++++------
 src/socket.c           |  18 +++---
 src/socket.h           |   6 +-
 src/tests/netns.sh     |  40 +++++++++++++
 src/tools/config.c     |  62 ++++++++++++++++++++
 src/tools/containers.h |  10 +++-
 src/tools/ipc.c        |   8 +++
 src/tools/man/wg.8     |   9 ++-
 src/tools/set.c        |   2 +-
 src/uapi/wireguard.h   |  24 +++++++-
 12 files changed, 300 insertions(+), 56 deletions(-)

-- 
2.18.0
