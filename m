Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d88c6549
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:40:06 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 4c98346f
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:40:05 +0000 (UTC)
Date: Wed, 17 May 2017 09:47:09 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Wireguard is not building on Fedora with 4.12 rc1 kernels
Message-ID: <20170517144709.GA28773@wolff.to>
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

It looks like the test for memneq is broken and both the kernel and compat 
versions get used at the same time.

[bruno@cerberus src]$ make
make -C /lib/modules/4.12.0-0.rc1.git0.1.fc27.x86_64/build M=/home/bruno/WireGuard/src modules
make[1]: Entering directory '/usr/src/kernels/4.12.0-0.rc1.git0.1.fc27.x86_64'
  CC [M]  /home/bruno/WireGuard/src/main.o
  CC [M]  /home/bruno/WireGuard/src/noise.o
In file included from /home/bruno/WireGuard/src/noise.c:15:0:
./include/crypto/algapi.h:389:19: error: redefinition of ‘crypto_memneq’
 static inline int crypto_memneq(const void *a, const void *b, size_t size)
                   ^~~~~~~~~~~~~
In file included from <command-line>:0:0:
/home/bruno/WireGuard/src/compat/memneq/include.h:2:19: note: previous definition of ‘crypto_memneq’ was here
 static inline int crypto_memneq(const void *a, const void *b, size_t size)
                   ^~~~~~~~~~~~~
make[2]: *** [scripts/Makefile.build:303: /home/bruno/WireGuard/src/noise.o] Error 1
make[1]: *** [Makefile:1516: _module_/home/bruno/WireGuard/src] Error 2
make[1]: Leaving directory '/usr/src/kernels/4.12.0-0.rc1.git0.1.fc27.x86_64'
make: *** [Makefile:28: module] Error 2
