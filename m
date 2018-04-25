Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78d8c225
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 23:06:08 +0000 (UTC)
Received: from dnvrco-cmomta01.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.226])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6af920d3
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 23:06:08 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Eddie <stunnel@attglobal.net>
Subject: Cannot ping Windows machines on server network
Message-ID: <9fa638b5-3f03-a35b-5341-8e7240193bd4@attglobal.net>
Date: Wed, 25 Apr 2018 16:06:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Another minor issue I've noticed in my tests.

I've configured wireguard to connect remotely to my home server, like a 
roadwarrior set-up, from both an Android tablet and also a Linux laptop 
connected to a mobile hot-spot.  Everything appears to work, except for 
one thing.

I can't ping the 2 Windows machines on the internal network from the 
wireguard clients.  I can ping all the other machines on the internal 
network, the wireguard IP on the server, and the clients can ping each 
other.  Just not the Windows boxes.

They are pingable from the server and all other machines on the 
network.  There are no routing of firewall rules anywhere that call out 
these 2 machines either by IP or name.

Cheers.
