Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 169514ac
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 09:50:30 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 767730cb
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 09:50:30 +0000 (UTC)
Received: from www (www.lan.vdorst.com [172.16.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 2519A1314B76
 for <wireguard@lists.zx2c4.com>; Fri, 22 Sep 2017 12:17:56 +0200 (CEST)
Date: Fri, 22 Sep 2017 10:17:56 +0000
Message-ID: <20170922101756.Horde.0028OWy_TWcXeR6q3nnfYrp@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: WireGuard list <wireguard@lists.zx2c4.com>
Subject: Failed to give packet to userspace from peer with very poor wifi
 connection.
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

I get "Failed to give packet to userspace from peer x" on my Solidrun  
Cubox I4pro with very poor wifi connection.
So i connect to my internal wireguard server via wifi. Run iperf3.  
Often I get Failed to give packet to userspace from peer x. See full  
log below.

I noticed it seems to happen before the last interval of iperf.

Running F26 with stock kernel 4.12.13-300.fc26.armv7hl

WireGuard 0.0.20170918-9-g31ae6e6: Fails often
WireGuard 0.0.20170918: No fails at the moment.

Related commit?:  
https://git.zx2c4.com/WireGuard/commit/?id=939c122c57ce834ac5624409272ece1428f70a4a

Number of Wifi AP in the aera:
[root@cubox src]# iw wlan0 scan | grep SSID | wc -l
17


dmesg and iperf3 log combined.

"dmesg -w &" # running dmesg in background.


[root@cubox ~]# iperf3 -c 10.0.0.1 -b 2M -t 120
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.2 port 51816 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec   144 KBytes  1.18 Mbits/sec    0   17.6 KBytes
[  4]   1.00-2.00   sec  48.8 KBytes   400 Kbits/sec    0   20.3 KBytes
[  4]   2.00-3.00   sec  89.5 KBytes   733 Kbits/sec    0   24.4 KBytes
[  4]   3.00-4.00   sec   127 KBytes  1.04 Mbits/sec    0   39.3 KBytes
[  4]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   39.3 KBytes
[  4]   5.00-6.00   sec  81.3 KBytes   666 Kbits/sec    0   39.3 KBytes
[  4]   6.00-7.00   sec   125 KBytes  1.02 Mbits/sec    0   59.6 KBytes
[  4]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    3   10.8 KBytes
[  4]   9.00-10.00  sec   125 KBytes  1.02 Mbits/sec   13   40.7 KBytes
[  4]  10.00-11.00  sec  0.00 Bytes  0.00 bits/sec    0   40.7 KBytes
[  4]  11.00-12.00  sec  0.00 Bytes  0.00 bits/sec    0   40.7 KBytes
[  4]  12.00-13.00  sec  0.00 Bytes  0.00 bits/sec    0   40.7 KBytes
[  4]  13.00-14.00  sec  0.00 Bytes  0.00 bits/sec    0   40.7 KBytes
[  4]  14.00-15.00  sec  0.00 Bytes  0.00 bits/sec    0   40.7 KBytes
[  4]  15.00-16.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  16.00-17.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  17.00-18.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  18.00-19.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  19.00-20.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  20.00-21.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  21.00-22.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  22.00-23.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  23.00-24.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  24.00-25.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[ 1141.138567] wireguard: wg0: Receiving handshake initiation from  
peer 2 (192.168.2.222:36464)
[ 1141.138579] wireguard: wg0: Sending handshake response to peer 2  
(192.168.2.222:36464)
[ 1141.140991] wireguard: wg0: Keypair 16 created for peer 2
[  4]  25.00-26.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  26.00-27.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  27.00-28.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  28.00-29.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  29.00-30.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[ 1146.511071] wireguard: wg0: Receiving handshake initiation from  
peer 2 (192.168.2.222:36464)
[ 1146.511085] wireguard: wg0: Sending handshake response to peer 2  
(192.168.2.222:36464)
[ 1146.513501] wireguard: wg0: Keypair 17 created for peer 2
[ 1146.518677] wireguard: wg0: Keypair 16 destroyed for peer 2
[ 1146.523213] wireguard: wg0: Receiving keepalive packet from peer 2  
(192.168.2.222:36464)
[  4]  30.00-31.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  31.00-32.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  32.00-33.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  33.00-34.00  sec  0.00 Bytes  0.00 bits/sec   31   28.5 KBytes
[  4]  34.00-35.00  sec   125 KBytes  1.02 Mbits/sec    0   32.5 KBytes
[  4]  35.00-36.00  sec  0.00 Bytes  0.00 bits/sec    0   36.6 KBytes
[  4]  36.00-37.00  sec  0.00 Bytes  0.00 bits/sec    0   38.0 KBytes
[  4]  37.00-38.00  sec   125 KBytes  1.02 Mbits/sec    6   27.1 KBytes
[  4]  38.00-39.00  sec  0.00 Bytes  0.00 bits/sec    0   27.1 KBytes
[  4]  39.00-40.00  sec  0.00 Bytes  0.00 bits/sec    1   27.1 KBytes
[  4]  40.00-41.00  sec  0.00 Bytes  0.00 bits/sec    0   25.8 KBytes
[  4]  41.00-42.00  sec  0.00 Bytes  0.00 bits/sec    0   25.8 KBytes
[  4]  42.00-43.00  sec  0.00 Bytes  0.00 bits/sec    0   25.8 KBytes
[  4]  43.00-44.00  sec  0.00 Bytes  0.00 bits/sec    0   25.8 KBytes
[  4]  44.00-45.00  sec  0.00 Bytes  0.00 bits/sec    0   25.8 KBytes
[  4]  45.00-46.00  sec  0.00 Bytes  0.00 bits/sec    0   25.8 KBytes
[  4]  46.00-47.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  47.00-48.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  48.00-49.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  49.00-50.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  50.00-51.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  51.00-52.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  52.00-53.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  53.00-54.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[ 1170.402192] wireguard: wg0: Receiving handshake initiation from  
peer 2 (192.168.2.222:36464)
[ 1170.402205] wireguard: wg0: Sending handshake response to peer 2  
(192.168.2.222:36464)
[ 1170.404622] wireguard: wg0: Keypair 18 created for peer 2
[ 1170.422683] wireguard: wg0: Receiving keepalive packet from peer 2  
(192.168.2.222:36464)
[  4]  54.00-55.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  55.00-56.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  56.00-57.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  57.00-58.00  sec  0.00 Bytes  0.00 bits/sec   19   19.0 KBytes
[  4]  58.00-59.00  sec   125 KBytes  1.02 Mbits/sec    0   23.0 KBytes
[  4]  59.00-60.00  sec   125 KBytes  1.02 Mbits/sec    0   27.1 KBytes
[  4]  60.00-61.00  sec  0.00 Bytes  0.00 bits/sec    0   27.1 KBytes
[  4]  61.00-62.00  sec  0.00 Bytes  0.00 bits/sec    1   19.0 KBytes
[  4]  62.00-63.00  sec  0.00 Bytes  0.00 bits/sec    0   19.0 KBytes
[  4]  63.00-64.00  sec  0.00 Bytes  0.00 bits/sec    4   12.2 KBytes
[  4]  64.00-65.00  sec  0.00 Bytes  0.00 bits/sec    1   13.6 KBytes
[  4]  65.00-66.00  sec  0.00 Bytes  0.00 bits/sec    0   14.9 KBytes
[  4]  66.00-67.00  sec  0.00 Bytes  0.00 bits/sec    0   14.9 KBytes
[  4]  67.00-68.00  sec  0.00 Bytes  0.00 bits/sec    2   10.8 KBytes
[  4]  68.00-69.00  sec  0.00 Bytes  0.00 bits/sec    0   10.8 KBytes
[  4]  69.00-70.00  sec  0.00 Bytes  0.00 bits/sec    0   10.8 KBytes
[  4]  70.00-71.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  71.00-72.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  72.00-73.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  73.00-74.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  74.00-75.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  75.00-76.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  76.00-77.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  77.00-78.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  78.00-79.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  79.00-80.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  80.00-81.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  81.00-82.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[ 1198.479999] wireguard: wg0: Retrying handshake with peer 2  
(192.168.2.222:36464) because we stopped hearing back after 15 seconds
[ 1198.480079] wireguard: wg0: Sending handshake initiation to peer 2  
(192.168.2.222:36464)
[  4]  82.00-83.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  83.00-84.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  84.00-85.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  85.00-86.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  86.00-87.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[ 1203.356551] wireguard: wg0: Receiving handshake initiation from  
peer 2 (192.168.2.222:36464)
[ 1203.356565] wireguard: wg0: Sending handshake response to peer 2  
(192.168.2.222:36464)
[ 1203.359169] wireguard: wg0: Keypair 19 created for peer 2
[ 1203.487682] wireguard: wg0: Receiving keepalive packet from peer 2  
(192.168.2.222:36464)
[  4]  87.00-88.00  sec   125 KBytes  1.02 Mbits/sec   10   6.78 KBytes
[  4]  88.00-89.00  sec  0.00 Bytes  0.00 bits/sec    1   9.49 KBytes
[  4]  89.00-90.00  sec   125 KBytes  1.02 Mbits/sec    0   12.2 KBytes
[  4]  90.00-91.00  sec  0.00 Bytes  0.00 bits/sec    0   14.9 KBytes
[  4]  91.00-92.00  sec  0.00 Bytes  0.00 bits/sec    0   14.9 KBytes
[  4]  92.00-93.00  sec  0.00 Bytes  0.00 bits/sec    1   14.9 KBytes
[  4]  93.00-94.00  sec  0.00 Bytes  0.00 bits/sec    0   14.9 KBytes
[  4]  94.00-95.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  95.00-96.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  96.00-97.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  97.00-98.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  98.00-99.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  99.00-100.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 100.00-101.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 101.00-102.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 102.00-103.00 sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4] 103.00-104.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 104.00-105.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 105.00-106.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[ 1222.762089] wireguard: wg0: Receiving handshake initiation from  
peer 2 (192.168.2.222:36464)
[ 1222.762101] wireguard: wg0: Sending handshake response to peer 2  
(192.168.2.222:36464)
[ 1222.764541] wireguard: wg0: Keypair 20 created for peer 2
[  4] 106.00-107.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 107.00-108.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 108.00-109.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 109.00-110.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 110.00-111.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[ 1227.745350] wireguard: wg0: Receiving handshake initiation from  
peer 2 (192.168.2.222:36464)
[ 1227.745362] wireguard: wg0: Sending handshake response to peer 2  
(192.168.2.222:36464)
[ 1227.747772] wireguard: wg0: Keypair 21 created for peer 2
[ 1227.752906] wireguard: wg0: Keypair 20 destroyed for peer 2
[ 1227.755581] wireguard: wg0: Receiving keepalive packet from peer 2  
(192.168.2.222:36464)
[  4] 111.00-112.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 112.00-113.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 113.00-114.00 sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4] 114.00-115.00 sec   125 KBytes  1.02 Mbits/sec   12   12.2 KBytes
[  4] 115.00-116.00 sec  0.00 Bytes  0.00 bits/sec    0   14.9 KBytes
[  4] 116.00-117.00 sec  0.00 Bytes  0.00 bits/sec    2   9.49 KBytes
[  4] 117.00-118.00 sec   125 KBytes  1.02 Mbits/sec    0   14.9 KBytes
[  4] 118.00-119.00 sec  0.00 Bytes  0.00 bits/sec    0   14.9 KBytes
[ 1236.189543] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[ 1236.194543] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[ 1236.216104] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[ 1236.218546] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[ 1236.251533] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[ 1236.253885] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[ 1236.281213] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[ 1236.289107] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[ 1236.296887] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[ 1236.382031] wireguard: wg0: Failed to give packet to userspace from  
peer 2 (192.168.2.222:36464)
[  4] 119.00-120.00 sec   125 KBytes  1.02 Mbits/sec    1   14.9 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-120.00 sec  1.82 MBytes   127 Kbits/sec  117             sender
[  4]   0.00-120.00 sec  1.59 MBytes   111 Kbits/sec                  receiver

