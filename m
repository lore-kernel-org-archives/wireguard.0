Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c5df1c8
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:45:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79332b22
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:45:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9687244b
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:59:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5c821a3a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:59:13 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id c11so119590748wrc.3
 for <wireguard@lists.zx2c4.com>; Sun, 09 Jul 2017 20:03:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170710025614.GA17552@wolff.to>
References: <20170710014834.GA14901@wolff.to>
 <CAHmME9qHmJCHT8_ZM1CYDbPx62T-Zuf3BfdL_ZpfB6drOsnwFw@mail.gmail.com>
 <20170710025614.GA17552@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Jul 2017 05:03:42 +0200
Message-ID: <CAHmME9pbky9H=+QkXA2VMeZ3OQonxxZ_H2-Jiz8Gy6FeYuR+7g@mail.gmail.com>
Subject: Re: Looks like 4.13 introduces a new incompatibility
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jul 10, 2017 at 4:56 AM, Bruno Wolff III <bruno@wolff.to> wrote:
> On Mon, Jul 10, 2017 at 04:01:04 +0200,
>  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>>
>> Hey Bruno,
>>
>> Thanks for the heads up. Does this fix it?
>>
>>
>> https://git.zx2c4.com/WireGuard/commit/?id=3Ddd007ad550b3def8a858e57aa71=
8af9b00047a28
>
>
> It looks like it fixed the problem. (At least device.o gets built.) But i=
t
> seems there is another problem.
>
> [bruno@wolff src]$ make clean all
> make -C /lib/modules/4.13.0-0.rc0.git3.1.fc27.i686+PAE/build
> M=3D/home/bruno/WireGuard/src clean
> make[1]: Entering directory
> '/usr/src/kernels/4.13.0-0.rc0.git3.1.fc27.i686+PAE'
>  CLEAN   /home/bruno/WireGuard/src/.tmp_versions
> make[1]: Leaving directory
> '/usr/src/kernels/4.13.0-0.rc0.git3.1.fc27.i686+PAE'
> make -C tools clean
> make[1]: Entering directory '/home/bruno/WireGuard/src/tools'
> rm -f wg *.o *.d
> make[1]: Leaving directory '/home/bruno/WireGuard/src/tools'
> make -C /lib/modules/4.13.0-0.rc0.git3.1.fc27.i686+PAE/build
> M=3D/home/bruno/WireGuard/src modules
> make[1]: Entering directory
> '/usr/src/kernels/4.13.0-0.rc0.git3.1.fc27.i686+PAE'
>  CC [M]  /home/bruno/WireGuard/src/main.o
>  CC [M]  /home/bruno/WireGuard/src/noise.o
>  CC [M]  /home/bruno/WireGuard/src/device.o
>  CC [M]  /home/bruno/WireGuard/src/peer.o
>  CC [M]  /home/bruno/WireGuard/src/timers.o
>  CC [M]  /home/bruno/WireGuard/src/data.o
>  CC [M]  /home/bruno/WireGuard/src/send.o
>  CC [M]  /home/bruno/WireGuard/src/receive.o
>  CC [M]  /home/bruno/WireGuard/src/socket.o
>  CC [M]  /home/bruno/WireGuard/src/config.o
>  CC [M]  /home/bruno/WireGuard/src/hashtables.o
>  CC [M]  /home/bruno/WireGuard/src/routingtable.o
>  CC [M]  /home/bruno/WireGuard/src/ratelimiter.o
>  CC [M]  /home/bruno/WireGuard/src/cookie.o
> /home/bruno/WireGuard/src/cookie.c: In function =E2=80=98cookie_message_c=
reate=E2=80=99:
> /home/bruno/WireGuard/src/cookie.c:156:2: error: implicit declaration of
> function =E2=80=98get_random_bytes_wait=E2=80=99; did you mean =E2=80=98g=
et_random_bytes_arch=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>  get_random_bytes_wait(dst->nonce, COOKIE_NONCE_LEN);
>  ^~~~~~~~~~~~~~~~~~~~~
>  get_random_bytes_arch
> cc1: some warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:303:
> /home/bruno/WireGuard/src/cookie.o] Error 1

I need to annoy Ted Tso about this. It'll get merged for rc1 or rc2.

Jason
