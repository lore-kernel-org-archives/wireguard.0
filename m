Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75eea330
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 06:31:32 +0000 (UTC)
Received: from mail.intelterm.ro (174.15.122.86.static.cluj.rdsnet.ro
 [86.122.15.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3e479a9
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 06:31:32 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.24.75.96])
 by mail.intelterm.ro (Postfix) with ESMTPSA id 126B92218C7D
 for <wireguard@lists.zx2c4.com>; Thu,  5 Apr 2018 09:44:38 +0300 (EEST)
To: wireguard@lists.zx2c4.com
From: Lucian Cristian <luci@createc.ro>
Subject: ssh console hang
Message-ID: <b76eeb2c-9d82-3178-4b05-1d91e5bdff1b@createc.ro>
Date: Thu, 5 Apr 2018 09:44:38 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Starting some time ago I get ssh console hangs when the screen is 
displaying lots of data (cat large file, compile something with lots of 
verbosity) I tried lowering the MTU of wg interface to 1380 or the MTU 
of the host but it's not helping. What can I try to do ?
I observed that the hang started to happen after I changed the routing 
protocol on the interface from RIP to OSPF, can this affect it because I 
don't see why it should ?
the topology is like this:
windows client - openwrt wg "client" (OSPF) - ubuntu wg "server" (OSPF) 
- cisco switch - VM linux host

Regards
