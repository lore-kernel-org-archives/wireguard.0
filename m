Return-Path: rm.wg@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe80a41f
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 09:15:12 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5029cf59
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 09:15:12 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e9:9eff:fe8f:1bcf])
 by rin.romanrm.net (Postfix) with SMTP id 1A33C404AA
 for <wireguard@lists.zx2c4.com>; Fri, 16 Mar 2018 09:25:48 +0000 (UTC)
Date: Fri, 16 Mar 2018 14:25:47 +0500
From: Roman Mamedov <rm.wg@romanrm.net>
To: wireguard@lists.zx2c4.com
Subject: Mixed MTU hosts on a network
Message-ID: <20180316142547.2ecb70de@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I have a host which is on PPPoE and has 1492 as underlying MTU.

When WireGuard starts by default, it sets MTU of its interface to 1420. All
TCP connections trying to send a stream of data over the WG interface to that
host, hang up (I test with iperf3).

My first idea was to override the MTU for this specific host via adding a
route:

# ip -6 route add fd39:30::250/128 dev wg0 mtu 1412 metric 1

# ip -6 route | grep ^fd39:30
fd39:30::250 dev wg0  metric 1  mtu 1412
fd39:30::/64 dev wg0  proto kernel  metric 256

# ip route get fd39:30::250
fd39:30::250 from :: dev wg0  src fd39:30::2  metric 1  mtu 1412

However, this does not help at all. Even adding the corresponding route on the
other side. Even using the "mtu lock" keyword instead of just "mtu". I am still
puzzled why. Any ideas?

=========================================
# iperf3 -c fd39:30::250
Connecting to host fd39:30::250, port 5201
[  4] local fd39:30::2 port 44902 connected to fd39:30::250 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec   474 KBytes  3.88 Mbits/sec    1   1.31 KBytes       
[  4]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.31 KBytes       
[  4]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    1   1.31 KBytes       
[  4]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    0   1.31 KBytes       
[  4]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    1   1.31 KBytes       
[  4]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.31 KBytes       
[  4]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    0   1.31 KBytes       
[  4]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.31 KBytes       
[  4]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.31 KBytes       
[  4]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec    1   1.31 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec   474 KBytes   388 Kbits/sec    5             sender
[  4]   0.00-10.00  sec  0.00 Bytes  0.00 bits/sec                  receiver

iperf Done.
=========================================

What helps, is only reducing MTU of the entire wg0 interface to 1412. Then
everything works fine. But it doesn't feel optimal to reduce MTU of the entire
network just because of 1 or 2 hosts. I would rather use a couple of those
mtu-override routes, if they worked.

-- 
With respect,
Roman
