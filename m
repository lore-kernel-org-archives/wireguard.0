Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e00d6183
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Oct 2017 23:36:35 +0000 (UTC)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
 [209.85.218.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d69137b
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Oct 2017 23:36:35 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id j126so2836802oib.8
 for <wireguard@lists.zx2c4.com>; Wed, 25 Oct 2017 16:38:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Thu, 26 Oct 2017 01:37:53 +0200
Message-ID: <CAKXLc7fv-d2sswAUcVA7n2oedgZZfdqO1WmQxi=yvzu6rQB9mQ@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Thu, Oct 26, 2017 at 12:43 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The hatchet works as follows. On interface addition:
>
> # echo nameserver 1.2.3.4 > /etc/resolv.conf.wg-quick.wg0
> # [ -f /etc/resolv.conf ] || touch /etc/resolv.conf
> # mount -o ro --bind /etc/resolv.conf.wg-quick.wg0 /etc/resolv.conf
> # unlink /etc/resolv.conf.wg-quick.wg0
>
> On interface removal:
>
> # umount /etc/resolv.conf
>
O, I love it! (didn't know you can --bind mount to a file, BTW)

I am sure someone will scream along the way, so jut document it and
put a short notice in a comment inside /etc/resolv.conf as to what is
going on.
And make it optional for people who (pretend to) have control over
their systems.

And can you briefly remind me why do you need to bother with the
resolv settings?
May be this is only valid for "use-only-VPN", e.g. laptop in China?

> Can anybody think of any potential issues with this?
>
* See if there is another mount, before doing it, i.e. check for the
hatchet before using it?
* Not sure anyone will hit the corner case of needing to umount /etc
while wireguard is running, but who knows.

Cheers,
Kalin.
