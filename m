Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1eb85e03
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 12:47:23 +0000 (UTC)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
 [209.85.223.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b80d48f8
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 12:47:23 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id d16so10673695ioj.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 06:14:46 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <CAHmME9qs_hyveXwUTU17gzri9Dwe+DgLj3Mzqu6dvZxuz57Jaw@mail.gmail.com>
References: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
 <CAHmME9pr6-WXJ6wthXDyzc4V5MAv-0uuSgrWD3a2O3NiLQWHEQ@mail.gmail.com>
 <CADdae-jAp+r2hT37Huetz9eajrgWEvwAZfhbo4mS8DP5gWw_Hw@mail.gmail.com>
 <CAHmME9qs_hyveXwUTU17gzri9Dwe+DgLj3Mzqu6dvZxuz57Jaw@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Thu, 21 Sep 2017 15:14:45 +0200
Message-ID: <CADdae-i+Ue8cLZhcNUZ__-DQzU7b+uC963VbENpgDV4TTsqGRg@mail.gmail.com>
Subject: Re: [wireguard-dev] Ability to use one udp port for multiple wg
 interfaces
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

internal dev = hack your code for our specifiq use, to multiplex
listening udp port .
I agree with you about configuration, it is possible, but we are using
"historical" private software, and it's difficult to deal with.
It is not a wireguard issue.

Regards,
Nicolas


2017-09-21 14:54 GMT+02:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Perhaps I'm not understanding your last message, but it's most
> certainly possible to bind to a particular IP address with a service.
> It's also possible to bind to _all_ IP addresses, and then use
> iptables to control which source networks have access to a particular
> port. Finally, within a service, if you only allow input from wg0
> since allowed-ips gives strong cryptographic binding, you can
> explicitly filter on the IP addresses you get from recvfrom.
>
> I don't understand your meaning of "internal dev".
