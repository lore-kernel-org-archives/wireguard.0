Return-Path: chris.ruehl@gtsys.com.hk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d27e2f5
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 01:24:10 +0000 (UTC)
Received: from sh1.xit.com.hk (sh1.xit.com.hk [111.91.236.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3ec64c3
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 01:24:10 +0000 (UTC)
Received: from mail.gtsys.com.hk
 (ruehlchr-3-pt.tunnel.tserv25.sin1.ipv6.he.net [IPv6:2001:470:35:5f1::2])
 by sh1.xit.com.hk (Postfix) with ESMTPSA id F413E30066A2
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 09:28:08 +0800 (HKT)
Received: from localhost (localhost [127.0.0.1])
 by mail.gtsys.com.hk (Postfix) with ESMTP id B1DE720155A1
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 09:28:05 +0800 (HKT)
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uygO1NYbJML5 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 09:28:05 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
 by mail.gtsys.com.hk (Postfix) with ESMTP id 90FEA2109C8E
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 09:28:05 +0800 (HKT)
Received: from [10.128.2.32] (n058152218161.netvigator.com [58.152.218.161])
 by s01.gtsys.com.hk (Postfix) with ESMTPSA id 68B8CC019F6
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 09:28:05 +0800 (HKT)
To: wireguard@lists.zx2c4.com
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Subject: Multicast packet drop with wg tunnel up
Message-ID: <28ad94a4-90fa-c64e-7700-ae0a46a8b271@gtsys.com.hk>
Date: Tue, 14 Nov 2017 09:28:02 +0800
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

Hi,

first message to the list, want say hello and want report with a problem I 
discovered when I play with the wireguard.

Setup:
Point to point tunnel (ARM-10.x.x.x) (FW) (www) (Server)
Tunnel fine no problem all works as expected.


On the ARM-10.x.x.x runs a service announce kind of service refesh
using MCAST group message.

ARM-10.x.x.x >> MCAST >> Service-listener
IP 10.128.2.193.10800 > 239.255.43.80.20800: UDP, length 19

Once WG is up the MCAST not shows up at Service-listener.

If remove the rules added by wg-quick:
root@91f4:/etc/wireguard# ip -4 rule delete table 51820
root@91f4:/etc/wireguard# ip -4 rule delete table main suppress_prefixlength 0

All back to normal, tunnel and MCAST works.

Is that a bug in the IP rule?

Regards
Chris


System info:
------------
Kernel 4.9.60

root@91f4:/etc/wireguard# wg-quick up wg0net
[#] ip link add wg0net type wireguard
[#] wg setconf wg0net /dev/fd/63
[#] ip address add 10.7.128.3/24 dev wg0net
[#] ip link set mtu 1420 dev wg0net
[#] ip link set wg0net up
[#] wg set wg0net fwmark 51820
[#] ip -6 route add ::/0 dev wg0net table 51820
[#] ip -6 rule add not fwmark 51820 table 51820
[#] ip -6 rule add table main suppress_prefixlength 0
sysctl: unable to open directory "/proc/sys/fs/binfmt_misc/"
[#] wg set wg0net fwmark 51820
[#] ip -4 route add 0.0.0.0/0 dev wg0net table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
sysctl: unable to open directory "/proc/sys/fs/binfmt_misc/"

root@91f4:/etc/wireguard# wg
interface: wg0net
   public key: EpdQHhUC4woDnL5gILT8drtAqHfdCPM2tnZe0ztM4n4=
   private key: (hidden)
   listening port: 35987
   fwmark: 0xca6c

peer: E/lOgU90jnqSKluYGCPvTGWQMCpthd4Xzm0qhbZj/nU=
   endpoint: 203.86.233.122:22114
   allowed ips: 0.0.0.0/0, ::/0
   latest handshake: 1 minute, 4 seconds ago
   transfer: 2.20 KiB received, 5.55 KiB sent





-- 
GTSYS Limited RFID Technology
9/F, Unit E, R07, Kwai Shing Industrial Building Phase 2,
42-46 Tai Lin Pai Road, Kwai Chung, N.T., Hong Kong
Tel (852) 9079 9521

Disclaimer: https://www.gtsys.com.hk/email/classified.html
