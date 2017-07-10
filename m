Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62eeaadb
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 01:34:50 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 2ea436dd
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 01:34:50 +0000 (UTC)
Date: Sun, 9 Jul 2017 20:48:34 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Looks like 4.13 introduces a new incompatibility
Message-ID: <20170710014834.GA14901@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

With Fedora's 4.13.0-0.rc0.git3.1.fc27 kernel, master no longer compiles. 
It is still a week before rc1 and I can use 4.12 on the relevant machines, 
but I thought I'd give a heads up.

[bruno@wolff src]$ make clean all
make -C /lib/modules/4.13.0-0.rc0.git3.1.fc27.i686+PAE/build M=/home/bruno/WireGuard/src clean
make[1]: Entering directory '/usr/src/kernels/4.13.0-0.rc0.git3.1.fc27.i686+PAE'
  CLEAN   /home/bruno/WireGuard/src/.tmp_versions
make[1]: Leaving directory '/usr/src/kernels/4.13.0-0.rc0.git3.1.fc27.i686+PAE'
make -C tools clean
make[1]: Entering directory '/home/bruno/WireGuard/src/tools'
rm -f wg *.o *.d
make[1]: Leaving directory '/home/bruno/WireGuard/src/tools'
make -C /lib/modules/4.13.0-0.rc0.git3.1.fc27.i686+PAE/build M=/home/bruno/WireGuard/src modules
make[1]: Entering directory '/usr/src/kernels/4.13.0-0.rc0.git3.1.fc27.i686+PAE'
  CC [M]  /home/bruno/WireGuard/src/main.o
  CC [M]  /home/bruno/WireGuard/src/noise.o
  CC [M]  /home/bruno/WireGuard/src/device.o
/home/bruno/WireGuard/src/device.c:372:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .newlink  = newlink,
              ^~~~~~~
/home/bruno/WireGuard/src/device.c:372:14: note: (near initialization for ‘link_ops.newlink’)
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:303: /home/bruno/WireGuard/src/device.o] Error 1
make[1]: *** [Makefile:1512: _module_/home/bruno/WireGuard/src] Error 2
make[1]: Leaving directory '/usr/src/kernels/4.13.0-0.rc0.git3.1.fc27.i686+PAE'
make: *** [Makefile:28: module] Error 2
