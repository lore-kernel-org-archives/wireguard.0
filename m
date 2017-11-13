Return-Path: pageexec@freemail.hu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93b643ae
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 01:36:10 +0000 (UTC)
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ea7d6c4
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 01:36:10 +0000 (UTC)
From: "PaX Team" <pageexec@freemail.hu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Nov 2017 02:39:57 +0100
MIME-Version: 1.0
Subject: Re: imer_setup() is not compatible with PaX's RAP
Message-ID: <5A08F7ED.19177.35F8664A@pageexec.freemail.hu>
In-reply-to: <CAHmME9qYobSS1aaj4ahqprmf_CFX49puiSVSg-WGdT9vzNZ-Ww@mail.gmail.com>
References: <20171111080920.GA5705@localhost.localdomain>,
 <CAHmME9qYobSS1aaj4ahqprmf_CFX49puiSVSg-WGdT9vzNZ-Ww@mail.gmail.com>
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

On 12 Nov 2017 at 11:50, Jason A. Donenfeld wrote:

> Hey Pipacs,
> 
> Looks like RAP is working correctly! That's heartening. If the below
> didn't break, I suppose there'd be a problem. [See replied-to email
> below.]

indeed, this is one kind of problem that RAP's supposed to catch ;).

> A grsecurity user has complained about this not working. I assume when
> you guys move to 4.14, this will go away,

not really... while there're no in-tree users of timer_setup in 4.14
and thus in-tree timer functions can be called without triggering RAP,
your wireguard callbacks have the wrong prototype and will be caught.
you can only cheat the compiler at the assignment by that fptr cast,
at fptr dereference time RAP will still see the type hash mismatch.

> I'm wondering if you can think of any macro hackery I could surround
> in `#ifdef CONFIG_PAX_RAP` inside compat.h, and have this issue go
> away. Perhaps some kind of special rap_hash attributes? Or other
> tricks?

there's no way to satisfy RAP other than getting your types right.
the problem isn't in timer_setup per se, but at the actual indirect
calls to the timer functions and those will always trigger RAP unless
the timer functions have the correct prototype. now you could add
wrapper functions if you don't want to uglyfy the code headed upstream
but then you cannot generate them from the timer_setup macro since
that's invoked inside a function and C would at most let you declare
those wrapper functions there but not define them.

another approach could be to depend on TIMER_DATA_TYPE instead and use
it in your callback prototypes. as a sidenote, if you want to depend
on plugin related features, it's better to depend on RAP_PLUGIN and
similar (as you do with CONSTIFY_PLUGIN already) and not the actual
kernel config option since the latter can be true even if the given
compiler doesn't support plugins or the config could cover more than
the plugin and could work without it even (the STACKLEAK feature used
to be an example of that).

speaking of PaX support, you recently added some __ro_after_init wrapper
to wireguard which breaks under KERNEXEC when it's used on ops structs
(my __read_only has different semantics) so i have to revert it here but
it'd be nicer if you didn't define it when KERNEXEC is active.

cheers,
 PaX Team