iperf Done.




Server dmesg log:

[  204.106610] wireguard: wg0: Receiving handshake initiation from  
peer 1 (192.168.2.32:36464)
[  204.106615] wireguard: wg0: Sending handshake response to peer 1  
(192.168.2.32:36464)
[  204.107336] wireguard: wg0: Keypair 1 created for peer 1
[  204.124303] wireguard: wg0: Receiving keepalive packet from peer 1  
(192.168.2.32:36464)
[  234.466367] wireguard: wg0: Retrying handshake with peer 1  
(192.168.2.32:36464) because we stopped hearing back after 15 seconds
[  234.466507] wireguard: wg0: Sending handshake initiation to peer 1  
(192.168.2.32:36464)
[  239.842381] wireguard: wg0: Handshake for peer 1  
(192.168.2.32:36464) did not complete after 5 seconds, retrying (try 2)
[  239.843028] wireguard: wg0: Sending handshake initiation to peer 1  
(192.168.2.32:36464)
[  239.854638] wireguard: wg0: Receiving handshake response from peer  
1 (192.168.2.32:36464)
[  239.854656] wireguard: wg0: Keypair 2 created for peer 1
[  239.854662] wireguard: wg0: Sending keepalive packet to peer 1  
(192.168.2.32:36464)
[  263.650390] wireguard: wg0: Retrying handshake with peer 1  
(192.168.2.32:36464) because we stopped hearing back after 15 seconds
[  263.650806] wireguard: wg0: Sending handshake initiation to peer 1  
(192.168.2.32:36464)
[  263.758349] wireguard: wg0: Receiving handshake response from peer  
1 (192.168.2.32:36464)
[  263.758364] wireguard: wg0: Keypair 3 created for peer 1
[  263.758372] wireguard: wg0: Sending keepalive packet to peer 1  
(192.168.2.32:36464)
[  291.298294] wireguard: wg0: Retrying handshake with peer 1  
(192.168.2.32:36464) because we stopped hearing back after 15 seconds
[  291.298859] wireguard: wg0: Sending handshake initiation to peer 1  
(192.168.2.32:36464)
[  296.674297] wireguard: wg0: Handshake for peer 1  
(192.168.2.32:36464) did not complete after 5 seconds, retrying (try 2)
[  296.674338] wireguard: wg0: Sending handshake initiation to peer 1  
(192.168.2.32:36464)
[  296.726405] wireguard: wg0: Receiving handshake response from peer  
1 (192.168.2.32:36464)
[  296.726421] wireguard: wg0: Keypair 4 created for peer 1
[  296.726429] wireguard: wg0: Sending keepalive packet to peer 1  
(192.168.2.32:36464)
[  315.874380] wireguard: wg0: Retrying handshake with peer 1  
(192.168.2.32:36464) because we stopped hearing back after 15 seconds
[  315.874954] wireguard: wg0: Sending handshake initiation to peer 1  
(192.168.2.32:36464)
[  320.994390] wireguard: wg0: Handshake for peer 1  
(192.168.2.32:36464) did not complete after 5 seconds, retrying (try 2)
[  320.994460] wireguard: wg0: Sending handshake initiation to peer 1  
(192.168.2.32:36464)
[  321.092067] wireguard: wg0: Receiving handshake response from peer  
1 (192.168.2.32:36464)
[  321.092083] wireguard: wg0: Keypair 5 created for peer 1
[  321.092096] wireguard: wg0: Sending keepalive packet to peer 1  
(192.168.2.32:36464)
[  339.938246] wireguard: wg0: Sending keepalive packet to peer 1  
(192.168.2.32:36464)
[  339.960001] wireguard: wg0: Receiving keepalive packet from peer 1  
(192.168.2.32:36464)
[  350.178222] wireguard: wg0: Sending keepalive packet to peer 1  
(192.168.2.32:36464)
[  350.195605] wireguard: wg0: Receiving keepalive packet from peer 1  
(192.168.2.32:36464)
[  400.371636] wireguard: wg0: Receiving keepalive packet from peer 1  
(192.168.2.32:36464)



