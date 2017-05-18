Return-Path: jannis@pinterjann.is
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b104758
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 18:30:39 +0000 (UTC)
Received: from mail.pinterjann.is (mail.pinterjann.is [37.120.169.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad9026e1
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 18:30:39 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Jannis Pinter <jannis@pinterjann.is>
Subject: Compatibiliyt issues between 0.0.20170115 and 0.0.20170517
Message-ID: <16c492cb-af24-e864-cd49-c8c2c5457ee4@pinterjann.is>
Date: Thu, 18 May 2017 12:35:20 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi list,

I use wireguard to connect to my remote LEDE routers which works great
and is really fast. This morning I've upgraded my Arch Linux laptop to
the latest wireguard version and noticed that I can no longer connect to
my routers.

It looks like the handshake between the two devices does not complete. I
can see that my laptop sends UDP packets every 5 seconds to the router,
but the router never sends a packet back.

Downgrading wireguard on my laptop to the previous version 0.0.20170421
solves the issue.

Software versions on LEDE router:
OS: 		LEDE 17.01
Kernel: 	4.4.59
Wireguard:	0.0.20170115

Software versions on my Arch Linux laptop:
OS:		Arch Linux
Kernel:		4.10.13
Wireguard:	0.0.20170517

Now this description is not very detailed, is there anything I could do
to provice more useful debugging output?

Regards,
Jannis
