Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a3dc1a2
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 19:30:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a437d622
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 19:30:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b63c9f9
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 19:30:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d6923695
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 19:30:58 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id l138so1959663oib.7
 for <wireguard@lists.zx2c4.com>; Mon, 13 Nov 2017 11:34:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5A08F7ED.19177.35F8664A@pageexec.freemail.hu>
References: <20171111080920.GA5705@localhost.localdomain>
 <CAHmME9qYobSS1aaj4ahqprmf_CFX49puiSVSg-WGdT9vzNZ-Ww@mail.gmail.com>
 <5A08F7ED.19177.35F8664A@pageexec.freemail.hu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Nov 2017 20:34:58 +0100
Message-ID: <CAHmME9pDi9Djov75zjuc++jzZ+ksYPMwGs=tUMJU=C2Vk1od7Q@mail.gmail.com>
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

Hey Pipacs,

On Mon, Nov 13, 2017 at 2:39 AM, PaX Team <pageexec@freemail.hu> wrote:
> at fptr dereference time RAP will still see the type hash mismatch.
> another approach could be to depend on TIMER_DATA_TYPE instead and use
> it in your callback prototypes. as a sidenote, if you want to depend
> on plugin related features, it's better to depend on RAP_PLUGIN

I've fixed this all up here:
https://git.zx2c4.com/WireGuard/commit/?id=e4bf02b833f99f4dcc2ab685d92517ccf8cc4766

I think it _should_ work now. Thanks for the suggestions. I just
monkey patched the signatures of each of those functions. Ugly, but it
works.

>
> speaking of PaX support, you recently added some __ro_after_init wrapper
> to wireguard which breaks under KERNEXEC when it's used on ops structs
> (my __read_only has different semantics) so i have to revert it here but
> it'd be nicer if you didn't define it when KERNEXEC is active.

I've attempted to fix this in the same commit. Does that look like it will work?

By the way, if you ever find yourself having to revert things to run
WireGuard, don't hesitate to send a patch or just poke me, and I'll
fix things. I'd definitely like to support PaX for as long as I can
manage to do so.

Jason
