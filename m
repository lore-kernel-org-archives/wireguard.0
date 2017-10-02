Return-Path: n.rein@Safe-mail.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10855ee6
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 19:21:07 +0000 (UTC)
Received: from mango.safe-mail.net (mango.safe-mail.net [212.29.227.83])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6d5b1ff
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 19:21:07 +0000 (UTC)
Received: by mango.safe-mail.net with Safe-mail (Exim 4.84)
 (envelope-from <n.rein@Safe-mail.net>) id 1dz6iw-0005SE-NL
 for wireguard@lists.zx2c4.com; Mon, 02 Oct 2017 15:49:54 -0400
Subject: Listen
Date: Mon, 2 Oct 2017 15:49:54 -0400
From: n.rein@Safe-mail.net
To: wireguard@lists.zx2c4.com
Message-Id: <N1M-qS7HLldEHk@Safe-mail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi.
by default wg listen 0.0.0.0:port
please add option like --listen-interface or --execpt-interface , for example:

[Interface]
PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
ListenInterface = eth0
ListenPort = 51820

[Peer]
PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
AllowedIPs = 10.192.122.3/32, 10.192.124.1/24
