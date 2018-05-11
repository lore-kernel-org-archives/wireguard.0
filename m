Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53480221
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 May 2018 22:43:00 +0000 (UTC)
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61b72f80
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 May 2018 22:43:00 +0000 (UTC)
Received: by mail-oi0-x230.google.com with SMTP id w123-v6so6059200oia.4
 for <wireguard@lists.zx2c4.com>; Fri, 11 May 2018 15:45:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Sat, 12 May 2018 00:45:34 +0200
Message-ID: <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
Subject: Re: Need for HW-clock independent timestamps
To: neumann@cgws.de
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

On Sat, May 12, 2018 at 12:07 AM, Axel Neumann <neumann@cgws.de> wrote:
> We have the following chicken-egg problem:
> We are using WG on openwrt devices which do not have a hardware clock so
> that time is resetted after each reboot.
> Because internet access shall be routed via WG tunnels the internet and
> network-time services (NTP) is not available unless WG works properly.
> But, guess, to reconnect, WG needs a greater time than before it
> rebooted :-(
>
> I heard that a suggested solution is to periodically save the current
> time to filesystem and then fix it during boot based on the last saved
> one. But all embedded devices use flash memory with a limited amount
> (about 10^5) of write cycles before they become unstable which would
> destroy the flash within weeks.
>
Good/Hard problem!

> Any ideas how to circumvent this problem?
>
I only see 2 ways:
* hardware: add a cheap RTC (best), or storage (USB, SD)
* policy: add exception for ntpdate on base UDP (not WG) (or have
dedicated server/s for that, which you control).

BTW, while flash write cycles are indeed limited, you are writing a
very small data (that causes a single block to be rewritten).
So a device with say 32 MB(8000 x 4K blocks) will last about 9000
years if you write one block once per hour until 10% (=800) of its
cells are past 10^5 writes.
(or 3 years if you write once per second!)
But my knowledge says 10^3-10^4 write cycles (so still 90-900 years for 1/hour).

If you have a large number of devices of the same hardware, I'd
suggest a "kill test" of one of them, by rewriting its flash. You can
further use specific file-systems optimized for NAND/NOR flash.

Cheers,
Kalin.
