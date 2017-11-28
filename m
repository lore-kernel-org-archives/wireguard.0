Return-Path: pageexec@freemail.hu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1cad0bc4
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:44:50 +0000 (UTC)
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3de209e7
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:44:49 +0000 (UTC)
From: "PaX Team" <pageexec@freemail.hu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Nov 2017 13:50:36 +0100
MIME-Version: 1.0
Subject: Re: imer_setup() is not compatible with PaX's RAP
Message-ID: <5A1D5B9C.27534.47CC58C6@pageexec.freemail.hu>
In-reply-to: <CAHmME9oxY3JRX4W3Xsx-RTc-9NKEdoC_14nPz+7R2_X5b5sfJw@mail.gmail.com>
References: <20171111080920.GA5705@localhost.localdomain>,
 <5A1D5741.21951.47BB55BB@pageexec.freemail.hu>,
 <CAHmME9oxY3JRX4W3Xsx-RTc-9NKEdoC_14nPz+7R2_X5b5sfJw@mail.gmail.com>
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

On 28 Nov 2017 at 13:36, Jason A. Donenfeld wrote:

> On Tue, Nov 28, 2017 at 1:32 PM, PaX Team <pageexec@freemail.hu> wrote:
> > targets of indirect calls must be marked by the RAP hash which the plugin
> > will do for code it sees but for asm you'll have to do it yourself, look at
> > the use of RAP_ENTRY to see how that works.
> 
> Oh, terrific. So I can just do something horrible like:
> 
> #ifdef RAP_PLUGIN
> #undef ENTRY
> #define ENTRY RAP_ENTRY
> #endif

well, that would work but if not all asm entry points are meant to be called
indirectly then you're unnecessarily increasing the attack surface ;). better
would be something like:

1. use ENTRY/RAP_ENTRY in your asm as necessary. you can call it something
   more generic like CFI_ENTRY if you want to cover other CFI systems in the
   future, e.g., intel's CET will need its own entry point marker insn.

2. have this in your headers:

#ifdef RAP_PLUGIN
#define CFI_ENTRY RAP_ENTRY
#elif defined(...)
...
#else
#define CFI_ENTRY ENTRY
#endif
