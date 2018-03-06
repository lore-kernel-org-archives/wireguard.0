Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 145ce4f5
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:59:04 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f495808c
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:59:04 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Roaming between IPv4 and IPv6?
In-Reply-To: <CAHmME9oF2TUQiO=xCeoMD2ajbG+16netREXD3YCem=j7HmwkoA@mail.gmail.com>
References: <871sgwna50.fsf@toke.dk>
 <CAHmME9oF2TUQiO=xCeoMD2ajbG+16netREXD3YCem=j7HmwkoA@mail.gmail.com>
Date: Tue, 06 Mar 2018 23:08:27 +0100
Message-ID: <87y3j4luw4.fsf@toke.dk>
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

> Hey Toke,
>
> For incoming packets, this would be strange behavior, since it's
> listening on v4 and v6.

Yeah, I think the incoming side is fine (it works over both v4 and v6 as
long as I have connectivity on the other end).

> For outgoing packets, if wireguard thinks it should be sending to a v6
> address, then that's what it will do.

Right, so it's not just me, this doesn't actually work currently. Cool ;)

> One way to fix this would be to re-resolve DNS from userspace, which
> is a bit ugly. Another way would be to simply store the last v4
> address, and fall back to that if it can't establish a route for the
> v6 address. And yet another way -- if simplicity is desired -- would
> be to do nothing (the status quo), and not build legacy semantics into
> something new. Any opinions on this?

While I can appreciate the simplicity of doing nothing, I think seamless
roaming even across v4/v6 is a pretty killer feature to have. It turns
wireguard into a "universal connectivity" tool that you can just enable
and forget about, without having to worry about calls dropping when
roaming, etc.

I think the idea of configuring both v4 and v6 on startup and caching
them is a reasonable idea. Maybe even configure all available addresses
when doing the initial DNS lookup? Or is that awkward to do?

-Toke
