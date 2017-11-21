Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7823f138
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:20:31 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e367d2c
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:20:31 +0000 (UTC)
Received: from www (www.lan.vdorst.com [172.16.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id A7112137B397
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 10:25:34 +0100 (CET)
Date: Tue, 21 Nov 2017 09:25:16 +0000
Message-ID: <20171121092516.Horde.-KEs7jQ3bs1TXDF4g98Y3gQ@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: WireGuard list <wireguard@lists.zx2c4.com>
Subject: ARM multitheaded?
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



iperf3 -c 10.0.0.1 -t 10 -Z -i 40 -P 3

1  [||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||    
87.7%] Tasks: 29, 9 thr, 83 kthr; 6 running
2  [||||||||||||||||||||                                            
28.5%] Load average: 0.86 0.64 0.87
3  [|||||||||||||||||||                                             
27.3%] Uptime: 4 days, 14:22:07
4  [||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||100.0%]
Mem[|||||||||||||||||||||||||||||||||||||||||||||            85.9M/1000M]
Swp[                                                             0K/244M]


iperf3 -c 10.0.0.1 -t 10 -Z -i 40

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
