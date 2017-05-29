Return-Path: ivan.leonardo@nickmaleao.stream
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32089d37
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:44:19 +0000 (UTC)
Received: from mail.nickmaleao.stream (69.228.115.89.rev.vodafone.pt
 [89.115.228.69])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 692c5e4d
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:44:18 +0000 (UTC)
Received: from authenticated-user (mail.nickmaleao.stream [89.115.228.69])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.nickmaleao.stream (Postfix) with ESMTPSA id 0CEA2161B1
 for <wireguard@lists.zx2c4.com>; Mon, 29 May 2017 21:57:12 +0100 (WEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Mon, 29 May 2017 21:57:12 +0100
From: Ivan Leonardo <ivan.leonardo@nickmaleao.stream>
To: wireguard@lists.zx2c4.com
Subject: TCP traffic in ipip tunnel inside wireguard connection
Message-ID: <3aee46648bd2d8c49fd13e1fd140d3d3@nickmaleao.stream>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello

Recently i have been experimenting with wireguard, and in fact the 
performance in wg is better than the ipsec tunnels i have. In my ipsec 
implementation i'm using vti interfaces(SAs 0.0.0.0/0) and i can select 
the traffic flow with static/dynamic routing.

Knowing that wg doesn't allow multiple tunnels with allowedip=0.0.0.0/0, 
  i tried to create a ipip tunnel using the wg endpoint tunnel ips. I 
don't have problems with UDP/ICMP traffic, but with TCP when a 
host(192.168.1.110) in lan1 tries to communicate with the ip of the ipip 
tunnel in server2, the returning tcp traffic has bad tcp checksum and 
the packets are discarded. If i try to send tcp packets with the source 
ip of the ipip tunnel of server2 to host(192.168.1.110) in lan1 , in 
tcpdump in server2 i see the tcp packets, but in the tcpdump in server1 
i dont see the packets.

Resuming, in this topology i only have problems with tcp traffic, udp 
and icmp works fine.


I have search the web for this use case, but didn't find anyone using 
it, in this topic 
https://forum.freifunk.net/t/wireguard-0-0-20161230-linuxkernel-3-18-gluon-v2016-2-2/14122 
, they managed to get a gre/gretap tunnel functioning with wg.

Does anyone have any ideia if its possible to use this topology?

Topology:

172.16.17.2/30 	             172.16.17.1/30
            wg0(172.16.17.0/30)
Server2  <----------------------> Server1   <----> lan1 (192.168.1.0/24)
             <--------------->
           ipip0(172.18.0.0/30)(remote/local = wireguard tunnel 
endpoints)
172.18.0.2/30                 172.18.0.1/30

Servers specs:

Server1/2 Ubuntu 16.04.02 (Kernel 4.4.0-78-generic)
WG version: 0.0.20170517-wg2~xenial


Best regards.
