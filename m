Return-Path: augustus_meyer@yahoo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2820555
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Apr 2018 10:06:36 +0000 (UTC)
Received: from sonic303-20.consmr.mail.ir2.yahoo.com
 (sonic303-20.consmr.mail.ir2.yahoo.com [77.238.178.201])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f92d9db2
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Apr 2018 10:06:35 +0000 (UTC)
Date: Sat, 28 Apr 2018 10:07:45 +0000 (UTC)
From: reiner otto <augustus_meyer@yahoo.de>
To: <wireguard@lists.zx2c4.com>
Message-ID: <570542680.2946509.1524910065103@mail.yahoo.com>
Subject: Route all traffic to one IP _only_ via wireguard
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
References: <570542680.2946509.1524910065103.ref@mail.yahoo.com>
Reply-To: reiner otto <augustus_meyer@yahoo.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

My basic setup of wg works, I can ssh from/to server or client.
But the real goal is to tunnel only traffic with a specific destination IP
via wireguard from client to server. 
I.e. a local router, which allows direct access to the web,
_BUT_ all traffic going to the corporate server using wireguard only.
Corporate server (public 1.2.3.4) == wireguard server (172.16.0.1).

I tried various settings on my client, like
ip route 1.2.3.4 dev wg0
ip route 1.2.3.4 via 172.16.0.1 
etc.
but nothing worked.

Any help really appreciated.

---
wg0.conf on server (1.2.3.4):
[Interface]
ListenPort = 1234
PrivateKey = secret
[Peer]
PublicKey = secret
AllowedIPs = 172.16.0.0/16
-
wg0.conf on client (172.16.18.31):
[Interface]
PrivateKey = secret
ListenPort = 1234
[Peer]
PublicKey = secret
AllowedIPs = 0.0.0.0/0
Endpoint = 1.2.3.4:1234
