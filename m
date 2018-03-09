Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29686e96
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 09:58:23 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70fd681b
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 09:58:23 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Another roaming problem
In-Reply-To: <CAHmME9ojxMOoB5z4VJQbecTD+Y7VLK=K8=oTSDciofWLC6Q0fg@mail.gmail.com>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
 <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
 <87h8pqlbw4.fsf@toke.dk>
 <CAHmME9pgOGghWRv9bMtTvbxrQfNycK9EHEnBu=UQxOz6AQJ2qA@mail.gmail.com>
 <7088098E-63F5-4ECB-A298-24444987482E@toke.dk>
 <CAHmME9ojxMOoB5z4VJQbecTD+Y7VLK=K8=oTSDciofWLC6Q0fg@mail.gmail.com>
Date: Fri, 09 Mar 2018 11:08:04 +0100
Message-ID: <87efktzhmj.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

> On Thu, Mar 8, 2018 at 6:50 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>> Well, I do generally setup routing in a somewhat unusual manner.
>>
>> I can try to capture some packet dumps tomorrow to poke into it a bit mo=
re. Anything in particular I should look for?
>
> One thing to examine is when WireGuard calls
> `socket_clear_peer_endpoint_src'. This makes wireguard forget the
> source address that it should be using and fall back to the default.
> You could add a pr_info(...) call in this function. I have an inkling
> that I make calls to this function too zealously and in potentially
> unneeded places, such as on handshake transmission retries.
>
> I'm headed out of town super soon, so likely debugging this will have
> to wait until I'm back, but do let me know what you find, and we'll
> get this fixed up upon return.

Well, completely failed to reproduce it; everything works as its
supposed to now (wireguard correctly picks the public IP as its source
address when replying to the client).

Not sure if I have changed something in my setup or what is going on;
but at least I can roam now, so I'm happy ;)

-Toke
