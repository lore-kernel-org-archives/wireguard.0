Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 12b31359
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 20:58:31 +0000 (UTC)
Date: Wed, 29 Jun 2016 15:59:39 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160629205939.GA19300@wolff.to>
References: <20160629202228.GA1993@wolff.to>
 <CAHmME9rSj3+4YB_x0HY26TvATSwL6+gNkjoH+SJCA6q3K-H63g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
In-Reply-To: <CAHmME9rSj3+4YB_x0HY26TvATSwL6+gNkjoH+SJCA6q3K-H63g@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] wg doesn't build on 4.7 kernels
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jun 29, 2016 at 22:48:26 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Fixed here:
>https://git.zx2c4.com/WireGuard/commit/?id=530ee2b2906af4d635d4d5bbabda5250b4a2b33e

That fixed the reported problem, but another 4.7 change is causing problems.
See: https://www.spinics.net/lists/kernel/msg2233003.html

These are the errors:
/home/bruno/WireGuard/src/crypto/chacha20poly1305.c: In function ‘chacha20poly1305_init’:
/home/bruno/WireGuard/src/crypto/chacha20poly1305.c:40:30: error: ‘cpu_has_xmm2’ undeclared (first use in this function)
  chacha20poly1305_use_sse2 = cpu_has_xmm2;
                              ^~~~~~~~~~~~
/home/bruno/WireGuard/src/crypto/chacha20poly1305.c:40:30: note: each undeclared identifier is reported only once for each function it appears in
/home/bruno/WireGuard/src/crypto/chacha20poly1305.c:42:30: error: ‘cpu_has_avx’ undeclared (first use in this function)
  chacha20poly1305_use_avx2 = cpu_has_avx && cpu_has_avx2 &&
                              ^~~~~~~~~~~
/home/bruno/WireGuard/src/crypto/chacha20poly1305.c:42:45: error: ‘cpu_has_avx2’ undeclared (first use in this function)
  chacha20poly1305_use_avx2 = cpu_has_avx && cpu_has_avx2 &&
                                             ^~~~~~~~~~~~
scripts/Makefile.build:289: recipe for target '/home/bruno/WireGuard/src/crypto/chacha20poly1305.o' failed
make[2]: *** [/home/bruno/WireGuard/src/crypto/chacha20poly1305.o] Error 1
Makefile:1461: recipe for target '_module_/home/bruno/WireGuard/src' failed
make[1]: *** [_module_/home/bruno/WireGuard/src] Error 2
make[1]: Leaving directory '/usr/src/kernels/4.7.0-0.rc5.git1.2.fc25.x86_64'
Makefile:34: recipe for target 'module' failed
make: *** [module] Error 2
