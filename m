Return-Path: jacmet@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9283f52a
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Dec 2017 22:24:16 +0000 (UTC)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73e1af97
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Dec 2017 22:24:16 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 64so41182921wme.3
 for <wireguard@lists.zx2c4.com>; Wed, 27 Dec 2017 14:25:00 -0800 (PST)
Return-Path: <jacmet@gmail.com>
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
To: Outback Dingo <outbackdingo@gmail.com>
Subject: Re: wg on arm 32-bit
References: <CAKYr3zwZC7QMyLZJT55MquxSOuJsvBO3JrNntFEp23egqJAeKw@mail.gmail.com>
Date: Wed, 27 Dec 2017 23:24:57 +0100
In-Reply-To: <CAKYr3zwZC7QMyLZJT55MquxSOuJsvBO3JrNntFEp23egqJAeKw@mail.gmail.com>
 (Outback Dingo's message of "Wed, 27 Dec 2017 12:57:47 -0500")
Message-ID: <87bmijq05i.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>>>>> "Outback" == Outback Dingo <outbackdingo@gmail.com> writes:

 > seems that wireguard is not capabl;e of building for 32bit arm?

It works fine in Buildroot.

 > | DEBUG: Executing shell function do_compile
 > | NOTE: make -j 8 -e MAKEFLAGS=
 > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/config.o
 > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/curve25519.o
 > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/mnlg.o
 > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/wg.o
 > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/ipc.o
 > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/encoding.o
 > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/show.o
 > |   CC      /home/dingo/yocto/build_bin/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/wireguard-tools/0.0.20171221-r0/WireGuard-0.0.20171221/src/tools/terminal.o
 > | In file included from encoding.h:11:0,
 > |                  from encoding.c:9:
 > | containers.h: In function 'free_wgdevice':
 > | containers.h:87:2: error: 'for' loop initial declarations are only
 > allowed in C99 or C11 mode

It looks like you are not passing -std=gnu11 to gcc. Can you build with
V=1 to see the exact command line?

-- 
Bye, Peter Korsgaard
