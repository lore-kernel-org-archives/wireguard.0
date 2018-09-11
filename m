Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af9c6792
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:35 +0000 (UTC)
Received: from mail-wm0-x231.google.com (mail-wm0-x231.google.com
 [IPv6:2a00:1450:400c:c09::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e77bdc6
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Sep 2018 19:12:35 +0000 (UTC)
Received: by mail-wm0-x231.google.com with SMTP id 207-v6so2109588wme.5
 for <wireguard@lists.zx2c4.com>; Tue, 11 Sep 2018 12:13:27 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v3 00/12] Allow changing the transit namespace
Date: Tue, 11 Sep 2018 21:12:59 +0200
Message-Id: <20180911191311.25373-1-ju.orth@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is v3 of [1] and [2].

The main reason for v2 was that v1 contained a serious vulnerability
that allowed any process to create a socket in any network namespace.
The solution in v2 was to ask the process to provide proof that he
already has access to UDP sockets in the desired transit namespace. I
believe that this method is sound, however, I do not think that it is
particularly clean.

Therefore I have implemented another solution to the vulnerability in
v1 which I believe is useful independently of the transit-netns feature.

Let's assume the following axioms:

* In order to access/modify the Wireguard UDP socket, the caller must
    * currently reside in the transit namespace or
    * have CAP_NET_ADMIN in the transit namespace
* In order to access/modify the Wireguard device, the caller must have
  CAP_NET_ADMIN in the namespace of the Wireguard device

Consider the following scenario:

* Alice is in network namespace `n1` which belongs to user namespace
  `u1`.
* Alice has no capabilities in `u1`.
* Alice creates a user namespace `u2` and a network namespace `n2`
  (whose user namespace is `u2`).
* Alice therefore has CAP_NET_ADMIN in `u2`.
* Alice creates a Wireguard device `wg0` in `n2`.
* Alice now wishes to set the transit namespace of `wg0` to `n1`.

If we look at the axioms above, then it is clear that there is only one
way for her to accomplish this:

* Alice must modify `wg0` while residing in `n1`.

Therefore, Alice executes the following command while residing in `n1`:

wg --netns n2 set wg0 transit-net n1

In addition to the features of v1, this version adds the orthogonal
feature displayed above: It allows the user to specify the namespace in
which Wireguard should look up the device to operate on.

As shown in the following Bash script, the combination of these features
allows the usage of Wireguard in unprivileged containers:

#!/bin/bash

rm -f pipe
mkfifo pipe

{
    read pid < pipe
    wg --netns "$pid" set wg0 transit-netns $$
    rm pipe
} &

unshare -r -U -n -- bash <<EOF
    wg-quick up ./wg0.conf
    echo \$$ > pipe
    ping -c1 wireguard.com
EOF

The code using transit-credentials can be applied on top of these
changes if it is considered useful.

Julian Orth (12):
  device: protect socket_init with device_update_lock
  netlink: check for CAP_NET_ADMIN manually
  netlink: allow specifying the device namespace
  netlink: restrict access to the UDP socket
  device: rename creating_net to transit_net
  device: store a copy of the device net
  socket: allow modification of transit_net
  netlink: allow modification of transit net
  tools: add framework for shared options
  tools: allow specifying the device namespace
  tools: allow modification of transit net
  tests: add test for transit-net

[1] v1: https://lists.zx2c4.com/pipermail/wireguard/2018-September/003322.html
[2] v2: https://lists.zx2c4.com/pipermail/wireguard/2018-September/003344.html

 src/device.c            |  44 +++++++-----
 src/device.h            |   6 +-
 src/netlink.c           | 150 ++++++++++++++++++++++++++++++++--------
 src/socket.c            |  18 ++---
 src/socket.h            |   6 +-
 src/tests/netns.sh      |  40 +++++++++++
 src/tools/config.c      |   8 +++
 src/tools/containers.h  |  22 +++++-
 src/tools/genkey.c      |   3 +-
 src/tools/ipc.c         |  26 +++++--
 src/tools/ipc.h         |   7 +-
 src/tools/man/wg.8      |   9 ++-
 src/tools/netns.c       |  62 +++++++++++++++++
 src/tools/netns.h       |  18 +++++
 src/tools/pubkey.c      |   3 +-
 src/tools/set.c         |   6 +-
 src/tools/setconf.c     |   4 +-
 src/tools/show.c        |  35 +++++++---
 src/tools/showconf.c    |   4 +-
 src/tools/subcommands.h |  14 ++--
 src/tools/wg.c          |  64 +++++++++++++++--
 src/uapi/wireguard.h    |  39 ++++++++++-
 22 files changed, 483 insertions(+), 105 deletions(-)
 create mode 100644 src/tools/netns.c
 create mode 100644 src/tools/netns.h

-- 
2.18.0
