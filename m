Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92fd4249
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:42:29 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 688f00af
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:42:29 +0000 (UTC)
Date: Sun, 9 Jul 2017 21:56:14 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Looks like 4.13 introduces a new incompatibility
Message-ID: <20170710025614.GA17552@wolff.to>
References: <20170710014834.GA14901@wolff.to>
 <CAHmME9qHmJCHT8_ZM1CYDbPx62T-Zuf3BfdL_ZpfB6drOsnwFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
In-Reply-To: <CAHmME9qHmJCHT8_ZM1CYDbPx62T-Zuf3BfdL_ZpfB6drOsnwFw@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jul 10, 2017 at 04:01:04 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Hey Bruno,
>
>Thanks for the heads up. Does this fix it?
>
>https://git.zx2c4.com/WireGuard/commit/?id=dd007ad550b3def8a858e57aa718af9b00047a28

It looks like it fixed the problem. (At least device.o gets built.) But it 
seems there is another problem.

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
  CC [M]  /home/bruno/WireGuard/src/peer.o
  CC [M]  /home/bruno/WireGuard/src/timers.o
  CC [M]  /home/bruno/WireGuard/src/data.o
  CC [M]  /home/bruno/WireGuard/src/send.o
  CC [M]  /home/bruno/WireGuard/src/receive.o
  CC [M]  /home/bruno/WireGuard/src/socket.o
  CC [M]  /home/bruno/WireGuard/src/config.o
  CC [M]  /home/bruno/WireGuard/src/hashtables.o
  CC [M]  /home/bruno/WireGuard/src/routingtable.o
  CC [M]  /home/bruno/WireGuard/src/ratelimiter.o
  CC [M]  /home/bruno/WireGuard/src/cookie.o
/home/bruno/WireGuard/src/cookie.c: In function ‘cookie_message_create’:
/home/bruno/WireGuard/src/cookie.c:156:2: error: implicit declaration of function ‘get_random_bytes_wait’; did you mean ‘get_random_bytes_arch’? [-Werror=implicit-function-declaration]
  get_random_bytes_wait(dst->nonce, COOKIE_NONCE_LEN);
  ^~~~~~~~~~~~~~~~~~~~~
  get_random_bytes_arch
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:303: /home/bruno/WireGuard/src/cookie.o] Error 1
make[1]: *** [Makefile:1512: _module_/home/bruno/WireGuard/src] Error 2
make[1]: Leaving directory '/usr/src/kernels/4.13.0-0.rc0.git3.1.fc27.i686+PAE'
make: *** [Makefile:28: module] Error 2
