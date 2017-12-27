Return-Path: outbackdingo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8580c547
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Dec 2017 17:57:47 +0000 (UTC)
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
 [209.85.128.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28d691c1
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Dec 2017 17:57:47 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id f8so26559127wre.4
 for <wireguard@lists.zx2c4.com>; Wed, 27 Dec 2017 09:58:29 -0800 (PST)
MIME-Version: 1.0
From: Outback Dingo <outbackdingo@gmail.com>
Date: Wed, 27 Dec 2017 12:57:47 -0500
Message-ID: <CAKYr3zwZC7QMyLZJT55MquxSOuJsvBO3JrNntFEp23egqJAeKw@mail.gmail.com>
Subject: wg on arm 32-bit
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

seems that wireguard is not capabl;e of building for 32bit arm?

| DEBUG: Executing shell function do_compile
| NOTE: make -j 8 -e MAKEFLAGS=
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/config.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/curve25519.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/mnlg.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/wg.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/ipc.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/encoding.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/show.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/terminal.o
| In file included from encoding.h:11:0,
|                  from encoding.c:9:
| containers.h: In function 'free_wgdevice':
| containers.h:87:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (struct wgpeer *peer = dev->first_peer, *np = peer ?
peer->next_peer : NULL; peer; peer = np, np = peer ? peer->next_peer :
NULL) {
|   ^
| containers.h:87:2: note: use option -std=c99, -std=gnu99, -std=c11
or -std=gnu11 to compile your code
| containers.h:88:3: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|    for (struct wgallowedip *allowedip = peer->first_allowedip, *na =
allowedip ? allowedip->next_allowedip : NULL; allowedip; allowedip =
na, na = allowedip ? allowedip->next_allowedip : NULL)
|    ^
| encoding.c: In function 'encode_base64':
| encoding.c:15:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (unsigned int i = 0; i < 4; ++i)
|   ^
| encoding.c: In function 'decode_base64':
| encoding.c:39:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (unsigned int i = 0; i < 4; ++i)
|   ^
| encoding.c: In function 'key_from_hex':
| encoding.c:92:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (unsigned int i = 0; i < WG_KEY_LEN_HEX - 1; ++i) {
|   ^
| encoding.c: In function 'key_is_zero':
| encoding.c:114:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (unsigned int i = 0; i < WG_KEY_LEN; ++i) {
|   ^
| In file included from show.c:19:0:
| containers.h: In function 'free_wgdevice':
| containers.h:87:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (struct wgpeer *peer = dev->first_peer, *np = peer ?
peer->next_peer : NULL; peer; peer = np, np = peer ? peer->next_peer :
NULL) {
|   ^
| containers.h:87:2: note: use option -std=c99, -std=gnu99, -std=c11
or -std=gnu11 to compile your code
| containers.h:88:3: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|    for (struct wgallowedip *allowedip = peer->first_allowedip, *na =
allowedip ? allowedip->next_allowedip : NULL; allowedip; allowedip =
na, na = allowedip ? allowedip->next_allowedip : NULL)
|    ^
| <builtin>: recipe for target 'encoding.o' failed
| make: *** [encoding.o] Error 1
| make: *** Waiting for unfinished jobs....
| wg.c: In function 'show_usage':
| wg.c:33:2: error: 'for' loop initial declarations are only allowed
in C99 or C11 mode
|   for (size_t i = 0; i < sizeof(subcommands) / sizeof(subcommands[0]); ++i)
|   ^
| wg.c:33:2: note: use option -std=c99, -std=gnu99, -std=c11 or
-std=gnu11 to compile your code
| wg.c: In function 'main':
| wg.c:52:2: error: 'for' loop initial declarations are only allowed
in C99 or C11 mode
|   for (size_t i = 0; i < sizeof(subcommands) / sizeof(subcommands[0]); ++i) {
|   ^
| <builtin>: recipe for target 'wg.o' failed
| make: *** [wg.o] Error 1
| In file included from ipc.c:38:0:
| containers.h: In function 'free_wgdevice':
| containers.h:87:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (struct wgpeer *peer = dev->first_peer, *np = peer ?
peer->next_peer : NULL; peer; peer = np, np = peer ? peer->next_peer :
NULL) {
|   ^
| containers.h:87:2: note: use option -std=c99, -std=gnu99, -std=c11
or -std=gnu11 to compile your code
| containers.h:88:3: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|    for (struct wgallowedip *allowedip = peer->first_allowedip, *na =
allowedip ? allowedip->next_allowedip : NULL; allowedip; allowedip =
na, na = allowedip ? allowedip->next_allowedip : NULL)
|    ^
| ipc.c: In function 'userspace_interface_file':
| ipc.c:43:19: error: 'RUNSTATEDIR' undeclared (first use in this function)
|  #define SOCK_PATH RUNSTATEDIR "/wireguard/"
|                    ^
| ipc.c:117:59: note: in expansion of macro 'SOCK_PATH'
|   ret = snprintf(addr.sun_path, sizeof(addr.sun_path) - 1, SOCK_PATH
"%s" SOCK_SUFFIX, interface);
|                                                            ^
| ipc.c:43:19: note: each undeclared identifier is reported only once
for each function it appears in
|  #define SOCK_PATH RUNSTATEDIR "/wireguard/"
|                    ^
| ipc.c:117:59: note: in expansion of macro 'SOCK_PATH'
|   ret = snprintf(addr.sun_path, sizeof(addr.sun_path) - 1, SOCK_PATH
"%s" SOCK_SUFFIX, interface);
|                                                            ^
| ipc.c:43:31: error: expected ')' before string constant
|  #define SOCK_PATH RUNSTATEDIR "/wireguard/"
|                                ^
| ipc.c:117:59: note: in expansion of macro 'SOCK_PATH'
|   ret = snprintf(addr.sun_path, sizeof(addr.sun_path) - 1, SOCK_PATH
"%s" SOCK_SUFFIX, interface);
|                                                            ^
| ipc.c: In function 'userspace_has_wireguard_interface':
| ipc.c:43:19: error: 'RUNSTATEDIR' undeclared (first use in this function)
|  #define SOCK_PATH RUNSTATEDIR "/wireguard/"
|                    ^
| ipc.c:158:57: note: in expansion of macro 'SOCK_PATH'
|   if (snprintf(addr.sun_path, sizeof(addr.sun_path) - 1, SOCK_PATH
"%s" SOCK_SUFFIX, interface) < 0)
|                                                          ^
| ipc.c:43:31: error: expected ')' before string constant
|  #define SOCK_PATH RUNSTATEDIR "/wireguard/"
|                                ^
| ipc.c:158:57: note: in expansion of macro 'SOCK_PATH'
|   if (snprintf(addr.sun_path, sizeof(addr.sun_path) - 1, SOCK_PATH
"%s" SOCK_SUFFIX, interface) < 0)
|                                                          ^
| ipc.c: In function 'userspace_get_wireguard_interfaces':
| ipc.c:43:19: error: 'RUNSTATEDIR' undeclared (first use in this function)
|  #define SOCK_PATH RUNSTATEDIR "/wireguard/"
|                    ^
| ipc.c:185:16: note: in expansion of macro 'SOCK_PATH'
|   dir = opendir(SOCK_PATH);
|                 ^
| ipc.c:43:31: error: expected ')' before string constant
|  #define SOCK_PATH RUNSTATEDIR "/wireguard/"
|                                ^
| ipc.c:185:16: note: in expansion of macro 'SOCK_PATH'
|   dir = opendir(SOCK_PATH);
|                 ^
| show.c: In function 'show_main':
| show.c:395:3: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|    for (size_t len = 0; (len = strlen(interface)); interface += len + 1) {
|    ^
| show.c:429:3: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|    for (size_t len = 0; (len = strlen(interface)); interface += len + 1)
|    ^
| <builtin>: recipe for target 'show.o' failed
| make: *** [show.o] Error 1
| In file included from config.c:19:0:
| containers.h: In function 'free_wgdevice':
| containers.h:87:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (struct wgpeer *peer = dev->first_peer, *np = peer ?
peer->next_peer : NULL; peer; peer = np, np = peer ? peer->next_peer :
NULL) {
|   ^
| containers.h:87:2: note: use option -std=c99, -std=gnu99, -std=c11
or -std=gnu11 to compile your code
| containers.h:88:3: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|    for (struct wgallowedip *allowedip = peer->first_allowedip, *na =
allowedip ? allowedip->next_allowedip : NULL; allowedip; allowedip =
na, na = allowedip ? allowedip->next_allowedip : NULL)
|    ^
| config.c: In function 'parse_endpoint':
| config.c:226:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (unsigned int timeout = 1000000;;) {
|   ^
| config.c:232:54: error: 'EAI_NODATA' undeclared (first use in this function)
|    if (ret == EAI_NONAME || ret == EAI_FAIL || ret == EAI_NODATA ||
timeout >= 90000000) {
|                                                       ^
| config.c:232:54: note: each undeclared identifier is reported only
once for each function it appears in
| config.c: In function 'config_read_line':
| config.c:434:2: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
|   for (size_t i = 0; i < len; ++i) {
|   ^
| <builtin>: recipe for target 'ipc.o' failed
| make: *** [ipc.o] Error 1
| <builtin>: recipe for target 'config.o' failed
| make: *** [config.o] Error 1
| ERROR: oe_runmake failed
