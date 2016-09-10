Return-Path: opensource@vdorst.com
Received: from smtp01.bhosted.nl (smtp01.bhosted.nl [94.124.121.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f4b75e7
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Sep 2016 12:42:05 +0000 (UTC)
Received: from www.lan.vdorst.com (www.lan.vdorst.com
 [IPv6:2a02:a441:63ae:0:5054:ff:feca:c4e1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 5AAE9321932
 for <wireguard@lists.zx2c4.com>; Sat, 10 Sep 2016 14:50:18 +0200 (CEST)
Date: Sat, 10 Sep 2016 12:50:25 +0000
Message-ID: <20160910125025.Horde.1oXPxRzlX1oP4By8Ppdyv2N@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Subject: [WireGuard] [PATCH] Add support for platforms which has no
 efficient unaligned memory access
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Here by my patch to support platforms which has no efficient unaligned  
memory access.

Without it, it caused 55.2% slowdown in throughput at TP-Link  
WR1043ND, MIPS32r2@400Mhz.

Benchmarks before:

root@lede:~# iperf3 -c 10.0.0.1 -i 10
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec    0    202 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec    0             sender
[  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec                  receiver

root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G
[ ID] Interval           Transfer     Bandwidth       Total Datagrams
[  4]   0.00-10.00  sec  31.1 MBytes  26.1 Mbits/sec  3982
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter     
Lost/Total Datagrams
[  4]   0.00-10.00  sec  31.1 MBytes  26.1 Mbits/sec  0.049 ms  0/3982 (0%)
[  4] Sent 3982 datagrams

Benchmarks with aligned memory fetching:

root@lede:~# iperf3 -c 10.0.0.1 -i 10
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec    0    145 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec    0             sender
[  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec                  receiver

iperf Done.
root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G
[ ID] Interval           Transfer     Bandwidth       Total Datagrams
[  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  7207
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter     
Lost/Total Datagrams
[  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  0.041 ms  0/7207 (0%)
[  4] Sent 7207 datagrams


Greats,

René van Dorst.
