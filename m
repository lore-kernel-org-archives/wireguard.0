Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48aca77d
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 12:46:50 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
 [209.85.128.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb2a3ec7
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 12:46:50 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id u40so14416841wrf.10
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 04:51:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qmZCt7GDeXZtDBwSeg2z1Md9UQENbNo5TXvSqWion9rA@mail.gmail.com>
References: <CAC6SzHKVvOEZYXiuK-O6jMN=OOPjfogq2bbeHnYA1xoLew-OcQ@mail.gmail.com>
 <CAHmME9qmZCt7GDeXZtDBwSeg2z1Md9UQENbNo5TXvSqWion9rA@mail.gmail.com>
From: d tbsky <tbskyd@gmail.com>
Date: Wed, 22 Nov 2017 20:51:56 +0800
Message-ID: <CAC6SzHJ_xHN5fCn2mQ=xrx2Uz6YbZLoHE6As0bwE1SmzprCn+g@mail.gmail.com>
Subject: Re: roaming and ddns dynamic ip
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

2017-11-22 19:59 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Hello,
>
> This is not a bug. DNS resolution is not done by the WireGuard module,
> but rather by the configuration tool. If you want to update an IP,
> you'll need to devise a mechanism for this. One popular one is this
> example script:
> https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns ,
> but many other possibilities exist too.
>
> Jason

 I don't think it's a bug. as you said, that's by design.although it
means I need other tool to co-maintain the vpn connection.

if wireguard can be configured to disable roaming and always use the
static dns name as endpoint, maybe the problem can be solved
automatically. like openvpn can restart itself and resolve dns name
again when connection is broken.

but anyway I can live with the current situation. just need to figure
it out. thanks a lot for your clarification!

Regards,
tbskyd
