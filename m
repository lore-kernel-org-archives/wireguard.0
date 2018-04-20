Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb136895
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 10:36:20 +0000 (UTC)
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
 [209.85.128.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4879303
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 10:36:20 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id w3-v6so21690645wrg.2
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 03:36:32 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Received: from debox ([37.26.147.242])
 by smtp.gmail.com with ESMTPSA id e50-v6sm10925134wre.4.2018.04.20.03.36.30
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Apr 2018 03:36:30 -0700 (PDT)
Message-ID: <1524220589.2059.27.camel@gmail.com>
Subject: Interface's Address is not saved when SaveConfig = true in config
From: ST <smntov@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Fri, 20 Apr 2018 13:36:29 +0300
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I have 
...
Address = 192.168.4.1/24
SaveConfig = true
in wg0.conf

1. if I add a peer with `wg set wg0 peer ...` WG doesn't add it
immediately to the wg0.conf file, only after I run `wg-quick down wg0`.
Why not? What happens if the system crashes unexpectedly?... The peer
will not be saved to the config file and the information will be lost.


2. once I run `wg-quick down wg0` I get:

Option "-all" is unknown, try "ip -help".
cat: /etc/resolvconf/run/interface/wg0: No such file or directory
[#] wg showconf wg0
sync: ignoring all arguments
[#] ip link delete dev wg0

Now the wg0.conf is enhanced with the peer details that was added
through command line, but the Address = 192.168.4.1/24 disappears from
the config. So running `wg-quick up wg0` again doesn't assigns IP to the
wg0 interface... What's wrong?

I'm using version:
apt list wireguard
wireguard/unstable,now 0.0.20180304-1 all [installed]

Thank you!
