Return-Path: jamie@onebillion.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8858ac1
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Apr 2017 10:39:43 +0000 (UTC)
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
 [209.85.128.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff366514
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Apr 2017 10:39:43 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id l50so32610397wrc.3
 for <wireguard@lists.zx2c4.com>; Tue, 25 Apr 2017 03:48:22 -0700 (PDT)
Return-Path: <jamie@onebillion.org>
Received: from [10.0.0.53] (host81-130-225-252.in-addr.btopenworld.com.
 [81.130.225.252])
 by smtp.gmail.com with ESMTPSA id j71sm2755338wmd.12.2017.04.25.03.48.18
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Apr 2017 03:48:19 -0700 (PDT)
From: Jamie Stuart <jamie@onebillion.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Client / Server help
Message-Id: <193CB6CC-DC39-482E-9050-4106262C1260@onebillion.org>
Date: Tue, 25 Apr 2017 11:48:18 +0100
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,
I=E2=80=99d like to trial transitioning our VPN system to WireGuard.
We currently have an Ubuntu server running OpenVPN with many ( > 50) =
clients (running OpenWRT) connecting to it periodically. Clients get =
addresses via DHCP from the server.
How would I go about transitioning this architecture to Wireguard? Note =
I have wg on both the clients and server already.

All help much appreciated!


Jamie, onebillion=
