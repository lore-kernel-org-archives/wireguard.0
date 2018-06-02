Return-Path: jungleboogie0@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8b1ad29
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 20:09:15 +0000 (UTC)
Received: from mail-pl0-x22a.google.com (mail-pl0-x22a.google.com
 [IPv6:2607:f8b0:400e:c01::22a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05a59d59
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 20:09:14 +0000 (UTC)
Received: by mail-pl0-x22a.google.com with SMTP id c41-v6so17241414plj.10
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jun 2018 13:11:46 -0700 (PDT)
Return-Path: <jungleboogie0@gmail.com>
Received: from localhost (ip70-173-220-152.lv.lv.cox.net. [70.173.220.152])
 by smtp.gmail.com with ESMTPSA id p2-v6sm36857544pgq.14.2018.06.02.13.11.44
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Jun 2018 13:11:44 -0700 (PDT)
From: Jungle Boogie <jungleboogie0@gmail.com>
Date: Sat, 2 Jun 2018 13:11:43 -0700
To: wireguard@lists.zx2c4.com
Subject: peer key in file
Message-ID: <20180602201143.GC5571@puffer.in.lylie.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi All,

I know the private key can be specified via file, but what about the peer key?

wg set tun0 peer ./peerfile allowed-ips 0.0.0.0/0 endpoint 192.168.0.1:7394

Thanks!
