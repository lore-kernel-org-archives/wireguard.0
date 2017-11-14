Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46aa673b
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 09:25:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7687790
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 09:25:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82f5a7bf
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 09:25:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f8765dd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 09:25:10 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id r128so13224527oig.9
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 01:29:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5A0A3587.25804.3AD10FF8@pageexec.freemail.hu>
References: <20171111080920.GA5705@localhost.localdomain>
 <5A08F7ED.19177.35F8664A@pageexec.freemail.hu>
 <CAHmME9pDi9Djov75zjuc++jzZ+ksYPMwGs=tUMJU=C2Vk1od7Q@mail.gmail.com>
 <5A0A3587.25804.3AD10FF8@pageexec.freemail.hu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 14 Nov 2017 10:29:14 +0100
Message-ID: <CAHmME9prMg_RuEUaO1XNy4Aj6MH3Cu=16kp=F_B-kKbSwO+qdQ@mail.gmail.com>
Subject: Re: imer_setup() is not compatible with PaX's RAP
To: pageexec@freemail.hu
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

On Tue, Nov 14, 2017 at 1:15 AM, PaX Team <pageexec@freemail.hu> wrote:
> oh boy, can't disagree with ugly ;)

The goal is the highest possible density of filth.

>
> --- WireGuard-0.0.20171111.orig/src/compat/compat.h       2017-11-11 04:35:06.000000000 +0100
> +++ WireGuard-0.0.20171111/src/compat/compat.h    2017-11-13 23:21:17.967716768 +0100

I fixed things up here:
https://git.zx2c4.com/WireGuard/commit/?id=df318d1f0526663a2d92439376379e32ebcfef1a

> the KERNEXEC block isn't needed as it was removing KERNEXEC's own define

Wait, but earlier you wrote:

> speaking of PaX support, you recently added some __ro_after_init wrapper
> to wireguard which breaks under KERNEXEC when it's used on ops structs
> (my __read_only has different semantics) so i have to revert it here but
> it'd be nicer if you didn't define it when KERNEXEC is active.

So what exactly should I be fixing? I think in that last patch I
forgot to redefine it to be empty. Would this do what you have in
mind:

#ifdef CONFIG_PAX_KERNEXEC
#include <linux/cache.h>
#undef __ro_after_init
#define __ro_after_init
#endif

Or is there something else?

Jason
