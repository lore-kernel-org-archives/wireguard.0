Return-Path: saeidscorp@yahoo.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af99dfed
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 21:04:58 +0000 (UTC)
Received: from sonic305-21.consmr.mail.ir2.yahoo.com
 (sonic305-21.consmr.mail.ir2.yahoo.com [77.238.177.83])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 209ac24e
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 21:04:58 +0000 (UTC)
Received: from smtp173.mail.ir2.yahoo.com (EHLO scorpbook.localnet)
 ([46.228.39.40])
 by smtp410.mail.ir2.yahoo.com (JAMES SMTP Server ) with ESMTPA ID
 0d7fc9413d7e2c726f9d1bdf1e05e13b for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 21:08:56 +0000 (UTC)
From: Saeid Akbari <saeidscorp@yahoo.com>
To: wireguard@lists.zx2c4.com
Subject: Channel/Tunnel bonding with wireguard
Date: Tue, 23 Jan 2018 00:33:27 +0330
Message-ID: <2657672.Dq05pOSN56@scorpbook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

I have been thinking about utilizing WireGuard on my VPS to act as a central 
hub for combining my multiple slower connections and having a faster one. I 
had a possible way of doing it in my mind, and finally today I did a little bit 
of googling found this article (also learned the real name for the technique: 
bonding):

http://vrayo.com/how-to-set-up-a-bonding-vpn-connection-in-linux/

Since this approach uses a user-space daemon to relay around data, it would 
incur some performance penalties compared to a kernel-mode driver like WG. So 
it's probably not a good idea to use it on top of WG.

The pure WG scheme I have in my mind goes something like this:
- having a single swg0 interface on VPS.
- having multiple interfaces on the client (cwg0, cwg1, ...), each configured 
with a single peer, that is the VPS swg0 interface.
- some iptables + ip rules fu to split and re-join the stream of IP packets.

For the third part, I can think of statistic netfilter match for splitting the 
packets. But there are other things around which I don't know much about; like 
the qdiscs... so I'm not confident if I'm headed in the right direction...

Is this a good idea? What do you suggest? Is there any better way to do it?

Thanks in Advance

Saeid,
