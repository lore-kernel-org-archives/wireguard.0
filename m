Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7600e970
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jun 2017 20:35:35 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e1eab7e
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jun 2017 20:35:35 +0000 (UTC)
Received: from [172.22.213.17] (global-184-110.nat-1.net.cam.ac.uk
 [131.111.184.110])
 by mail.thalheim.io (Postfix) with ESMTPSA id 6930B7545F
 for <wireguard@lists.zx2c4.com>; Tue,  6 Jun 2017 20:49:27 +0000 (UTC)
Subject: Re: TCP traffic in ipip tunnel inside wireguard connection
To: wireguard@lists.zx2c4.com
References: <3aee46648bd2d8c49fd13e1fd140d3d3@nickmaleao.stream>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <486fab7f-810b-6ad1-72b7-789e2905021d@higgsboson.tk>
Date: Tue, 6 Jun 2017 21:49:21 +0100
MIME-Version: 1.0
In-Reply-To: <3aee46648bd2d8c49fd13e1fd140d3d3@nickmaleao.stream>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Like Jason said, multiple wireguard interfaces are the way to go here.
You can then set up your routing protocols on top.

On 2017-05-29 21:57, Ivan Leonardo wrote:
> Hello
>
> Recently i have been experimenting with wireguard, and in fact the performance in wg is better than the ipsec tunnels i have. In my ipsec implementation i'm using vti interfaces(SAs 0.0.0.0/0) and i can select the traffic flow with static/dynamic routing.
>
> Knowing that wg doesn't allow multiple tunnels with allowedip=0.0.0.0/0,  i tried to create a ipip tunnel using the wg endpoint tunnel ips. I don't have problems with UDP/ICMP traffic, but with TCP when a host(192.168.1.110) in lan1 tries to communicate with the ip of the ipip tunnel in server2, the returning tcp traffic has bad tcp checksum and the packets are discarded. If i try to send tcp packets with the source ip of the ipip tunnel of server2 to host(192.168.1.110) in lan1 , in tcpdump in server2 i see the tcp packets, but in the tcpdump in server1 i dont see the packets.
>
> Resuming, in this topology i only have problems with tcp traffic, udp and icmp works fine.
>
>
> I have search the web for this use case, but didn't find anyone using it, in this topic https://forum.freifunk.net/t/wireguard-0-0-20161230-linuxkernel-3-18-gluon-v2016-2-2/14122 , they managed to get a gre/gretap tunnel functioning with wg.
>
> Does anyone have any ideia if its possible to use this topology?
>
> Topology:
>
> 172.16.17.2/30                  172.16.17.1/30
>            wg0(172.16.17.0/30)
> Server2  <----------------------> Server1   <----> lan1 (192.168.1.0/24)
>             <--------------->
>           ipip0(172.18.0.0/30)(remote/local = wireguard tunnel endpoints)
> 172.18.0.2/30                 172.18.0.1/30
>
> Servers specs:
>
> Server1/2 Ubuntu 16.04.02 (Kernel 4.4.0-78-generic)
> WG version: 0.0.20170517-wg2~xenial
>
>
> Best regards.
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
