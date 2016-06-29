Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 84d97b88
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 20:21:20 +0000 (UTC)
Date: Wed, 29 Jun 2016 15:22:28 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Message-ID: <20160629202228.GA1993@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Subject: [WireGuard] wg doesn't build on 4.7 kernels
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

make[1]: Entering directory '/usr/src/kernels/4.7.0-0.rc5.git1.2.fc25.x86_64'
  CC [M]  /home/bruno/WireGuard/src/device.o
/home/bruno/WireGuard/src/device.c: In function ‘xmit’:
/home/bruno/WireGuard/src/device.c:112:5: error: ‘struct net_device’ has no member named ‘trans_start’; did you mean ‘mem_start’?
  dev->trans_start = jiffies;
     ^~
