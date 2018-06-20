Return-Path: jacmet@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a81c643
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 10:20:58 +0000 (UTC)
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91393238
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 10:20:58 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id n5-v6so5812252wmc.5
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 03:25:43 -0700 (PDT)
Return-Path: <jacmet@gmail.com>
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180613` Available
References: <b9a234e9f09a7dc2@frisell.zx2c4.com>
Date: Wed, 20 Jun 2018 12:25:40 +0200
In-Reply-To: <b9a234e9f09a7dc2@frisell.zx2c4.com> (Jason A. Donenfeld's
 message of "Wed, 13 Jun 2018 16:19:08 +0200")
Message-ID: <87zhzpn49n.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

Hi,

 > Hello,
 > A new snapshot, `0.0.20180613`, has been tagged in the git repository.

 > Please note that this snapshot is, like the rest of the project at this point
 > in time, experimental, and does not consitute a real release that would be
 > considered secure and bug-free. WireGuard is generally thought to be fairly
 > stable, and most likely will not crash your computer (though it may).
 > However, as this is a pre-release snapshot, it comes with no guarantees, and
 > its security is not yet to be depended on; it is not applicable for CVEs.

 > With all that said, if you'd like to test this snapshot out, there are a
 > few relevent changes.

FYI, I see complication errors with poly1305.c when building for an ARMv5
target with 4.16.7 after moving from 0.0.20180524:

>>> wireguard 0.0.20180613 Building kernel module(s)
PATH="/home/peko/source/buildroot/output-wireguard/host/bin:/home/peko/source/buildroot/output-wireguard/host/sbin:/home/peko/bin:/home/peko/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" BR_BINARIES_DIR=/home/peko/source/buildroot/output-wireguard/images /usr/bin/make -j5 -C /home/peko/source/buildroot/output-wireguard/build/linux-4.16.7 HOSTCC="/usr/bin/gcc -O2 -I/home/peko/source/buildroot/output-wireguard/host/include -L/home/peko/source/buildroot/output-wireguard/host/lib -Wl,-rpath,/home/peko/source/buildroot/output-wireguard/host/lib" ARCH=arm INSTALL_MOD_PATH=/home/peko/source/buildroot/output-wireguard/target CROSS_COMPILE="/home/peko/source/buildroot/output-wireguard/host/bin/arm-none-linux-gnueabi-" DEPMOD=/home/peko/source/buildroot/output-wireguard/host/sbin/depmod INSTALL_MOD_STRIP=1  PWD=/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src M=/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src modules
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/main.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/noise.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/device.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/peer.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/timers.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/queueing.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/send.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/receive.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/socket.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/hashtables.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/allowedips.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/ratelimiter.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/cookie.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/netlink.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/chacha20.o
  CC [M]  /home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/poly1305.o
/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/poly1305.c: In function 'poly1305_update':
/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/poly1305.c:332:4: error: implicit declaration of function 'memcpy' [-Werror=implicit-function-declaration]
    memcpy(ctx->data + num, inp, rem);
    ^
/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/poly1305.c:332:4: warning: incompatible implicit declaration of built-in function 'memcpy' [enabled by default]
/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/poly1305.c:338:4: warning: incompatible implicit declaration of built-in function 'memcpy' [enabled by default]
    memcpy(ctx->data + num, inp, len);
    ^
/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/poly1305.c:353:3: warning: incompatible implicit declaration of built-in function 'memcpy' [enabled by default]
   memcpy(ctx->data, inp, rem);
   ^
/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/poly1305.c: In function 'poly1305_finish':
/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/poly1305.c:372:2: error: implicit declaration of function 'memzero_explicit' [-Werror=implicit-function-declaration]
  memzero_explicit(ctx, sizeof(*ctx));
  ^
cc1: some warnings being treated as errors
scripts/Makefile.build:324: recipe for target '/home/peko/source/buildroot/output-wireguard/build/wireguard-0.0.20180613/src/crypto/poly1305.o' failed


An explicit include of linux/string.h fixes it for me.

-- 
Bye, Peter Korsgaard
