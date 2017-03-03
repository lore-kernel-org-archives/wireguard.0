Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80fac22c
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 03:22:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6d586b9
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 03:22:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1210dac9
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 03:22:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7dfc54f6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 03:22:17 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id i1so66060211ota.3
 for <wireguard@lists.zx2c4.com>; Thu, 02 Mar 2017 19:24:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <02a8fddb-7246-984c-c51c-cd8fe3925694@it-offshore.co.uk>
References: <6b590394-3134-b725-a063-0993b32a51c4@it-offshore.co.uk>
 <CAHmME9ow_=3muSufX_--6JRG0Fz9qfyEPKi_=rc3tJUGr_CaAQ@mail.gmail.com>
 <02a8fddb-7246-984c-c51c-cd8fe3925694@it-offshore.co.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 2 Mar 2017 19:24:16 -0800
Message-ID: <CAHmME9pSB59MBqxRa0Hm-EwrnARAvT42wHsYjdZO=7MFrhjb+A@mail.gmail.com>
Subject: Re: Wireguard added to Alpine Linux
To: IT Developer <developer@it-offshore.co.uk>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Stuart,

On Thu, Mar 2, 2017 at 1:49 PM, Stuart Cardall
<developer@it-offshore.co.uk> wrote:
> Wireguard can be added to Alpine with:
>
> apk add wireguard-tools

Great!

>. On the server it is probably necessary to:
>
> echo wireguard >> /etc/modules && rc-update add modules boot

This step should not be necessary. You're probably forgetting to call
`depmod -a` after installing the module. This is needed to ensure that
the right module aliases and dependency information is generated, so
that the module is _auto-loaded_ when users run `ip link add wg0 type
wireguard`.

> A wireguard user mentioned on irc earlier today that everything is working
> perfectly.

Awesome!

>
> To monitor releases @ Alpine we use https://release-monitoring.org/ - if it
> doesn't pick up the changes I'll subscribe.

Okay. Well, keep in mind that I publish release notes here and tips to
distributions about any possible build changes, so your involvement or
at least subscription here would indeed be a good thing.

>
> If there is a step I was missing to correctly run `make check` I would still
> like to run it in the future - perhaps it will pick up potential issues from
> Alpine using musl libc (not glibc).

It's certainly not any of the current `make check` or tests/ stuff
that you're currently looking at. Rather, when WireGuard is compiled
in debug mode, if you insert it, then it will go through a series of
self-tests. For more intense testing, involving the userspace
component, there's `make test-qemu`, which builds a kernel and boots
up QEMU... But I suspect this is a bit too heavy weight for a distro.
And besides, it's already being run for every commit for all
kernel.org kernels on: https://www.wireguard.io/build-status/ By the
way -- this uses musl libc, so I ensure it will always run nicely
there.

The only thing remaining in the package is to remove the incoherent
"wireguard-tests" package, which doesn't work in the way you'd hope,
and doesn't belong there.

Regards,
Jason
