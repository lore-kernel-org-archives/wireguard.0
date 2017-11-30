Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb7e4a09
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:17:50 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1920a6e2
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:17:50 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason@zx2c4.com
Subject: [PATCH 0/6] wireguard: add SPDX tags
Date: Thu, 30 Nov 2017 15:23:49 +0000
Message-Id: <20171130152355.25387-1-gregkh@linuxfoundation.org>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The Linux kernel developers are currently adding the correct SPDX tag to
all of the in-tree files.  This patch series adds the needed SPDX tags
to all of the wireguard kernel files as well as a few others in src/
using the agreeded apon format and style for the different files.

No license was changed in any of these patches, except the last patch.

Note, the last patch in the series does change the license to be maybe
what I think you want, but I could be wrong.  Please see the changelog
text for that patch for what you might want.  In any case, only apply it
if you really know what you are doing :)

On a side note, the whole "All rights reserved" is cargo-cult crud.  As
described by a developer who has done more license work than probably
anyone else on the kernel mailing list today:
	Side note a trailing  "All Rights Reserved." in a copyright
	statement is never needed, even though customarily cargo culted
	by everyone, including me.  Started in 1910, it become fully
	obsolete in 2000 thanks to Nicaragua [1] signing the Berne
	convention.
	[1] https://en.wikipedia.org/wiki/All_rights_reserved

So you can remove those from the files as well if you want to, but I'll
let you do that :)

Greg Kroah-Hartman (6):
  src/tools: add SPDX tags to all files
  src/selftest: add SPDX tags to all files
  src/tests: add SPDX tags to all files
  src/crypto: add SPDX tags to all files
  src: add SPDX tags to all files
  src/uapi/wireguard: add SPDX tag

 src/allowedips.c                              | 1 +
 src/allowedips.h                              | 1 +
 src/cookie.c                                  | 1 +
 src/cookie.h                                  | 1 +
 src/crypto/blake2s-x86_64.S                   | 1 +
 src/crypto/blake2s.c                          | 1 +
 src/crypto/blake2s.h                          | 1 +
 src/crypto/chacha20-arm.S                     | 1 +
 src/crypto/chacha20-arm64.S                   | 1 +
 src/crypto/chacha20-x86_64.S                  | 1 +
 src/crypto/chacha20poly1305.c                 | 1 +
 src/crypto/chacha20poly1305.h                 | 1 +
 src/crypto/curve25519-arm.S                   | 1 +
 src/crypto/curve25519-x86_64.S                | 1 +
 src/crypto/curve25519.c                       | 1 +
 src/crypto/curve25519.h                       | 1 +
 src/crypto/poly1305-arm.S                     | 1 +
 src/crypto/poly1305-arm64.S                   | 1 +
 src/crypto/poly1305-mips64.S                  | 1 +
 src/crypto/poly1305-x86_64.S                  | 1 +
 src/device.c                                  | 1 +
 src/device.h                                  | 1 +
 src/hashtables.c                              | 1 +
 src/hashtables.h                              | 1 +
 src/main.c                                    | 1 +
 src/messages.h                                | 1 +
 src/netlink.c                                 | 1 +
 src/netlink.h                                 | 1 +
 src/noise.c                                   | 1 +
 src/noise.h                                   | 1 +
 src/peer.c                                    | 1 +
 src/peer.h                                    | 1 +
 src/queueing.c                                | 1 +
 src/queueing.h                                | 1 +
 src/ratelimiter.c                             | 1 +
 src/ratelimiter.h                             | 1 +
 src/receive.c                                 | 1 +
 src/selftest/allowedips.h                     | 1 +
 src/selftest/blake2s.h                        | 1 +
 src/selftest/chacha20poly1305.h               | 1 +
 src/selftest/counter.h                        | 1 +
 src/selftest/curve25519.h                     | 1 +
 src/selftest/ratelimiter.h                    | 1 +
 src/send.c                                    | 1 +
 src/socket.c                                  | 1 +
 src/socket.h                                  | 1 +
 src/tests/netns.sh                            | 1 +
 src/tests/qemu/init.c                         | 1 +
 src/timers.c                                  | 1 +
 src/timers.h                                  | 1 +
 src/tools/completion/wg-quick.bash-completion | 1 +
 src/tools/completion/wg.bash-completion       | 1 +
 src/tools/config.c                            | 1 +
 src/tools/config.h                            | 1 +
 src/tools/containers.h                        | 1 +
 src/tools/curve25519.c                        | 1 +
 src/tools/curve25519.h                        | 1 +
 src/tools/encoding.c                          | 1 +
 src/tools/encoding.h                          | 1 +
 src/tools/genkey.c                            | 1 +
 src/tools/ipc.c                               | 1 +
 src/tools/ipc.h                               | 1 +
 src/tools/mnlg.c                              | 1 +
 src/tools/mnlg.h                              | 1 +
 src/tools/pubkey.c                            | 1 +
 src/tools/set.c                               | 1 +
 src/tools/setconf.c                           | 1 +
 src/tools/show.c                              | 1 +
 src/tools/showconf.c                          | 1 +
 src/tools/subcommands.h                       | 1 +
 src/tools/terminal.c                          | 1 +
 src/tools/terminal.h                          | 1 +
 src/tools/wg-quick.bash                       | 1 +
 src/tools/wg.c                                | 1 +
 src/uapi/wireguard.h                          | 1 +
 src/version.h                                 | 1 +
 76 files changed, 76 insertions(+)

-- 
2.15.1
