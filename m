Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 104f5524
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 19:06:09 +0000 (UTC)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
 [209.85.218.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd7f0240
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 19:06:09 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id c3-v6so14315762oib.5
 for <wireguard@lists.zx2c4.com>; Sun, 25 Mar 2018 12:17:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522001437.2044.11.camel@gmail.com>
References: <1521919967.1921.32.camel@gmail.com>
 <CAF75rJBe8amfHP__gQMzAf6cBj933c2yCg4wx4nA2hw98tcVXQ@mail.gmail.com>
 <1522001437.2044.11.camel@gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Sun, 25 Mar 2018 21:17:35 +0200
Message-ID: <CAKXLc7e1cJ6E=KCMshe_=EOtnwTa-YpRwPe2RwW8vNkj3qzONw@mail.gmail.com>
Subject: Re: add/remove a peer
To: ST <smntov@gmail.com>
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

On Sun, Mar 25, 2018 at 8:10 PM, ST <smntov@gmail.com> wrote:
> PS: if you have over 100 peers it is a bit a headache to find a free IP
> when adding a new peer. There is no reason WG could not scan through IPs
> it already knows and choose a free one, assign it in its own config file
> and print it out for passing to the remote peer...
>
There is a reason, at least one, good one - it is called simplicity.
It is also hard to work when you are running out of disk space or
memory; do you expect WG to solve that for you?
Simply put, IP addressing schemes are not a part of WG, neither a requirement.
There are many ways to use WG and "assign random, free IP address and
send to a new peer" is too specific of a use case.

May be you can cobble up something with a DHCP server that cares about
certain address range?
Or a simple flat-file dB and a script that does it for you?

What happens when you run out of addresses?
How do you re-assign an IP address to a new peer?
...
Those are questions widely outside WG, IMHO.

Cheers,
Kalin.
