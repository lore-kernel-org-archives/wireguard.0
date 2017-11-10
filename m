Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76dd483b
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 10:57:21 +0000 (UTC)
Received: from 15.mo3.mail-out.ovh.net (15.mo3.mail-out.ovh.net
 [87.98.150.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65387398
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 10:57:21 +0000 (UTC)
Received: from player797.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 6325816FC5B
 for <wireguard@lists.zx2c4.com>; Fri, 10 Nov 2017 12:00:55 +0100 (CET)
Received: from localhost.localdomain (60-242-138-227.static.tpgi.com.au
 [60.242.138.227]) (Authenticated sender: aurelien@chabot.fr)
 by player797.ha.ovh.net (Postfix) with ESMTPA id DE0CB2E008A
 for <wireguard@lists.zx2c4.com>; Fri, 10 Nov 2017 12:00:51 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: Close the tun fd when closing the device
Date: Fri, 10 Nov 2017 22:00:32 +1100
Message-Id: <20171110110033.24210-1-aurelien@chabot.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This patch was part of the android development, as this is not specific
to android, here is an independent patch. 
