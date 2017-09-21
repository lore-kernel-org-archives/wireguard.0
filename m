Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d13926e
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 12:27:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7812b183
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 12:27:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 303d705c
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 12:46:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3a2bc346
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 12:46:07 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id n69so10552347ioi.5
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 05:54:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-jAp+r2hT37Huetz9eajrgWEvwAZfhbo4mS8DP5gWw_Hw@mail.gmail.com>
References: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
 <CAHmME9pr6-WXJ6wthXDyzc4V5MAv-0uuSgrWD3a2O3NiLQWHEQ@mail.gmail.com>
 <CADdae-jAp+r2hT37Huetz9eajrgWEvwAZfhbo4mS8DP5gWw_Hw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Sep 2017 14:54:25 +0200
Message-ID: <CAHmME9qs_hyveXwUTU17gzri9Dwe+DgLj3Mzqu6dvZxuz57Jaw@mail.gmail.com>
Subject: Re: [wireguard-dev] Ability to use one udp port for multiple wg
 interfaces
To: nicolas prochazka <prochazka.nicolas@gmail.com>
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

Perhaps I'm not understanding your last message, but it's most
certainly possible to bind to a particular IP address with a service.
It's also possible to bind to _all_ IP addresses, and then use
iptables to control which source networks have access to a particular
port. Finally, within a service, if you only allow input from wg0
since allowed-ips gives strong cryptographic binding, you can
explicitly filter on the IP addresses you get from recvfrom.

I don't understand your meaning of "internal dev".
