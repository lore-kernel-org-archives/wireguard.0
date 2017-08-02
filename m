Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c75becab
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:03:21 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 00432fe1
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:03:21 +0000 (UTC)
Date: Wed, 2 Aug 2017 07:19:20 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Compile time assertion failure
Message-ID: <20170802121920.GA3119@wolff.to>
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

I'm seeing the following:

[bruno@wolff src]$ make clean all
make -C /lib/modules/4.13.0-0.rc3.git0.1.fc27.i686+PAE/build M=/home/bruno/WireGuard/src clean
make[1]: Entering directory '/usr/src/kernels/4.13.0-0.rc3.git0.1.fc27.i686+PAE'
  CLEAN   /home/bruno/WireGuard/src/.tmp_versions
  CLEAN   /home/bruno/WireGuard/src/Module.symvers
make[1]: Leaving directory '/usr/src/kernels/4.13.0-0.rc3.git0.1.fc27.i686+PAE'
make -C tools clean
make[1]: Entering directory '/home/bruno/WireGuard/src/tools'
rm -f wg *.o *.d
make[1]: Leaving directory '/home/bruno/WireGuard/src/tools'
make -C /lib/modules/4.13.0-0.rc3.git0.1.fc27.i686+PAE/build M=/home/bruno/WireGuard/src modules
make[1]: Entering directory '/usr/src/kernels/4.13.0-0.rc3.git0.1.fc27.i686+PAE'
  CC [M]  /home/bruno/WireGuard/src/main.o
  CC [M]  /home/bruno/WireGuard/src/noise.o
  CC [M]  /home/bruno/WireGuard/src/device.o
  CC [M]  /home/bruno/WireGuard/src/peer.o
  CC [M]  /home/bruno/WireGuard/src/timers.o
  CC [M]  /home/bruno/WireGuard/src/data.o
  CC [M]  /home/bruno/WireGuard/src/send.o
  CC [M]  /home/bruno/WireGuard/src/receive.o
  CC [M]  /home/bruno/WireGuard/src/socket.o
  CC [M]  /home/bruno/WireGuard/src/config.o
  CC [M]  /home/bruno/WireGuard/src/hashtables.o
  CC [M]  /home/bruno/WireGuard/src/routingtable.o
In file included from ./include/uapi/linux/stddef.h:1:0,
                 from ./include/linux/stddef.h:4,
                 from ./include/uapi/linux/posix_types.h:4,
                 from ./include/uapi/linux/types.h:13,
                 from ./include/linux/types.h:5,
                 from /home/bruno/WireGuard/src/compat/compat.h:8,
                 from <command-line>:0:
In function ‘common_bits’,
    inlined from ‘node_placement.constprop’ at /home/bruno/WireGuard/src/routingtable.c:170:39,
    inlined from ‘add.part.1’ at /home/bruno/WireGuard/src/routingtable.c:195:6:
./include/linux/compiler.h:542:38: error: call to ‘__compiletime_assert_129’ declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(bits) || (bits != 32 && bits != 128)
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
./include/linux/compiler.h:525:4: note: in definition of macro ‘__compiletime_assert’
    prefix ## suffix();    \
    ^~~~~~
./include/linux/compiler.h:542:2: note: in expansion of macro ‘_compiletime_assert’
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:46:37: note: in expansion of macro ‘compiletime_assert’
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:70:2: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
  ^~~~~~~~~~~~~~~~
/home/bruno/WireGuard/src/routingtable.c:129:2: note: in expansion of macro ‘BUILD_BUG_ON’
  BUILD_BUG_ON(!__builtin_constant_p(bits) || (bits != 32 && bits != 128));
  ^~~~~~~~~~~~
In function ‘common_bits’,
    inlined from ‘add.part.1’ at /home/bruno/WireGuard/src/routingtable.c:215:9:
./include/linux/compiler.h:542:38: error: call to ‘__compiletime_assert_129’ declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(bits) || (bits != 32 && bits != 128)
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
./include/linux/compiler.h:525:4: note: in definition of macro ‘__compiletime_assert’
    prefix ## suffix();    \
    ^~~~~~
./include/linux/compiler.h:542:2: note: in expansion of macro ‘_compiletime_assert’
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:46:37: note: in expansion of macro ‘compiletime_assert’
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:70:2: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
  ^~~~~~~~~~~~~~~~
/home/bruno/WireGuard/src/routingtable.c:129:2: note: in expansion of macro ‘BUILD_BUG_ON’
  BUILD_BUG_ON(!__builtin_constant_p(bits) || (bits != 32 && bits != 128));
  ^~~~~~~~~~~~
make[2]: *** [scripts/Makefile.build:303: /home/bruno/WireGuard/src/routingtable.o] Error 1
make[1]: *** [Makefile:1515: _module_/home/bruno/WireGuard/src] Error 2
make[1]: Leaving directory '/usr/src/kernels/4.13.0-0.rc3.git0.1.fc27.i686+PAE'
make: *** [Makefile:28: module] Error 2
