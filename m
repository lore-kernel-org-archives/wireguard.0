Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d09d92f
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 20:41:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 561bf477
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 20:41:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a81945d
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 21:00:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 19300b8f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 21:00:40 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id c74so13946074iod.4
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2017 14:03:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABQfmN0ULhDZ5vgrdgiQMy83Lt0Lze4bB3e08araPFtreW=oOQ@mail.gmail.com>
References: <CADqnr01+qq8K+083_LRJeq424BHB_F+R-nxoGdrWAPCuS1r=gA@mail.gmail.com>
 <CAHmME9pMAMC4DY6PXTB_y64O6O2O6JVQY8ks=c=co+gDFYMHqA@mail.gmail.com>
 <CADqnr00euKzi7R44JSTktKCbooodU5Y1sko6wP9b8bpf4SLFbg@mail.gmail.com>
 <CAHmME9q8hNh8tfqruwyYfb0G0qZgdHN53p2NVzpG8QZcx++z8Q@mail.gmail.com>
 <CABQfmN1fviFhgp1bw82_A9RnZrokch+PmwLZCUMZm=F_doxc5g@mail.gmail.com>
 <CABQfmN3EFBL-w3KwLJQMa3HB7_FTrFEFXyQyeJqDtM4yg4DW4Q@mail.gmail.com>
 <CAHmME9qNUzNqPQK-csdRou3Ndy5rqsugdMQ132_uADNOhmMeuw@mail.gmail.com>
 <CABQfmN3uYPrhMzUOvQ9cphXVN3WwNE8YAXdyrTa_cYtfr=9BLA@mail.gmail.com>
 <CABQfmN0ULhDZ5vgrdgiQMy83Lt0Lze4bB3e08araPFtreW=oOQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Aug 2017 23:03:43 +0200
Message-ID: <CAHmME9pySYzi06OU0QhG_XdmKMJMKg=UBhYcZ_rR-YEmrbETLw@mail.gmail.com>
Subject: Re: FR: interface ListenAddress (Aka:Multihomed server issue)
To: Jan De Landtsheer <jan.delandtsheer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jan De Landtsheer <jan@delandtsheer.eu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Aug 10, 2017 at 11:00 PM, Jan De Landtsheer
<jan.delandtsheer@gmail.com> wrote:
> seeing the latest & greatest, this patch will not apply cleanly, so I don't
> know ... is this train of thought going to be kept for later releases ?

If anything changes, it would be for whatever snapshot I publish after
vacation. But I'd like some feedback on whether or not it works first.

zx2c4@thinkpad ~ $ git clone https://git.zx2c4.com/WireGuard
Cloning into 'WireGuard'...
remote: Counting objects: 3995, done.
remote: Compressing objects: 100% (1623/1623), done.
remote: Total 3995 (delta 2913), reused 3212 (delta 2301)
Receiving objects: 100% (3995/3995), 778.37 KiB | 1.76 MiB/s, done.
Resolving deltas: 100% (2913/2913), done.
zx2c4@thinkpad ~ $ cd WireGuard/
zx2c4@thinkpad ~/WireGuard $ curl http://ix.io/z3d | patch -p1
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   807  100   807    0     0    919      0 --:--:-- --:--:-- --:--:--  1310
patching file src/socket.c
zx2c4@thinkpad ~/WireGuard $ cd src
zx2c4@thinkpad ~/WireGuard/src $ make -j9
make -C tools
make[1]: Entering directory '/home/zx2c4/WireGuard/src/tools'
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o wg.o wg.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o config.o config.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o show.o show.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o terminal.o terminal.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o ipc.o ipc.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o encoding.o encoding.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o curve25519.o curve25519.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o setconf.o setconf.c
make -C /lib/modules/4.12.5-gentoo/build M=/home/zx2c4/WireGuard/src modules
make[1]: Entering directory '/usr/src/linux-4.12.5-gentoo'
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o genkey.o genkey.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o showconf.o showconf.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o pubkey.o pubkey.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o set.o set.c
cc   wg.o config.o show.o terminal.o ipc.o encoding.o curve25519.o
setconf.o genkey.o showconf.o pubkey.o set.o  -lmnl -o wg
make[1]: Leaving directory '/home/zx2c4/WireGuard/src/tools'
  CC [M]  /home/zx2c4/WireGuard/src/main.o
  CC [M]  /home/zx2c4/WireGuard/src/noise.o
  CC [M]  /home/zx2c4/WireGuard/src/device.o
  CC [M]  /home/zx2c4/WireGuard/src/peer.o
  CC [M]  /home/zx2c4/WireGuard/src/timers.o
  CC [M]  /home/zx2c4/WireGuard/src/data.o
  CC [M]  /home/zx2c4/WireGuard/src/send.o
  CC [M]  /home/zx2c4/WireGuard/src/receive.o
  CC [M]  /home/zx2c4/WireGuard/src/socket.o
  CC [M]  /home/zx2c4/WireGuard/src/config.o
  CC [M]  /home/zx2c4/WireGuard/src/hashtables.o
  CC [M]  /home/zx2c4/WireGuard/src/routingtable.o
  CC [M]  /home/zx2c4/WireGuard/src/ratelimiter.o
  CC [M]  /home/zx2c4/WireGuard/src/cookie.o
  CC [M]  /home/zx2c4/WireGuard/src/crypto/curve25519.o
  CC [M]  /home/zx2c4/WireGuard/src/crypto/chacha20poly1305.o
  CC [M]  /home/zx2c4/WireGuard/src/crypto/blake2s.o
  AS [M]  /home/zx2c4/WireGuard/src/crypto/chacha20-ssse3-x86_64.o
  AS [M]  /home/zx2c4/WireGuard/src/crypto/poly1305-sse2-x86_64.o
  AS [M]  /home/zx2c4/WireGuard/src/crypto/blake2s-avx-x86_64.o
  AS [M]  /home/zx2c4/WireGuard/src/crypto/curve25519-avx-x86_64.o
  AS [M]  /home/zx2c4/WireGuard/src/crypto/chacha20-avx2-x86_64.o
  AS [M]  /home/zx2c4/WireGuard/src/crypto/poly1305-avx2-x86_64.o
  LD [M]  /home/zx2c4/WireGuard/src/wireguard.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /home/zx2c4/WireGuard/src/wireguard.mod.o
  LD [M]  /home/zx2c4/WireGuard/src/wireguard.ko
make[1]: Leaving directory '/usr/src/linux-4.12.5-gentoo'
zx2c4@thinkpad ~/WireGuard/src $ sudo rmmod wireguard; sudo make install
