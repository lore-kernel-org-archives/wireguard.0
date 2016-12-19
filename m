Return-Path: me@prok.pw
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43dcffc5
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 21:42:03 +0000 (UTC)
Received: from mail.aur.rocks (mail.aur.rocks [164.132.51.92])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e084023
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 21:42:03 +0000 (UTC)
Received: from [77.106.104.40] (helo=[10.0.0.5])
 by mail.aur.rocks with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.87) (envelope-from <me@prok.pw>) id 1cJ5nj-0006BT-QE
 for wireguard@lists.zx2c4.com; Tue, 20 Dec 2016 04:48:56 +0700
Date: Tue, 20 Dec 2016 04:48:51 +0700
From: Sergey <me@prok.pw>
Subject: WireGuard network perfomance
To: wireguard@lists.zx2c4.com
Message-Id: <1482184131.1467.9@mail.aur.rocks>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello guys.

First of all thanks for the WireGuard project: it really simple & 
powerful and no more headaches with openvpn :)

My question about network perfomance, I tested network speed with 
iperf3 and got these results:

Raw test (no WireGuard):

$ iperf3 -c PUBLIC_IP
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  98.1 MBytes  82.3 Mbits/sec   25             
sender
[  4]   0.00-10.00  sec  93.6 MBytes  78.5 Mbits/sec                  
receiver

So I got ~80 Mbits/sec

And WireGuard test:

$ iperf3 -c PRIVATE_IP
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  53.2 MBytes  44.7 Mbits/sec  1863             
sender
[  4]   0.00-10.00  sec  46.1 MBytes  38.7 Mbits/sec                  
receiver

And there is ~40 Mbits/sec, so half of original.

I missed something? Probably I need to configure something /etc?
btw what is "Retr" column in iperf? Why it so big with WireGuard?

Anyway that's good result for me, as openvpn can only give me something 
~15 Mbits/sec.

Best regards, Sergey.
