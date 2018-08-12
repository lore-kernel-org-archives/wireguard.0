Return-Path: bounce+1a9445.bb0-wireguard=lists.zx2c4.com@poorlab.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bde361c
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 16:42:47 +0000 (UTC)
Received: from m32-4.eu.mailgun.net (m32-4.eu.mailgun.net [141.193.32.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fa7181f
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 16:42:46 +0000 (UTC)
Sender: coder@poorlab.com
Received: by mail-qk0-f182.google.com with SMTP id 13-v6so9503756qkl.9
 for <wireguard@lists.zx2c4.com>; Sun, 12 Aug 2018 09:54:22 -0700 (PDT)
MIME-Version: 1.0
From: StarBrilliant <coder@poorlab.com>
Date: Mon, 13 Aug 2018 02:53:44 +1000
Message-ID: <CA+7UkwLpoa_n87PKghohdGc5JVpYJdjAB1a8NUpYjx35o5nPWw@mail.gmail.com>
Subject: Fragmentation on UDP layer possible?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Wireguard developers and uesrs,

Thank you for having built up this software!

Recently I found some problems transmitting large UDP packets at
certain network environments.

My network architecture consists of 2 layers (Wireguard + VXLAN) to
enable mesh routing based on BGP and Babel routing protocols. To reach
a minimum MTU of 1280 bytes required by IPv6, the network must be able
to send and receive UDP datagrams of 1362 bytes. However some public
Wi-Fi does not allow me to send UDP packets of this big. No matter I
do fragmentation on my box with DF Flag on, or disable PMTUD with DF
flag off, the firewall simply rejects any fragmented IP packet.

I know Wireguard can already do IP layer fragmentation. (Just set
tunnel MTU >= 1441 then fragmentation will be turned on) But in this
network condition we might need to solve the problem on UDP layer.
OpenVPN supports UDP layer fragmentation through the "--fragment X"
option. By specifying this option, UDP packets will be no more than X
bytes. It adds an additional 4-byte overhead per fragment.

My question is, is UDP layer fragmentation technically possible for
Wireguard? If possible, will it introduce incompatibility to old
clients? How much overhead might it have?


And again, thank you!
