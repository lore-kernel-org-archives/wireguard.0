Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6249768c
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 17:56:18 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb3c2c83
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 17:56:18 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Text-based IPC for Userspace Implementations
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <CAHmME9o-PM0ma0E5tF868fBCmOfoSdJ8BYA+_Enbbq89t900+w@mail.gmail.com>
Date: Wed, 17 May 2017 20:07:41 +0200
In-Reply-To: <CAHmME9o-PM0ma0E5tF868fBCmOfoSdJ8BYA+_Enbbq89t900+w@mail.gmail.com>
 (Jason A. Donenfeld's message of "Wed, 17 May 2017 16:00:17 +0200")
Message-ID: <87wp9fuzki.fsf@alrua-karlstad>
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

> Hello list,
>
> Re:JSON --
>
> JSON is difficult to parse and requires large libraries, especially
> for something like JSON-RPC. I'd rather not have these dependencies or
> complications.
>
> On the contrary, a simple key=value newline scheme can be parsed
> trivially by anyone in a safe way, and allows for very quick in basic
> implementations in nearly all environments, even bash. Even given a
> JSON library, a stream of key=value is considerably easier and more
> flexible in the parsing stage.

My point was not so much "just use JSON". My point was "you are
disguising something that requires stateful parsing as a simple
key/value scheme, which is bound to lead to bugs eventually". I.e. if
someone were to write a parser that would (e.g.) just grep for a public
key, they'd end up with ambiguous results at best.

-Toke
