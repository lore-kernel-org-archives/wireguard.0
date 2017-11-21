Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 937ae2e0
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:35:36 +0000 (UTC)
Received: from smtp01.bhosted.nl (smtp01.bhosted.nl [94.124.121.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 217cf509
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:35:35 +0000 (UTC)
Received: from www (www.lan.vdorst.com [172.16.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 9B33D137B3C2
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 10:40:50 +0100 (CET)
Date: Tue, 21 Nov 2017 09:40:32 +0000
Message-ID: <20171121094032.Horde.sBBE8SerNxaWD9b3BswUV6c@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: WireGuard list <wireguard@lists.zx2c4.com>
Subject: Re: ARM multitheaded?
In-Reply-To: <20171121092516.Horde.-KEs7jQ3bs1TXDF4g98Y3gQ@www.vdorst.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

Part 2 ;)

I was expecting that my ixm6 quad core 933MHz outperform my single  
core dove 800MHz with a large magnitude.


Dove (Cubox-es) iperf results:

root@cubox-es:~# iperf3 -c 10.0.0.1 -t 10 -Z -i 10
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.4 port 43600 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.00  sec   194 MBytes   163 Mbits/sec    0    820 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec   194 MBytes   163 Mbits/sec    0             sender
[  4]   0.00-10.00  sec   192 MBytes   161 Mbits/sec                  receiver

iperf Done.
root@cubox-es:~# iperf3 -c 10.0.0.1 -t 10 -Z -i 10 -P 3
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.4 port 43604 connected to 10.0.0.1 port 5201
[  6] local 10.0.0.4 port 43606 connected to 10.0.0.1 port 5201
[  8] local 10.0.0.4 port 43608 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.00  sec  89.3 MBytes  74.9 Mbits/sec    0    354 KBytes
[  6]   0.00-10.00  sec  38.8 MBytes  32.6 Mbits/sec    0    227 KBytes
[  8]   0.00-10.00  sec  54.3 MBytes  45.5 Mbits/sec    0    235 KBytes
[SUM]   0.00-10.00  sec   182 MBytes   153 Mbits/sec    0
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  89.3 MBytes  74.9 Mbits/sec    0             sender
[  4]   0.00-10.00  sec  88.5 MBytes  74.2 Mbits/sec                  receiver
[  6]   0.00-10.00  sec  38.8 MBytes  32.6 Mbits/sec    0             sender
[  6]   0.00-10.00  sec  38.4 MBytes  32.2 Mbits/sec                  receiver
[  8]   0.00-10.00  sec  54.3 MBytes  45.5 Mbits/sec    0             sender
[  8]   0.00-10.00  sec  53.6 MBytes  44.9 Mbits/sec                  receiver
[SUM]   0.00-10.00  sec   182 MBytes   153 Mbits/sec    0             sender
[SUM]   0.00-10.00  sec   180 MBytes   151 Mbits/sec                  receiver


Imx6 (Utilite) iperf results:


[root@utilite ~]# iperf3 -c 10.0.0.1 -t 10 -Z -i 10
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.5 port 40336 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.00  sec   216 MBytes   181 Mbits/sec    0    382 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec   216 MBytes   181 Mbits/sec    0             sender
[  4]   0.00-10.00  sec   215 MBytes   181 Mbits/sec                  receiver

iperf Done.
[root@utilite ~]# iperf3 -c 10.0.0.1 -t 10 -Z -i 10 -P 3
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.5 port 40340 connected to 10.0.0.1 port 5201
[  6] local 10.0.0.5 port 40342 connected to 10.0.0.1 port 5201
[  8] local 10.0.0.5 port 40344 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-10.00  sec  93.5 MBytes  78.4 Mbits/sec    0    270 KBytes
[  6]   0.00-10.00  sec  76.1 MBytes  63.9 Mbits/sec    1    224 KBytes
[  8]   0.00-10.00  sec  88.9 MBytes  74.6 Mbits/sec    0    270 KBytes
[SUM]   0.00-10.00  sec   259 MBytes   217 Mbits/sec    1
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  93.5 MBytes  78.4 Mbits/sec    0             sender
[  4]   0.00-10.00  sec  93.0 MBytes  78.0 Mbits/sec                  receiver
[  6]   0.00-10.00  sec  76.1 MBytes  63.9 Mbits/sec    1             sender
[  6]   0.00-10.00  sec  75.5 MBytes  63.3 Mbits/sec                  receiver
[  8]   0.00-10.00  sec  88.9 MBytes  74.6 Mbits/sec    0             sender
[  8]   0.00-10.00  sec  88.4 MBytes  74.1 Mbits/sec                  receiver
[SUM]   0.00-10.00  sec   259 MBytes   217 Mbits/sec    1             sender
[SUM]   0.00-10.00  sec   257 MBytes   215 Mbits/sec                  receiver

iperf Done.


I looked at the cpu usage at the imx while running iperf.
Then I see that iperf is around 2-10% cpu use.
But Kthreads use a lot more.

Below typical cpu usage. (HTOP cpu bars output)

Running: iperf3 -c 10.0.0.1 -t 10 -Z -i 40 -P 3

1  [||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||    
87.7%] Tasks: 29, 9 thr, 83 kthr; 6 running
2  [||||||||||||||||||||                                            
28.5%] Load average: 0.86 0.64 0.87
3  [|||||||||||||||||||                                             
27.3%] Uptime: 4 days, 14:22:07
4  [||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||100.0%]
Mem[|||||||||||||||||||||||||||||||||||||||||||||            85.9M/1000M]
Swp[                                                             0K/244M]


Running: iperf3 -c 10.0.0.1 -t 10 -Z -i 40

htop output
1  [|||||||||||||||||||||||||||||||||||||||||||||||||||             
74.0%] Tasks: 29, 9 thr, 83 kthr; 4 running
2  [|||||||||||||||                                                 
20.5%] Load average: 1.20 0.73 0.90
3  [||||||||||||||                                                  
19.5%] Uptime: 4 days, 14:22:22
4  [|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||96.8%]
Mem[|||||||||||||||||||||||||||||||||||||||||||||            86.0M/1000M]
Swp[                                                             0K/244M]


So it seems that one of process in the chain has a bottleneck.
HTOP only show "kworkers" as a name. Not really useful for debugging.  
See below.

1  [||||||||||||||||||||||||||||||||||||||||||||||||||||||          
79.1%] Tasks: 29, 9 thr, 82 kthr; 5 running
2  [||||||||||||||||||                                              
24.5%] Load average: 2.07 1.33 1.35
3  [||||||||||||||||                                                
23.2%] Uptime: 4 days, 14:34:57
4  [|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||99.4%]
Mem[|||||||||||||||||||||||||||||||||||||||||||||            86.3M/1000M]
Swp[                                                             0K/244M]
   PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
13706 root       20   0     0     0     0 R 61.8  0.0  1:20.60 kworker/3:6
     7 root       20   0     0     0     0 R 20.6  0.0  2:39.03 ksoftirqd/0
13743 root       20   0     0     0     0 S 19.9  0.0  0:10.00 kworker/2:0
13755 root       20   0     0     0     0 R 17.9  0.0  0:18.32 kworker/3:3
13707 root       20   0     0     0     0 S 15.9  0.0  0:24.29 kworker/1:3
13747 root       20   0     0     0     0 S 14.6  0.0  0:03.73 kworker/3:0
13753 root       20   0     0     0     0 S 13.3  0.0  0:01.68 kworker/0:1
13754 root       20   0     0     0     0 R  7.3  0.0  0:03.91 kworker/0:2
13752 root       20   0     0     0     0 S  4.7  0.0  0:02.97 kworker/1:0
13751 root       20   0     0     0     0 S  4.0  0.0  0:03.97 kworker/3:2
13748 root       20   0  2944   608   536 S  2.7  0.1  0:01.14 iperf3  
-c 10.0.0.1 -t 1000 -Z -i 40
13749 root       20   0     0     0     0 S  2.7  0.0  0:02.61 kworker/2:1
13733 root       20   0 12860  3252  2368 R  2.0  0.3  0:16.53 htop
13757 root       20   0     0     0     0 S  0.7  0.0  0:01.54 kworker/2:2
13684 root       20   0     0     0     0 S  0.0  0.0  0:25.83 kworker/1:1
13750 root       20   0     0     0     0 S  0.0  0.0  0:04.12 kworker/3:1
13756 root       20   0     0     0     0 S  0.0  0.0  0:01.21 kworker/1:2

Any idea how to debug it and to improve the performance?

Greats,

René van Dorst.
