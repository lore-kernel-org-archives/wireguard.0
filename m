Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81eba860
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 13:01:27 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e535a970
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 13:01:27 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Text-based IPC for Userspace Implementations
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
Date: Tue, 16 May 2017 15:12:39 +0200
In-Reply-To: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 (Jason A. Donenfeld's message of "Tue, 16 May 2017 14:36:00 +0200")
Message-ID: <87vap1gd2w.fsf@alrua-kau>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hey guys,
>
> Currently wg(8) talks to the kernel by passing structs through an
> ioctl. Due to upstream demands, this is going to be changed to
> netlink, and we'll ditch those structs. wg(8) previously tried to
> re-use those same structs for userspace implementations, passing them
> through a unix socket. Implementors did not like dealing with this.
> Since the structs are going for the kernel stuff, we might as well
> move to something better, too, for the userspace stuff. Therefore
> wg(8) now has a very simple text-based IPC format over unix sockets
> (or Windows named pipes) that can be easily implemented in nearly
> every language, even bash.
>
> I've written a small description of it here: https://www.wireguard.io/xplatform/
>
> This will be part of the next snapshot.
>
> Any questions?

I applaud the general idea of moving to a text-based interface. But why
invent Yet Another Configuration Format?

I guess you could say that key=value pairs are fairly straight forward;
but from the examples it looks like there's an implicit nested
structure? I.e. a public_key=xxx line denotes the start of a new
endpoint, and the following keys are logically part of that endpoint?
Or? If this is the case, you'll need a stateful parser to parse it,
which is not immediately obvious from the description, and is bound to
trip people up at some point...

So why not avoid any possible confusion and just emit JSON? Or another
well-established serialisation format where the nesting can be made
explicit... :)

-Toke
