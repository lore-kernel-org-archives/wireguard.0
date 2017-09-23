Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e81d547e
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Sep 2017 22:17:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aaf88878
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Sep 2017 22:17:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbbc4b9f
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Sep 2017 22:36:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0e52e07a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Sep 2017 22:36:11 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id b1so2725867oih.4
 for <wireguard@lists.zx2c4.com>; Sat, 23 Sep 2017 15:44:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAH8WAOZGHrxOHTWsTCgEQNgF3XixeeWeU6+-nMSjOeoFNtDJFQ@mail.gmail.com>
References: <CAH8WAOZGHrxOHTWsTCgEQNgF3XixeeWeU6+-nMSjOeoFNtDJFQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 24 Sep 2017 00:44:48 +0200
Message-ID: <CAHmME9pD--t1gNhZ=W=LS1PC0Rz3umEY8pbpsbcmU8MSqp5XCw@mail.gmail.com>
Subject: Re: Bridge interfaces?
To: Lord Kitsuna <lordkitsuna112@gmail.com>
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

Hi,

Yes indeed this is possible. Enable ip forwarding (sysctl -w
net.ipv4.ip_forwarding=1), and then make sure you have the correct
routes set. You may have to add a few entries to your allowed-ips to
ensure that the network is okay with wireguard, or, perhaps easier,
would to just enable MASQUERADEing (iptables -t nat -A POSTROUTING -s
10.8.8.0/24 -o tinc0 -j MASQUERADE, where 10.8.8.0/24 is the wireguard
network.)

There are a lot of ways to skin the cat, and I suspect if you write
back with details of network segments and whatnot, there might be
others who might have their own useful opinions. Alternatively, you
can always ask in #wireguard on Freenode.

Jason
