Return-Path: em12345@web.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 668bfcd3
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 00:23:52 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37e36bd7
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 00:23:52 +0000 (UTC)
Received: from [192.168.244.69] ([84.168.73.228]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LeLWP-1coEdD3nXJ-00q9Wi for
 <wireguard@lists.zx2c4.com>; Tue, 10 Jan 2017 01:33:30 +0100
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: em12345 <em12345@web.de>
Subject: Re: Varying source address and stateful firewalls (Was: Multiple
 Endpoints)
Message-ID: <33fed77c-4367-2411-0666-5c75148d1608@web.de>
Date: Tue, 10 Jan 2017 01:33:29 +0100
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

Hi Baptiste,

after seeing

    https://wiki.asterisk.org/wiki/display/TOP/NAT+Traversal+Testing

I realized that the connection tracking with its state calculation and
the SNAT port mapping are two different things which don't have to
follow the same rules related to src/dst IP and ports.

This could be an explanation why Jason tested the NATed whole punching
successful with different src IPs, while your example failed.

The iptables connection tracking really does include src and dst IP
according to:

     http://www.iptables.info/en/connection-state.html

So iptables ESTABLISHED filter rules require the src,dst and both ports.

But may be the iptables NAT port mapping does not require this. The
iptables man page is vague on MASQUERADE and SNAT target.


Anyway, only packets with an existing port mapping (however this is
determined) will make it into the FORWARD chain from WAN to LAN interface.
Therefore it would not really be necessary to check for ESTABLISHED in
the FORWARD chain for those WAN-to-LAN packets. Assuming that there are
really showing up such NEW packets.

However in your example which is only using the INPUT chain, one of
course has to filter out the NEW packets here.


Emmanuel
