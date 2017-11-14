Return-Path: pageexec@freemail.hu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31e220f4
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 00:11:11 +0000 (UTC)
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b25da32
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 00:11:11 +0000 (UTC)
From: "PaX Team" <pageexec@freemail.hu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 14 Nov 2017 01:15:03 +0100
MIME-Version: 1.0
Subject: Re: imer_setup() is not compatible with PaX's RAP
Message-ID: <5A0A3587.25804.3AD10FF8@pageexec.freemail.hu>
In-reply-to: <CAHmME9pDi9Djov75zjuc++jzZ+ksYPMwGs=tUMJU=C2Vk1od7Q@mail.gmail.com>
References: <20171111080920.GA5705@localhost.localdomain>,
 <5A08F7ED.19177.35F8664A@pageexec.freemail.hu>,
 <CAHmME9pDi9Djov75zjuc++jzZ+ksYPMwGs=tUMJU=C2Vk1od7Q@mail.gmail.com>
Content-type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: pageexec@freemail.hu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 13 Nov 2017 at 20:34, Jason A. Donenfeld wrote:

> I've fixed this all up here:
> https://git.zx2c4.com/WireGuard/commit/?id=e4bf02b833f99f4dcc2ab685d92517ccf8cc4766
> 
> I think it _should_ work now. Thanks for the suggestions. I just
> monkey patched the signatures of each of those functions. Ugly, but it
> works.

oh boy, can't disagree with ugly ;). it needed a few tweaks:

--- WireGuard-0.0.20171111.orig/src/compat/compat.h       2017-11-11 04:35:06.000000000 +0100
+++ WireGuard-0.0.20171111/src/compat/compat.h    2017-11-13 23:21:17.967716768 +0100
@@ -562,4 +562,23 @@ static inline void new_icmpv6_send(struc
 #define __read_mostly
 #endif

+#ifdef RAP_PLUGIN
+#include <linux/timer.h>
+#ifndef TIMER_DATA_TYPE
+#define TIMER_DATA_TYPE unsigned long
+#endif
+
+#define expired_retransmit_handshake(a) expired_retransmit_handshake(TIMER_DATA_TYPE timer)
+#define expired_send_keepalive(a) expired_send_keepalive(TIMER_DATA_TYPE timer)
+#define expired_new_handshake(a) expired_new_handshake(TIMER_DATA_TYPE timer)
+#define expired_zero_key_material(a) expired_zero_key_material(TIMER_DATA_TYPE timer)
+#define expired_send_persistent_keepalive(a) expired_send_persistent_keepalive(TIMER_DATA_TYPE timer)
+
+#undef timer_setup
+#define timer_setup(a, b, c) setup_timer(a, ((void (*)(TIMER_DATA_TYPE))b), ((TIMER_DATA_TYPE)a))
+
+#undef from_timer
+#define from_timer(var, callback_timer, timer_fieldname) container_of((struct timer_list *)callback_timer, typeof(*var), timer_fieldname)
+#endif
+
 #endif /* _WG_COMPAT_H */

the KERNEXEC block isn't needed as it was removing KERNEXEC's own define and
pre 4.14 kernels don't define TIMER_DATA_TYPE so it has to be defined for them.
also this whole block should probably depend on 4.15 if it ends up converting
all old prototypes and removes TIMER_DATA_TYPE itself.

> By the way, if you ever find yourself having to revert things to run
> WireGuard, don't hesitate to send a patch or just poke me, and I'll
> fix things. I'd definitely like to support PaX for as long as I can
> manage to do so.

thanks, will keep you posted if i see anything.
