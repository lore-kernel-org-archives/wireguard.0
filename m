Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fde966b0
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 14:31:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70c394bb
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 14:31:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4ff8106
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 14:22:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cabdce86
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 14:22:24 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id 188-v6so10844549oih.8
 for <wireguard@lists.zx2c4.com>; Sat, 14 Apr 2018 07:45:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180414193815.0d0cd039@natsu>
References: <20180316142547.2ecb70de@natsu>
 <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
 <20180414024017.GA14470@zx2c4.com>
 <CAHmME9ru0iQeYMv_Y5dBZ1GoJvT_=UK8V74wWYNz2jtZWRFhfw@mail.gmail.com>
 <20180414184018.0166bc48@natsu>
 <CAHmME9rHTu1dQi+xyyRnkKxVkC9bx91V06-qF513SsVt8e7FKg@mail.gmail.com>
 <20180414193815.0d0cd039@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 16:45:32 +0200
Message-ID: <CAHmME9ra=DZiaUS7pP3xAxC_7H-yqfiTefU3Q8gufpP7e6H2zw@mail.gmail.com>
Subject: Re: Mixed MTU hosts on a network
To: Roman Mamedov <rm@romanrm.net>
Content-Type: text/plain; charset="UTF-8"
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roman Mamedov <rm.wg@romanrm.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Roman,

That's strange; I'm unable to reproduce what you've described:

[+] NS1: ip link set wg0 mtu 1412
[+] NS2: ip link set wg0 mtu 1412
[+] NS1: wg set wg0 peer QXloTaPOwUTzqFElVLSD0vBc4sxjyoKtPBSaTkZHokY=
endpoint 127.0.0.1:2
[+] NS2: wg set wg0 peer X0p7+UWc4wjaAmT73xAEuXLY80I6Gv8vTg6KwFHCPGs=
endpoint 127.0.0.1:1
[+] NS0: iptables -A INPUT -m length --length 1473 -j DROP
[+] NS2: ping -c 1 -W 1 -s 1384 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 1384(1412) bytes of data.
1392 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.752 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.752/0.752/0.752/0.000 ms

In this case, WireGuard seems to be doing the right thing. Think you
could come up with some minimal test that exhibits the behavior you're
seeing?

Jason
