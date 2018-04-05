Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53e9bd84
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 12:46:03 +0000 (UTC)
Received: from mail.intelterm.ro (174.15.122.86.static.cluj.rdsnet.ro
 [86.122.15.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f8cdcc4
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 12:46:03 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.24.75.96])
 by mail.intelterm.ro (Postfix) with ESMTPSA id 283D92218C77
 for <wireguard@lists.zx2c4.com>; Thu,  5 Apr 2018 15:59:11 +0300 (EEST)
Subject: Re: ssh console hang
To: wireguard@lists.zx2c4.com
References: <b76eeb2c-9d82-3178-4b05-1d91e5bdff1b@createc.ro>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <8b0fc0a4-54f5-97ce-9244-f0d5cfe1883f@createc.ro>
Date: Thu, 5 Apr 2018 15:59:11 +0300
MIME-Version: 1.0
In-Reply-To: <b76eeb2c-9d82-3178-4b05-1d91e5bdff1b@createc.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 05.04.2018 09:44, Lucian Cristian wrote:
> Starting some time ago I get ssh console hangs when the screen is 
> displaying lots of data (cat large file, compile something with lots 
> of verbosity) I tried lowering the MTU of wg interface to 1380 or the 
> MTU of the host but it's not helping. What can I try to do ?
> I observed that the hang started to happen after I changed the routing 
> protocol on the interface from RIP to OSPF, can this affect it because 
> I don't see why it should ?
> the topology is like this:
> windows client - openwrt wg "client" (OSPF) - ubuntu wg "server" 
> (OSPF) - cisco switch - VM linux host
>
> Regards
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

For the moment seems that moving to OSPF was the problem, the ubuntu 
server has multiple vlans and OSPF was listening on all of them and the 
routes were going randomly by the wrong path

Regards
