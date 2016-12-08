Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e13af7d
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 12:42:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c89891b0
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 12:42:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1274f127
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 12:42:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3f39a73b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 12:42:43 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id a197so215290113wmd.0
 for <wireguard@lists.zx2c4.com>; Thu, 08 Dec 2016 04:48:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161208123343.54f162d7@leda>
References: <20161208091214.15449-1-list@eworm.de>
 <CAHmME9qc02xGhyiXp3J3ugFyCKkWbYY0Fj_q9C1euv1gAYa9qg@mail.gmail.com>
 <20161208123343.54f162d7@leda>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Dec 2016 13:48:13 +0100
Message-ID: <CAHmME9pXPHPZwFy4JLQZLbOjinFnPJ+JcP1mPR=+PvAMLYmoLA@mail.gmail.com>
Subject: Re: [PATCH 1/1] make the systemd unit example more general
To: Christian Hesse <list@eworm.de>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Dec 8, 2016 at 12:33 PM, Christian Hesse <list@eworm.de> wrote:
> "Jason A. Donenfeld" <Jason@zx2c4.com> on Thu, 2016/12/08 12:18:
>> I like this, but two questions.
>>
>> 1. Why did you get rid of the ExecStop config saving line?
>
> I do not like units altering configuration. If you want to save configuration
> on stop create a second unit with correct dependencies an ordering that
> writes the configuration.

That's fair. Want to submit a v2, then, with a shutdown unit too?
(By the way, please prefix the commit message with "contrib: ".)

> Not sure about that. :-p At least I left it in examples directory. ;)
>
> In first place this is a RFC. Nevertheless we should polish things a bit and
> provide a usable systemd unit.

Alright then. By the way, there's some work upstream with systemd to
include this in systemd-networkd, which would probably be the "more
correct" way of doing it. But I guess a unit would nonetheless be
useful for folks who don't use systemd-networkd.

>
> I still do not like to have two files that hold the settings... But no idea
> how to get rid of that in a clean way. Having shell code in a systemd unit is
> even worse...

Yea, it's not nice. There's some additional logic: adding allowed-ips
to routes for the device, if the allowed-ips aren't already included
in the device's address prefix route.

I've thought about just adding this to `wg(8)` itself, and letting it
be specified in the config file. This would indeed be _nice_, but it
still seems like the wrong place to be doing these things. Maybe it'd
be useful to have an extra shell-script in contrib called wg-config.sh
that takes a device name, a `wg(8)`, config file, a list of IPs given
by --address=, a list of additional routes given by --route=, and the
ability to disable auto-route-from-allowed-ips-adding via
--no-auto-routes. Maybe I'll code this up myself -- it should only
take a few minutes to do...
