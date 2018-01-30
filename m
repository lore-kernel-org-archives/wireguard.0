Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 294c87dd
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jan 2018 15:38:14 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id bb55d84f
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jan 2018 15:38:14 +0000 (UTC)
Date: Tue, 30 Jan 2018 09:38:59 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: gcc 8 warning
Message-ID: <20180130153859.GA31852@wolff.to>
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

While there were a few other warnings about sibling call from callable 
instruction with modified stack frame, the following looked more significant if 
it isn't a gcc bug.
  CC [M]  /home/bruno/WireGuard/src/crypto/chacha20poly1305.o
In file included from ./include/linux/bitmap.h:9,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/x86/include/asm/cpumask.h:5,
                 from ./arch/x86/include/asm/msr.h:11,
                 from ./arch/x86/include/asm/processor.h:21,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:38,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:81,
                 from ./include/linux/spinlock.h:51,
                 from ./include/linux/seqlock.h:36,
                 from ./include/linux/time.h:6,
                 from ./include/linux/skbuff.h:19,
                 from ./include/linux/ip.h:20,
                 from /home/bruno/WireGuard/src/compat/compat.h:583,
                 from <command-line>:
In function ‘memcpy’,
    inlined from ‘poly1305_update’ at /home/bruno/WireGuard/src/crypto/chacha20poly1305.c:549:4,
    inlined from ‘chacha20poly1305_encrypt_sg’ at /home/bruno/WireGuard/src/crypto/chacha20poly1305.c:673:4:
./include/linux/string.h:344:9: warning: ‘__builtin_memcpy’ forming offset [233, 272] is out of the bounds [0, 232] of object ‘poly1305_state’ with type ‘struct poly1305_ctx’ [-Warray-bounds]
  return __builtin_memcpy(p, q, size);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/bruno/WireGuard/src/crypto/chacha20poly1305.c: In function ‘chacha20poly1305_encrypt_sg’:
/home/bruno/WireGuard/src/crypto/chacha20poly1305.c:652:22: note: ‘poly1305_state’ declared here
  struct poly1305_ctx poly1305_state;
                      ^~~~~~~~~~~~~~
In file included from ./include/linux/bitmap.h:9,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/x86/include/asm/cpumask.h:5,
                 from ./arch/x86/include/asm/msr.h:11,
                 from ./arch/x86/include/asm/processor.h:21,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:38,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:81,
                 from ./include/linux/spinlock.h:51,
                 from ./include/linux/seqlock.h:36,
                 from ./include/linux/time.h:6,
                 from ./include/linux/skbuff.h:19,
                 from ./include/linux/ip.h:20,
                 from /home/bruno/WireGuard/src/compat/compat.h:583,
                 from <command-line>:
In function ‘memcpy’,
    inlined from ‘poly1305_update’ at /home/bruno/WireGuard/src/crypto/chacha20poly1305.c:549:4,
    inlined from ‘chacha20poly1305_decrypt_sg’ at /home/bruno/WireGuard/src/crypto/chacha20poly1305.c:789:4:
./include/linux/string.h:344:9: warning: ‘__builtin_memcpy’ forming offset [233, 272] is out of the bounds [0, 232] of object ‘poly1305_state’ with type ‘struct poly1305_ctx’ [-Warray-bounds]
  return __builtin_memcpy(p, q, size);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/bruno/WireGuard/src/crypto/chacha20poly1305.c: In function ‘chacha20poly1305_decrypt_sg’:
/home/bruno/WireGuard/src/crypto/chacha20poly1305.c:764:22: note: ‘poly1305_state’ declared here
  struct poly1305_ctx poly1305_state;
                      ^~~~~~~~~~~~~~
