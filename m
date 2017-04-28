Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1568e154
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Apr 2017 10:06:26 +0000 (UTC)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
 [209.85.223.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc1bd014
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Apr 2017 10:06:26 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id p80so57449975iop.3
 for <wireguard@lists.zx2c4.com>; Fri, 28 Apr 2017 03:15:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <24fd775a-38aa-d6fa-476f-95cc734d990d@hall-andersen.dk>
References: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
 <24fd775a-38aa-d6fa-476f-95cc734d990d@hall-andersen.dk>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Fri, 28 Apr 2017 12:15:05 +0200
Message-ID: <CAKXLc7cVeDy+nXB13wWotS=s-VCFMGiUK3U2AgEaYhQxMiF5jw@mail.gmail.com>
Subject: Re: potential preshared-key changes
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I finally read through all the thread :-D

(and very good write-up, Mathias!)

Obeying the KISS principle, while erring on security should lead to
"per-client PSK", the proposed method.

I see some scenarios where the current method (per-iface) works
better, mainly in small private VPNs, usually temporary and all
trusting each other; in such cases identity hiding is not an issue and
simple initial setup (one PSK) is a plus.
( think a bunch of short-lived VPC instances, started/owned by single person)

To eat the cake and have it whole, supporting both methods MAY be
possible, iff (=if-and-only-if) this does not introduce lots of
complexity in code.

Thinking about code, how would that be implemented, how do we define user?
I am wondering what happens after Alice establishes a connection to
SERVER_1 with PSK_A from IP_1:
* then someone (Eve?) establishes another connection with (stolen)
PSK_A from IP_2 ? -> log or ignore
* then Bob establishes another connection with own PSK_B from IP_1
(same company GW)? -> hopefully possible!

I guess part of the design of WG is to not keep state or logs, so
those will "simply work" (TM) :-D

Regards,
Kalin.
