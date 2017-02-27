Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1d5ece5
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 18:03:31 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 4acab21c
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 18:03:31 +0000 (UTC)
Date: Mon, 27 Feb 2017 12:04:34 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Kernel commit d35a00b8e33dab7385f724e713ae71c8be0a49f4 breaks
 wireguard
Message-ID: <20170227180434.GA5702@wolff.to>
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

When building wireguard for Fedora's 4.11.0-0.rc0.git4.2.fc26.x86_64 kernel 
I get the following error:
/home/bruno/WireGuard/src/device.c: In function ‘open’:
/home/bruno/WireGuard/src/device.c:44:9: error: ‘struct inet6_dev’ has no member named ‘addr_gen_mode’
   dev_v6->addr_gen_mode = IN6_ADDR_GEN_MODE_NONE;
         ^~

It looks like addr_gen_mode was dropped from inet6_dev in 
include/net/if_inet6.h in commit d35a00b8e33dab7385f724e713ae71c8be0a49f4.
