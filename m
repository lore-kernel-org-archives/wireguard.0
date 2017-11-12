Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cc5a301
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Nov 2017 02:46:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 186d7b2c
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Nov 2017 02:46:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d0ddd5f
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Nov 2017 02:46:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ab152b7b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Nov 2017 02:46:50 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id o23so314836otd.1
 for <wireguard@lists.zx2c4.com>; Sat, 11 Nov 2017 18:50:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171111080920.GA5705@localhost.localdomain>
References: <20171111080920.GA5705@localhost.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Nov 2017 11:50:36 +0900
Message-ID: <CAHmME9qYobSS1aaj4ahqprmf_CFX49puiSVSg-WGdT9vzNZ-Ww@mail.gmail.com>
Subject: Re: imer_setup() is not compatible with PaX's RAP
To: Pipacs <pageexec@gmail.com>
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

Hey Pipacs,

Looks like RAP is working correctly! That's heartening. If the below
didn't break, I suppose there'd be a problem. [See replied-to email
below.]

Upstream changed the argument of timer callbacks to `struct timer_list
*` instead of `unsigned long`. Since I'm trying to get my stuff
upstream, I generally code against the newest kernel, and then have
this disgusting file called compat.h [1] that abuses the preprocessor
to rewrite code based on which kernel I'm compiling against; I've got
it working for 3.10+.  If you woke up with good vision this morning,
I'm sorry, since your eyeballs are doubtlessly bleeding after glancing
at compat.h. In order to support old kernels, I just cast the
functions with argument `struct timer_list *` to functions with
argument `unsigned long`, and call it a day.

A grsecurity user has complained about this not working. I assume when
you guys move to 4.14, this will go away, but I also assume that the
person who emailed me below isn't actually a paying customer and
instead is using the old patches. So, I can't just say, "go to
grsecurity.net and get the latest." Yet, I'd like to continue
supporting PaX in my compat.h layer for as long as possible.

I'm wondering if you can think of any macro hackery I could surround
in `#ifdef CONFIG_PAX_RAP` inside compat.h, and have this issue go
away. Perhaps some kind of special rap_hash attributes? Or other
tricks?

Thanks,
Jason

[1] https://git.zx2c4.com/WireGuard/tree/src/compat/compat.h


On Sat, Nov 11, 2017 at 5:09 PM, Tom Li <tomli@tomli.me> wrote:
> After upgraded to 0.0.20171101, I found my 4.9 PaX/grsecurity kernel
> will panic soon if wireguard has been started, because of a RAP function
> point type violation.
>
> PAX: RAP hash violation for function pointer: peer_remove_all+0x450/0x930 [wireguard]
> PAX: overwritten function pointer detected: 0000 [#1] PREEMPT SMP
> RIP: 0010:[<ffffffff8115f670>]  [<ffffffff8115f670>] call_timer_fn+0x210/0x230
>
> Basically it says call_timer_fn() was going to call a function pointer led to peer_remove_all(),
> but the type of the function pointer doesn't match the function.
>
> A quick look to the kernel source code showed it was a side-effect of Kees Cook's
> new timer API in commit 686fef928bba6be13cabe639f154af7d72b63120 [1], which introduced
> new timer_setup() function.
>
> static inline void timer_setup(struct timer_list *timer,
>                                void (*callback)(struct timer_list *),
>                                unsigned int flags)
>
> WireGuard has switched to this new API to setup timers since
> 7be989478f2fa659b0b6b55dbd72f222b932a5ee [2], and provided a macro to be compatible
> with older kernels.
>
> #define timer_setup(a, b, c) setup_timer(a, ((void (*)(unsigned long))b), ((unsigned long)a))
>
> But it has an unfortunately consequence. a function type must match function pointer type used
> in the indirect call, although conversion in-between is allowed, but it has to be matched
> when the pointer is called, otherwise it's an undefined behavior.
>
> Normally, it works on most compilers, but it triggers PaX's RAP as a breach of Control-Flow
> Integrity. I don't think there were any RAP violations in the previous version, and as user
> it would be the best to get it fixed in a way that doesn't involve incompatible function pointer
> types to comfort RAP, but I don't know if WireGuard is still going to support 4.9 PaX kernel...
>
> P.S: Now the kernel is doing essentially the same thing, but Cook said after the conversion is
> finished, pointer cast will be removed. But on existing kernels it'll always be an issue...
>
> Anyway, It's hard to say who break who... Probably it's going to work for me if I revert
> 7be989478f2fa659b0b6b55dbd72f222b932a5ee on my computer as for now...
>
> At least it has been documented in the mailing list now...
>
> Regards,
> Tom Li
>
> [1] https://github.com/torvalds/linux/commit/686fef928bba6be13cabe639f154af7d72b63120
> [2] https://git.zx2c4.com/WireGuard/commit/?id=7be989478f2fa659b0b6b55dbd72f222b932a5ee
