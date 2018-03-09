Return-Path: bruno@streamfeed.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f136053
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 19:28:53 +0000 (UTC)
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
 [209.85.220.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88b6c91c
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 19:28:53 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id z184so3473905qkc.1
 for <wireguard@lists.zx2c4.com>; Fri, 09 Mar 2018 11:38:40 -0800 (PST)
Return-Path: <bruno@streamfeed.com>
Received: from [192.168.6.105] ([107.191.34.90])
 by smtp.gmail.com with ESMTPSA id f197sm1087911qka.3.2018.03.09.11.38.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Mar 2018 11:38:39 -0800 (PST)
To: wireguard@lists.zx2c4.com
From: Bruno <bruno@streamfeed.com>
Subject: Policy-based routing
Message-ID: <a81edfe2-2a49-c49a-ea7c-65e60639ecfe@streamfeed.com>
Date: Fri, 9 Mar 2018 16:38:35 -0300
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

Hello,

I'm trying to set up a policy-based routing on a wireguard instance. I 
didn't want to call it server, because it acts more like a proxy.

Let's say I have 6 peers plus this wireguard server.

Peer 2  Peer 3   Peer 4
  \/       \/       \/
______________________
|                     |
| Wireguard "server"  |
|                     |
|_____________________|
  \/       \/       \/
Peer 5  Peer 6   Peer 7

Wireguard "server"
Address = 10.0.0.1/24

Peers 2-7
Address = 10.0.0.2-7/24, respectively.

So, what I'm trying to do is route traffic to Peer 7, for example, if it 
is coming from Peer 2. I can do it doing some `ip rule` and `ip route` 
commands. However, wireguard seems to be blocking that traffic. So, I 
want peers 5-7 act as gateways to the internet and I would choose it via 
Linux environment.

Peers 5-7 would be wireguard servers that would route all traffic to the 
internet. So, on the wireguard instance (10.0.0.1/24, "server"), I have 
to set allowed IPs to peers 5-7 as "0.0.0.0/0", correct? Does wireguard 
accept that? On my tests it would just pick one as allowed IPs as 
0.0.0.0/0 and set others to (none). Then, I couldn't reach traffic 
neither from nor to that others peers.

On the wireguard "server" I would set allowed-IPs to peers 2-4 as 
10.0.0.2/32-10.0.0.4/32 as I don't need traffic going through it, just 
coming from it.

Is it possible to achieve that with wireguard?

Thanks!
