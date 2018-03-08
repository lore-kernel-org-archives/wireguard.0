Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b25706e
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:54:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bb8ef8d
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:54:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76b4e84e
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:45:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61434c2b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:45:22 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id g5so5018739oiy.8
 for <wireguard@lists.zx2c4.com>; Thu, 08 Mar 2018 10:03:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7088098E-63F5-4ECB-A298-24444987482E@toke.dk>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
 <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
 <87h8pqlbw4.fsf@toke.dk>
 <CAHmME9pgOGghWRv9bMtTvbxrQfNycK9EHEnBu=UQxOz6AQJ2qA@mail.gmail.com>
 <7088098E-63F5-4ECB-A298-24444987482E@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Mar 2018 19:03:51 +0100
Message-ID: <CAHmME9ojxMOoB5z4VJQbecTD+Y7VLK=K8=oTSDciofWLC6Q0fg@mail.gmail.com>
Subject: Re: Another roaming problem
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
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

On Thu, Mar 8, 2018 at 6:50 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> Well, I do generally setup routing in a somewhat unusual manner.
>
> I can try to capture some packet dumps tomorrow to poke into it a bit mor=
e. Anything in particular I should look for?

One thing to examine is when WireGuard calls
`socket_clear_peer_endpoint_src'. This makes wireguard forget the
source address that it should be using and fall back to the default.
You could add a pr_info(...) call in this function. I have an inkling
that I make calls to this function too zealously and in potentially
unneeded places, such as on handshake transmission retries.

I'm headed out of town super soon, so likely debugging this will have
to wait until I'm back, but do let me know what you find, and we'll
get this fixed up upon return.
