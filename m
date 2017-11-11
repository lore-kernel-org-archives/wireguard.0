Return-Path: tomli@tomli.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 385f2064
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 08:05:46 +0000 (UTC)
Received: from tomli.me (tomli.me [153.92.126.73])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0812662
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 08:05:45 +0000 (UTC)
Received: from tomli.me (localhost [127.0.0.1])
 by tomli.me (OpenSMTPD) with ESMTP id 1cb45a21
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 08:09:27 +0000 (UTC)
Date: Sat, 11 Nov 2017 16:09:20 +0800
From: Tom Li <tomli@tomli.me>
To: wireguard@lists.zx2c4.com
Subject: imer_setup() is not compatible with PaX's RAP
Message-ID: <20171111080920.GA5705@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

After upgraded to 0.0.20171101, I found my 4.9 PaX/grsecurity kernel
will panic soon if wireguard has been started, because of a RAP function
point type violation.

PAX: RAP hash violation for function pointer: peer_remove_all+0x450/0x930 [wireguard]
PAX: overwritten function pointer detected: 0000 [#1] PREEMPT SMP
RIP: 0010:[<ffffffff8115f670>]  [<ffffffff8115f670>] call_timer_fn+0x210/0x230

Basically it says call_timer_fn() was going to call a function pointer led to peer_remove_all(),
but the type of the function pointer doesn't match the function.

A quick look to the kernel source code showed it was a side-effect of Kees Cook's
new timer API in commit 686fef928bba6be13cabe639f154af7d72b63120 [1], which introduced
new timer_setup() function.

static inline void timer_setup(struct timer_list *timer,
                               void (*callback)(struct timer_list *),
                               unsigned int flags)

WireGuard has switched to this new API to setup timers since
7be989478f2fa659b0b6b55dbd72f222b932a5ee [2], and provided a macro to be compatible
with older kernels.

#define timer_setup(a, b, c) setup_timer(a, ((void (*)(unsigned long))b), ((unsigned long)a))

But it has an unfortunately consequence. a function type must match function pointer type used
in the indirect call, although conversion in-between is allowed, but it has to be matched
when the pointer is called, otherwise it's an undefined behavior.

Normally, it works on most compilers, but it triggers PaX's RAP as a breach of Control-Flow
Integrity. I don't think there were any RAP violations in the previous version, and as user
it would be the best to get it fixed in a way that doesn't involve incompatible function pointer
types to comfort RAP, but I don't know if WireGuard is still going to support 4.9 PaX kernel...

P.S: Now the kernel is doing essentially the same thing, but Cook said after the conversion is
finished, pointer cast will be removed. But on existing kernels it'll always be an issue...

Anyway, It's hard to say who break who... Probably it's going to work for me if I revert
7be989478f2fa659b0b6b55dbd72f222b932a5ee on my computer as for now...

At least it has been documented in the mailing list now...

Regards,
Tom Li
