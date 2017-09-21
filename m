Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bda7a937
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:50:29 +0000 (UTC)
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
 [209.85.223.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fc09b59
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:50:29 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id z187so10281159ioz.12
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 05:17:51 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <CAHmME9pr6-WXJ6wthXDyzc4V5MAv-0uuSgrWD3a2O3NiLQWHEQ@mail.gmail.com>
References: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
 <CAHmME9pr6-WXJ6wthXDyzc4V5MAv-0uuSgrWD3a2O3NiLQWHEQ@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Thu, 21 Sep 2017 14:17:50 +0200
Message-ID: <CADdae-jAp+r2hT37Huetz9eajrgWEvwAZfhbo4mS8DP5gWw_Hw@mail.gmail.com>
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

Ok,
To be more precise, the uses cases are :
services ( as daemon ) are listening on specifiq interface/Ipv6
address to secure and active service by client, with only one
interface, it is not possible, aliasing seems to be not relevant.
However i can understand that is not the problem of wireguard ,
perhaps can you tell us if an internal dev is possible or if the
nature of wireguard forbid this ?

Regards,
Nicolas
Ps : sorry for the prefix

2017-09-21 13:55 GMT+02:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Please do not prefix your email subjects with [wireguard-dev].
