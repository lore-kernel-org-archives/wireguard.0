Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f986c7f8
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:32:29 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c871fd0
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:32:29 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Another roaming problem
In-Reply-To: <CAHmME9p+hZm46v_MsGtMwKO_RRe2GUOYkSB8PR_tNa5aUhazjA@mail.gmail.com>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
 <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
 <87h8pqlbw4.fsf@toke.dk>
 <CAHmME9pgOGghWRv9bMtTvbxrQfNycK9EHEnBu=UQxOz6AQJ2qA@mail.gmail.com>
 <7088098E-63F5-4ECB-A298-24444987482E@toke.dk>
 <CAHmME9ojxMOoB5z4VJQbecTD+Y7VLK=K8=oTSDciofWLC6Q0fg@mail.gmail.com>
 <87efktzhmj.fsf@toke.dk> <87tvtpjp57.fsf@toke.dk>
 <CAHmME9p+hZm46v_MsGtMwKO_RRe2GUOYkSB8PR_tNa5aUhazjA@mail.gmail.com>
Date: Fri, 09 Mar 2018 15:42:13 +0100
Message-ID: <87lgf1jooq.fsf@toke.dk>
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

> Hi Toke,
>
> That all makes sense. I'm going out of town extremely soon, but I'll
> fix this when I've returned. I have a pretty good idea of what's
> required. If you're curious to try it yourself, just try removing
> invocations of socket_clear_peer_endpoint_src inside timers.c.

Cool! I'll be travelling for a few weeks myself, so no great rush. Not
sure I'll the time to try out any changes before I leave...

-Toke
