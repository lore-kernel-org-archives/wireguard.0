Return-Path: outbackdingo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f4e8c58
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Dec 2017 14:25:22 +0000 (UTC)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61b0b6cd
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Dec 2017 14:25:22 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id g75so44451253wme.0
 for <wireguard@lists.zx2c4.com>; Thu, 28 Dec 2017 06:26:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87bmijq05i.fsf@dell.be.48ers.dk>
References: <CAKYr3zwZC7QMyLZJT55MquxSOuJsvBO3JrNntFEp23egqJAeKw@mail.gmail.com>
 <87bmijq05i.fsf@dell.be.48ers.dk>
From: Outback Dingo <outbackdingo@gmail.com>
Date: Thu, 28 Dec 2017 09:25:29 -0500
Message-ID: <CAKYr3zxFYEVpTLUcqE42DYs983ivGt+9p877=0XuDyZWzm6qjw@mail.gmail.com>
Subject: Re: wg on arm 32-bit
To: Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

so i added -std=gnu11  and seems its gotten further, however not quite there

 DEBUG: Executing shell function do_compile
| NOTE: make -j 8 -e MAKEFLAGS=
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/config.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/encoding.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/mnlg.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/ipc.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/show.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/terminal.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/curve25519.o
|   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/wg.o
| terminal.c: In function 'filter_ansi':
| terminal.c:42:2: warning: implicit declaration of function
'vasprintf' [-Wimplicit-function-declaration]
|   len = vasprintf(&str, fmt, args);
|   ^
| config.c: In function 'parse_endpoint':
| config.c:232:54: error: 'EAI_NODATA' undeclared (first use in this function)
|    if (ret == EAI_NONAME || ret == EAI_FAIL || ret == EAI_NODATA ||
timeout >= 90000000) {
|                                                       ^
| config.c:232:54: note: each undeclared identifier is reported only
once for each function it appears in
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
| <builtin>: recipe for target 'config.o' failed
| make: *** [config.o] Error 1
| make: *** Waiting for unfinished jobs....
| <builtin>: recipe for target 'ipc.o' failed
| make: *** [ipc.o] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/temp/run.do_compile.14786:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/temp/log.do_compile.14786)

On Wed, Dec 27, 2017 at 5:24 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Outback" == Outback Dingo <outbackdingo@gmail.com> writes:
>
>  > seems that wireguard is not capabl;e of building for 32bit arm?
>
> It works fine in Buildroot.
>
>  > | DEBUG: Executing shell function do_compile
>  > | NOTE: make -j 8 -e MAKEFLAGS=
>  > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/config.o
>  > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/curve25519.o
>  > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/mnlg.o
>  > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/wg.o
>  > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/ipc.o
>  > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/encoding.o
>  > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/show.o
>  > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/terminal.o
>  > | In file included from encoding.h:11:0,
>  > |                  from encoding.c:9:
>  > | containers.h: In function 'free_wgdevice':
>  > | containers.h:87:2: error: 'for' loop initial declarations are only
>  > allowed in C99 or C11 mode
>
> It looks like you are not passing -std=gnu11 to gcc. Can you build with
> V=1 to see the exact command line?
>
> --
> Bye, Peter Korsgaard
