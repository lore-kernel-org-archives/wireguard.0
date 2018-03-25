Return-Path: samuel.c.p.neves@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ad3f304
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 21:06:50 +0000 (UTC)
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c73ac246
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 21:06:50 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t7so11922783wmh.5
 for <wireguard@lists.zx2c4.com>; Sun, 25 Mar 2018 14:18:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHsAZcANfzjCysbSvgXDKidwcW_my2k+f9TsDqBTwPWv2dhSZA@mail.gmail.com>
References: <CAHsAZcANfzjCysbSvgXDKidwcW_my2k+f9TsDqBTwPWv2dhSZA@mail.gmail.com>
From: Samuel Neves <samuel.c.p.neves@gmail.com>
Date: Sun, 25 Mar 2018 22:17:57 +0100
Message-ID: <CAEX_ruGMSpijmXjPyt9F+FcDE6E752o2OcA1UcZ3Um2QaibyWg@mail.gmail.com>
Subject: Re: CentOS 7 build warning, chacha20_avx512vl
To: Vbook A1 <vbooka1maillist@gmail.com>
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

I don't think this is a problem.

This seems to be related to the toolchain not knowing about AVX-512
instructions yet, and therefore mistaking some instruction bytes for
other instructions (i.e., the byte sequence 7d 28 at 0x263f looks like
a jump to offset 0x2669, but it's part of an AVX-512 instruction
`vmovdqa32 ymm16,ymm0`).

Since Linux only added AVX-512 support in version 3.15, this wouldn't
make any difference anyway, as CentOS is stuck on 3.10.

Best,
Samuel Neves


On Sun, Mar 25, 2018 at 7:50 PM, Vbook A1 <vbooka1maillist@gmail.com> wrote:
> Hello,
>
> this is the build log of the latest "stable" WireGuard on the latest CentOS 7:
>
>> -bash-4.2# make
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/main.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/noise.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/device.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/peer.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/timers.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/queueing.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/send.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/receive.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/socket.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/hashtables.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/allowedips.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/ratelimiter.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/cookie.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/netlink.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/crypto/curve25519.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/crypto/chacha20poly1305.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/crypto/blake2s.o
>>  AS [M]  /dev/shm/WireGuard-0.0.20180304/src/crypto/chacha20-x86_64.o
>> /dev/shm/WireGuard-0.0.20180304/src/crypto/chacha20-x86_64.o: warning: objtool: chacha20_avx512vl()+0x3f: can't find jump dest instruction at .text+0x2669
>>  AS [M]  /dev/shm/WireGuard-0.0.20180304/src/crypto/poly1305-x86_64.o
>>  AS [M]  /dev/shm/WireGuard-0.0.20180304/src/crypto/blake2s-x86_64.o
>>  AS [M]  /dev/shm/WireGuard-0.0.20180304/src/crypto/curve25519-x86_64.o
>>  CC [M]  /dev/shm/WireGuard-0.0.20180304/src/compat/siphash/siphash.o
>>  LD [M]  /dev/shm/WireGuard-0.0.20180304/src/wireguard.o
>>  Building modules, stage 2.
>>  MODPOST 1 modules
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/wireguard.mod.o
>>  LD [M]  /dev/shm/WireGuard-0.0.20180304/src/wireguard.ko
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/wg.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/config.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/show.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/terminal.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/ipc.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/mnlg.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/encoding.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/curve25519.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/setconf.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/genkey.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/showconf.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/pubkey.o
>>  CC      /dev/shm/WireGuard-0.0.20180304/src/tools/set.o
>>  LD      /dev/shm/WireGuard-0.0.20180304/src/tools/wg
>
>
> git "unstable" version gives the same warning:
>
>>   AS [M]  /dev/shm/WireGuard/src/crypto/chacha20-x86_64.o
>> /dev/shm/WireGuard/src/crypto/chacha20-x86_64.o: warning: objtool: chacha20_avx512vl()+0x3f: can't find jump dest instruction at .text+0x2669
>
>
> However Wireguard [seemingly] works well despite this warning, tested
> with three CentOS 7 servers. Is it OK?
>
>
> System info:
> CentOS 7.4.1708 64bit
> Kernel 3.10.0-693.21.1.el7.x86_64
> gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-16)
> Make 3.82
> elfutils 0.168-8.el7
> libmnl 1.0.3-7.el7
>
>
> BTW many thanks for such a great software, I fell in love with
> Wireguard for its simplicity after working for several years with
> OpenVPN.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
