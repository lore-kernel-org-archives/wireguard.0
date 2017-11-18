Return-Path: markus.woschank@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb4cad25
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 15:07:18 +0000 (UTC)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
 [209.85.218.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 714589eb
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 15:07:18 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id a75so3581956oib.1
 for <wireguard@lists.zx2c4.com>; Sat, 18 Nov 2017 07:11:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKUy5ayySemw3Yct425deiLmqSLNLDTS-2Q2GAYp9y8aJabOhg@mail.gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
 <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
 <CAKUy5ayySemw3Yct425deiLmqSLNLDTS-2Q2GAYp9y8aJabOhg@mail.gmail.com>
From: Markus Woschank <markus.woschank@gmail.com>
Date: Sat, 18 Nov 2017 16:11:54 +0100
Message-ID: <CAKUy5axn5nMsjFs6QeB624MokCdAQp+xa_=p=8Z8OkMuE6ddaQ@mail.gmail.com>
Subject: Re: Roaming Mischief
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Sorry for the previous message.

@matthias

> Simple example: a mobile IP phone. Rebooting your telephony server
> causes you to drop the connection to the client until _it_ next issues a
> call. However, if you persist the phone's address, you don't lose
> incoming service.

Thank you for the example.

While a reboot already impacts the service of the telephony system
this might be also tackled via the persistent keepalive, but I see
your point.

But then again the original configuration did not specify any endpoint
and suddenly, after reboot, it does.
I strongly believe the state (current endpoint of roaming peers) needs
to be separated from the configuration.
Take the dhcpd server for example, it does _not_ store leases in the
configuration and rewrites it on every shutdown, it stores the _state_
at a different location.

 Again ;) my proposal: if a peer's endpoint is specified this makes it
a non roaming peer, make it possible to store and restore, and/or set
current roaming peers endpoints, for special situations and don't
change the configuration syntax.

Markus
