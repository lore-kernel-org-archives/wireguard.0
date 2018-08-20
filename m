Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 689ba219
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Aug 2018 04:31:07 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 43ea416f
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Aug 2018 04:31:07 +0000 (UTC)
Date: Sun, 19 Aug 2018 23:40:22 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Wireguard not building on pre-rc1 4.19 kernels (Fedora)
Message-ID: <20180820044022.GA11783@wolff.to>
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

[bruno@cerberus src]$ make KERNELDIR=/lib/modules/4.19.0-0.rc0.git6.1.fc30.x86_64/build clean all
  CLEAN   /home/bruno/WireGuard/src/.tmp_versions
  CLEAN   /home/bruno/WireGuard/src/tools/{wg,*.o,*.d}
  CC [M]  /home/bruno/WireGuard/src/main.o
In file included from <command-line>:
/home/bruno/WireGuard/src/compat/compat.h:684:20: error: static declaration of ‘rng_is_initialized’ follows non-static declaration
 static inline bool rng_is_initialized(void)
                    ^~~~~~~~~~~~~~~~~~
In file included from ./include/linux/net.h:22,
                 from ./include/linux/skbuff.h:29,
                 from ./include/linux/ip.h:20,
                 from /home/bruno/WireGuard/src/compat/compat.h:640,
                 from <command-line>:
./include/linux/random.h:39:13: note: previous declaration of ‘rng_is_initialized’ was here
 extern bool rng_is_initialized(void);
             ^~~~~~~~~~~~~~~~~~
make[2]: *** [scripts/Makefile.build:311: /home/bruno/WireGuard/src/main.o] Error 1
make[1]: *** [Makefile:1514: _module_/home/bruno/WireGuard/src] Error 2
make: *** [Makefile:36: module] Error 2
[bruno@cerberus src]$ 
