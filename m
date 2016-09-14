Return-Path: opensource@vdorst.com
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72b30334
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Sep 2016 07:07:59 +0000 (UTC)
Received: from www.lan.vdorst.com (www.lan.vdorst.com
 [IPv6:2a02:a441:63ae:0:5054:ff:feca:c4e1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id CE3A832A53E
 for <wireguard@lists.zx2c4.com>; Wed, 14 Sep 2016 09:16:40 +0200 (CEST)
Date: Wed, 14 Sep 2016 07:16:54 +0000
Message-ID: <20160914071654.Horde.VPt42kADErUJCGSNzTb-Lfl@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
References: <20160808132309.Horde.PpRcvoBjgmDh9S0lYDhy7Au@www.vdorst.com>
 <CAHmME9o+QqPR0qo8uadYVZDMw=Z-uxCwuBgggOeYNdE8FDLXpQ@mail.gmail.com>
 <20160908115753.Horde.dla9pNo2jSEeBF-QW8dWlO-@www.vdorst.com>
 <20160909134611.Horde.d1CtbRQrioV8yr-kI71aUI3@www.vdorst.com>
 <20160909135202.GA32666@lud.imag.fr>
 <20160909152208.Horde.qMOsffs1bVcJx-AfO91qa9q@www.vdorst.com>
 <20160909194927.Horde.e1JlaJl_SL7blOrpizk9Uba@www.vdorst.com>
In-Reply-To: <20160909194927.Horde.e1JlaJl_SL7blOrpizk9Uba@www.vdorst.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Subject: Re: [WireGuard] News about MIPS and ARM optimized code?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

An update of my current findings.

Most improvements I have seen at the moment is writing and optimize  
poly1305_generic_blocks function.
This gives a improvement of more than 1%.
I also noticed that the ping time does not change.

Improvement at the moment is around UDP: ~1.47% TCP: ~1.68% on large  
transfers like iperf.

Wireguard mix of Asm and C variant:  
https://github.com/vDorst/wireguard/commit/6f9187c325ee883b1f2b9f9da3deb0a61655b504

root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G -t 60
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.2 port 47996 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Total Datagrams
[  4]   0.00-10.00  sec  57.5 MBytes  48.2 Mbits/sec  7354
[  4]  10.00-20.00  sec  57.4 MBytes  48.2 Mbits/sec  7350
[  4]  20.00-30.00  sec  57.4 MBytes  48.2 Mbits/sec  7353
[  4]  30.00-40.00  sec  57.5 MBytes  48.2 Mbits/sec  7356
[  4]  40.00-50.00  sec  57.5 MBytes  48.2 Mbits/sec  7357
[  4]  50.00-60.00  sec  57.5 MBytes  48.2 Mbits/sec  7358
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter     
Lost/Total Datag                                        rams
[  4]   0.00-60.00  sec   345 MBytes  48.2 Mbits/sec  0.037 ms  0/44128 (0%)
[  4] Sent 44128 datagrams

root@lede:~# iperf3 -c 10.0.0.1 -i 10-b 1G -t 60
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.2 port 37950 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.14  sec  52.5 MBytes  43.4 Mbits/sec    0    147 KBytes
[  4]  10.14-20.02  sec  51.2 MBytes  43.5 Mbits/sec    0    147 KBytes
[  4]  20.02-30.14  sec  52.5 MBytes  43.5 Mbits/sec    0    147 KBytes
[  4]  30.14-40.01  sec  51.2 MBytes  43.5 Mbits/sec    0    147 KBytes
[  4]  40.01-50.16  sec  52.5 MBytes  43.4 Mbits/sec    0    220 KBytes
[  4]  50.16-60.01  sec  42.5 MBytes  36.2 Mbits/sec    0    220 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-60.01  sec   302 MBytes  42.3 Mbits/sec    0             sender
[  4]   0.00-60.01  sec   302 MBytes  42.3 Mbits/sec                  receiver


Wireguard C variant:  
https://github.com/vDorst/wireguard/commit/13fae657624aac6b9c1f411aa6472a91aae7fcc3

root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G -t 60
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.2 port 40439 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Total Datagrams
[  4]   0.00-10.00  sec  56.6 MBytes  47.5 Mbits/sec  7246
[  4]  10.00-20.00  sec  56.6 MBytes  47.5 Mbits/sec  7243
[  4]  20.00-30.00  sec  56.6 MBytes  47.5 Mbits/sec  7244
[  4]  30.00-40.00  sec  56.6 MBytes  47.5 Mbits/sec  7245
[  4]  40.00-50.00  sec  56.6 MBytes  47.5 Mbits/sec  7245
[  4]  50.00-60.00  sec  56.6 MBytes  47.5 Mbits/sec  7247
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter     
Lost/Total Datagrams
[  4]   0.00-60.00  sec   340 MBytes  47.5 Mbits/sec  0.039 ms  0/43470 (0%)
[  4] Sent 43470 datagrams

root@lede:~# iperf3 -c 10.0.0.1 -i 10 -b 1G -t 60
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.2 port 37956 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.02  sec  49.6 MBytes  41.5 Mbits/sec    0    137 KBytes
[  4]  10.02-20.00  sec  49.6 MBytes  41.7 Mbits/sec    0    209 KBytes
[  4]  20.00-30.02  sec  49.6 MBytes  41.6 Mbits/sec    0    209 KBytes
[  4]  30.02-40.01  sec  49.2 MBytes  41.3 Mbits/sec    0    209 KBytes
[  4]  40.01-50.02  sec  49.6 MBytes  41.6 Mbits/sec    0    209 KBytes
[  4]  50.02-60.02  sec  49.6 MBytes  41.6 Mbits/sec    0    209 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-60.02  sec   297 MBytes  41.6 Mbits/sec    0             sender
[  4]   0.00-60.02  sec   297 MBytes  41.6 Mbits/sec                  receiver


Greats,

René van Dorst.
