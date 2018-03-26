Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 128fb15b
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 15:02:04 +0000 (UTC)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
 [209.85.128.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef75d6c0
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 15:02:04 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id u46so19294087wrc.11
 for <wireguard@lists.zx2c4.com>; Mon, 26 Mar 2018 08:13:57 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1522077232.2044.31.camel@gmail.com>
Subject: Re: add/remove a peer
From: ST <smntov@gmail.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 26 Mar 2018 18:13:52 +0300
In-Reply-To: <CAKXLc7e1cJ6E=KCMshe_=EOtnwTa-YpRwPe2RwW8vNkj3qzONw@mail.gmail.com>
References: <1521919967.1921.32.camel@gmail.com>
 <CAF75rJBe8amfHP__gQMzAf6cBj933c2yCg4wx4nA2hw98tcVXQ@mail.gmail.com>
 <1522001437.2044.11.camel@gmail.com>
 <CAKXLc7e1cJ6E=KCMshe_=EOtnwTa-YpRwPe2RwW8vNkj3qzONw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, 2018-03-25 at 21:17 +0200, Kalin KOZHUHAROV wrote:
> On Sun, Mar 25, 2018 at 8:10 PM, ST <smntov@gmail.com> wrote:
> > PS: if you have over 100 peers it is a bit a headache to find a free IP
> > when adding a new peer. There is no reason WG could not scan through IPs
> > it already knows and choose a free one, assign it in its own config file
> > and print it out for passing to the remote peer...
> >
> There is a reason, at least one, good one - it is called simplicity.
> It is also hard to work when you are running out of disk space or
> memory; do you expect WG to solve that for you?

They are not related to WG at all.

> Simply put, IP addressing schemes are not a part of WG, neither a requirement.
> There are many ways to use WG and "assign random, free IP address and
> send to a new peer" is too specific of a use case.

No, sending to a peer is not what I asked - only assign a random free IP
if no one is provided to `wg set peer ...`. That's it. Only locally and
only internally. No keys distribution schemes or something. How to send
it to the new peer is the problem of the sysadmin. Could be per
encrypted email/https or whatever.

> What happens when you run out of addresses?

You just give an error message "no more IPs are available, make one free
or choose another IP range!"

> How do you re-assign an IP address to a new peer?

You delete the [Peer] with that IP from the .conf file (or `wg set wg0
peer peer_pubkey remove`) and then `wg set peer allowed-ips
old.ip.to.reassign/32 ...`

Thank you!