EXAMPLE 2

[  4]  23.00-24.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  24.00-25.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  25.00-26.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  26.00-27.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  27.00-28.00  sec  0.00 Bytes  0.00 bits/sec    7   8.13 KBytes
[  4]  28.00-29.00  sec   100 KBytes   822 Kbits/sec    0   13.6 KBytes
[ 7546.471927] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7546.477342] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7546.481168] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7546.483651] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7546.485982] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7546.487257] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7546.489727] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7546.529357] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7546.547737] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7546.551720] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[  4]  29.00-30.00  sec   153 KBytes  1.25 Mbits/sec    0   20.3 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-30.00  sec   497 KBytes   136 Kbits/sec   14             sender
[  4]   0.00-30.00  sec   435 KBytes   119 Kbits/sec                  receiver


EXAMPLE 3

[  4]  26.00-27.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[ 7398.889279] wireguard: wg0: Receiving handshake initiation from  
peer 1 (192.168.2.222:36464)
[ 7398.889290] wireguard: wg0: Sending handshake response to peer 1  
(192.168.2.222:36464)
[ 7398.891746] wireguard: wg0: Keypair 49 created for peer 1
[ 7398.898398] wireguard: wg0: Keypair 48 destroyed for peer 1
[ 7398.923968] wireguard: wg0: Receiving keepalive packet from peer 1  
(192.168.2.222:36464)
[  4]  27.00-28.00  sec  38.0 KBytes   311 Kbits/sec    8   8.13 KBytes
[  4]  28.00-29.00  sec  77.3 KBytes   633 Kbits/sec    2   9.49 KBytes
[ 7401.597745] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7401.646351] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7401.679038] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7401.842041] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7401.850521] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[  4]  29.00-30.00  sec  36.6 KBytes   300 Kbits/sec    1   8.13 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-30.00  sec   690 KBytes   188 Kbits/sec   21             sender
[  4]   0.00-30.00  sec   636 KBytes   174 Kbits/sec                  receiver


EXAMPLE 4

[root@cubox src]# iperf3 -c 10.0.0.1 -b 1M -t 30 -i 1

<SNIP>

[  4]  27.00-28.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  28.00-29.00  sec  66.4 KBytes   544 Kbits/sec   15   14.9 KBytes
[ 7708.890767] wireguard: wg0: Receiving handshake initiation from  
peer 1 (192.168.2.222:36464)
[ 7708.890779] wireguard: wg0: Sending handshake response to peer 1  
(192.168.2.222:36464)
[ 7708.893200] wireguard: wg0: Keypair 56 created for peer 1
[ 7708.898444] wireguard: wg0: Keypair 55 destroyed for peer 1
[ 7708.966281] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7708.981742] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7708.995961] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7708.997977] wireguard: wg0: Receiving keepalive packet from peer 1  
(192.168.2.222:36464)
[ 7709.057181] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[ 7709.086144] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[  4]  29.00-30.00  sec  0.00 Bytes  0.00 bits/sec    0   38.0 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-30.00  sec   994 KBytes   271 Kbits/sec   22             sender
[  4]   0.00-30.00  sec   930 KBytes   254 Kbits/sec                  receiver
